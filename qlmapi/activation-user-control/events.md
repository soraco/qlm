# Events

| Name                 | Description                                                                                                                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| QlmActivate          | This event is triggered when the user activates the license. Details about the success of the activation as well as the keys that were activated can be retrieved from the ActivateEventArgs argument. |
| QlmClose             | This event is triggered when the user clicks the Close button. You would typically need to implement this event to close the Form that is hosting this .NET control.                                   |
| QlmOfflineActivation | This event is triggered when the user clicks the Offline activation radio button.                                                                                                                      |
| QlmReadKeys          | This event is triggered when the control tries to read the keys from the system. You can set this event to implement your own way of reading keys.                                                     |
| QlmWriteKeys         | This event is triggered when the control tries to write the keys to the system. You can set this event to implement your own way of writing keys.                                                      |
