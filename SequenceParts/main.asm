TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
.data

GenerateSequence PROTO sequenceOffset:DWORD, count:DWORD, maxNum:WORD
WriteMatrix PROTO matrixOffset:DWORD, rows:DWORD, columns:DWORD, bytesInCell:DWORD

SequenceLength DD 6
Sequence DW 6 dup(?)

.code
main PROC
	call Clrscr
	finit

	INVOKE GenerateSequence, OFFSET Sequence, SequenceLength, 20
	INVOKE WriteMatrix, OFFSET Sequence, 1, SequenceLength, 2

	mov ECX, SequenceLength
	xor ESI, ESI

	NumbersLoop:
		push ECX
		xor EAX, EAX

		mov ECX, SequenceLength
		xor EDI, EDI
		LessLoop:
			mov DX, Sequence[2 * EDI]
			mov BX, Sequence[2 * ESI]
			cmp DX, BX
			jae LessLoopContinue
			inc EAX

			LessLoopContinue:
				inc EDI
				loop LessLoop

		call WriteInt
		inc ESI
		pop ECX
		loop NumbersLoop

	call Crlf
	fldz
	mov ECX, SequenceLength
	xor ESI, ESI
	AverageLoop:
		fild word ptr [Sequence + 2*ESI]
		fadd
		inc ESI
		loop AverageLoop

	fild SequenceLength
	fdiv
	call WriteFloat

	exit
main ENDP

END main