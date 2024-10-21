;hello
;using assembly language for turning LED on


.include "/data/data/com.termux/files/home/m328Pdef.inc"


  ; Initialize ports for LCD (Assume RS -> PD0, EN -> PD1, D4-D7 -> PD4-PD7)
.org 0x00
    rjmp RESET

RESET:
    ; Set RS, EN, D4-D7 as output
    ldi r16, 0b11110011
    out DDRD, r16         ; Set PD0, PD1, PD4-PD7 as output
    
    ; LCD initialization sequence
    rcall LCD_INIT

    ; Write "A square wave of" to LCD
    rcall LCD_CLEAR
    rcall WRITE_STRING_LINE1
    rcall WRITE_STRING_LINE2

    rjmp LOOP

; LCD initialization subroutine
LCD_INIT:
    ; Initialize LCD in 4-bit mode
    ; Send commands for function set, display on, clear display, etc.
    ; Details depend on the LCD model
    ret

; Subroutine to clear the LCD
LCD_CLEAR:
    ; Send the clear display command (0x01)
    ret

; Subroutine to write "A square wave of" to line 1
WRITE_STRING_LINE1:
    ldi r16, 'A'           ; Load character 'A' ASCII
    rcall LCD_WRITE_CHAR
    ldi r16, ' '           ; Write ' ' (space)
    rcall LCD_WRITE_CHAR
    ; Continue for the rest of the string
    ret

; Subroutine to write "frequency 50 MHz" to line 2
WRITE_STRING_LINE2:
    ; Move cursor to line 2
    ldi r16, 0xC0          ; Address of second line
    rcall LCD_COMMAND

    ldi r16, 'f'
    rcall LCD_WRITE_CHAR
    ; Continue for the rest of the string
    ret

; Subroutine to write a single character to LCD
LCD_WRITE_CHAR:
    ; Set RS pin (PD0) for data mode
    sbi PORTD, 0

    ; Write upper nibble of character
    rcall SEND_NIBBLE
    ; Write lower nibble of character
    ret

; Subroutine to send a 4-bit nibble to the LCD
SEND_NIBBLE:
    ; Send upper nibble to PD4-PD7
    ret

; Subroutine to send a command to LCD
LCD_COMMAND:
    ; Clear RS pin (PD0) for command mode
    cbi PORTD, 0

    ; Send upper nibble
    rcall SEND_NIBBLE
    ; Send lower nibble
    ret

LOOP:
    rjmp LOOP
