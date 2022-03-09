/*Author - Wing Hoy. Last edited on Jan 14, 2022 */
.global Clear
.syntax unified

.text
.equ Opcode, 0x20002000
.equ Opcode1, 0x20003000

Clear:
PUSH {lr}

ldr r4, =Opcode
movs r6, #50
movs r3,#0
again:
str r3,[r4]
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

ldr r4, =Opcode1
movs r6, #50
movs r3,#0
again1:
str r3,[r4]
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again1

POP {PC}
