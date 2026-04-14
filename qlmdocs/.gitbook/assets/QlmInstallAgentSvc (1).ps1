<#
.SYNOPSIS
    Installs or updates a Windows Service using New-Service / sc.exe.

.PARAMETER ServiceName
    The internal service name (no spaces or parentheses). Example: QlmAgentSvcNetCore

.PARAMETER ExePath
    Full path to the service executable.

.PARAMETER DisplayName
    Friendly display name (can contain spaces).

.PARAMETER Description
    Service description.

.PARAMETER StartType
    Automatic | Manual | Disabled

.PARAMETER Arguments
    Optional command-line arguments for the service executable.

.PARAMETER LogPath
    Optional path for the log file. Defaults to %TEMP%\svc-install-<ServiceName>.log
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)][string]$ServiceName,
    [Parameter(Mandatory = $true)][string]$ExePath,
    [string]$DisplayName,
    [string]$Description,
    [ValidateSet('Automatic','Manual','Disabled')][string]$StartType = 'Automatic',
    [string]$Arguments = '',
    [string]$LogPath
)

function Write-Log {
    param([string]$Message)
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "[$ts] $Message"
    Write-Host $line
    Add-Content -Path $script:LogFile -Value $line
}

# --- Elevation check ---
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script must be run as Administrator."
    exit 1603
}

# --- Validate ServiceName (Windows internal name cannot contain spaces/parentheses) ---
# --- Validate ServiceName (allow spaces; block problematic characters) ---
if ($ServiceName -notmatch '^[A-Za-z0-9_.\- ]+$') {
    Write-Host "ERROR: ServiceName '$ServiceName' contains invalid characters."
    Write-Host "Allowed characters: letters, numbers, space, underscore, dot, hyphen."
    exit 1604
}


# --- Defaults & paths ---
if (-not $DisplayName) { $DisplayName = $ServiceName }

if (-not (Test-Path $ExePath)) {
    Write-Host "Executable not found: $ExePath"
    exit 2
}
$ExePath = (Resolve-Path -Path $ExePath).Path

$script:LogFile = if ($LogPath) { $LogPath } else { Join-Path $env:TEMP ("svc-install-{0}.log" -f ($ServiceName -replace '[^\w\.-]','_')) }
"--- Service install/update log for '$ServiceName' ---" | Set-Content -Path $script:LogFile

Write-Log "ServiceName = $ServiceName"
Write-Log "ExePath     = $ExePath"
Write-Log "DisplayName = $DisplayName"
Write-Log "StartType   = $StartType"
if ($Description) { Write-Log "Description = $Description" }
Write-Log "LogPath     = $script:LogFile"

# Map StartType to sc value
$scStart = switch ($StartType) {
    'Automatic' { 'auto' }
    'Manual'    { 'demand' }
    'Disabled'  { 'disabled' }
}

# Build binPath (quoted exe plus optional args)
$quotedExe = '"' + $ExePath + '"'
$binPathFull = if ($Arguments -and $Arguments.Trim()) { "$quotedExe $Arguments" } else { $quotedExe }
Write-Log "binPath     = $binPathFull"

function Get-ServiceExists {
    try {
        $null = Get-Service -Name $ServiceName -ErrorAction Stop
        return $true
    } catch { return $false }
}

function Stop-Service-IfRunning {
    try {
        $svc = Get-Service -Name $ServiceName -ErrorAction Stop
        if ($svc.Status -ne 'Stopped') {
            Write-Log "Stopping service '$ServiceName'..."
            Stop-Service -Name $ServiceName -Force -ErrorAction Stop
            $svc.WaitForStatus('Stopped','00:00:20')
            Write-Log "Service stopped."
        } else {
            Write-Log "Service already stopped."
        }
    } catch {
        Write-Log "Stop skipped (not installed yet or cannot query): $($_.Exception.Message)"
    }
}

function Ensure-Service-Created-Or-Updated {
    if (Get-ServiceExists) {
        Write-Log "Service exists. Updating config..."
        # Stop first
        Stop-Service-IfRunning

        # Update binPath and start type (Set-Service cannot change BinaryPathName)
        $args = @(
            'config', $ServiceName,
            ('binPath= '   + $binPathFull),
            ('start= '     + $scStart)
        )
        $p = Start-Process -FilePath "$env:WINDIR\System32\sc.exe" -ArgumentList $args -Wait -NoNewWindow -PassThru `
             -RedirectStandardOutput "$env:TEMP\sc_cfg_$($ServiceName).txt"
        $cfgOut = Get-Content "$env:TEMP\sc_cfg_$($ServiceName).txt" -Raw
        Write-Log "sc config output: $cfgOut"
        if ($p.ExitCode -ne 0) { Write-Log "ERROR: sc config failed with exit code $($p.ExitCode)."; exit 3 }

        if ($DisplayName) {
            $p = Start-Process -FilePath "$env:WINDIR\System32\sc.exe" -ArgumentList @(
                'config', $ServiceName, ('DisplayName= ' + $DisplayName)
            ) -Wait -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\sc_disp_$($ServiceName).txt"
            $dispOut = Get-Content "$env:TEMP\sc_disp_$($ServiceName).txt" -Raw
            Write-Log "sc displayname output: $dispOut"
        }
    } else {
        Write-Log "Service does not exist. Creating..."
        # New-Service supports quoted path + args via -BinaryPathName
        New-Service -Name $ServiceName `
                    -BinaryPathName $binPathFull `
                    -DisplayName $DisplayName `
                    -StartupType $StartType `
                    -ErrorAction Stop
    }

    if ($Description) {
        # Description must be quoted for sc.exe when it contains spaces
        $quotedDescription = '"' + $Description + '"'
        $p = Start-Process -FilePath "$env:WINDIR\System32\sc.exe" -ArgumentList @(
            'description', $ServiceName, $quotedDescription
        ) -Wait -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\sc_desc_$($ServiceName).txt"
        $descOut = Get-Content "$env:TEMP\sc_desc_$($ServiceName).txt" -Raw
        Write-Log "sc description output: $descOut"
    }
}

function Set-RecoveryOptions {
    # Restart on failure (1st/2nd/subsequent) after 5s, reset after 1 day
    $actions = 'restart/5000/restart/5000/restart/5000'
    $p = Start-Process -FilePath "$env:WINDIR\System32\sc.exe" -ArgumentList @(
        'failure', $ServiceName, 'reset= 86400', ('actions= ' + $actions)
    ) -Wait -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\sc_fail_$($ServiceName).txt"

    # Optional: read SC output if you still want it for troubleshooting
    # $out = Get-Content "$env:TEMP\sc_fail_$($ServiceName).txt" -Raw

    Write-Log "Configured automatic restart if the service stops unexpectedly."
}

function Start-Service-IfNeeded {
    if ($StartType -eq 'Disabled') {
        Write-Log "Service is Disabled; not starting."
        return
    }
    try {
        Write-Log "Starting service '$ServiceName'..."
        Start-Service -Name $ServiceName -ErrorAction Stop
        (Get-Service -Name $ServiceName).WaitForStatus('Running','00:00:25')
        Write-Log "Service started successfully."
    } catch {
        Write-Log "ERROR: failed to start service: $($_.Exception.Message)"
        exit 5
    }
}

# --- Main flow ---
try {
    Stop-Service-IfRunning
    Ensure-Service-Created-Or-Updated
    Set-RecoveryOptions
    #Start-Service-IfNeeded
    Write-Log "DONE."
    exit 0
}
catch {
    Write-Log "UNHANDLED ERROR: $($_.Exception.Message)"
    exit 1
}