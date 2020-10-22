#include "p16F628a.inc"
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
 
i equ 0x30
j equ 0x31
k equ 0x32
l equ 0x33
m equ 0x34

START
 
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000000'
    MOVWF TRISB
    BCF STATUS, RP0
    
inicio:
	BSF PORTB, 0
	CALL ta
	nop
	nop
	nop
	nop
	nop
	BCF PORTB, 0
	CALL tb
	nop
	nop
	nop
	nop
	GOTO inicio
	
ta:	MOVLW d'43'
	MOVWF i
	nop
	nop
	nop
	nop
	nop
lopj:	MOVLW d'60'
	MOVWF j
	nop
	nop
	nop
	nop
lopk:   MOVLW d'51'
	MOVWF k
	nop
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO lopk
	DECFSZ i
	GOTO lopj
	RETURN
	
tb:	MOVLW d'56'
	MOVWF i
	nop
	nop
	nop
	nop
loopj:	MOVLW d'54'
	MOVWF j
	nop
loopk:  MOVLW d'64'
	MOVWF k
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO loopk
	DECFSZ i
	GOTO loopj
	RETURN
END