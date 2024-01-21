# Fraud Detection

QLM can track illegal computers that connect to the License Server and logs information about these computers in the database. An illegal computer is defined as a computer that has a valid license key but whose license key is (a) not in the database or (b) in the database but registered for another computer. This situation can occur if a user with a valid license key requests that his license be released from computer A claiming to have uninstalled your program from computer A. If the user subsequently attempts to connect to the License Server via computer A, QLM detects this computer as an illegal computer and logs it into the database.

![](<../../../.gitbook/assets/image (13).png>)Illegal Computers

This button displays a list of all the detected illegal computers. QLM does not prevent all illegal computer from running your application. Once an illegal computer is detected, it is up to you to decide the course of action to take by contacting the customer and enquiring about the situation.

![](<../../../.gitbook/assets/image (14).png>)Activation Attempts

Click the Activation Attempts button to view a list of failed activation attempts. A failed activation is typically due to multiple attempts to activate the same license key on different computers. Though failed activation attempts may indicate an intention to illegally activate a license on a particular computer, they can also be regarded as the sign of a user who needs additional licenses for your software.

