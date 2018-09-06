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
;Tính tổng các số <N
soN equ 9
start
	ldr r2, =soN
	mov r0,#0
	mov r1,#1
loop
	cmp r1,r2
	bgt thoat
	bl sum
	b loop
thoat
	nop
sum proc
	add r0,r1
	add r1,#1
	endp	
stop b stop
end