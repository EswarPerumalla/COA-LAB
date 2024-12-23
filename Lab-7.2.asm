ORG 100h ; Origin, to specify that the program starts at 100h (COM file format)
; Display message "Enter the first digit: "
MOV DX, OFFSET msg_input1 ; Load the address of the first input message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h ; Call DOS interrupt to print the message
; Read the first digit from the user
MOV AH, 01h ; Function 01h of INT 21h is used to read a character
INT 21h ; Call DOS interrupt to get the character
SUB AL, '0' ; Convert ASCII to actual number (subtract ASCII value of '0')
MOV BL, AL ; Store the first digit in BL
; Display message "Enter the second digit: "
MOV DX, OFFSET msg_input2 ; Load the address of the second input message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h ; Call DOS interrupt to print the message
; Read the second digit from the user
MOV AH, 01h ; Function 01h of INT 21h is used to read a character
INT 21h ; Call DOS interrupt to get the character
SUB AL, '0' ; Convert ASCII to actual number (subtract ASCII value of '0')
MOV BH, AL ; Store the second digit in BH
; Perform the addition

ADD BL, BH ; Add the two digits (BL = first digit, BH = second digit)
; Display message "The result is: "
MOV DX, OFFSET msg_output ; Load the address of the output message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h ; Call DOS interrupt to print the output message
; Handle result above 9 (two-digit number)
CMP BL, 10 ; Compare the result with 10
JL PrintResult ; If result is less than 10, jump to PrintResult
; Handle two-digit result
MOV AL, BL ; Load the result into AL
MOV AH, 00 ; Clear AH for division
MOV CL, 10 ; Load divisor (10) into CL
DIV CL ; AL = quotient (tens), AH = remainder (ones)
; Print the tens digit
ADD AL, '0' ; Convert tens digit to ASCII
MOV DL, AL ; Load tens digit into DL
MOV AH, 02h ; Function 02h to print a character
INT 21h ; Print tens digit
; Print the ones digit
ADD AH, '0' ; Convert ones digit to ASCII
MOV DL, AH ; Load ones digit into DL
MOV AH, 02h ; Function 02h to print a character
INT 21h ; Print ones digit
JMP EndProgram ; Jump to end
PrintResult:
; If the result is a single-digit number
ADD BL, '0' ; Convert single-digit result to ASCII
; Print the result
MOV DL, BL ; Load result into DL for printing
MOV AH, 02h ; Function 02h to print a character
INT 21h ; Call DOS interrupt to print the result
EndProgram:
MOV AH, 4Ch ; Function 4Ch of INT 21h terminates the program
INT 21h ; Call DOS interrupt to exit
msg_input1 DB 'Enter the first digit: $'
msg_input2 DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output DB 0Dh, 0Ah, 'The result is: $'