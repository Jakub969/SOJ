INCLUDE Irvine32.inc

.code

WriteMatrix PROC USES EAX EBX ECX ESI EDI matrixOffset:DWORD, rows:DWORD, columns:DWORD, bytesInCell:DWORD
	mov ECX, rows
	xor ESI, ESI; aktuálny index riadka * type

	LoopRows:
		mov EBX, columns
		imul EBX, ESI; v EBX je aktuálny offset riadka

		push ECX
		
		add EBX, matrixOffset

		mov ECX, columns
		xor EDI, EDI

		LoopColumns:
			movsx EAX, word ptr [EBX + EDI]
			call WriteInt
			add EDI, bytesInCell
			loop LoopColumns

		pop ECX
		add ESI, bytesInCell

		call Crlf
		loop LoopRows
	ret
WriteMatrix ENDP

END