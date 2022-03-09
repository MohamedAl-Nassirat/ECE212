/*Author - Wing Hoy. Last edited on Feb 5, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Test
.global printf
.global cr
.global getchar
.global putchar
.global value

.text
Test:
PUSH {lr}
/*--------------------------------------*/
Repeat:
bl cr
ldr r0, =Welcome
bl printf
bl cr

ldr r0, =Welcome1
bl printf
bl cr

ldr r0, =Welcome2
bl printf
bl cr

bl getchar
mov r4,r0
bl cr

cmp r4,#0x31
beq Test1
cmp r4,#0x32
beq Test2

ldr r0, =Error
bl printf
bl cr
bal Repeat

Test1:
ldr r4,=#0x20001000
ldr r5,=#0x20002000
ldr r0, =Output1
bl printf
bl cr
Testagain:
mov r6,#0x0d
mov r10,r6
ldr r6,[r4]
mov r8,r6
ldr r6,[r5]
mov r9,r6
cmp r8,r10
beq Exit
ldr r0, =Output1a
bl printf
mov r0,r8
bl putchar
ldr r0, =Output1b
bl printf
mov r0,r9
bl value
bl cr
add r4,#4
add r5,#4
bal Testagain

Test2:
ldr r4,=#0x20001000
ldr r5,=#0x20003000
ldr r0, =Output1
bl printf
bl cr

Testagain1:
mov r6,#0x0d
mov r10,r6
ldr r6,[r4]
mov r8,r6
ldr r6,[r5]
mov r9,r6
cmp r8,r10
beq Exit
ldr r0, =Output1a
bl printf
mov r0,r8
bl putchar
ldr r0, =Output1c
bl printf
mov r0,r9
bl putchar
bl cr
add r4,#4
add r5,#4
bal Testagain1

Exit:
mov r4,r4
/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
Welcome:
.string "Welcome to lab1 test program, please select"
Welcome1:
.string "Press 1 to test part a"
Welcome2:
.string "Press 2 to test part b"
Error:
.string "Wrong Selection, Please select again"
Output1:
.string "The conversion is starting at 0x20001000:"
Output1a:
.string "Ascii Character = "
Output1b:
.string " Decimal value = "
Output1c:
.string " Upper or lower case equivalent = "

/*--------------------------------------*/
