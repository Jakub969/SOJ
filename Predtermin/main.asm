TITLE MASM Template						(main.asm)

INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data
Matica DB 0,3,1,5,0
	   DB 3,0,1,0,4
	   DB 1,1,0,1,1
	   DB 5,0,1,0,2
	   DB 0,4,1,2,0

Rozmer DB 5

Sprava1 DB "Zle zadany vrchol, zadaj vrchol od 1-5. ",0
Sprava2 DB "Zadaj vrchol (1-5). ",0
Sprava3 DB "Susedne vrcholy su: ",0
.code
main PROC
	
NacitajVrchol:
	mov edx, offset Sprava2
	call WriteString
	call ReadInt
	cmp eax,5
	jg ZlyVrchol
	cmp eax,0
	je	ZlyVrchol
	dec eax
	mov edx, offset sprava3
	call WriteString
	movzx ecx, rozmer
	xor esi,esi
Vypis:
	push eax
	mov ebx, eax
	movzx eax, rozmer
	mul ebx
	movzx ebx, Matica[eax + esi]
	inc esi
	cmp ebx, 0
	je preskoc
	mov eax, esi
	call WriteInt
	call Crlf
	pop eax
Preskoc:
	loop Vypis
	jmp Koniec
ZlyVrchol:
	mov edx, offset sprava1
	call WriteString
	call Crlf
	jmp NacitajVrchol
Koniec:
	exit
main ENDP
END main