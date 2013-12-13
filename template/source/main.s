.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

/*SetGpioFunction*/
pinNum .req r0
pinFunc .req r1
mov pinNum,#16
mov pinFunc,#1
bl SetGpioFunction
.unreq pinNum
.unreq pinFunc

/*Blink loop*/
loop$:

/*Turn on OK LED*/
pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#0
bl SetGpio
.unreq pinNum
.unreq pinVal

/*Create Wait(Delay) to keep LED on*/
ldr r0,=10000
bl Wait

/*Turn off OK LED*/
pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1
bl SetGpio
.unreq pinNum
.unreq pinVal

/*Create Wait(Delay) to keep LED off*/
ldr r0,=10000
bl Wait

/*Loop LED blink*/
b loop$
