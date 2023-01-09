TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data

WriteMatrix PROTO matrixOffset:DWORD, rows:DWORD, columns:DWORD, bytesInCell:DWORD

Matrix DW -1, 2, 3, -4, 5
DW 6, -7, 8, -9, 10
DW -11, 12, 13, -14, 15
RowLength EQU sizeof Matrix
columns DD 5

.code
main PROC
	call Clrscr
	finit

	INVOKE WriteMatrix, OFFSET Matrix, 3, 5, type Matrix

	call ReadInt

	mov EBX, RowLength
	imul EBX, EAX
	mov ECX, 5
	xor ESI, ESI

	ChangeSignLoop:
		mov AX, Matrix[EBX + ESI * type Matrix]
		imul AX, -1
		mov Matrix[EBX + ESI * type Matrix], AX

		inc ESI
		loop ChangeSignLoop

	INVOKE WriteMatrix, OFFSET Matrix, 3, 5, type Matrix
	call Crlf

	mov ECX, 5
	xor ESI, ESI
	ColumnsSumLoop:
		push ECX

		mov ECX, 3
		xor DX, DX
		xor EDI, EDI

		ColumsSumLoopRows:
			mov EBX, RowLength
			imul EBX, EDI

			add DX, word ptr Matrix[EBX + ESI * type Matrix]
			inc EDI
			loop ColumsSumLoopRows

		movsx EAX, DX
		call WriteInt
		call Crlf

		pop ECX
		inc ESI
		loop ColumnsSumLoop


	call Crlf
	call ReadInt
	mov ECX, 5
	xor ESI, ESI

	mov EBX, RowLength
	imul EBX, EAX
	fldz

	AverageLoop:
		fild word ptr Matrix[EBX + ESI * type Matrix]
		fadd

		inc ESI
		loop AverageLoop

	fild columns
	fdiv

	call WriteFloat

	exit
main ENDP

END main