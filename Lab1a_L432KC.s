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


// 0-9 Decimal
// 0x41-46 upperCase


// R1 = Data
// R2= Storage
// R9 = Exit
// R5 = ZeroExtending
// R7 = Counter
//

.EQU Data, 0x20001000 // Loads data address 0x20001000 into R1
LDR r1, =Data 

.EQU Storage, 0x20002000 // Loads the storage address 0x20002000 into R2
LDR r2, =Storage


.EQU Data3, 0xFFFFFFFF // 32 bit extended (zero extending) into R5
LDR r5, =Data3



mov r7, #50 // 50 iterations (Counter)

loop:

	LDR R3,[r1] // Loads sample data into R3
	CMP R3, #0x0D // Comparing R3 with Enter
	BEQ End // If enter is pressed, go to end (nothing)
	CMP r3, #0x30 // Is the number less than 30
	BLO Error // If yes, Error
	cmp r3, #0x3A // Is the number less then 39?
	BLO decimalConversion // if it is lower, begin conversion
	cmp r3, #0x41  // is it lower then 41?
	Blo Error // if so, error
	CMP R3, #0x47 // is it lower then 46
	BLO upperCase // if so, it's A-F so begin conversion
	CMP R3, #0x61 // less than 61
	BLO Error // If so, give error
	CMP r3, #0x67 // lower then 67
	BLO lowerCase // a-f conversion
	B Error // error


decimalConversion:
	SUB R3, #0x30 // Subtract decimal value stored in R3 by 30, to give 0-9
	STR R3, [R2] //stores data in storage
	ADD R2, #0x4 // 4 bytes (32 bits)
	ADD R1, #0x4 // Add to counter
	SUB R7, 1 // Counter -1 to track 
	CMP R7, #0 // Is the counter at 0? If so stop
	BEQ End 
	B loop

upperCase:
	SUB R3, #0x37 
	STR R3, [R2]
	ADD R2, #0x4
	ADD R1, #0x4
	SUB R7, 1
	CMP R7, #0
	BEQ End
	B loop


lowerCase:

	SUB R3, #0x57
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
