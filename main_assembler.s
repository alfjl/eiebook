;##############################################################################
;# File: main_assembler.s
;##############################################################################

;------------------------------------------------------------------------------
; Description
; This is a demonstration program to show basic code structures in assembly
; A test comment.
; A second test comment.

; Includes
#define  __ASSEMBLY__           1  ; Need this so the correct values in AT91SAM3U4.h are selected
#include "AT91SAM3U4.h"	           ; Include file for all special function registers
						                       ; and corresponding bit names
; A "MODULE" in an assembly file becomes and object file after it is assembled.
 		MODULE  main_assembler
    SECTION .text : CODE : NOROOT(2)
    THUMB

; "PUBLIC" declarations make labels from this file visible to others
		PUBLIC  main
				

main

move_eg   MOV       r0, #10             ; r0 = 10
          MOV       r1, r0              ; r1 = r0
          MOV       r0, r1, LSL #4      ; r0 = r1 * 16
          MOV       r0, r1, ASR #1      ; r0 = signed(r1 / 2)

move_eg2  MOV       r2, #8              ; r2 = 8
          MOV       r0, r1, LSL r2      ; r0 = r1 x 2^r2
          MOV       r0, r1, ASR r2      ; r0 = signed(r1 / 2^r2)

move_eg3  MOV       r0, #0              ; r0 = 0
          MOV       r1, #0              ; r1 = 0
          MOV       r2, r1              ; r2 = r1
          MOVS      r3, #0              ; r3 = 0, update APSR
          ADD       r0, r0, #256        ; r0 = r0 + 256
          ADD       r1, r1, r0, LSL #2  ; r1 = r1 + (4 x r0)
          MOV       r2, r0, LSR #6      ; r2 = r0 / 64
          SUBS      r3, r1, r0          ; r3 = r1 - r0, update APSR
          IT        EQ                  ; Get ready for conditional 'EQ'(=equal)
          MOVEQ     r3, #1024           ; if {Z}, r3 = 1024 (only executed, if result of previous instruction left Zero-flag as '1'. Not in this case!)
          RSBS      r3, r1, r0, LSL #4  ; r3 = (16 x r0) - r1) ('RSBS' =reverse subtraction (operand2 - operand1))

	END