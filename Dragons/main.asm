TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data

DragonBuro DD 00000011111100000000000000000000b
DragonFifi DD 00000000111111000000000000000000b
DragonSano DD 00000000011111100000000000000000b
DragonPepe DD 00000000000011111100000000000000b
DragonRici DD 00000000000000011111000000000000b
DragonDodo DD 00000000000000001111100000000000b

DragonsMouths DB 3, 5, 10, 6, 7, 4

Dragons DD DragonBuro, DragonFifi, DragonSano, DragonPepe, DragonRici, DragonDodo

DragonsCount DB 0
HoursCount DB 0
MouthsCount DB 0

.code
main PROC
	call Clrscr

	;A-------------------------------------------
	mov ECX, 6
	xor ESI, ESI
	mov EBX, Dragons

	DragonsLoopA:
		push ECX

		mov ECX, 2
		mov EDI, 16
		xor EAX, EAX

		BitsLoopA:
			mov EDX, 1

			push ECX
			mov ECX, 31
			sub ECX, EDI
			shl EDX, CL
			pop ECX

			test dword ptr [EBX + 4*ESI], EDX
			jnz IsNotZeroA

			BitsLoopContinueA:
				inc EDI
				loop BitsLoopA

		cmp EAX, 2
		je IsDragonA

		DragonsLoopContinueA:
			inc ESI
			pop ECX
			loop DragonsLoopA
			jmp EndA

	IsNotZeroA:
		inc EAX
		jmp BitsLoopContinueA

	IsDragonA:
		inc DragonsCount
		mov EAX, ESI
		call WriteInt
		mWrite " "
		jmp DragonsLoopContinueA

	EndA:
		call Crlf
		movzx EAX, DragonsCount
		call WriteInt
	;-------------------------------------------

	call Crlf
	call Crlf
	call Crlf

	;B-------------------------------------------
	
	mov ECX, 32
	xor ESI, ESI
	BitsLoopB:
		push ECX

		mov ECX, 6
		xor EDI, EDI
		xor EAX, EAX

		DragonsLoopB:
			mov EDX, 1

			push ECX
			mov ECX, 31
			sub ECX, ESI
			shl EDX, CL
			pop ECX

			test dword ptr [EBX + 4*EDI], EDX
			jnz IsNotZeroB

			DragonsLoopContinueB:
				inc EDI
				loop DragonsLoopB

		cmp EAX, 2
		je IsHour

		BitsLoopContinueB:
			pop ECX
			inc ESI
			loop BitsLoopB
			jmp EndB

	IsNotZeroB:
		inc EAX
		jmp DragonsLoopContinueB

	IsHour:
		inc HoursCount
		mov EAX, ESI
		call WriteInt
		mWrite " "
		jmp BitsLoopContinueB

	EndB:
		call Crlf
		movzx EAX, HoursCount
		call WriteInt
	;-------------------------------------------

	call Crlf
	call Crlf
	call Crlf

	;C-------------------------------------------
	mov ECX, 6
	xor ESI, ESI
	mov EBX, Dragons

	DragonsLoopC:
		push ECX

		mov ECX, 2
		mov EDI, 12
		xor EAX, EAX

		BitsLoopC:
			mov EDX, 1

			push ECX
			mov ECX, 31
			sub ECX, EDI
			shl EDX, CL
			pop ECX

			test dword ptr [EBX + 4*ESI], EDX
			jnz IsNotZeroC

			BitsLoopContinueC:
				inc EDI
				loop BitsLoopC

		cmp EAX, 2
		je IsDragonC

		DragonsLoopContinueC:
			inc ESI
			pop ECX
			loop DragonsLoopC
			jmp EndC

	IsNotZeroC:
		inc EAX
		jmp BitsLoopContinueC

	IsDragonC:
		push AX
		mov AL, byte ptr[DragonsMouths + ESI]
		add MouthsCount, AL
		pop AX

		mov EAX, ESI
		call WriteInt
		mWrite " "
		jmp DragonsLoopContinueC

	EndC:
		call Crlf
		movzx EAX, MouthsCount
		call WriteInt
	;-------------------------------------------

	exit
main ENDP

END main