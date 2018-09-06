; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
 
; Khai bao doan ma lenh
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
;Tinh x^n
soN equ 9
soX equ 3
start
	ldr r2, =soN
	ldr r3, =soX
	mov r0,r3
	mov r1,#1
	bl tinhToan
tinhToan proc
	cmp r1,r2
	bgt thoat
	mul r0,r3
	add r1,#1
	bl tinhToan
thoat
	nop
	endp
stop b stop
end
