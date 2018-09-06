; Khai bao doan du lieu   (1-x^n+1)/(1-x)
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
;Tinh 1+x+...x^n
soN equ 9
soX equ 3
start
	ldr r2, =soN
	ldr r3, =soX
	mov r0,#1
	mov r1,#0
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
sum proc
	mov r4,#1
	subs r4,#1,r0
	subs r5,#1,r3
	sdiv r0,r4,r5
	endp
stop b stop
end
