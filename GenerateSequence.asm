INCLUDE Irvine32.inc

.code

GenerateSequence PROC USES EAX EBX ECX ESI sequenceOffset:DWORD, count:DWORD, maxNum:WORD
	call Randomize
	mov EBX, sequenceOffset
	mov ECX, count
	xor ESI, ESI

	GenerateLoop:
		movzx EAX, maxNum
		call RandomRange

		mov word ptr [EBX + 2 * ESI], AX

		inc ESI
		loop GenerateLoop
	ret
GenerateSequence ENDP

END