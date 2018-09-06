; Khai bao doan du lieu  (x^n+1 -1)/(x-1)
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
	subs r4,r0,#1
	subs r5,r3,#1
	sdiv r0,r4,r5
	endp
stop b stop
end
