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
;Tong cac so <=N va chia het cho 5
soN equ 9
start 
	ldr r2, =soN
	mov r0,#0	
	mov r1,#1	//i=1
loop
	cmp r1,r2	// i>9 ?		
	bgt thoat	// true: thoat
	bl ktra
	cmp r4,#0	
	beq tong	
	add r1,#1	//i++
	b loop
ktra proc
	mov r3,#5
	udiv r4,r1,r3  //r4=r1/r3
	mls r4,r4,r3,r1
	endp
tong proc
	add r0,r1	// tổng  =r0
	endp
thoat
	nop
stop end stop
end
