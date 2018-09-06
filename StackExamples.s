;	CHUONG TRINH MINH HOA SU DUNG NGAN XEP

INITIAL_MSP	EQU	0x20001000	; Initial Main Stack Pointer Value	 
			; Allocating 1000 bytes to the stack as it grows down
;Data			
 AREA    RESET, DATA, READONLY
            EXPORT  __Vectors

__Vectors	DCD	INITIAL_MSP	; stack pointer value when stack is empty
        	DCD	Reset_Handler	; reset vector
		ALIGN

; Program
; Linker requires Reset_Handler

            AREA    MYCODE, CODE, READONLY

		    ENTRY
		    EXPORT	Reset_Handler

		    ALIGN
;;; Define Procedures
;;;;;;;user main program;;;;;;;;

Reset_Handler  	
         
main PROC
	LDR R0,=ValOne ; Passing of the @ of the first argument
	LDR R3,=ValTwo ; Passing of the @ of the second argument
	LDR R4,= Maxi ; Passing of the @ of the exit argument
	BL MaxVer3 ; Call to the procedure
Infinity B Infinity ; End of the program
	ENDP
;– – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – –
MaxVer3 PROC
	PUSH {R1-R2} ; Save the modified registers
	LDR R1,[R0] ; Read the first argument
	LDR R2,[R3] ; Read second argument
	CMP R1,R2
	BHS Good ; If ValOne < ValTwo ...
ExChange MOV R1,R2 ; ... ValTwo becomes the max
Good 	STR R1,[R4] ; Store the result contained in R1
		POP {R1-R2} ; Restore the saved registers
		BX LR ; Return
		ENDP


        END
 ;!!! Đây chỉ là file nghiên cứu làm bài stack chứ éo phải bài làm đâu (ngủ mai tính sau)
