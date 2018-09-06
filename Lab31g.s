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
;Tinh gcd
soA equ 9
soB equ 6
start
	ldr r2, =soA
	ldr r3, =soB
	mov r4,#0			//temp =0
	mov r0,#0			//r0 = UCLN
	bl UCLN
UCLN proc
	cmp r3,#0
	beq thoat
	udiv r4,r2,r3
	mls r4,r4,r3,r2
	mov r2=r3
	mov r3=r4 
	bl UCLN
thoat
	mov r0,r2
	endp
stop b stop
end
