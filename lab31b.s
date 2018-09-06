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
;Tính tổng các số chẵn, lẻ
soN equ 9
ktraChanLe proc
	mov r3,#2
	udiv r4,r1,r3  ;r4=r1/r3
	mls r4,r4,r3,r1		;r4=r1-r3*r4
	endp
sumLe proc
	add r5,r1	; tổng số lẻ=r5
	endp
sumChan proc
	add r0,r1	;tổng số chẵn =r0
	add r1,#1	;i++
	endp
start 
	ldr r2, =soN
	mov r0,#0	;tong so chan =r0
	mov r5,#0	;tong so le =r5
	mov r1,#1	;i=1
loop
	cmp r1,r2
	bgt thoat	; true: thoat
	;Ktra tinh chan le
	bl ktraChanLe
	cmp r4,#0	
	bne sumLe	;tinh tong cac so le
	bl sumChan	;tinh tong cac so chan va tang bien dem them 1
	b loop
thoat
	nop
stop end stop
end
