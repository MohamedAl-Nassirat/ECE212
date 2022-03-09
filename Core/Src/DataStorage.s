/*Author - Wing Hoy. Last edited on Jan 18, 2021 */
.global Intialization

.text
.equ Opcode, 0x20001000

Intialization:
PUSH {lr}

ldr r4, =Opcode
ldr r5, =FirstBlock
movs r6, #23


again:
ldr r3,[r5]
str r3,[r4]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

POP {PC}

.data
FirstBlock:
.long 0x30
.long 0x31
.long 0x32
.long 0x33
.long 0x34
.long 0x35
.long 0x36
.long 0x37
.long 0x38
.long 0x39
.long 0x41
.long 0x42
.long 0x43
.long 0x44
.long 0x45
.long 0x46
.long 0x61
.long 0x62
.long 0x63
.long 0x64
.long 0x65
.long 0x66
.long 0x0d


