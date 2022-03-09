/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr
.syntax unified

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

//

.EQU Data, 0x20001000
LDR r1, =Data //loads the data in the r1 register

.EQU Storage, 0x20003000
LDR r2, =Storage //loads the storate into r2 register



.EQU Data3, 0x2A
LDR r5, =Data3



mov r7, #50 // 50 iterations

loop:

	LDR R3,[r1]
	CMP R3, #0x0D
	BEQ End
	CMP r3, #0x30
	BLO Error // If yes, Error
	cmp r3, #0x3A
	BLO decimalConversion // Then it means it's 0-9, begin conversion
	cmp r3, #0x41  // is it higher then 41?
	Blo Error // if no, continue
	CMP R3, #0x47 // is it lower then 46
	BLO upperCase
	CMP R3, #0x61 // less than 61
	BLO Error // lower
	CMP r3, #0x67
	BLO lowerCase
	B Error


decimalConversion:

	STR R5, [R2]
	ADD R2, #0x4
	ADD R1, #0x4
	SUB R7, 1
	CMP R7, #0
	BEQ End
	b loop

upperCase:

	ADD R3, #0x20
	STR R3, [R2]
	ADD R2, #0x4
	ADD R1, #0x4
	SUB R7, 1
	CMP R7, #0
	BEQ End
	B loop


lowerCase:

	SUB R3, #0x20
	STR R3, [R2]
	ADD R2, #0x4
	ADD R1, #0x4
	SUB R7, 1
	CMP R7, #0
	BEQ End
	B loop

Error:

	STR R5, [R2]
	ADD R2, #0x4
	ADD R1, #0x4
	SUB R7, 1
	CMP R7, #0
	BEQ End
	b loop

End:

























/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
