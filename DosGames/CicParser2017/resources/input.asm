		public start
start		proc near
		push	ds
		mov	ax, 0
		push	ax
		call	sub_code_5C60
		mov	ax, seg	data
		mov	ds, ax
		assume ds:data
		call	sub_code_13AA
		mov	byte ptr word_data_8+688h, 4
		mov	word ptr byte_data_6D37+0C1h, 0
		mov	byte ptr word_data_8+693h, 0
		call	sub_code_1419
		call	sub_code_13E8
		mov	ax, word_data_8+68Bh
		add	ax, 240h
		mov	word ptr byte_data_6D37+0C9h, ax
		mov	ax, 4
		int	10h		; - VIDEO - SET	VIDEO MODE
					; AL = mode
		mov	al, 4
		cmp	byte ptr word_data_8+68Fh, 0FDh	; '�'
		jz	short loc_code_3F
		mov	al, 6

loc_code_3F:				; CODE XREF: start+3Bj
		mov	byte ptr word_data_8+688h, al
		mov	ah, 0Bh
		mov	bx, 101h
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		mov	word_data_8+40Eh, 0
		mov	word_data_4, 0
		call	sub_code_1D31
		cmp	byte ptr word_data_8+68Fh, 0FDh	; '�'
		jz	short loc_code_65
		mov	dx, 3D9h
		mov	al, 20h	; ' '
		out	dx, al

loc_code_65:				; CODE XREF: start+5Dj
		call	sub_code_2E10
		call	sub_code_26E1
		call	sub_code_26DA
		mov	byte ptr word_data_8+412h, 0
		mov	ax, 0FFFFh
		mov	word_data_8+415h, ax
		mov	word_data_8+417h, ax
		mov	byte_data_0, 0FFh

loc_code_81:				; CODE XREF: start+F8j	start+15Cj ...
		call	sub_code_2690
		mov	word_data_8, 0
		mov	word_data_4, 0
		call	sub_code_1D31
		call	sub_code_5B21
		call	sub_code_5CB0
		call	sub_code_5B21
		cmp	byte ptr word_data_8+412h, 0
		jnz	short loc_code_AE

loc_code_A3:				; CODE XREF: start+106j start+169j ...
		call	sub_code_5B21
		call	sub_code_5EE5
		mov	byte ptr word_data_8+412h, 1

loc_code_AE:				; CODE XREF: start+A1j	start+FFj ...
		mov	ax, word ptr byte_data_6D37+0C1h
		mov	word_data_8, ax
		mov	byte ptr word_data_8+1F78h, 3
		call	sub_code_26DA
		mov	word_data_4, 0
		call	sub_code_1D31
		call	sub_code_5B21
		mov	word_data_8+1C28h, 0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word_data_8+40Ah, dx
		mov	word_data_8+40Ch, 0
		mov	byte ptr word_data_8+410h, 0
		mov	byte ptr word_data_8+411h, 0
		mov	byte ptr word_data_8+414h, 0
		mov	byte ptr word_data_8+413h, 0
		call	sub_code_5B21

loc_code_F3:				; CODE XREF: start+456j
		cmp	byte ptr word_data_8+1F78h, 0
		jz	short loc_code_81
		cmp	byte ptr word_data_8+413h, 0
		jnz	short loc_code_AE
		cmp	byte ptr word_data_8+414h, 0
		jnz	short loc_code_A3
		call	sub_code_2A00
		call	sub_code_5400
		mov	byte ptr word_data_8+1F79h, 0FFh
		call	sub_code_5B21
		mov	word_data_4, 0
		cmp	byte ptr word_data_8+411h, 0
		jz	short loc_code_137
		call	sub_code_7A1
		mov	byte ptr word_data_8+548h, 2
		mov	byte ptr word_data_8+56Eh, 1
		mov	byte ptr word_data_8+570h, 20h ; ' '
		jmp	short loc_code_140
; ---------------------------------------------------------------------------

loc_code_137:				; CODE XREF: start+121j
		mov	word_data_8+571h, 0
		call	sub_code_70D

loc_code_140:				; CODE XREF: start+135j
		call	sub_code_1E40
		call	sub_code_1830
		call	sub_code_2210
		call	sub_code_2330
		call	sub_code_26F2
		call	sub_code_26FC
		call	sub_code_58BD

loc_code_155:				; CODE XREF: start+18Fj start+1ABj
		cmp	byte ptr word_data_8+1F78h, 0
		jnz	short loc_code_15F
		jmp	loc_code_81
; ---------------------------------------------------------------------------

loc_code_15F:				; CODE XREF: start+15Aj
		call	near ptr sub_code_1338
		cmp	byte ptr word_data_8+414h, 0
		jz	short loc_code_16C
		jmp	loc_code_A3
; ---------------------------------------------------------------------------

loc_code_16C:				; CODE XREF: start+167j
		cmp	byte ptr word_data_8+413h, 0
		jz	short loc_code_176
		jmp	loc_code_AE
; ---------------------------------------------------------------------------

loc_code_176:				; CODE XREF: start+171j
		call	sub_code_1200
		call	sub_code_8E5
		call	sub_code_1E63
		cmp	byte ptr word_data_8+1CB0h, 0
		jnz	short loc_code_191
		inc	byte ptr word_data_8+407h
		test	byte ptr word_data_8+407h, 3
		jnz	short loc_code_155

loc_code_191:				; CODE XREF: start+184j
		call	sub_code_546D
		call	sub_code_4A0
		call	sub_code_1936
		call	sub_code_184B
		call	sub_code_2216
		call	sub_code_237B
		call	sub_code_26B3
		cmp	byte ptr word_data_8+549h, 0
		jz	short loc_code_155
		cmp	byte ptr word_data_8+1F78h, 0
		jnz	short loc_code_1B7
		jmp	loc_code_81
; ---------------------------------------------------------------------------

loc_code_1B7:				; CODE XREF: start+1B2j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word_data_8+408h, dx
		mov	ax, word_data_8+571h
		mov	word_data_1, ax
		mov	al, byte ptr word_data_8+573h
		mov	byte_data_3, al
		mov	byte ptr word_data_8+411h, 1
		cmp	byte ptr word_data_8+410h, 0
		jz	short loc_code_1E5
		mov	byte ptr word_data_8+410h, 0
		mov	word_data_4, 7
		jmp	short loc_code_238
; ---------------------------------------------------------------------------
		nop

loc_code_1E5:				; CODE XREF: start+1D5j start+228j
		call	sub_code_2DFD
		test	dl, 0A0h
		jz	short loc_code_20A
		mov	bx, word_data_8
		and	bx, 3
		cmp	bx, 3
		jz	short loc_code_20A
		mov	cl, 2
		shl	bx, cl
		and	dx, 3
		add	bx, dx
		mov	al, [bx+421h]
		jmp	short loc_code_21C
; ---------------------------------------------------------------------------

loc_code_20A:				; CODE XREF: start+1EBj start+1F8j ...
		call	sub_code_2DFD
		and	dx, 7
		cmp	dx, 5
		jnb	short loc_code_20A
		mov	bx, dx
		mov	al, [bx+42Dh]

loc_code_21C:				; CODE XREF: start+208j
		sub	ah, ah
		cmp	ax, word_data_8+415h
		jnz	short loc_code_22A
		cmp	ax, word_data_8+417h
		jz	short loc_code_1E5

loc_code_22A:				; CODE XREF: start+222j
		mov	word_data_4, ax
		mov	cx, word_data_8+415h
		mov	word_data_8+417h, cx
		mov	word_data_8+415h, ax

loc_code_238:				; CODE XREF: start+1E2j
		mov	word_data_6, 0
		mov	bx, word_data_4
		cmp	bx, 7
		jbe	short loc_code_249
		sub	bx, bx

loc_code_249:				; CODE XREF: start+245j
		shl	bx, 1
		jmp	cs:off_code_250[bx]
; ---------------------------------------------------------------------------
off_code_250	dw offset loc_code_3E2	; DATA XREF: start+24Br
		dw offset loc_code_3E2
		dw offset loc_code_459
		dw offset loc_code_394
		dw offset loc_code_349
		dw offset loc_code_2FE
		dw offset loc_code_2AA
		dw offset loc_code_260
; ---------------------------------------------------------------------------

loc_code_260:				; CODE XREF: start+24Bj
					; DATA XREF: start+25Eo
		mov	word_data_4, 7
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_7A1
		call	sub_code_1E40
		call	sub_code_3405
		call	sub_code_6100
		call	sub_code_4F59
		call	sub_code_58BD

loc_code_27E:				; CODE XREF: start+2A5j
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_8E5
		call	sub_code_6106
		call	sub_code_2F66
		call	sub_code_2E60
		call	sub_code_4C10
		mov	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+414h
		or	al, byte ptr word_data_8+413h
		jz	short loc_code_27E
		jmp	loc_code_427
; ---------------------------------------------------------------------------

loc_code_2AA:				; CODE XREF: start+24Bj
					; DATA XREF: start+25Co
		mov	word_data_4, 6
		call	sub_code_1BF0
		call	sub_code_2790
		call	nullsub_1
		call	sub_code_7A1
		call	sub_code_3405
		call	sub_code_1E40
		call	sub_code_58BD

loc_code_2C5:				; CODE XREF: start+2F9j
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_4943
		call	sub_code_47D6
		call	sub_code_8E5
		cmp	byte ptr word_data_8+1CB0h, 0
		jz	short loc_code_2E3
		call	sub_code_1E63
		jmp	short loc_code_2E6
; ---------------------------------------------------------------------------

loc_code_2E3:				; CODE XREF: start+2DCj
		call	sub_code_3150

loc_code_2E6:				; CODE XREF: start+2E1j
		mov	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+413h
		or	al, byte ptr word_data_8+414h
		jz	short loc_code_2C5
		jmp	loc_code_427
; ---------------------------------------------------------------------------

loc_code_2FE:				; CODE XREF: start+24Bj
					; DATA XREF: start+25Ao
		mov	word_data_4, 5
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_457A
		call	sub_code_7A1
		call	sub_code_3405
		call	sub_code_1E40
		call	sub_code_58BD

loc_code_319:				; CODE XREF: start+344j
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_45AB
		call	sub_code_4340
		call	sub_code_8E5
		call	sub_code_3150
		call	sub_code_1E63
		mov	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+414h
		or	al, byte ptr word_data_8+413h
		jz	short loc_code_319
		jmp	loc_code_427
; ---------------------------------------------------------------------------

loc_code_349:				; CODE XREF: start+24Bj
					; DATA XREF: start+258o
		mov	word_data_4, 4
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_7A1
		call	sub_code_3405
		call	sub_code_1E40
		call	sub_code_4090
		call	sub_code_58BD

loc_code_364:				; CODE XREF: start+38Fj
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_8E5
		call	sub_code_3E90
		call	sub_code_40C2
		call	sub_code_3150
		call	sub_code_1E63
		mov	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+414h
		or	al, byte ptr word_data_8+413h
		jz	short loc_code_364
		jmp	loc_code_427
; ---------------------------------------------------------------------------

loc_code_394:				; CODE XREF: start+24Bj
					; DATA XREF: start+256o
		mov	word_data_4, 3
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_7A1
		call	sub_code_3405
		call	sub_code_1E40
		call	sub_code_3B30
		call	sub_code_3C90
		call	sub_code_58BD

loc_code_3B2:				; CODE XREF: start+3DDj
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_8E5
		call	sub_code_3CB1
		call	sub_code_3B42
		call	sub_code_3150
		call	sub_code_1E63
		mov	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+414h
		or	al, byte ptr word_data_8+413h
		jz	short loc_code_3B2
		jmp	short loc_code_427
; ---------------------------------------------------------------------------
		nop

loc_code_3E2:				; CODE XREF: start+24Bj
					; DATA XREF: start:off_code_250o ...
		mov	word_data_4, 1
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_7A1
		call	sub_code_3405
		call	sub_code_1E40
		call	sub_code_58BD

loc_code_3FA:				; CODE XREF: start+425j
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_8E5
		call	sub_code_3150
		call	sub_code_1E63
		call	sub_code_3850
		cmp	byte ptr word_data_8+54Ch, 0
		jnz	short loc_code_459
		mov	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+549h
		or	al, byte ptr word_data_8+413h
		or	al, byte ptr word_data_8+414h
		jz	short loc_code_3FA

loc_code_427:				; CODE XREF: start+2A7j start+2FBj ...
		cmp	byte ptr word_data_8+413h, 0
		jz	short loc_code_431
		jmp	loc_code_AE
; ---------------------------------------------------------------------------

loc_code_431:				; CODE XREF: start+42Cj
		cmp	byte ptr word_data_8+414h, 0
		jz	short loc_code_43B
		jmp	loc_code_A3
; ---------------------------------------------------------------------------

loc_code_43B:				; CODE XREF: start+436j
		cmp	byte ptr word_data_8+54Ah, 0
		jz	short loc_code_447
		mov	byte ptr word_data_8+411h, 0

loc_code_447:				; CODE XREF: start+440j
		mov	ax, word_data_4
		mov	word_data_6, ax
		mov	word_data_4, 0
		call	sub_code_1BF0
		jmp	loc_code_F3
; ---------------------------------------------------------------------------

loc_code_459:				; CODE XREF: start+24Bj start+414j
					; DATA XREF: ...
		mov	word_data_4, 2
		call	sub_code_1BF0
		call	sub_code_2790
		call	sub_code_35C9
		call	sub_code_7A1
		mov	byte ptr word_data_8+1CB7h, 0
		mov	byte ptr word_data_8+1CB0h, 0
		call	sub_code_58BD

loc_code_478:				; CODE XREF: start+499j
		call	near ptr sub_code_1338
		call	sub_code_1200
		call	sub_code_546D
		call	sub_code_8E5
		call	sub_code_3675
		call	sub_code_37E5
		mov	al, byte ptr word_data_8+54Ah
		or	al, byte ptr word_data_8+54Bh
		or	al, byte ptr word_data_8+414h
		or	al, byte ptr word_data_8+413h
		jz	short loc_code_478
		jmp	short loc_code_427
start		endp ; sp-analysis failed

; ---------------------------------------------------------------------------
		align 4

; =============== S U B	R O U T	I N E =======================================


sub_code_4A0	proc near		; CODE XREF: start+194p
		dec	byte ptr word_data_8+529h
		jz	short loc_code_4A7

locret_code_4A6:			; CODE XREF: sub_code_4A0+Ej
					; sub_code_4A0+15j ...
		retn
; ---------------------------------------------------------------------------

loc_code_4A7:				; CODE XREF: sub_code_4A0+4j
		inc	byte ptr word_data_8+529h
		call	sub_code_13D8
		jnz	short locret_code_4A6
		cmp	byte ptr word_data_8+552h, 0
		jnz	short locret_code_4A6
		cmp	byte ptr word_data_8+166Bh, 0
		jnz	short locret_code_4A6
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, word_data_8+53Ch
		jz	short locret_code_4A6
		mov	word_data_8+53Ch, dx
		mov	bx, word_data_8
		mov	al, [bx+532h]
		cmp	byte ptr word_data_8+573h, 60h ; '`'
		ja	short loc_code_4DF
		shr	al, 1
		shr	al, 1

loc_code_4DF:				; CODE XREF: sub_code_4A0+39j
		mov	byte ptr word_data_8+529h, al
		mov	bx, word_data_8+527h
		call	sub_code_658
		jz	short loc_code_50C
		mov	al, byte ptr word_data_8+51Dh
		add	al, [bx+529h]
		cmp	al, 4
		jb	short locret_code_4A6

loc_code_4F6:				; CODE XREF: sub_code_4A0+60j
					; sub_code_4A0+65j
		call	sub_code_2DFD
		and	dl, 3
		cmp	dl, byte ptr word_data_8+527h
		jz	short loc_code_4F6
		cmp	dl, 3
		jz	short loc_code_4F6
		mov	bl, dl
		jmp	short loc_code_535
; ---------------------------------------------------------------------------
		nop

loc_code_50C:				; CODE XREF: sub_code_4A0+49j
		mov	al, [bx+529h]
		add	byte ptr word_data_8+51Dh, al
		cmp	byte ptr word_data_8+51Dh, 4
		jb	short loc_code_583
		call	sub_code_2DFD
		cmp	dl, 40h	; '@'
		ja	short loc_code_539

loc_code_523:				; CODE XREF: sub_code_4A0+8Cj
					; sub_code_4A0+93j
		call	sub_code_2DFD
		and	dl, 3
		cmp	dl, 3
		jz	short loc_code_523
		mov	bl, dl
		call	sub_code_658
		jnz	short loc_code_523

loc_code_535:				; CODE XREF: sub_code_4A0+69j
		mov	word_data_8+527h, bx

loc_code_539:				; CODE XREF: sub_code_4A0+81j
		mov	al, [bx+526h]
		mov	byte ptr word_data_8+51Dh, al
		mov	ax, seg	data
		mov	es, ax
		assume es:data
		mov	di, 4D7h
		mov	ah, [bx+52Ch]
		mov	bx, word_data_8
		mov	bl, [bx+2ABAh]
		mov	bh, ah
		call	sub_code_67D
		cmp	word_data_8+527h, 1
		jz	short loc_code_56E
		shr	byte ptr word_data_8+538h, 1
		call	sub_code_633
		shr	byte ptr word_data_8+538h, 1
		jmp	short loc_code_57C
; ---------------------------------------------------------------------------
		nop

loc_code_56E:				; CODE XREF: sub_code_4A0+BEj
		mov	al, byte ptr word_data_8+538h
		shr	al, 1
		shr	al, 1
		call	sub_code_633
		shr	byte ptr word_data_8+538h, 1

loc_code_57C:				; CODE XREF: sub_code_4A0+CBj
		call	sub_code_633
		mov	bx, word_data_8+527h

loc_code_583:				; CODE XREF: sub_code_4A0+79j
		cmp	byte ptr word_data_8+4CEh, 0
		jz	short loc_code_5D0
		mov	ax, word_data_8+571h
		cmp	bl, 1
		jz	short loc_code_5BF
		inc	word_data_8+557h
		add	ax, 4
		cmp	ax, 123h
		jb	short loc_code_5CD

loc_code_59E:				; CODE XREF: sub_code_4A0+126j
					; sub_code_4A0+12Bj
		mov	byte ptr word_data_8+553h, 11h
		mov	byte ptr word_data_8+569h, 1
		mov	byte ptr word_data_8+56Eh, 1
		mov	byte ptr word_data_8+570h, 18h
		mov	byte ptr word_data_8+56Ah, 1
		mov	byte ptr word_data_8+554h, 0
		jmp	short loc_code_5D0
; ---------------------------------------------------------------------------
		nop

loc_code_5BF:				; CODE XREF: sub_code_4A0+F0j
		dec	word_data_8+557h
		sub	ax, 4
		jb	short loc_code_59E
		cmp	ax, 8
		jb	short loc_code_59E

loc_code_5CD:				; CODE XREF: sub_code_4A0+FCj
		mov	word_data_8+571h, ax

loc_code_5D0:				; CODE XREF: sub_code_4A0+E8j
					; sub_code_4A0+11Cj
		push	ds
		shl	bx, 1
		mov	ax, [bx+51Dh]
		mov	word_data_8+51Bh, ax
		mov	si, [bx+517h]
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	es, ax
		assume es:nothing
		mov	di, si
		cmp	bx, 2
		jnz	short loc_code_5F1
		cld
		dec	di
		jmp	short loc_code_5F3
; ---------------------------------------------------------------------------
		nop

loc_code_5F1:				; CODE XREF: sub_code_4A0+14Aj
		std
		inc	di

loc_code_5F3:				; CODE XREF: sub_code_4A0+14Ej
		mov	cx, 27Fh
		push	di
		push	si
		rep movsb
		pop	si
		pop	di
		add	si, 2000h
		add	di, 2000h
		mov	cx, 280h
		rep movsb
		pop	ds
		assume ds:nothing
		mov	di, ds:523h
		mov	bl, ds:525h
		sub	bh, bh
		add	bx, 4D7h
		mov	cx, 10h

loc_code_61B:				; CODE XREF: sub_code_4A0:loc_code_630j
		mov	al, [bx]
		mov	es:[di], al
		add	bx, 4
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_630
		add	di, 50h	; 'P'

loc_code_630:				; CODE XREF: sub_code_4A0+18Bj
		loop	loc_code_61B
		retn
sub_code_4A0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_633	proc near		; CODE XREF: sub_code_4A0+C4p
					; sub_code_4A0+D5p ...
		lahf
		mov	bx, ds:52Fh
		mov	bl, [bx+541h]
		mov	cx, 5
		cmp	bl, 9
		jz	short loc_code_64E

loc_code_644:				; CODE XREF: sub_code_633+18j
		sahf
		rcr	byte ptr [bx+1016h], 1
		lahf
		inc	bx
		loop	loc_code_644
		retn
; ---------------------------------------------------------------------------

loc_code_64E:				; CODE XREF: sub_code_633+Fj
					; sub_code_633+22j
		sahf
		rcl	byte ptr [bx+1016h], 1
		lahf
		dec	bx
		loop	loc_code_64E
		retn
sub_code_633	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_658	proc near		; CODE XREF: sub_code_4A0+46p
					; sub_code_4A0+90p
		mov	byte ptr ds:4D6h, 0
		mov	al, ds:57Ch
		cmp	al, [bx+53Dh]
		jb	short loc_code_679
		cmp	al, [bx+53Ah]
		jnb	short loc_code_679
		cmp	byte ptr ds:55Ch, 1
		jnb	short loc_code_674
		retn
; ---------------------------------------------------------------------------

loc_code_674:				; CODE XREF: sub_code_658+19j
		mov	byte ptr ds:4D6h, 1

loc_code_679:				; CODE XREF: sub_code_658+Cj
					; sub_code_658+12j
		cmp	al, al
		retn
sub_code_658	endp

; ---------------------------------------------------------------------------
		retn

; =============== S U B	R O U T	I N E =======================================


sub_code_67D	proc near		; CODE XREF: sub_code_4A0+B6p
					; sub_code_2AC6+1Fp
		mov	byte ptr ds:540h, 0
		cld
		mov	cx, 20h	; ' '
		mov	ax, 0AAAAh
		rep stosw
		sub	di, 40h	; '@'
		mov	ax, 4444h
		mov	es:[di+4], ax
		mov	es:[di+6], ax
		call	sub_code_2DFD
		cmp	dl, bl
		jb	short locret_code_6A4
		cmp	dh, bh
		ja	short loc_code_6A5

locret_code_6A4:			; CODE XREF: sub_code_67D+21j
		retn
; ---------------------------------------------------------------------------

loc_code_6A5:				; CODE XREF: sub_code_67D+25j
		call	sub_code_2DFD
		cmp	dl, 18h
		jb	short loc_code_6C7
		cmp	dl, 60h	; '`'
		jb	short loc_code_6D0
		push	di
		call	sub_code_6DE
		shl	al, 1
		mov	ds:540h, al
		pop	di
		add	di, 2
		call	sub_code_6DE
		or	ds:540h, al
		retn
; ---------------------------------------------------------------------------

loc_code_6C7:				; CODE XREF: sub_code_67D+2Ej
		mov	cx, 20h	; ' '
		mov	si, 490h
		jmp	short loc_code_6D6
; ---------------------------------------------------------------------------
		nop

loc_code_6D0:				; CODE XREF: sub_code_67D+33j
		mov	cx, 10h
		mov	si, 460h

loc_code_6D6:				; CODE XREF: sub_code_67D+50j
		rep movsw
		mov	byte ptr ds:540h, 3
		retn
sub_code_67D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_6DE	proc near		; CODE XREF: sub_code_67D+36p
					; sub_code_67D+42p
		call	sub_code_2DFD
		and	dx, 6
		cmp	dl, 6
		jnz	short loc_code_6ED
		sub	al, al
		retn
; ---------------------------------------------------------------------------

loc_code_6ED:				; CODE XREF: sub_code_6DE+Aj
		mov	bx, dx
		mov	si, [bx+4D0h]
		mov	cx, 8

loc_code_6F6:				; CODE XREF: sub_code_6DE+1Dj
		lodsw
		stosw
		add	di, 2
		loop	loc_code_6F6
		mov	al, 1
		retn
sub_code_6DE	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_700	proc near		; CODE XREF: sub_code_70D+90p
					; sub_code_7A1+A4p
		mov	word ptr ds:57Dh, 0
		mov	word ptr ds:684h, 0
		retn
sub_code_700	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_70D	proc near		; CODE XREF: start+13Dp
					; sub_code_8E5:loc_code_E0Fp ...
		mov	cx, 0
		mov	ah, 1
		cmp	word ptr ds:579h, 0A0h ; '�'
		jb	short loc_code_71F
		mov	cx, 128h
		mov	ah, 0FFh

loc_code_71F:				; CODE XREF: sub_code_70D+Bj
		mov	ds:56Eh, ah
		mov	byte ptr ds:558h, 3
		mov	byte ptr ds:559h, 0Ch
		mov	dl, 0B4h ; '�'
		mov	ds:579h, cx
		mov	ds:57Bh, dl
		mov	byte ptr ds:57Ch, 0E6h ; '�'
		call	sub_code_2CB0
		mov	ds:55Fh, ax
		mov	word ptr ds:561h, 0B03h
		call	sub_code_1124
		mov	byte ptr ds:571h, 0
		mov	word ptr ds:572h, 2
		mov	byte ptr ds:576h, 1
		mov	byte ptr ds:55Bh, 0
		mov	byte ptr ds:550h, 0
		mov	byte ptr ds:55Ch, 0
		mov	byte ptr ds:55Ah, 0
		mov	byte ptr ds:583h, 0
		mov	byte ptr ds:698h, 0
		mov	byte ptr ds:699h, 0
		mov	byte ptr ds:551h, 0
		mov	byte ptr ds:584h, 0
		mov	byte ptr ds:552h, 0
		mov	word ptr ds:554h, 0
		mov	byte ptr ds:553h, 0
		mov	byte ptr ds:127Ch, 0
		call	sub_code_700
		retn
sub_code_70D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_7A1	proc near		; CODE XREF: start+123p start+26Cp ...
		mov	bx, ds:4
		cmp	bx, 0
		jnz	short loc_code_7B5
		mov	cx, ds:1
		mov	dl, ds:3
		jmp	short loc_code_7BF
; ---------------------------------------------------------------------------
		nop

loc_code_7B5:				; CODE XREF: sub_code_7A1+7j
		mov	dl, [bx+5E9h]
		shl	bl, 1
		mov	cx, [bx+5D9h]

loc_code_7BF:				; CODE XREF: sub_code_7A1+11j
		mov	ds:579h, cx
		mov	ds:57Bh, dl
		mov	al, dl
		add	al, 32h	; '2'
		mov	ds:57Ch, al
		call	sub_code_2CB0
		mov	ds:55Fh, ax
		mov	ax, ds:0FB2h
		mov	ds:569h, ax
		mov	ax, ds:0FBEh
		mov	ds:567h, ax
		mov	ds:561h, ax
		call	sub_code_1124
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:56Eh, 0
		mov	byte ptr ds:576h, 1
		mov	byte ptr ds:578h, 40h ;	'@'
		mov	al, 0Ah
		cmp	word ptr ds:4, 7
		jnz	short loc_code_805
		sub	al, al

loc_code_805:				; CODE XREF: sub_code_7A1+60j
		mov	ds:55Bh, al
		mov	byte ptr ds:550h, 0
		mov	byte ptr ds:55Ch, 0
		mov	byte ptr ds:55Ah, 0
		mov	byte ptr ds:583h, 0
		mov	byte ptr ds:698h, 0
		mov	byte ptr ds:699h, 0
		mov	byte ptr ds:551h, 0
		mov	byte ptr ds:584h, 0
		mov	byte ptr ds:552h, 0
		mov	word ptr ds:554h, 0
		mov	byte ptr ds:553h, 0
		mov	byte ptr ds:127Ch, 0
		call	sub_code_700
		cmp	word ptr ds:4, 2
		jnz	short locret_code_871
		mov	byte ptr ds:576h, 10h
		mov	word ptr ds:574h, 10h
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5F1h, dx
		mov	byte ptr ds:5F3h, 0
		mov	byte ptr ds:5F4h, 5
		mov	byte ptr ds:5F5h, 1

locret_code_871:			; CODE XREF: sub_code_7A1+ACj
		retn
sub_code_7A1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_872	proc near		; CODE XREF: sub_code_33BA:loc_code_33FEp
		mov	word ptr ds:592Ah, 400h
		cmp	byte ptr ds:584h, 0
		jz	short loc_code_880
		retn
; ---------------------------------------------------------------------------

loc_code_880:				; CODE XREF: sub_code_872+Bj
		mov	byte ptr ds:576h, 8
		mov	dl, 0FFh
		mov	al, ds:57Bh
		cmp	al, ds:2652h
		jnb	short loc_code_892
		mov	dl, 1

loc_code_892:				; CODE XREF: sub_code_872+1Cj
		mov	ds:571h, dl
		mov	ax, ds:579h
		sub	ax, ds:2650h
		mov	dl, 0FFh
		ja	short loc_code_8A5
		mov	dl, 1
		not	ax

loc_code_8A5:				; CODE XREF: sub_code_872+2Dj
		mov	ds:56Eh, dl
		cmp	ah, 0
		jz	short loc_code_8B1
		mov	ax, 0FFh

loc_code_8B1:				; CODE XREF: sub_code_872+3Aj
		not	al
		cmp	al, 30h	; '0'
		jnb	short loc_code_8B9
		mov	al, 30h	; '0'

loc_code_8B9:				; CODE XREF: sub_code_872+43j
		mov	bl, al
		shr	bl, 1
		shr	bl, 1
		sub	al, bl
		mov	ds:578h, al
		mov	cl, 5
		shr	al, cl
		mov	ds:572h, ax
		mov	byte ptr ds:55Ch, 0
		mov	byte ptr ds:39E0h, 0
		mov	byte ptr ds:577h, 1
		mov	byte ptr ds:55Bh, 10h
		mov	byte ptr ds:584h, 1
		retn
sub_code_872	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_8E5	proc near		; CODE XREF: start+179p start+287p ...
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:57Dh
		jnz	short loc_code_8FD
		cmp	word ptr ds:684h, 0
		jz	short locret_code_8FC
		dec	word ptr ds:684h
		jz	short loc_code_90C

locret_code_8FC:			; CODE XREF: sub_code_8E5+Fj
					; sub_code_8E5+3Fj ...
		retn
; ---------------------------------------------------------------------------

loc_code_8FD:				; CODE XREF: sub_code_8E5+8j
		mov	ax, 20h	; ' '
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_909
		shr	ax, 1

loc_code_909:				; CODE XREF: sub_code_8E5+20j
		mov	ds:684h, ax

loc_code_90C:				; CODE XREF: sub_code_8E5+15j
		cmp	word ptr ds:4, 2
		jz	short loc_code_91D
		mov	cl, ds:571h
		or	cl, ds:56Eh
		jnz	short loc_code_926

loc_code_91D:				; CODE XREF: sub_code_8E5+2Cj
		push	dx
		push	ax
		call	sub_code_13D8
		pop	ax
		pop	dx
		jz	short locret_code_8FC

loc_code_926:				; CODE XREF: sub_code_8E5+36j
		mov	ds:57Dh, dx
		mov	ds:57Fh, ax
		cmp	word ptr ds:4, 4
		jnz	short loc_code_93B
		cmp	byte ptr ds:39E1h, 0
		jnz	short locret_code_8FC

loc_code_93B:				; CODE XREF: sub_code_8E5+4Dj
		cmp	word ptr ds:4, 6
		jnz	short loc_code_949
		cmp	byte ptr ds:44BDh, 0
		jnz	short locret_code_8FC

loc_code_949:				; CODE XREF: sub_code_8E5+5Bj
		cmp	word ptr ds:4, 2
		jz	short loc_code_953
		jmp	loc_code_BAC
; ---------------------------------------------------------------------------

loc_code_953:				; CODE XREF: sub_code_8E5+69j
		mov	si, ds:8
		shl	si, 1
		mov	ax, ds:57Dh
		sub	ax, ds:5F1h
		cmp	ax, [si+589h]
		jb	short loc_code_9D6
		cmp	ax, [si+599h]
		jb	short loc_code_971
		mov	byte ptr ds:552h, 1

loc_code_971:				; CODE XREF: sub_code_8E5+85j
		dec	byte ptr ds:5F5h
		jnz	short loc_code_9B9
		call	sub_code_597F
		mov	byte ptr ds:5F5h, 6
		mov	al, ds:5F4h
		cmp	byte ptr ds:57Bh, 0B3h ; '�'
		jb	short loc_code_992
		cmp	al, 0C8h ; '�'
		jnb	short loc_code_992
		add	al, 1Eh
		mov	ds:5F4h, al

loc_code_992:				; CODE XREF: sub_code_8E5+A2j
					; sub_code_8E5+A6j
		mov	dl, ds:57Bh
		sub	dl, al
		jnb	short loc_code_99C
		sub	dl, dl

loc_code_99C:				; CODE XREF: sub_code_8E5+B3j
		mov	cx, ds:579h
		and	dl, 0F8h
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 64Eh
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, 0Eh
		mov	cx, 503h
		call	sub_code_2D35

loc_code_9B9:				; CODE XREF: sub_code_8E5+90j
		mov	byte ptr ds:56Eh, 0
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:5F3h, 1
		mov	byte ptr ds:576h, 20h ;	' '
		sub	bx, bx
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		jmp	loc_code_A86
; ---------------------------------------------------------------------------

loc_code_9D6:				; CODE XREF: sub_code_8E5+7Fj
		mov	si, ds:8
		shl	si, 1
		sub	bx, bx
		cmp	ax, [si+5A9h]
		jb	short loc_code_9F6
		inc	bl
		cmp	ax, [si+5B9h]
		jb	short loc_code_9F6
		mov	bl, 5
		cmp	ax, [si+5C9h]
		jb	short loc_code_9F6
		dec	bl

loc_code_9F6:				; CODE XREF: sub_code_8E5+FDj
					; sub_code_8E5+105j ...
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		mov	al, ds:56Eh
		mov	ds:56Fh, al
		mov	al, ds:571h
		mov	ds:570h, al
		mov	al, ds:698h
		cmp	al, 0
		jnz	short loc_code_A1A
		cmp	word ptr ds:574h, 10h
		jb	short loc_code_A2E
		dec	word ptr ds:574h
		jmp	short loc_code_A37
; ---------------------------------------------------------------------------

loc_code_A1A:				; CODE XREF: sub_code_8E5+126j
		cmp	al, ds:56Eh
		jnz	short loc_code_A2E
		cmp	word ptr ds:574h, 30h ;	'0'
		jnb	short loc_code_A37
		add	word ptr ds:574h, 3
		jmp	short loc_code_A37
; ---------------------------------------------------------------------------

loc_code_A2E:				; CODE XREF: sub_code_8E5+12Dj
					; sub_code_8E5+139j
		mov	ds:56Eh, al
		mov	word ptr ds:574h, 20h ;	' '

loc_code_A37:				; CODE XREF: sub_code_8E5+133j
					; sub_code_8E5+140j ...
		mov	ax, ds:574h
		mov	cl, 3
		shr	ax, cl
		mov	bx, ds:8
		shl	bl, 1
		cmp	ax, [bx+66Ch]
		jbe	short loc_code_A4E
		mov	ax, [bx+66Ch]

loc_code_A4E:				; CODE XREF: sub_code_8E5+163j
		mov	ds:572h, ax
		call	sub_code_FC9
		mov	al, ds:699h
		cmp	al, 0
		jnz	short loc_code_A6A
		not	al
		cmp	byte ptr ds:576h, 10h
		jb	short loc_code_A7E
		dec	byte ptr ds:576h
		jmp	short loc_code_A86
; ---------------------------------------------------------------------------

loc_code_A6A:				; CODE XREF: sub_code_8E5+174j
		cmp	al, ds:571h
		jnz	short loc_code_A7E
		cmp	byte ptr ds:576h, 40h ;	'@'
		jnb	short loc_code_A86
		add	byte ptr ds:576h, 4
		jmp	short loc_code_A86
; ---------------------------------------------------------------------------

loc_code_A7E:				; CODE XREF: sub_code_8E5+17Dj
					; sub_code_8E5+189j
		mov	ds:571h, al
		mov	byte ptr ds:576h, 20h ;	' '

loc_code_A86:				; CODE XREF: sub_code_8E5+EEj
					; sub_code_8E5+183j ...
		mov	si, ds:8
		mov	dl, ds:57Bh
		mov	cl, 4
		mov	bl, ds:576h
		shr	bl, cl
		cmp	bl, [si+67Ch]
		jbe	short loc_code_AA0
		mov	bl, [si+67Ch]

loc_code_AA0:				; CODE XREF: sub_code_8E5+1B5j
		mov	al, ds:571h
		cmp	al, 1
		jb	short loc_code_ACE
		jnz	short loc_code_AB4
		add	dl, bl
		cmp	dl, 0B4h ; '�'
		jb	short loc_code_ACE
		mov	dl, 0B3h ; '�'
		jmp	short loc_code_ACE
; ---------------------------------------------------------------------------

loc_code_AB4:				; CODE XREF: sub_code_8E5+1C2j
		sub	dl, bl
		jb	short loc_code_ABD
		cmp	dl, 3
		ja	short loc_code_ACE

loc_code_ABD:				; CODE XREF: sub_code_8E5+1D1j
		mov	ax, ds:9B8h
		cmp	ax, ds:55Dh
		jnz	short loc_code_ACC
		mov	ax, ds:57Dh
		mov	ds:5F1h, ax

loc_code_ACC:				; CODE XREF: sub_code_8E5+1DFj
		mov	dl, 2

loc_code_ACE:				; CODE XREF: sub_code_8E5+1C0j
					; sub_code_8E5+1C9j ...
		mov	ds:57Bh, dl
		mov	cx, ds:579h
		call	sub_code_2CB0
		mov	ds:563h, ax
		cmp	byte ptr ds:5F3h, 0
		jz	short loc_code_AE9
		mov	bx, 10h
		jmp	short loc_code_B64
; ---------------------------------------------------------------------------
		nop

loc_code_AE9:				; CODE XREF: sub_code_8E5+1FCj
		mov	al, ds:56Eh
		cmp	al, ds:56Fh
		jnz	short loc_code_AFB
		mov	al, ds:571h
		cmp	al, ds:570h
		jz	short loc_code_B00

loc_code_AFB:				; CODE XREF: sub_code_8E5+20Bj
		mov	bx, 18h
		jmp	short loc_code_B64
; ---------------------------------------------------------------------------

loc_code_B00:				; CODE XREF: sub_code_8E5+214j
		inc	word ptr ds:587h
		mov	bx, ds:587h
		mov	al, ds:698h
		or	al, ds:699h
		jnz	short loc_code_B13
		shr	bl, 1

loc_code_B13:				; CODE XREF: sub_code_8E5+22Aj
		cmp	byte ptr ds:57Bh, 0B3h ; '�'
		jb	short loc_code_B21
		cmp	byte ptr ds:571h, 1
		jz	short loc_code_B3C

loc_code_B21:				; CODE XREF: sub_code_8E5+233j
		cmp	byte ptr ds:57Bh, 4
		ja	short loc_code_B2F
		cmp	byte ptr ds:699h, 0
		jnz	short loc_code_B53

loc_code_B2F:				; CODE XREF: sub_code_8E5+241j
		mov	al, ds:576h
		sub	ah, ah
		shr	ax, 1
		cmp	ax, ds:574h
		jnb	short loc_code_B53

loc_code_B3C:				; CODE XREF: sub_code_8E5+23Aj
		cmp	byte ptr ds:56Eh, 0
		jz	short loc_code_B53
		and	bx, 6
		cmp	byte ptr ds:56Eh, 1
		jz	short loc_code_B64
		or	bl, 8
		jmp	short loc_code_B64
; ---------------------------------------------------------------------------

loc_code_B53:				; CODE XREF: sub_code_8E5+248j
					; sub_code_8E5+255j ...
		and	bx, 2
		or	bl, 10h
		cmp	byte ptr ds:571h, 1
		jnz	short loc_code_B64
		add	bl, 4

loc_code_B64:				; CODE XREF: sub_code_8E5+201j
					; sub_code_8E5+219j ...
		mov	ax, [bx+9A6h]
		mov	ds:55Dh, ax
		mov	ax, [bx+9C0h]
		mov	ds:565h, ax
		mov	al, 30h	; '0'
		mov	cx, 2BCh
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jb	short loc_code_B97
		jz	short loc_code_B85
		mov	al, 8
		mov	cx, 3E8h

loc_code_B85:				; CODE XREF: sub_code_8E5+299j
		cmp	ds:57Bh, al
		ja	short loc_code_B97

loc_code_B8B:				; CODE XREF: sub_code_8E5+2A9j
		call	sub_code_13D8
		jnz	short loc_code_B8B

loc_code_B90:				; CODE XREF: sub_code_8E5+2AEj
		call	sub_code_13D8
		jz	short loc_code_B90

loc_code_B95:				; CODE XREF: sub_code_8E5:loc_code_B95j
		loop	loc_code_B95

loc_code_B97:				; CODE XREF: sub_code_8E5+297j
					; sub_code_8E5+2A4j
		call	sub_code_11E3
		mov	ax, ds:563h
		mov	ds:55Fh, ax
		call	sub_code_1145
		call	sub_code_34A0
		jnb	short locret_code_BAB
		call	sub_code_1145

locret_code_BAB:			; CODE XREF: sub_code_8E5+2C1j
		retn
; ---------------------------------------------------------------------------

loc_code_BAC:				; CODE XREF: sub_code_8E5+6Bj
		call	sub_code_1B7A
		jnb	short loc_code_BB2

locret_code_BB1:			; CODE XREF: sub_code_8E5+2D2j
		retn
; ---------------------------------------------------------------------------

loc_code_BB2:				; CODE XREF: sub_code_8E5+2CAj
		cmp	byte ptr ds:1CB8h, 0
		jnz	short locret_code_BB1
		cmp	byte ptr ds:558h, 0
		jz	short loc_code_C1C
		cmp	byte ptr ds:559h, 0
		jz	short loc_code_BD3
		cmp	byte ptr ds:1CBFh, 0
		jnz	short locret_code_BD2
		dec	byte ptr ds:559h

locret_code_BD2:			; CODE XREF: sub_code_8E5+2E7j
		retn
; ---------------------------------------------------------------------------

loc_code_BD3:				; CODE XREF: sub_code_8E5+2E0j
		dec	byte ptr ds:558h
		jnz	short loc_code_BE5
		mov	word ptr ds:572h, 8
		call	sub_code_FC9
		jmp	short loc_code_C1C
; ---------------------------------------------------------------------------
		nop

loc_code_BE5:				; CODE XREF: sub_code_8E5+2F2j
		call	sub_code_1020
		mov	ds:55Dh, bx
		mov	al, ds:558h
		mov	ah, ds:56Eh
		call	sub_code_F87
		cmp	byte ptr ds:558h, 2
		jz	short loc_code_C00
		call	sub_code_11E3

loc_code_C00:				; CODE XREF: sub_code_8E5+316j
		call	sub_code_1B7A
		jb	short locret_code_C1B
		call	sub_code_20F5
		jb	short locret_code_C1B
		mov	dl, ds:57Bh
		mov	cx, ds:579h
		call	sub_code_2CB0
		mov	ds:55Fh, ax
		call	sub_code_1145

locret_code_C1B:			; CODE XREF: sub_code_8E5+31Ej
					; sub_code_8E5+323j
		retn
; ---------------------------------------------------------------------------

loc_code_C1C:				; CODE XREF: sub_code_8E5+2D9j
					; sub_code_8E5+2FDj
		cmp	byte ptr ds:55Ch, 1
		jb	short loc_code_C6A
		jnz	short loc_code_C5F
		inc	byte ptr ds:55Ch
		mov	word ptr ds:572h, 6
		mov	dl, ds:57Bh
		mov	cx, ds:579h
		call	sub_code_2CB0
		mov	ds:563h, ax
		call	sub_code_11E3
		call	sub_code_1B7A
		jb	short locret_code_C66
		call	sub_code_20F5
		jb	short locret_code_C66
		mov	ax, ds:563h
		mov	ds:55Fh, ax
		mov	word ptr ds:565h, 0E03h
		mov	word ptr ds:55Dh, 9DAh
		call	sub_code_1145

loc_code_C5F:				; CODE XREF: sub_code_8E5+33Ej
		cmp	byte ptr ds:699h, 0
		jnz	short loc_code_C67

locret_code_C66:			; CODE XREF: sub_code_8E5+35Ej
					; sub_code_8E5+363j
		retn
; ---------------------------------------------------------------------------

loc_code_C67:				; CODE XREF: sub_code_8E5+37Fj
		jmp	loc_code_E78
; ---------------------------------------------------------------------------

loc_code_C6A:				; CODE XREF: sub_code_8E5+33Cj
		cmp	byte ptr ds:571h, 0
		jnz	short loc_code_C74
		jmp	loc_code_E23
; ---------------------------------------------------------------------------

loc_code_C74:				; CODE XREF: sub_code_8E5+38Aj
		call	sub_code_FC9
		jnb	short loc_code_C90
		mov	byte ptr ds:56Eh, 0
		mov	byte ptr ds:576h, 2
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:55Bh, 0
		jmp	short loc_code_CC1
; ---------------------------------------------------------------------------
		nop

loc_code_C90:				; CODE XREF: sub_code_8E5+392j
		mov	al, ds:578h
		sub	ds:577h, al
		jnb	short loc_code_CC1
		cmp	byte ptr ds:571h, 1
		jz	short loc_code_CB6
		cmp	byte ptr ds:576h, 1
		jbe	short loc_code_CAE
		dec	byte ptr ds:576h
		jmp	short loc_code_CC1
; ---------------------------------------------------------------------------
		nop

loc_code_CAE:				; CODE XREF: sub_code_8E5+3C0j
		mov	byte ptr ds:571h, 1
		jmp	short loc_code_CC1
; ---------------------------------------------------------------------------
		nop

loc_code_CB6:				; CODE XREF: sub_code_8E5+3B9j
		cmp	byte ptr ds:576h, 4
		jnb	short loc_code_CC1
		inc	byte ptr ds:576h

loc_code_CC1:				; CODE XREF: sub_code_8E5+3A8j
					; sub_code_8E5+3B2j ...
		cmp	byte ptr ds:55Ah, 0
		jnz	short loc_code_CE7
		cmp	byte ptr ds:55Bh, 0
		jz	short loc_code_CD5
		dec	byte ptr ds:55Bh
		jnz	short loc_code_CE7

loc_code_CD5:				; CODE XREF: sub_code_8E5+3E8j
		cmp	byte ptr ds:571h, 1
		jnz	short loc_code_CE7
		call	sub_code_1608
		jnb	short loc_code_CE7
		mov	al, ds:57Ch
		jmp	short loc_code_D29
; ---------------------------------------------------------------------------
		nop

loc_code_CE7:				; CODE XREF: sub_code_8E5+3E1j
					; sub_code_8E5+3EEj ...
		mov	al, ds:57Ch
		cmp	byte ptr ds:571h, 1
		jz	short loc_code_D06
		sub	al, ds:576h
		jnb	short loc_code_D4F
		sub	al, al
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:576h, 1
		jmp	short loc_code_D4F
; ---------------------------------------------------------------------------
		nop

loc_code_D06:				; CODE XREF: sub_code_8E5+40Aj
		add	al, ds:576h
		cmp	al, 0E6h ; '�'
		jbe	short loc_code_D4F
		cmp	word ptr ds:4, 7
		jnz	short loc_code_D22
		cmp	al, 0F8h ; '�'
		jb	short loc_code_D4F
		mov	al, 0F8h ; '�'
		mov	byte ptr ds:551h, 1
		jmp	short loc_code_D4F
; ---------------------------------------------------------------------------

loc_code_D22:				; CODE XREF: sub_code_8E5+42Ej
		mov	al, 0E6h ; '�'
		mov	byte ptr ds:550h, 0

loc_code_D29:				; CODE XREF: sub_code_8E5+3FFj
		mov	byte ptr ds:571h, 0
		mov	byte ptr ds:584h, 0
		mov	word ptr ds:572h, 2
		mov	byte ptr ds:55Bh, 0
		mov	byte ptr ds:55Ah, 0
		cmp	byte ptr ds:55Ch, 0
		jz	short loc_code_D4F
		push	ax
		call	sub_code_5AC2
		pop	ax

loc_code_D4F:				; CODE XREF: sub_code_8E5+410j
					; sub_code_8E5+41Ej ...
		mov	ds:57Ch, al
		sub	al, 32h	; '2'
		jnb	short loc_code_D58
		sub	al, al

loc_code_D58:				; CODE XREF: sub_code_8E5+46Fj
		mov	ds:57Bh, al
		mov	dl, ds:57Bh
		mov	cx, ds:579h
		call	sub_code_2CB0
		mov	ds:563h, ax
		cmp	byte ptr ds:583h, 0
		jnz	short loc_code_D73
		call	sub_code_11E3

loc_code_D73:				; CODE XREF: sub_code_8E5+489j
		call	sub_code_1B7A
		jb	short loc_code_DC4
		call	sub_code_20F5
		jb	short loc_code_DC4
		mov	ax, ds:563h
		mov	ds:55Fh, ax
		cmp	byte ptr ds:584h, 0
		jz	short loc_code_DA1
		add	word ptr ds:585h, 2
		mov	bx, ds:585h
		and	bx, 0Eh
		mov	ax, [bx+0FC2h]
		mov	bx, [bx+0FD2h]
		jmp	short loc_code_DA8
; ---------------------------------------------------------------------------

loc_code_DA1:				; CODE XREF: sub_code_8E5+4A3j
		mov	ax, ds:569h
		mov	bx, ds:567h

loc_code_DA8:				; CODE XREF: sub_code_8E5+4BAj
		mov	ds:55Dh, ax
		mov	ds:565h, bx
		mov	al, 32h	; '2'
		sub	al, ds:57Ch
		jz	short loc_code_DDE
		jb	short loc_code_DDE
		mov	cx, 168h

loc_code_DBC:				; CODE XREF: sub_code_8E5:loc_code_DBCj
		loop	loc_code_DBC
		sub	bh, al
		jz	short loc_code_DC4
		jnb	short loc_code_DCA

loc_code_DC4:				; CODE XREF: sub_code_8E5+491j
					; sub_code_8E5+496j ...
		mov	byte ptr ds:583h, 1
		retn
; ---------------------------------------------------------------------------

loc_code_DCA:				; CODE XREF: sub_code_8E5+4DDj
		mov	ds:565h, bx
		mov	ah, bl
		shl	ah, 1
		mul	ah
		add	ax, ds:569h
		mov	ds:55Dh, ax
		jmp	short loc_code_E1F
; ---------------------------------------------------------------------------
		nop

loc_code_DDE:				; CODE XREF: sub_code_8E5+4D0j
					; sub_code_8E5+4D2j
		cmp	word ptr ds:4, 7
		jnz	short loc_code_DEE
		mov	al, ds:57Bh
		sub	al, 0BBh ; '�'
		jb	short loc_code_E1F
		jnb	short loc_code_DFC

loc_code_DEE:				; CODE XREF: sub_code_8E5+4FEj
		cmp	byte ptr ds:550h, 2
		jnz	short loc_code_E1F
		mov	al, ds:57Bh
		sub	al, 5Eh	; '^'
		jb	short loc_code_E1F

loc_code_DFC:				; CODE XREF: sub_code_8E5+507j
		sub	bh, al
		jz	short loc_code_E02
		jnb	short loc_code_E16

loc_code_E02:				; CODE XREF: sub_code_8E5+519j
		cmp	word ptr ds:4, 7
		jnz	short loc_code_E0F
		mov	byte ptr ds:551h, 1
		retn
; ---------------------------------------------------------------------------

loc_code_E0F:				; CODE XREF: sub_code_8E5+522j
		call	sub_code_70D
		call	sub_code_59CB
		retn
; ---------------------------------------------------------------------------

loc_code_E16:				; CODE XREF: sub_code_8E5+51Bj
		mov	ds:565h, bx
		mov	byte ptr ds:576h, 2

loc_code_E1F:				; CODE XREF: sub_code_8E5+4F6j
					; sub_code_8E5+505j ...
		call	sub_code_1145
		retn
; ---------------------------------------------------------------------------

loc_code_E23:				; CODE XREF: sub_code_8E5+38Cj
		cmp	word ptr ds:4, 7
		jz	short loc_code_E31
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jnb	short loc_code_E78

loc_code_E31:				; CODE XREF: sub_code_8E5+543j
		call	sub_code_1608
		jb	short loc_code_E43
		mov	byte ptr ds:56Eh, 0
		mov	byte ptr ds:571h, 1
		jmp	short loc_code_EB1
; ---------------------------------------------------------------------------
		nop

loc_code_E43:				; CODE XREF: sub_code_8E5+54Fj
		cmp	word ptr ds:4, 0
		jnz	short loc_code_E78
		call	sub_code_22F7
		jb	short loc_code_E56
		mov	byte ptr ds:56Ch, 0
		jmp	short loc_code_E78
; ---------------------------------------------------------------------------

loc_code_E56:				; CODE XREF: sub_code_8E5+568j
		cmp	byte ptr ds:56Ch, 0
		jnz	short loc_code_E60
		call	sub_code_591F

loc_code_E60:				; CODE XREF: sub_code_8E5+576j
		mov	byte ptr ds:699h, 1
		mov	byte ptr ds:56Ch, 1
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_E74
		mov	dl, 0FFh

loc_code_E74:				; CODE XREF: sub_code_8E5+58Bj
		mov	ds:698h, dl

loc_code_E78:				; CODE XREF: sub_code_8E5:loc_code_C67j
					; sub_code_8E5+54Aj ...
		mov	al, ds:56Eh
		mov	ds:56Fh, al
		mov	al, ds:698h
		mov	ds:56Eh, al
		mov	al, ds:699h
		mov	ds:571h, al
		cmp	al, 0
		jnz	short loc_code_E91
		jmp	loc_code_F34
; ---------------------------------------------------------------------------

loc_code_E91:				; CODE XREF: sub_code_8E5+5A7j
		cmp	byte ptr ds:571h, 1
		jnz	short loc_code_EC9
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jb	short loc_code_EB1
		mov	byte ptr ds:571h, 0
		mov	byte ptr ds:584h, 0
		mov	byte ptr ds:699h, 0
		jmp	loc_code_F34
; ---------------------------------------------------------------------------

loc_code_EB1:				; CODE XREF: sub_code_8E5+55Bj
					; sub_code_8E5+5B8j
		mov	ah, 1
		mov	al, 20h	; ' '
		mov	byte ptr ds:55Bh, 8
		cmp	byte ptr ds:550h, 1
		jnz	short loc_code_EF1
		mov	byte ptr ds:550h, 0
		jmp	short loc_code_EF1
; ---------------------------------------------------------------------------
		nop

loc_code_EC9:				; CODE XREF: sub_code_8E5+5B1j
		mov	byte ptr ds:55Bh, 0
		mov	ax, ds:572h
		mov	bl, al
		cmp	al, 2
		jbe	short loc_code_ED9
		sub	al, 2

loc_code_ED9:				; CODE XREF: sub_code_8E5+5F0j
		mov	ds:572h, ax
		mov	ah, 8
		mov	al, bl
		xor	al, 0Fh
		mov	cl, 4
		shl	al, cl
		cmp	byte ptr ds:550h, 1
		jnz	short loc_code_EF1
		inc	byte ptr ds:550h

loc_code_EF1:				; CODE XREF: sub_code_8E5+5DAj
					; sub_code_8E5+5E1j ...
		mov	ds:578h, al
		mov	ds:576h, ah
		mov	byte ptr ds:577h, 1
		mov	byte ptr ds:55Ch, 0
		mov	bl, ds:56Eh
		inc	bl
		shl	bl, 1
		cmp	byte ptr ds:571h, 0FFh
		jz	short loc_code_F14
		add	bl, 6

loc_code_F14:				; CODE XREF: sub_code_8E5+62Aj
		sub	bh, bh
		mov	ax, [bx+0FAAh]
		mov	ds:569h, ax
		mov	ax, [bx+0FB6h]
		mov	ds:567h, ax
		mov	byte ptr ds:39E0h, 0
		cmp	byte ptr ds:127Ch, 0
		jz	short locret_code_F33
		call	sub_code_58F8

locret_code_F33:			; CODE XREF: sub_code_8E5+649j
		retn
; ---------------------------------------------------------------------------

loc_code_F34:				; CODE XREF: sub_code_8E5+5A9j
					; sub_code_8E5+5C9j
		cmp	word ptr ds:4, 0
		jz	short loc_code_F45
		cmp	word ptr ds:4, 7
		jz	short loc_code_F45
		call	sub_code_3445

loc_code_F45:				; CODE XREF: sub_code_8E5+654j
					; sub_code_8E5+65Bj
		call	sub_code_FC9
		mov	dl, ds:57Bh
		mov	cx, ds:579h
		call	sub_code_2CB0
		mov	ds:563h, ax
		mov	al, ds:56Eh
		or	al, ds:571h
		jnz	short loc_code_F63
		call	sub_code_1069
		retn
; ---------------------------------------------------------------------------

loc_code_F63:				; CODE XREF: sub_code_8E5+678j
		call	sub_code_1020
		mov	ds:55Dh, bx
		call	sub_code_11E3
		call	sub_code_1B7A
		jb	short locret_code_F86
		call	sub_code_20F5
		jb	short locret_code_F86
		mov	ax, ds:563h
		mov	ds:55Fh, ax
		mov	word ptr ds:565h, 0B03h
		call	sub_code_1145

locret_code_F86:			; CODE XREF: sub_code_8E5+68Bj
					; sub_code_8E5+690j
		retn
sub_code_8E5	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_F87	proc near		; CODE XREF: sub_code_8E5+30Ep
		mov	cx, 0B03h
		sub	cl, al
		mov	ds:565h, cx
		cmp	ah, 0FFh
		jz	short loc_code_FA6
		sub	ah, ah
		shl	al, 1
		add	ds:55Dh, ax
		mov	word ptr ds:579h, 0
		jmp	short loc_code_FB4
; ---------------------------------------------------------------------------
		nop

loc_code_FA6:				; CODE XREF: sub_code_F87+Cj
		sub	ah, ah
		shl	al, 1
		shl	al, 1
		shl	al, 1
		add	ax, 128h
		mov	ds:579h, ax

loc_code_FB4:				; CODE XREF: sub_code_F87+1Cj
		push	ds
		pop	es
		assume es:nothing
		mov	si, ds:55Dh
		mov	di, 0Eh
		mov	al, 3
		call	sub_code_2D70
		mov	word ptr ds:55Dh, 0Eh
		retn
sub_code_F87	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_FC9	proc near		; CODE XREF: sub_code_8E5+16Cp
					; sub_code_8E5+2FAp ...
		mov	word ptr ds:5F6h, 8
		mov	word ptr ds:5F8h, 123h
		cmp	word ptr ds:4, 7
		jnz	short loc_code_FE8
		mov	word ptr ds:5F6h, 24h ;	'$'
		mov	word ptr ds:5F8h, 10Fh

loc_code_FE8:				; CODE XREF: sub_code_FC9+11j
		mov	ax, ds:579h
		cmp	byte ptr ds:56Eh, 1
		jb	short loc_code_101E
		jnz	short loc_code_1007
		add	ax, ds:572h
		cmp	ax, ds:5F8h
		jb	short loc_code_101B
		mov	ax, ds:5F8h
		dec	ax
		mov	ds:579h, ax
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_1007:				; CODE XREF: sub_code_FC9+29j
		sub	ax, ds:572h
		jb	short loc_code_1013
		cmp	ax, ds:5F6h
		jnb	short loc_code_101B

loc_code_1013:				; CODE XREF: sub_code_FC9+42j
		mov	ax, ds:5F6h
		mov	ds:579h, ax
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_101B:				; CODE XREF: sub_code_FC9+33j
					; sub_code_FC9+48j
		mov	ds:579h, ax

loc_code_101E:				; CODE XREF: sub_code_FC9+27j
		clc
		retn
sub_code_FC9	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1020	proc near		; CODE XREF: sub_code_8E5:loc_code_BE5p
					; sub_code_8E5:loc_code_F63p
		mov	al, ds:56Eh
		cmp	al, ds:56Fh
		jz	short loc_code_102F
		mov	word ptr ds:572h, 2

loc_code_102F:				; CODE XREF: sub_code_1020+7j
		cmp	word ptr ds:572h, 8
		jnb	short loc_code_1045
		dec	byte ptr ds:577h
		mov	al, ds:577h
		and	al, 3
		jnz	short loc_code_1045
		inc	word ptr ds:572h

loc_code_1045:				; CODE XREF: sub_code_1020+14j
					; sub_code_1020+1Fj
		mov	bl, ds:56Bh
		inc	bl
		cmp	bl, 6
		jb	short loc_code_1052
		mov	bl, 0

loc_code_1052:				; CODE XREF: sub_code_1020+2Ej
		mov	ds:56Bh, bl
		cmp	byte ptr ds:56Eh, 0FFh
		jnz	short loc_code_1060
		add	bl, 6

loc_code_1060:				; CODE XREF: sub_code_1020+3Bj
		shl	bl, 1
		sub	bh, bh
		mov	bx, [bx+0F7Ah]
		retn
sub_code_1020	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1069	proc near		; CODE XREF: sub_code_8E5+67Ap
		mov	word ptr ds:572h, 2
		mov	byte ptr ds:577h, 8
		cmp	word ptr ds:561h, 0C02h
		jnz	short loc_code_1087
		inc	byte ptr ds:56Dh
		test	byte ptr ds:56Dh, 7
		jnz	short locret_code_10DC

loc_code_1087:				; CODE XREF: sub_code_1069+11j
		call	sub_code_11E3
		call	sub_code_1B7A
		jb	short locret_code_10DC
		call	sub_code_20F5
		jb	short locret_code_10DC
		call	sub_code_2DFD
		mov	bl, dl
		and	bx, 0Eh
		mov	si, [bx+0F92h]
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	di, ds:55Fh
		mov	bp, 5FAh
		mov	word ptr ds:561h, 0C02h
		mov	cx, 602h
		call	sub_code_2D35
		call	sub_code_2DFD
		mov	bl, dl
		and	bx, 6
		mov	si, [bx+0FA2h]
		mov	di, ds:55Fh
		add	di, 0F0h ; '�'
		mov	bp, 612h
		mov	cx, 602h
		call	sub_code_2D35
		mov	byte ptr ds:583h, 0

locret_code_10DC:			; CODE XREF: sub_code_1069+1Cj
					; sub_code_1069+24j ...
		retn
sub_code_1069	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_10DD	proc near		; CODE XREF: sub_code_1B7A+34p
		mov	byte ptr ds:55Ch, 0
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:576h, 2
		mov	byte ptr ds:578h, 1
		mov	byte ptr ds:577h, 0FFh
		mov	byte ptr ds:56Eh, 0
		mov	byte ptr ds:55Ah, 1
		mov	ax, ds:0FACh
		mov	ds:569h, ax
		mov	ax, ds:0FB8h
		mov	ds:567h, ax
		mov	byte ptr ds:550h, 2
		retn
sub_code_10DD	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1112	proc near		; CODE XREF: sub_code_3E90+10Ap
					; sub_code_45AB+9Ap
		mov	cx, ds:579h
		mov	dl, ds:57Bh
		call	sub_code_2CB0
		mov	ds:55Fh, ax
		call	sub_code_1124
		retn
sub_code_1112	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1124	proc near		; CODE XREF: sub_code_70D+3Bp
					; sub_code_7A1+42p ...
		mov	ax, seg	data
		mov	es, ax
		assume es:data
		mov	di, 5FAh
		push	ds
		mov	si, ds:55Fh
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	cx, es:word_data_8+559h
		call	sub_code_2DCA
		pop	ds
		assume ds:nothing
		mov	byte ptr ds:583h, 0
		retn
sub_code_1124	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1145	proc near		; CODE XREF: sub_code_8E5+2BBp
					; sub_code_8E5+2C3p ...
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	di, ds:55Fh
		mov	bp, 5FAh
		mov	si, ds:55Dh
		mov	cx, ds:565h
		mov	ds:561h, cx
		mov	byte ptr ds:583h, 0
		call	sub_code_2D35
		retn
sub_code_1145	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1166	proc near		; CODE XREF: sub_code_1B7A+43p
		mov	dl, ds:57Bh
		mov	cx, ds:579h
		sub	cx, 0Ch
		jnb	short loc_code_1175
		sub	cx, cx

loc_code_1175:				; CODE XREF: sub_code_1166+Bj
		cmp	cx, 10Fh
		jb	short loc_code_117E
		mov	cx, 10Eh

loc_code_117E:				; CODE XREF: sub_code_1166+13j
		call	sub_code_2CB0
		mov	ds:581h, ax
		mov	di, ax
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, 0Eh
		mov	si, 1679h
		mov	cx, 1205h
		call	sub_code_2CCC
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:57Fh, dx
		mov	word ptr ds:5A3Ch, 0
		mov	word ptr ds:5A3Eh, 0

loc_code_11AB:				; CODE XREF: sub_code_1166+53j
		call	sub_code_5A1C
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:57Fh
		cmp	dx, 0Ah
		jb	short loc_code_11AB
		call	sub_code_5B21
		mov	di, ds:581h
		mov	si, 0Eh
		mov	cx, 1205h
		mov	byte ptr ds:583h, 0
		call	sub_code_2D9D
		cmp	byte ptr ds:1678h, 0
		jz	short locret_code_11E2
		cmp	byte ptr ds:1F80h, 0
		jz	short locret_code_11E2
		dec	byte ptr ds:1F80h

locret_code_11E2:			; CODE XREF: sub_code_1166+6Fj
					; sub_code_1166+76j
		retn
sub_code_1166	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_11E3	proc near		; CODE XREF: sub_code_8E5:loc_code_B97p
					; sub_code_8E5+318p ...
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:55Fh
		mov	si, 5FAh
		mov	cx, ds:561h
		call	sub_code_2D9D
		retn
sub_code_11E3	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_1200	proc near		; CODE XREF: start:loc_code_176p
					; start+281p ...
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:69Fh
		cmp	ax, 2
		jnb	short loc_code_1210
		retn
; ---------------------------------------------------------------------------

loc_code_1210:				; CODE XREF: sub_code_1200+Dj
		mov	ds:69Fh, dx
		cmp	byte ptr ds:69Bh, 0
		jnz	short loc_code_122E
		call	sub_code_12C1
		call	sub_code_13B7
		mov	dx, ax

loc_code_1223:				; CODE XREF: sub_code_1200+2Bj
		call	sub_code_13B7
		sub	ax, dx
		cmp	ax, 0F8EDh
		jb	short loc_code_1223
		retn
; ---------------------------------------------------------------------------

loc_code_122E:				; CODE XREF: sub_code_1200+19j
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	al, 10h
		mov	ds:69Ah, al
		mov	byte ptr ds:69Eh, 3
		call	sub_code_13B7
		mov	ds:69Ch, ax
		out	dx, al
		mov	cx, 7D0h

loc_code_1246:				; CODE XREF: sub_code_1200+86j
		in	al, dx
		test	al, 1
		jnz	short loc_code_125E
		test	byte ptr ds:69Eh, 1
		jz	short loc_code_125E
		and	byte ptr ds:69Eh, 0FEh
		call	sub_code_12A1
		mov	ds:698h, bl

loc_code_125E:				; CODE XREF: sub_code_1200+49j
					; sub_code_1200+50j
		test	al, 2
		jnz	short loc_code_1275
		test	byte ptr ds:69Eh, 2
		jz	short loc_code_1275
		and	byte ptr ds:69Eh, 0FDh
		call	sub_code_12A1
		mov	ds:699h, bl

loc_code_1275:				; CODE XREF: sub_code_1200+60j
					; sub_code_1200+67j
		test	byte ptr ds:69Eh, 3
		jz	short locret_code_12A0
		call	sub_code_13B7
		sub	ax, ds:69Ch
		cmp	ax, 1964h
		loopne	loc_code_1246
		test	byte ptr ds:69Eh, 1
		jz	short loc_code_1294
		mov	byte ptr ds:698h, 0FFh

loc_code_1294:				; CODE XREF: sub_code_1200+8Dj
		test	byte ptr ds:69Eh, 2
		jz	short locret_code_12A0
		mov	byte ptr ds:699h, 0FFh

locret_code_12A0:			; CODE XREF: sub_code_1200+7Aj
					; sub_code_1200+99j
		retn
sub_code_1200	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_12A1	proc near		; CODE XREF: sub_code_1200+57p
					; sub_code_1200+6Ep
		push	ax
		call	sub_code_13B7
		sub	ax, ds:69Ch
		mov	bx, ax
		pop	ax
		cmp	bx, 0F5E6h
		jnb	short loc_code_12B5
		mov	bl, 1
		retn
; ---------------------------------------------------------------------------

loc_code_12B5:				; CODE XREF: sub_code_12A1+Fj
		cmp	bx, 0FAFAh
		jnb	short loc_code_12BE
		sub	bl, bl
		retn
; ---------------------------------------------------------------------------

loc_code_12BE:				; CODE XREF: sub_code_12A1+18j
		mov	bl, 0FFh
		retn
sub_code_12A1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_12C1	proc near		; CODE XREF: sub_code_1200+1Bp
		mov	al, ds:6BAh
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_12D3
		and	al, ds:6BDh
		and	al, ds:6BEh

loc_code_12D3:				; CODE XREF: sub_code_12C1+8j
		xor	al, 80h
		jz	short loc_code_12D9
		mov	al, 1

loc_code_12D9:				; CODE XREF: sub_code_12C1+14j
		mov	ds:699h, al
		mov	al, ds:6B8h
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_12EE
		and	al, ds:6BCh
		and	al, ds:6BFh

loc_code_12EE:				; CODE XREF: sub_code_12C1+23j
		xor	al, 80h
		jz	short loc_code_12F7
		mov	byte ptr ds:699h, 0FFh

loc_code_12F7:				; CODE XREF: sub_code_12C1+2Fj
		mov	al, ds:6B9h
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_1309
		and	al, ds:6BCh
		and	al, ds:6BDh

loc_code_1309:				; CODE XREF: sub_code_12C1+3Ej
		xor	al, 80h
		jz	short loc_code_130F
		mov	al, 1

loc_code_130F:				; CODE XREF: sub_code_12C1+4Aj
		mov	ds:698h, al
		mov	al, ds:6BBh
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_1324
		and	al, ds:6BEh
		and	al, ds:6BFh

loc_code_1324:				; CODE XREF: sub_code_12C1+59j
		xor	al, 80h
		jz	short loc_code_132D
		mov	byte ptr ds:698h, 0FFh

loc_code_132D:				; CODE XREF: sub_code_12C1+65j
		mov	al, ds:6B7h
		mov	cl, 3
		shr	al, cl
		mov	ds:69Ah, al
		retn
sub_code_12C1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1338	proc far		; CODE XREF: start:loc_code_15Fp
					; start:loc_code_27Ep ...
		mov	ax, ds:693h
		cmp	ax, ds:691h
		jz	short locret_code_1357
		mov	ds:691h, ax
		test	byte ptr ds:6C0h, 80h
		jnz	short loc_code_1358
		mov	ax, ds:693h
		cmp	ax, ds:6E00h
		jz	short locret_code_1357
		call	sub_code_5E70

locret_code_1357:			; CODE XREF: sub_code_1338+7j
					; sub_code_1338+1Aj
		retn
; ---------------------------------------------------------------------------

loc_code_1358:				; CODE XREF: sub_code_1338+11j
		test	byte ptr ds:6C9h, 80h
		jz	short loc_code_1360
		retn
; ---------------------------------------------------------------------------

loc_code_1360:				; CODE XREF: sub_code_1338+25j
		test	byte ptr ds:6CCh, 80h
		jnz	short loc_code_136D
		mov	byte ptr ds:1F80h, 9
		retn
; ---------------------------------------------------------------------------

loc_code_136D:				; CODE XREF: sub_code_1338+2Dj
		test	byte ptr ds:6C1h, 80h
		jz	short loc_code_13A5
		test	byte ptr ds:6CBh, 80h
		jnz	short loc_code_1381
		mov	byte ptr ds:41Ch, 0FFh
		retn
; ---------------------------------------------------------------------------

loc_code_1381:				; CODE XREF: sub_code_1338+41j
		test	byte ptr ds:6C8h, 80h
		jnz	short loc_code_138E
		mov	byte ptr ds:41Bh, 0FFh
		retn
; ---------------------------------------------------------------------------

loc_code_138E:				; CODE XREF: sub_code_1338+4Ej
		test	byte ptr ds:6C7h, 80h
		jnz	short locret_code_13A4
		not	byte ptr ds:0
		cmp	byte ptr ds:0, 0
		jnz	short locret_code_13A3
		call	sub_code_5B21

locret_code_13A3:			; CODE XREF: sub_code_1338+66j
		retn
; ---------------------------------------------------------------------------

locret_code_13A4:			; CODE XREF: sub_code_1338+5Bj
		retn
; ---------------------------------------------------------------------------

loc_code_13A5:				; CODE XREF: sub_code_1338+3Aj
		call	sub_code_147F
		pop	ax
		retf
sub_code_1338	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_code_13AA	proc near		; CODE XREF: start+Dp
		mov	ax, 0F000h
		mov	es, ax
		assume es:nothing
		mov	al, es:0FFFEh
		mov	ds:697h, al
		retn
sub_code_13AA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_13B7	proc near		; CODE XREF: sub_code_1200+1Ep
					; sub_code_1200:loc_code_1223p	...
		mov	al, 0
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		nop
		nop
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	ah, al
		nop
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		xchg	al, ah
		retn
sub_code_13B7	endp

; ---------------------------------------------------------------------------
		call	sub_code_13B7
		mov	bx, ax
		sub	ax, cx
		mov	cx, bx
		cmp	ax, dx
		jnb	short loc_code_13D5
		retn
; ---------------------------------------------------------------------------

loc_code_13D5:				; CODE XREF: code:13D2j
		cmp	dx, dx
		retn

; =============== S U B	R O U T	I N E =======================================


sub_code_13D8	proc near		; CODE XREF: sub_code_4A0+Bp
					; sub_code_8E5+3Ap ...
		mov	dx, 3DAh
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8
		retn
sub_code_13D8	endp

; ---------------------------------------------------------------------------
word_code_13DF	dw 0			; DATA XREF: sub_code_1419+17w
					; sub_code_147F+4r
word_code_13E1	dw 0			; DATA XREF: sub_code_1419+1Bw
					; sub_code_147F+8r
word_code_13E3	dw 0			; DATA XREF: sub_code_1419+20w
					; sub_code_147F+Dr
word_code_13E5	dw 0			; DATA XREF: sub_code_1419+25w
					; sub_code_147F+12r
byte_code_13E7	db 0			; DATA XREF: sub_code_13E8+28w
					; code:1529r

; =============== S U B	R O U T	I N E =======================================


sub_code_13E8	proc near		; CODE XREF: start+23p
					; code:loc_code_1530p
		push	ax
		push	es
		push	di
		push	cx
		mov	ax, seg	data
		mov	es, ax
		assume es:data
		cld
		mov	di, 6B7h
		mov	cx, 16h
		mov	al, 80h	; '�'
		rep stosb
		mov	ax, es:word_data_8+68Bh
		sub	ax, 70h	; 'p'
		mov	es:word_data_8+689h, ax
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	al, es:12h
		mov	cs:byte_code_13E7, al
		pop	cx
		pop	di
		pop	es
		assume es:nothing
		pop	ax
		retn
sub_code_13E8	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1419	proc near		; CODE XREF: start+20p
		sub	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, es:24h
		mov	bx, es:26h
		mov	cx, es:120h
		mov	dx, es:122h
		mov	cs:word_code_13DF, ax
		mov	cs:word_code_13E1, bx
		mov	cs:word_code_13E3, cx
		mov	cs:word_code_13E5, dx
		mov	bx, 14B3h
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_1450
		mov	bx, 14FBh

loc_code_1450:				; CODE XREF: sub_code_1419+32j
		cli
		mov	es:24h,	bx
		mov	word ptr es:26h, cs
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_147D
		mov	word ptr es:120h, offset loc_code_1554
		mov	word ptr es:122h, cs
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	al, es:18h
		or	al, 1
		mov	es:18h,	al

loc_code_147D:				; CODE XREF: sub_code_1419+47j
		sti
		retn
sub_code_1419	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_147F	proc near		; CODE XREF: sub_code_1338:loc_code_13A5p
		sub	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, cs:word_code_13DF
		mov	bx, cs:word_code_13E1
		mov	cx, cs:word_code_13E3
		mov	dx, cs:word_code_13E5
		cli
		mov	es:24h,	ax
		mov	es:26h,	bx
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_14B1
		mov	es:120h, cx
		mov	es:122h, dx

loc_code_14B1:				; CODE XREF: sub_code_147F+26j
		sti
		retn
sub_code_147F	endp

; ---------------------------------------------------------------------------
		push	ax
		push	es
		push	di
		push	cx
		mov	di, seg	data
		mov	es, di
		assume es:data
		in	al, 60h		; AT Keyboard controller 8042.
		mov	ah, al
		and	al, 7Fh
		test	ah, 80h
		jnz	short loc_code_14CC
		inc	es:word_data_8+68Bh

loc_code_14CC:				; CODE XREF: code:14C5j
		mov	di, 6A1h
		mov	cx, 16h
		cld
		repne scasb
		jnz	short loc_code_14E3
		sub	di, 6A2h
		and	ah, 80h
		mov	es:[di+6B7h], ah

loc_code_14E3:				; CODE XREF: code:14D5j
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	ah, al
		or	al, 80h
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	al, ah
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		call	sub_code_1572
		pop	cx
		pop	di
		pop	es
		assume es:nothing
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	ax
		iret
; ---------------------------------------------------------------------------
		sti
		push	ax
		push	es
		push	di
		push	cx
		mov	di, seg	data
		mov	es, di
		assume es:data
		mov	ah, al
		and	al, 7Fh
		test	ah, 80h
		jnz	short loc_code_1513
		inc	es:word_data_8+68Bh

loc_code_1513:				; CODE XREF: code:150Cj
		cmp	ah, 0FFh
		jz	short loc_code_1530
		cmp	ah, 55h	; 'U'
		jz	short loc_code_1530
		push	es
		mov	di, 40h	; '@'
		mov	es, di
		assume es:nothing
		mov	cl, es:12h
		pop	es
		assume es:nothing
		cmp	cl, cs:byte_code_13E7
		jz	short loc_code_1535

loc_code_1530:				; CODE XREF: code:1516j code:151Bj
		call	sub_code_13E8
		jmp	short loc_code_154C
; ---------------------------------------------------------------------------

loc_code_1535:				; CODE XREF: code:152Ej
		mov	di, 6A1h
		mov	cx, 16h
		cld
		repne scasb
		jnz	short loc_code_154C
		sub	di, 6A2h
		and	ah, 80h
		mov	es:[di+6B7h], ah

loc_code_154C:				; CODE XREF: code:1533j code:153Ej
		call	sub_code_1572
		pop	cx
		pop	di
		pop	es
		pop	ax
		iret
; ---------------------------------------------------------------------------

loc_code_1554:				; DATA XREF: sub_code_1419+49o
		int	9		;  - IRQ1 - KEYBOARD INTERRUPT
					; Generated when data is received from the keyboard.
		iret
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_code_1572

loc_code_1557:				; CODE XREF: sub_code_1572+19j
		mov	ax, 0F000h
		mov	ss, ax
		assume ss:nothing
		mov	ax, 40h	; '@'
		mov	ds, ax
		assume ds:nothing
		mov	bx, 72h	; 'r'
		mov	word ptr [bx], 1234h
		mov	ax, 0
		mov	es, ax
		assume es:nothing
		jmp	far ptr	0F000h:0E05Bh
; END OF FUNCTION CHUNK	FOR sub_code_1572

; =============== S U B	R O U T	I N E =======================================


sub_code_1572	proc near		; CODE XREF: code:14EFp
					; code:loc_code_154Cp

; FUNCTION CHUNK AT 1557 SIZE 0000001B BYTES

		mov	al, es:6C9h
		or	al, es:6B7h
		cmp	al, 0
		jnz	short locret_code_15C9
		test	byte ptr es:6CAh, 80h
		jnz	short loc_code_158D
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		jmp	short loc_code_1557
; ---------------------------------------------------------------------------

loc_code_158D:				; CODE XREF: sub_code_1572+13j
		test	byte ptr es:6B9h, 80h
		jnz	short loc_code_15A4
		cmp	byte ptr es:690h, 1
		jb	short locret_code_15C9
		dec	byte ptr es:690h
		jmp	short loc_code_15B9
; ---------------------------------------------------------------------------

loc_code_15A4:				; CODE XREF: sub_code_1572+21j
		test	byte ptr es:6BBh, 80h
		jnz	short locret_code_15C9
		cmp	byte ptr es:690h, 7
		jnb	short locret_code_15C9
		inc	byte ptr es:690h

loc_code_15B9:				; CODE XREF: sub_code_1572+30j
		push	dx
		mov	al, 2
		mov	dx, 3D4h
		out	dx, al		; Video: CRT cntrlr addr
					; start	horizontal blanking (character count)
		mov	al, es:690h
		add	al, 27h	; '''
		inc	dx
		out	dx, al		; Video: CRT controller	internal registers
		pop	dx

locret_code_15C9:			; CODE XREF: sub_code_1572+Bj
					; sub_code_1572+29j ...
		retn
sub_code_1572	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_15D0	proc near		; CODE XREF: sub_code_2216:loc_code_224Ep
		mov	bx, ds:8
		mov	cl, [bx+100Eh]

loc_code_15D8:				; CODE XREF: sub_code_15D0+10j
					; sub_code_15D0+1Aj
		call	sub_code_2DFD
		and	dl, 7
		cmp	dl, cl
		ja	short loc_code_15D8
		add	dl, [bx+1006h]
		cmp	dl, ds:1028h
		jz	short loc_code_15D8
		mov	ds:1028h, dl
		mov	bl, dl
		mov	cl, [bx+0FF0h]
		mov	dl, 88h	; '�'
		test	cl, 80h
		jnz	short loc_code_15FF
		mov	dl, 90h	; '�'

loc_code_15FF:				; CODE XREF: sub_code_15D0+2Bj
		and	cx, 7Fh
		shl	cx, 1
		shl	cx, 1
		retn
sub_code_15D0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1608	proc near		; CODE XREF: sub_code_8E5+3F7p
					; sub_code_8E5:loc_code_E31p
		cmp	word ptr ds:4, 7
		jnz	short loc_code_1613
		call	sub_code_30FA
		retn
; ---------------------------------------------------------------------------

loc_code_1613:				; CODE XREF: sub_code_1608+5j
		cmp	word ptr ds:4, 0
		jz	short loc_code_161E
		call	sub_code_16C6
		retn
; ---------------------------------------------------------------------------

loc_code_161E:				; CODE XREF: sub_code_1608+10j
		mov	al, ds:57Bh
		and	al, 0F8h
		cmp	al, 60h	; '`'
		jz	short loc_code_1630
		call	sub_code_1657
		jb	short locret_code_1656
		call	sub_code_17AD
		retn
; ---------------------------------------------------------------------------

loc_code_1630:				; CODE XREF: sub_code_1608+1Dj
		cmp	byte ptr ds:550h, 2
		jnb	short loc_code_1655
		mov	ds:57Bh, al
		add	al, 32h	; '2'
		mov	ds:57Ch, al
		cmp	byte ptr ds:550h, 1
		jz	short loc_code_1653
		mov	byte ptr ds:550h, 1
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:556h, dx

loc_code_1653:				; CODE XREF: sub_code_1608+3Cj
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_1655:				; CODE XREF: sub_code_1608+2Dj
		clc

locret_code_1656:			; CODE XREF: sub_code_1608+22j
		retn
sub_code_1608	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1657	proc near		; CODE XREF: sub_code_1608+1Fp
		mov	cl, ds:57Bh
		add	cl, 2
		and	cl, 0F8h
		mov	bx, ds:8
		mov	bl, [bx+1006h]

loc_code_1669:				; CODE XREF: sub_code_1657+2Cj
					; sub_code_1657+3Fj ...
		mov	al, [bx+0FF0h]
		cmp	al, 0
		jnz	short loc_code_1678
		mov	byte ptr ds:127Ch, 0
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_1678:				; CODE XREF: sub_code_1657+18j
		inc	bx
		mov	ch, 88h	; '�'
		test	al, 80h
		jnz	short loc_code_1681
		mov	ch, 90h	; '�'

loc_code_1681:				; CODE XREF: sub_code_1657+26j
		cmp	cl, ch
		jnz	short loc_code_1669
		and	ax, 7Fh
		shl	ax, 1
		shl	ax, 1
		mov	dx, ds:579h
		and	dx, 0FFF8h
		cmp	dx, ax
		jb	short loc_code_1669
		mov	dx, ds:579h
		sub	dx, 0Fh
		and	dx, 0FFF8h
		cmp	dx, ax
		ja	short loc_code_1669
		sub	ch, 2
		mov	ds:57Bh, ch
		add	ch, 32h	; '2'
		mov	ds:57Ch, ch
		cmp	byte ptr ds:127Ch, 0
		jnz	short loc_code_16C4
		mov	byte ptr ds:127Ch, 1
		call	sub_code_590E

loc_code_16C4:				; CODE XREF: sub_code_1657+63j
		stc
		retn
sub_code_1657	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_16C6	proc near		; CODE XREF: sub_code_1608+12p
		mov	byte ptr ds:39E0h, 0
		cmp	byte ptr ds:571h, 1
		jnz	short loc_code_16FC
		mov	ax, ds:2650h
		sub	ax, 4
		mov	dl, ds:2652h
		sub	dl, 8
		mov	si, 0Ch
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E10h
		call	sub_code_2E29
		jnb	short loc_code_16FC
		mov	byte ptr ds:551h, 1
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_16FC:				; CODE XREF: sub_code_16C6+Aj
					; sub_code_16C6+2Dj
		cmp	word ptr ds:4, 3
		jnz	short loc_code_170E
		call	sub_code_3C43
		jnb	short loc_code_170E
		mov	byte ptr ds:55Ch, 1
		retn
; ---------------------------------------------------------------------------

loc_code_170E:				; CODE XREF: sub_code_16C6+3Bj
					; sub_code_16C6+40j
		mov	cl, ds:57Bh
		and	cl, 0F8h
		mov	bx, ds:4
		shl	bx, 1
		mov	bx, [bx+1269h]

loc_code_171F:				; CODE XREF: sub_code_16C6+7Dj
					; sub_code_16C6+89j ...
		mov	ch, [bx+1029h]
		cmp	ch, 0
		jnz	short loc_code_172A
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_172A:				; CODE XREF: sub_code_16C6+60j
		mov	al, [bx+1089h]
		mov	ds:127Bh, al
		shl	bl, 1
		mov	ax, [bx+11A9h]
		mov	ds:1279h, ax
		mov	ax, [bx+10E9h]
		shr	bl, 1
		inc	bx
		cmp	cl, ch
		jnz	short loc_code_171F
		mov	dx, ds:579h
		and	dx, 0FFF8h
		cmp	dx, ax
		jb	short loc_code_171F
		mov	dx, ds:579h
		sub	dx, ds:1279h
		jnb	short loc_code_175D
		sub	dx, dx

loc_code_175D:				; CODE XREF: sub_code_16C6+93j
		and	dx, 0FFFCh
		cmp	dx, ax
		ja	short loc_code_171F
		mov	ds:57Bh, ch
		add	ch, 32h	; '2'
		mov	ds:57Ch, ch
		mov	al, ds:127Bh
		mov	ds:55Ch, al
		cmp	al, 0
		jz	short loc_code_1780
		and	word ptr ds:579h, 0FFFCh

loc_code_1780:				; CODE XREF: sub_code_16C6+B2j
		cmp	word ptr ds:4, 4
		jnz	short loc_code_1797
		dec	bx
		sub	bx, 27h	; '''
		jb	short loc_code_1797
		cmp	bx, 10h
		jnb	short loc_code_1797
		inc	bx
		mov	ds:39E0h, bl

loc_code_1797:				; CODE XREF: sub_code_16C6+BFj
					; sub_code_16C6+C5j ...
		stc
		retn
sub_code_16C6	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1799	proc near		; CODE XREF: sub_code_17AD+5Ap
		mov	cl, 3
		shr	bx, cl
		mov	ch, bl
		mov	cl, 3
		shr	bx, cl
		mov	cl, ch
		and	cl, 7
		mov	ch, 80h	; '�'
		shr	ch, cl
		retn
sub_code_1799	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_17AD	proc near		; CODE XREF: sub_code_1608+24p
		mov	dl, ds:57Bh
		and	dl, 0F8h
		sub	bx, bx
		cmp	dl, 8
		jz	short loc_code_17C9
		inc	bl
		cmp	dl, 28h	; '('
		jz	short loc_code_17C9
		inc	bl
		cmp	dl, 48h	; 'H'
		jnz	short loc_code_1810

loc_code_17C9:				; CODE XREF: sub_code_17AD+Cj
					; sub_code_17AD+13j
		mov	ax, ds:579h
		cmp	bx, ds:52Fh
		jnz	short loc_code_17FC
		cmp	byte ptr ds:525h, 3
		ja	short loc_code_17FC
		cmp	bl, 1
		jz	short loc_code_17EE
		mov	cx, 4
		sub	cl, ds:525h
		shl	cl, 1
		shl	cl, 1
		add	ax, cx
		jmp	short loc_code_17FC
; ---------------------------------------------------------------------------
		nop

loc_code_17EE:				; CODE XREF: sub_code_17AD+2Fj
		sub	ch, ch
		mov	cl, ds:525h
		inc	cl
		shl	cl, 1
		shl	cl, 1
		sub	ax, cx

loc_code_17FC:				; CODE XREF: sub_code_17AD+23j
					; sub_code_17AD+2Aj ...
		mov	bl, [bx+1025h]
		mov	si, bx
		mov	bx, ax
		add	bx, 0Ah
		call	sub_code_1799
		test	[bx+si+1016h], ch
		jnz	short loc_code_1812

loc_code_1810:				; CODE XREF: sub_code_17AD+1Aj
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_1812:				; CODE XREF: sub_code_17AD+61j
		mov	ds:57Bh, dl
		add	dl, 32h	; '2'
		mov	ds:57Ch, dl
		and	word ptr ds:579h, 0FFF8h
		mov	byte ptr ds:55Ch, 1
		stc
		retn
sub_code_17AD	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_1830	proc near		; CODE XREF: start+143p
					; sub_code_5CB0+7p
		mov	byte ptr ds:1665h, 0
		mov	byte ptr ds:1673h, 0
		mov	byte ptr ds:1677h, 0
		mov	byte ptr ds:1678h, 0
		mov	word ptr ds:166Ch, 9
		retn
sub_code_1830	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_184B	proc near		; CODE XREF: start+19Ap
		cmp	byte ptr ds:1673h, 0
		jz	short locret_code_185C
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:17ECh
		jnz	short loc_code_185D

locret_code_185C:			; CODE XREF: sub_code_184B+5j
		retn
; ---------------------------------------------------------------------------

loc_code_185D:				; CODE XREF: sub_code_184B+Fj
		mov	ds:17ECh, dx
		cmp	byte ptr ds:1677h, 0
		jz	short loc_code_187F
		mov	ax, ds:1671h
		and	ax, 0FFF8h
		mov	bx, ds:579h
		and	bx, 0FFF8h
		cmp	ax, bx
		jnz	short loc_code_187F
		mov	byte ptr ds:1674h, 0

loc_code_187F:				; CODE XREF: sub_code_184B+1Bj
					; sub_code_184B+2Dj
		inc	byte ptr ds:17E9h
		cmp	word ptr ds:17EAh, 1
		ja	short loc_code_188E
		dec	word ptr ds:17EAh

loc_code_188E:				; CODE XREF: sub_code_184B+3Dj
		mov	ax, ds:1671h
		mov	dx, ds:17EAh
		mov	cl, 3
		shr	dl, cl
		cmp	byte ptr ds:1674h, 1
		jb	short loc_code_18B5
		jnz	short loc_code_18AF
		add	ax, dx
		cmp	ax, 12Fh
		jb	short loc_code_18B5
		mov	ax, 12Eh
		jmp	short loc_code_18B5
; ---------------------------------------------------------------------------
		nop

loc_code_18AF:				; CODE XREF: sub_code_184B+55j
		sub	ax, dx
		jnb	short loc_code_18B5
		sub	ax, ax

loc_code_18B5:				; CODE XREF: sub_code_184B+53j
					; sub_code_184B+5Cj ...
		mov	ds:1671h, ax
		mov	bx, ds:17DFh
		mov	al, ds:17E9h
		shr	al, 1
		add	al, ds:1673h
		mov	dl, al
		sub	al, ds:1676h
		jb	short loc_code_18E1
		sub	bh, al
		jz	short loc_code_18D3
		jnb	short loc_code_18E1

loc_code_18D3:				; CODE XREF: sub_code_184B+84j
		mov	byte ptr ds:1673h, 0
		mov	byte ptr ds:1678h, 0
		call	sub_code_1922

locret_code_18E0:			; CODE XREF: sub_code_184B+B5j
		retn
; ---------------------------------------------------------------------------

loc_code_18E1:				; CODE XREF: sub_code_184B+80j
					; sub_code_184B+86j
		mov	ds:1673h, dl
		mov	cx, ds:1671h
		mov	ds:17E1h, bx
		call	sub_code_2CB0
		mov	ds:17E7h, ax
		cmp	byte ptr ds:17E9h, 2
		jz	short loc_code_18FD
		call	sub_code_1922

loc_code_18FD:				; CODE XREF: sub_code_184B+ADj
		call	sub_code_1B7A
		jb	short locret_code_18E0
		mov	di, ds:17E7h
		mov	ds:17E5h, di
		mov	cx, ds:17E1h
		mov	ds:17E3h, cx
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	si, ds:17DDh
		mov	bp, 17EEh
		call	sub_code_2CCC
		retn
sub_code_184B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1922	proc near		; CODE XREF: sub_code_184B+92p
					; sub_code_184B+AFp ...
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:17E5h
		mov	si, 17EEh
		mov	cx, ds:17E3h
		call	sub_code_2D9D
		retn
sub_code_1922	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1936	proc near		; CODE XREF: start+197p
		dec	byte ptr ds:166Ah
		jz	short loc_code_193D

locret_code_193C:			; CODE XREF: sub_code_1936+Fj
					; sub_code_1936+20j ...
		retn
; ---------------------------------------------------------------------------

loc_code_193D:				; CODE XREF: sub_code_1936+4j
		mov	byte ptr ds:166Ah, 0Dh
		call	sub_code_13D8
		jnz	short locret_code_193C
		cmp	byte ptr ds:1665h, 0
		jz	short loc_code_1951
		call	sub_code_1B05

loc_code_1951:				; CODE XREF: sub_code_1936+16j
		cmp	byte ptr ds:1673h, 0
		jnz	short locret_code_193C
		cmp	byte ptr ds:1665h, 0
		jnz	short loc_code_19CD
		cmp	byte ptr ds:57Bh, 60h ;	'`'
		ja	short locret_code_193C
		mov	byte ptr ds:1677h, 0
		cmp	byte ptr ds:550h, 1
		jnz	short loc_code_198A
		cmp	byte ptr ds:418h, 0
		jnz	short loc_code_198A
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:556h
		cmp	dx, 48h	; 'H'
		jb	short loc_code_198A
		inc	byte ptr ds:1677h

loc_code_198A:				; CODE XREF: sub_code_1936+3Aj
					; sub_code_1936+41j ...
		call	sub_code_2DFD
		cmp	byte ptr ds:1677h, 0
		jz	short loc_code_199A
		and	dl, 3
		jmp	short loc_code_19A2
; ---------------------------------------------------------------------------
		nop

loc_code_199A:				; CODE XREF: sub_code_1936+5Cj
		and	dl, 0Fh
		cmp	dl, 0Ch
		jnb	short locret_code_193C

loc_code_19A2:				; CODE XREF: sub_code_1936+61j
		mov	ds:1669h, dl
		call	sub_code_1AEA
		mov	ds:1666h, cx
		mov	ds:1668h, dl
		call	sub_code_1B05
		jb	short loc_code_198A
		mov	byte ptr ds:1665h, 1Dh
		mov	bx, ds:8
		shl	bl, 1
		mov	ax, [bx+181Eh]
		mov	ds:166Ch, ax
		mov	byte ptr ds:1670h, 1

loc_code_19CD:				; CODE XREF: sub_code_1936+27j
		call	sub_code_1B05
		jb	short locret_code_19E0
		mov	byte ptr ds:1664h, 0
		call	sub_code_1B4C
		jnb	short loc_code_19E1
		inc	byte ptr ds:1664h

locret_code_19E0:			; CODE XREF: sub_code_1936+9Aj
		retn
; ---------------------------------------------------------------------------

loc_code_19E1:				; CODE XREF: sub_code_1936+A4j
		cmp	byte ptr ds:1665h, 10h
		jnz	short loc_code_19F0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:166Eh, dx

loc_code_19F0:				; CODE XREF: sub_code_1936+B0j
		cmp	byte ptr ds:1665h, 0Fh
		jnz	short loc_code_1A76
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:166Eh
		cmp	dx, ds:166Ch
		jnb	short loc_code_1A76
		cmp	byte ptr ds:1670h, 0
		jz	short locret_code_1A75
		cmp	byte ptr ds:1673h, 0
		jnz	short locret_code_1A75
		cmp	byte ptr ds:418h, 0
		jnz	short locret_code_1A75
		dec	byte ptr ds:1670h
		mov	byte ptr ds:1678h, 1
		mov	al, ds:1668h
		mov	ds:1673h, al
		call	sub_code_2DFD
		and	dx, 0Fh
		add	dx, ds:1666h
		mov	ds:1671h, dx
		mov	al, 1
		cmp	dx, ds:579h
		jb	short loc_code_1A42
		mov	al, 0FFh

loc_code_1A42:				; CODE XREF: sub_code_1936+108j
		mov	ds:1674h, al
		call	sub_code_2DFD
		mov	bl, dl
		and	bx, 6
		mov	ax, [bx+17C9h]
		mov	ds:17DDh, ax
		mov	ax, [bx+17D1h]
		mov	ds:17DFh, ax
		shr	bl, 1
		mov	al, [bx+17D9h]
		mov	ds:1676h, al
		mov	word ptr ds:17EAh, 20h ; ' '
		mov	byte ptr ds:17E9h, 1
		mov	byte ptr ds:1675h, 0

locret_code_1A75:			; CODE XREF: sub_code_1936+D4j
					; sub_code_1936+DBj ...
		retn
; ---------------------------------------------------------------------------

loc_code_1A76:				; CODE XREF: sub_code_1936+BFj
					; sub_code_1936+CDj
		dec	byte ptr ds:1665h
		mov	cx, ds:1666h
		mov	dl, ds:1668h
		cmp	byte ptr ds:1665h, 0Eh
		jbe	short loc_code_1A93
		add	dl, ds:1665h
		sub	dl, 0Eh
		jmp	short loc_code_1A9A
; ---------------------------------------------------------------------------
		nop

loc_code_1A93:				; CODE XREF: sub_code_1936+151j
		add	dl, 0Eh
		sub	dl, ds:1665h

loc_code_1A9A:				; CODE XREF: sub_code_1936+15Aj
		mov	ds:166Bh, dl
		call	sub_code_2CB0
		mov	di, ax
		mov	ax, 0B800h
		mov	es, ax
		cld
		mov	cx, 4
		cmp	byte ptr ds:1665h, 0Eh
		jbe	short loc_code_1AD7
		cmp	byte ptr ds:418h, 0
		jz	short loc_code_1AD2
		mov	al, ds:166Bh
		sub	al, ds:1668h
		sub	ah, ah
		mov	cl, 3
		shl	ax, cl
		add	ax, 15E0h
		mov	si, ax
		mov	cx, 4
		rep movsw
		retn
; ---------------------------------------------------------------------------

loc_code_1AD2:				; CODE XREF: sub_code_1936+182j
		sub	ax, ax
		rep stosw
		retn
; ---------------------------------------------------------------------------

loc_code_1AD7:				; CODE XREF: sub_code_1936+17Bj
		mov	al, ds:166Bh
		sub	al, ds:1668h
		mov	ah, 0Ah
		mul	ah
		add	ax, 2681h
		mov	si, ax
		rep movsw
		retn
sub_code_1936	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1AEA	proc near		; CODE XREF: sub_code_1936+70p
		sub	bh, bh
		mov	bl, dl
		and	bl, 3
		shl	bl, 1
		mov	cx, [bx+1658h]
		mov	bl, dl
		shr	bl, 1
		shr	bl, 1
		and	bl, 3
		mov	dl, [bx+1660h]
		retn
sub_code_1AEA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1B05	proc near		; CODE XREF: sub_code_1936+18p
					; sub_code_1936+7Bp ...
		mov	ax, ds:1666h
		mov	dl, ds:1668h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	si, 20h	; ' '
		mov	di, 18h
		mov	cx, 0E0Fh
		call	sub_code_2E29
		jnb	short locret_code_1B4B
		cmp	byte ptr ds:571h, 1
		jnz	short loc_code_1B4A
		cmp	byte ptr ds:55Ah, 0
		jnz	short loc_code_1B4A
		cmp	byte ptr ds:57Bh, 60h ;	'`'
		jnb	short loc_code_1B4A
		cmp	byte ptr ds:1665h, 5
		jb	short loc_code_1B4A
		cmp	byte ptr ds:1665h, 19h
		jnb	short loc_code_1B4A
		mov	byte ptr ds:551h, 1

loc_code_1B4A:				; CODE XREF: sub_code_1B05+22j
					; sub_code_1B05+29j ...
		stc

locret_code_1B4B:			; CODE XREF: sub_code_1B05+1Bj
		retn
sub_code_1B05	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1B4C	proc near		; CODE XREF: sub_code_1936+A1p
		mov	al, ds:1669h
		cmp	al, 8
		jnb	short loc_code_1B78
		mov	bx, 2
		test	al, 4
		jz	short loc_code_1B5C
		shl	bl, 1

loc_code_1B5C:				; CODE XREF: sub_code_1B4C+Cj
		mov	ax, [bx+1F30h]
		add	ax, 10h
		cmp	ax, ds:1666h
		jb	short loc_code_1B78
		sub	ax, 30h	; '0'
		jnb	short loc_code_1B70
		sub	ax, ax

loc_code_1B70:				; CODE XREF: sub_code_1B4C+20j
		cmp	ax, ds:1666h
		ja	short loc_code_1B78
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_1B78:				; CODE XREF: sub_code_1B4C+5j
					; sub_code_1B4C+1Bj ...
		clc
		retn
sub_code_1B4C	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1B7A	proc near		; CODE XREF: sub_code_8E5:loc_code_BACp
					; sub_code_8E5:loc_code_C00p ...
		cmp	word ptr ds:4, 0
		jnz	short loc_code_1BE1
		mov	dl, ds:1673h
		cmp	dl, 0
		jz	short loc_code_1BE1
		mov	cx, ds:17DFh
		xchg	cl, ch
		mov	si, 10h
		mov	ax, ds:1671h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	ch, 0Eh
		call	sub_code_2E29
		jnb	short locret_code_1BE2
		call	sub_code_11E3
		call	sub_code_1922
		call	sub_code_10DD
		cmp	byte ptr ds:1675h, 0
		jnz	short loc_code_1BDF
		mov	byte ptr ds:1675h, 1
		call	sub_code_1166
		mov	dl, 1
		cmp	byte ptr ds:1674h, 0FFh
		jz	short loc_code_1BCB
		mov	dl, 0FFh

loc_code_1BCB:				; CODE XREF: sub_code_1B7A+4Dj
		mov	ds:1674h, dl
		mov	word ptr ds:17EAh, 60h ; '`'
		mov	byte ptr ds:17E9h, 1
		mov	byte ptr ds:55Ch, 0

loc_code_1BDF:				; CODE XREF: sub_code_1B7A+3Cj
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_1BE1:				; CODE XREF: sub_code_1B7A+5j
					; sub_code_1B7A+Ej
		clc

locret_code_1BE2:			; CODE XREF: sub_code_1B7A+2Cj
		retn
sub_code_1B7A	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_1BF0	proc near		; CODE XREF: start+266p start+2B0p ...
		sub	bx, bx
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		cmp	word ptr ds:6, 7
		jnz	short loc_code_1C12
		cmp	byte ptr ds:553h, 0
		jz	short loc_code_1C12
		call	sub_code_528B
		mov	word ptr ds:579h, 98h ;	'�'
		mov	byte ptr ds:57Bh, 5Fh ;	'_'

loc_code_1C12:				; CODE XREF: sub_code_1BF0+Bj
					; sub_code_1BF0+12j
		mov	ax, 0B800h
		mov	es, ax
		cld
		mov	word ptr ds:1839h, 0
		call	sub_code_1C67
		call	sub_code_5B21
		call	sub_code_1D31
		cmp	word ptr ds:4, 0
		jnz	short loc_code_1C49
		cmp	byte ptr ds:553h, 0
		jz	short loc_code_1C46
		cmp	word ptr ds:6, 7
		jnz	short loc_code_1C41
		call	sub_code_5313
		jmp	short loc_code_1C49
; ---------------------------------------------------------------------------

loc_code_1C41:				; CODE XREF: sub_code_1BF0+4Aj
		call	sub_code_38B0
		jmp	short loc_code_1C49
; ---------------------------------------------------------------------------

loc_code_1C46:				; CODE XREF: sub_code_1BF0+43j
		call	sub_code_1D76

loc_code_1C49:				; CODE XREF: sub_code_1BF0+3Cj
					; sub_code_1BF0+4Fj ...
		cmp	word ptr ds:4, 7
		jz	short loc_code_1C5A
		mov	ax, 0AAAAh
		cmp	word ptr ds:4, 2
		jnz	short loc_code_1C5D

loc_code_1C5A:				; CODE XREF: sub_code_1BF0+5Ej
		mov	ax, 5555h

loc_code_1C5D:				; CODE XREF: sub_code_1BF0+68j
		mov	ds:1839h, ax
		call	sub_code_1C67
		call	sub_code_5B21
		retn
sub_code_1BF0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1C67	proc near		; CODE XREF: sub_code_1BF0+2Ep
					; sub_code_1BF0+70p
		call	nullsub_2
		mov	word ptr ds:1835h, 1
		mov	byte ptr ds:1837h, 8
		mov	cx, ds:579h
		mov	dl, ds:57Bh
		add	cx, 0Ch
		and	cx, 0FFF0h
		add	dl, 8
		mov	byte ptr ds:1838h, 0

loc_code_1C8C:				; CODE XREF: sub_code_1C67:loc_code_1D2Ej
		call	sub_code_5897
		mov	ds:1832h, cx
		mov	ds:1834h, dl
		call	sub_code_2CB0
		mov	di, ax
		mov	bl, ds:1837h

loc_code_1CA0:				; CODE XREF: sub_code_1C67+65j
		mov	ax, ds:1839h
		mov	cx, ds:1835h
		shr	cx, 1
		shr	cx, 1
		shr	cx, 1
		rep stosw
		mov	cx, ds:1835h
		shr	cx, 1
		shr	cx, 1
		and	cx, 0FEh
		sub	di, cx
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_1CCA
		add	di, 50h	; 'P'

loc_code_1CCA:				; CODE XREF: sub_code_1C67+5Ej
		dec	bl
		jnz	short loc_code_1CA0
		cmp	byte ptr ds:1838h, 0Fh
		jnz	short loc_code_1CD6
		retn
; ---------------------------------------------------------------------------

loc_code_1CD6:				; CODE XREF: sub_code_1C67+6Cj
		add	word ptr ds:1835h, 20h ; ' '
		add	byte ptr ds:1837h, 10h
		mov	cx, ds:1832h
		mov	dl, ds:1834h
		sub	cx, 10h
		jnb	short loc_code_1CF4
		sub	cx, cx
		or	byte ptr ds:1838h, 1

loc_code_1CF4:				; CODE XREF: sub_code_1C67+84j
		mov	ax, ds:1835h
		add	ax, cx
		cmp	ax, 140h
		jb	short loc_code_1D0B
		mov	ax, 140h
		sub	ax, cx
		mov	ds:1835h, ax
		or	byte ptr ds:1838h, 2

loc_code_1D0B:				; CODE XREF: sub_code_1C67+95j
		sub	dl, 8
		jnb	short loc_code_1D17
		sub	dl, dl
		or	byte ptr ds:1838h, 4

loc_code_1D17:				; CODE XREF: sub_code_1C67+A7j
		mov	al, ds:1837h
		add	al, dl
		jb	short loc_code_1D22
		cmp	al, 0C8h ; '�'
		jb	short loc_code_1D2E

loc_code_1D22:				; CODE XREF: sub_code_1C67+B5j
		mov	al, 0C8h ; '�'
		sub	al, dl
		mov	ds:1837h, al
		or	byte ptr ds:1838h, 8

loc_code_1D2E:				; CODE XREF: sub_code_1C67+B9j
		jmp	loc_code_1C8C
sub_code_1C67	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1D31	proc near		; CODE XREF: start+55p	start+90p ...
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_1D48
		mov	ah, 0Bh
		mov	bh, 1
		mov	si, ds:4
		mov	bl, [si+1853h]
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		jmp	short loc_code_1D67
; ---------------------------------------------------------------------------

loc_code_1D48:				; CODE XREF: sub_code_1D31+5j
		mov	si, ds:4
		mov	bl, 1
		mov	bh, [si+183Bh]
		call	sub_code_1D6E
		mov	bl, 2
		mov	bh, [si+1843h]
		call	sub_code_1D6E
		mov	bl, 3
		mov	bh, [si+184Bh]
		call	sub_code_1D6E

loc_code_1D67:				; CODE XREF: sub_code_1D31+15j
		mov	ah, 0Bh
		sub	bx, bx
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		retn
sub_code_1D31	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1D6E	proc near		; CODE XREF: sub_code_1D31+21p
					; sub_code_1D31+2Ap ...
		mov	ax, 1000h
		push	si
		int	10h		; - VIDEO - SET	PALETTE	REGISTER (Jr, PS, TANDY	1000, EGA, VGA)
					; BL = palette register	to set
					; BH = color value to store
		pop	si
		retn
sub_code_1D6E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1D76	proc near		; CODE XREF: sub_code_1BF0:loc_code_1C46p
		cmp	word ptr ds:6, 7
		jnz	short loc_code_1D81
		call	sub_code_6040
		retn
; ---------------------------------------------------------------------------

loc_code_1D81:				; CODE XREF: sub_code_1D76+5j
		call	sub_code_57D5
		mov	ax, 185Bh
		cmp	byte ptr ds:552h, 0
		jz	short loc_code_1DC6
		mov	bx, ds:1C30h
		add	word ptr ds:1C30h, 2
		and	bx, 6
		mov	ax, [bx+1C26h]
		cmp	byte ptr ds:1F80h, 0
		jz	short loc_code_1DAA
		dec	byte ptr ds:1F80h

loc_code_1DAA:				; CODE XREF: sub_code_1D76+2Ej
		cmp	byte ptr ds:552h, 0DDh ; '�'
		jnz	short loc_code_1DC6
		cmp	word ptr ds:8, 0
		jz	short loc_code_1DC6
		cmp	byte ptr ds:1F80h, 1
		jb	short loc_code_1DC6
		call	sub_code_5BE0
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_1DC6:				; CODE XREF: sub_code_1D76+16j
					; sub_code_1D76+39j ...
		mov	ds:1C2Eh, ax
		mov	word ptr ds:1C1Bh, 8080h
		mov	byte ptr ds:1C1Dh, 1Ch

loc_code_1DD4:				; CODE XREF: sub_code_1D76+9Bj
		call	sub_code_1E17
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:1830h, dx

loc_code_1DDF:				; CODE XREF: sub_code_1D76+74j
		call	sub_code_57E4
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:1830h
		jz	short loc_code_1DDF
		cmp	byte ptr ds:1C1Dh, 14h
		ja	short loc_code_1E02
		sub	bh, bh
		mov	bl, ds:1C1Dh
		and	bl, 6
		mov	ax, [bx+1C1Eh]
		jmp	short loc_code_1E0A
; ---------------------------------------------------------------------------

loc_code_1E02:				; CODE XREF: sub_code_1D76+7Bj
		mov	ax, ds:1C1Bh
		stc
		rcr	al, 1
		mov	ah, al

loc_code_1E0A:				; CODE XREF: sub_code_1D76+8Aj
		mov	ds:1C1Bh, ax
		dec	byte ptr ds:1C1Dh
		jnz	short loc_code_1DD4
		call	sub_code_5B21
		retn
sub_code_1D76	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1E17	proc near		; CODE XREF: sub_code_1D76:loc_code_1DD4p
		cld
		push	ds
		pop	es
		assume es:nothing
		mov	si, ds:1C2Eh
		mov	di, 0Eh
		mov	cx, 60h	; '`'

loc_code_1E24:				; CODE XREF: sub_code_1E17+13j
		lodsw
		and	ax, ds:1C1Bh
		stosw
		loop	loc_code_1E24
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	si, 0Eh
		mov	di, 0ED0h
		mov	cx, 0C08h
		call	sub_code_2D9D
		retn
sub_code_1E17	endp

; ---------------------------------------------------------------------------
		align 4

; =============== S U B	R O U T	I N E =======================================


sub_code_1E40	proc near		; CODE XREF: start:loc_code_140p
					; start+26Fp ...
		mov	byte ptr ds:1CBFh, 0
		mov	word ptr ds:1CE1h, 0
		mov	byte ptr ds:1CC0h, 0
		mov	byte ptr ds:1CC1h, 0
		mov	byte ptr ds:1CB8h, 0
		mov	byte ptr ds:1CC8h, 0B1h	; '�'
		call	sub_code_5450
		retn
sub_code_1E40	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_1E63	proc near		; CODE XREF: start+17Cp start+2DEp ...
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	cx, dx
		sub	dx, ds:1CC9h
		mov	ax, ds:1CE1h
		and	ax, 1
		add	ax, 1
		cmp	dx, ax
		jnb	short loc_code_1E7B

locret_code_1E7A:			; CODE XREF: sub_code_1E63+1Bj
		retn
; ---------------------------------------------------------------------------

loc_code_1E7B:				; CODE XREF: sub_code_1E63+15j
		call	sub_code_13D8
		jz	short locret_code_1E7A
		mov	ds:1CC9h, cx
		inc	word ptr ds:1CE1h
		cmp	byte ptr ds:1CC1h, 0
		jz	short loc_code_1EE2
		dec	byte ptr ds:1CC1h
		jnz	short loc_code_1EC9
		call	sub_code_5B21
		cmp	byte ptr ds:1CB8h, 0
		jz	short loc_code_1EC2
		cmp	word ptr ds:4, 0
		jz	short loc_code_1EB7
		mov	byte ptr ds:552h, 0DDh ; '�'
		mov	word ptr ds:579h, 0A0h ; '�'
		mov	byte ptr ds:57Bh, 60h ;	'`'
		retn
; ---------------------------------------------------------------------------

loc_code_1EB7:				; CODE XREF: sub_code_1E63+41j
		cmp	byte ptr ds:1F80h, 0
		jz	short loc_code_1EC2
		dec	byte ptr ds:1F80h

loc_code_1EC2:				; CODE XREF: sub_code_1E63+3Aj
					; sub_code_1E63+59j
		call	sub_code_20E1
		call	sub_code_1E40
		retn
; ---------------------------------------------------------------------------

loc_code_1EC9:				; CODE XREF: sub_code_1E63+30j
		call	sub_code_2022
		mov	ax, 104h
		sub	al, ds:1CC1h
		cmp	byte ptr ds:1CD0h, 0FFh
		jz	short loc_code_1EDC
		mov	ah, 0FFh

loc_code_1EDC:				; CODE XREF: sub_code_1E63+75j
		call	sub_code_2059
		jmp	loc_code_1FFB
; ---------------------------------------------------------------------------

loc_code_1EE2:				; CODE XREF: sub_code_1E63+2Aj
		cmp	byte ptr ds:1CB8h, 0
		jz	short loc_code_1F0C
		mov	dl, ds:1CB8h
		cmp	word ptr ds:1CB9h, 0
		jz	short loc_code_1F02
		dec	word ptr ds:1CB9h
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_1F02
		mov	dl, 0FFh

loc_code_1F02:				; CODE XREF: sub_code_1E63+8Fj
					; sub_code_1E63+9Bj
		mov	ds:1CD0h, dl
		mov	ax, ds:1CC6h
		jmp	loc_code_1FAB
; ---------------------------------------------------------------------------

loc_code_1F0C:				; CODE XREF: sub_code_1E63+84j
		cmp	byte ptr ds:1CBFh, 0
		jnz	short loc_code_1F75
		cmp	byte ptr ds:1CC0h, 0
		jnz	short loc_code_1F57
		cmp	byte ptr ds:1D58h, 0
		jnz	short loc_code_1F3D
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jb	short locret_code_1F3C
		cmp	byte ptr ds:558h, 0
		jnz	short locret_code_1F3C
		call	sub_code_2DFD
		mov	bx, ds:8
		cmp	dl, [bx+1CD1h]
		jb	short loc_code_1F3D

locret_code_1F3C:			; CODE XREF: sub_code_1E63+C3j
					; sub_code_1E63+CAj
		retn
; ---------------------------------------------------------------------------

loc_code_1F3D:				; CODE XREF: sub_code_1E63+BCj
					; sub_code_1E63+D7j
		mov	al, 1
		mov	word ptr ds:59BAh, 0
		cmp	word ptr ds:579h, 0A0h ; '�'
		jnb	short loc_code_1F4F
		mov	al, 0FFh

loc_code_1F4F:				; CODE XREF: sub_code_1E63+E8j
		mov	ds:1CD0h, al
		mov	byte ptr ds:1CC0h, 4

loc_code_1F57:				; CODE XREF: sub_code_1E63+B5j
		dec	byte ptr ds:1CC0h
		jnz	short loc_code_1F65
		mov	byte ptr ds:1CBFh, 1
		jmp	short loc_code_1F75
; ---------------------------------------------------------------------------
		nop

loc_code_1F65:				; CODE XREF: sub_code_1E63+F8j
		call	sub_code_2022
		mov	al, ds:1CC0h
		mov	ah, ds:1CD0h
		call	sub_code_2059
		jmp	loc_code_1FFB
; ---------------------------------------------------------------------------

loc_code_1F75:				; CODE XREF: sub_code_1E63+AEj
					; sub_code_1E63+FFj
		mov	byte ptr ds:1D58h, 0
		mov	ax, ds:1CC6h
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jb	short loc_code_1FAB
		cmp	byte ptr ds:558h, 0
		jnz	short loc_code_1FAB
		call	sub_code_2DFD
		mov	bx, ds:8
		cmp	dl, [bx+1CD9h]
		ja	short loc_code_1FAB
		cmp	ax, ds:579h
		ja	short loc_code_1FA6
		mov	byte ptr ds:1CD0h, 1
		jmp	short loc_code_1FAB
; ---------------------------------------------------------------------------
		nop

loc_code_1FA6:				; CODE XREF: sub_code_1E63+139j
		mov	byte ptr ds:1CD0h, 0FFh

loc_code_1FAB:				; CODE XREF: sub_code_1E63+A6j
					; sub_code_1E63+11Fj ...
		cmp	byte ptr ds:1CD0h, 1
		jb	short loc_code_1FEF
		jz	short loc_code_1FE2
		sub	ax, 8
		jnb	short loc_code_1FEF
		sub	ax, ax

loc_code_1FBB:				; CODE XREF: sub_code_1E63+18Aj
		cmp	byte ptr ds:1CB8h, 0
		jz	short loc_code_1FCC
		cmp	word ptr ds:1CB9h, 0
		jnz	short loc_code_1FEF
		jmp	short loc_code_1FDA
; ---------------------------------------------------------------------------
		nop

loc_code_1FCC:				; CODE XREF: sub_code_1E63+15Dj
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jb	short loc_code_1FDA
		cmp	byte ptr ds:558h, 0
		jz	short loc_code_1FEF

loc_code_1FDA:				; CODE XREF: sub_code_1E63+166j
					; sub_code_1E63+16Ej
		mov	byte ptr ds:1CC1h, 4
		jmp	short loc_code_1FEF
; ---------------------------------------------------------------------------
		nop

loc_code_1FE2:				; CODE XREF: sub_code_1E63+14Fj
		add	ax, 8
		cmp	ax, 11Eh
		jb	short loc_code_1FEF
		mov	ax, 11Eh
		jmp	short loc_code_1FBB
; ---------------------------------------------------------------------------

loc_code_1FEF:				; CODE XREF: sub_code_1E63+14Dj
					; sub_code_1E63+154j ...
		mov	ds:1CC6h, ax
		call	sub_code_2022
		mov	word ptr ds:1CC4h, 0F04h

loc_code_1FFB:				; CODE XREF: sub_code_1E63+7Cj
					; sub_code_1E63+10Fj
		mov	cx, ds:1CC6h
		mov	dl, ds:1CC8h
		call	sub_code_2CB0
		mov	ds:1CCDh, ax
		cmp	byte ptr ds:1CC0h, 3
		jz	short loc_code_2013
		call	sub_code_20E1

loc_code_2013:				; CODE XREF: sub_code_1E63+1ABj
		call	sub_code_20F5
		jb	short locret_code_2021
		mov	ax, ds:1CCDh
		mov	ds:1CBDh, ax
		call	sub_code_209B

locret_code_2021:			; CODE XREF: sub_code_1E63+1B3j
		retn
sub_code_1E63	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2022	proc near		; CODE XREF: sub_code_1E63:loc_code_1EC9p
					; sub_code_1E63:loc_code_1F65p	...
		sub	bh, bh
		cmp	byte ptr ds:1CB8h, 0
		jz	short loc_code_203B
		inc	byte ptr ds:1CCFh
		mov	bl, ds:1CCFh
		and	bl, 6
		or	bl, 8
		jnz	short loc_code_2051

loc_code_203B:				; CODE XREF: sub_code_2022+7j
		add	byte ptr ds:1CCFh, 2
		mov	bl, ds:1CCFh
		and	bl, 2
		cmp	byte ptr ds:1CD0h, 1
		jnz	short loc_code_2051
		or	bl, 4

loc_code_2051:				; CODE XREF: sub_code_2022+17j
					; sub_code_2022+2Aj
		mov	ax, [bx+15C8h]
		mov	ds:1CBBh, ax
		retn
sub_code_2022	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2059	proc near		; CODE XREF: sub_code_1E63:loc_code_1EDCp
					; sub_code_1E63+10Cp
		mov	cx, 0F04h
		sub	cl, al
		mov	ds:1CC4h, cx
		cmp	ah, 0FFh
		jz	short loc_code_2078
		sub	ah, ah
		shl	al, 1
		add	ds:1CBBh, ax
		mov	word ptr ds:1CC6h, 0
		jmp	short loc_code_2086
; ---------------------------------------------------------------------------
		nop

loc_code_2078:				; CODE XREF: sub_code_2059+Cj
		sub	ah, ah
		shl	al, 1
		shl	al, 1
		shl	al, 1
		add	ax, 120h
		mov	ds:1CC6h, ax

loc_code_2086:				; CODE XREF: sub_code_2059+1Cj
		push	ds
		pop	es
		assume es:nothing
		mov	si, ds:1CBBh
		mov	di, 0Eh
		mov	al, 4
		call	sub_code_2D70
		mov	word ptr ds:1CBBh, 0Eh
		retn
sub_code_2059	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_209B	proc near		; CODE XREF: sub_code_1E63+1BBp
					; sub_code_2136+80p
		mov	cx, ds:1CC4h
		mov	ds:1CC2h, cx
		mov	ax, 0B800h
		cmp	byte ptr ds:1CB8h, 0
		jnz	short loc_code_20BE
		mov	es, ax
		assume es:nothing
		mov	di, ds:1CBDh
		mov	si, ds:1CBBh
		mov	bp, 1C40h
		call	sub_code_2CCC
		retn
; ---------------------------------------------------------------------------

loc_code_20BE:				; CODE XREF: sub_code_209B+10j
		push	ds
		mov	ds, ax
		assume ds:nothing
		pop	es
		assume es:nothing
		push	es
		push	ds
		mov	si, es:1CBDh
		mov	di, 1C40h
		call	sub_code_2DCA
		pop	es
		pop	ds
		mov	si, ds:1CBBh
		mov	di, ds:1CBDh
		mov	cx, ds:1CC4h
		call	sub_code_2D9D
		retn
sub_code_209B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_20E1	proc near		; CODE XREF: sub_code_1E63:loc_code_1EC2p
					; sub_code_1E63+1ADp ...
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	di, ds:1CBDh
		mov	si, 1C40h
		mov	cx, ds:1CC2h
		call	sub_code_2D9D
		retn
sub_code_20E1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_20F5	proc near		; CODE XREF: sub_code_8E5+320p
					; sub_code_8E5+360p ...
		cmp	byte ptr ds:1CB8h, 0
		jnz	short loc_code_2134
		mov	al, ds:1CBFh
		or	al, ds:1CC0h
		or	al, ds:1CC1h
		jz	short loc_code_2134
		cmp	byte ptr ds:57Bh, 0A3h ; '�'
		jb	short loc_code_2134
		cmp	byte ptr ds:558h, 0
		jnz	short loc_code_2134
		mov	ax, ds:1CC6h
		add	ax, 20h	; ' '
		cmp	ax, ds:579h
		jb	short loc_code_2134
		sub	ax, 38h	; '8'
		jnb	short loc_code_212A
		sub	ax, ax

loc_code_212A:				; CODE XREF: sub_code_20F5+31j
		cmp	ax, ds:579h
		ja	short loc_code_2134
		call	sub_code_2136
		retn
; ---------------------------------------------------------------------------

loc_code_2134:				; CODE XREF: sub_code_20F5+5j
					; sub_code_20F5+12j ...
		clc
		retn
sub_code_20F5	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2136	proc near		; CODE XREF: sub_code_20F5+3Bp
					; sub_code_47D6+72p
		cmp	word ptr ds:4, 6
		jnz	short loc_code_2149
		mov	al, ds:57Bh
		mov	ds:1CC8h, al
		mov	ax, ds:579h
		mov	ds:1CC6h, ax

loc_code_2149:				; CODE XREF: sub_code_2136+5j
		mov	ax, ds:1CC6h
		add	ax, ds:579h
		shr	ax, 1
		cmp	ax, 118h
		jb	short loc_code_215A
		mov	ax, 117h

loc_code_215A:				; CODE XREF: sub_code_2136+1Fj
		mov	ds:1CC6h, ax
		mov	bl, 1
		cmp	ax, 0A0h ; '�'
		ja	short loc_code_216E
		mov	bl, 0FFh
		mov	dx, 0A1h ; '�'
		sub	dx, ax
		jmp	short loc_code_2173
; ---------------------------------------------------------------------------
		nop

loc_code_216E:				; CODE XREF: sub_code_2136+2Cj
		sub	ax, 9Fh	; '�'
		mov	dx, ax

loc_code_2173:				; CODE XREF: sub_code_2136+35j
		mov	ds:1CB8h, bl
		mov	byte ptr ds:1CBFh, 1
		mov	byte ptr ds:1CC1h, 0
		mov	cl, 3
		shr	dx, cl
		mov	ds:1CB9h, dx
		cmp	word ptr ds:4, 6
		jnz	short loc_code_21BD
		call	sub_code_11E3
		mov	al, ds:1CB8h
		push	ax
		mov	byte ptr ds:1CB8h, 0
		mov	word ptr ds:1CC4h, 0F04h
		mov	ax, ds:15C8h
		mov	ds:1CBBh, ax
		mov	cx, ds:1CC6h
		mov	dl, ds:1CC8h
		call	sub_code_2CB0
		mov	ds:1CBDh, ax
		call	sub_code_209B
		pop	ax
		mov	ds:1CB8h, al

loc_code_21BD:				; CODE XREF: sub_code_2136+58j
		call	sub_code_20E1
		call	sub_code_11E3
		mov	ax, 0
		cmp	word ptr ds:579h, 0A0h ; '�'
		jnb	short loc_code_21D1
		mov	ax, 122h

loc_code_21D1:				; CODE XREF: sub_code_2136+96j
		mov	ds:579h, ax
		cmp	word ptr ds:4, 0
		jnz	short loc_code_21DE
		call	sub_code_70D

loc_code_21DE:				; CODE XREF: sub_code_2136+A3j
		stc
		retn
sub_code_2136	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_21E0	proc near		; CODE XREF: sub_code_3150+22p
					; sub_code_3150:loc_code_3328p
		mov	al, ds:1CBFh
		or	al, ds:1CC0h
		or	al, ds:1CC1h
		jz	short loc_code_2209
		mov	ax, ds:327Dh
		mov	dl, ds:327Fh
		mov	si, 10h
		mov	bx, ds:1CC6h
		mov	dh, ds:1CC8h
		mov	di, 20h	; ' '
		mov	cx, 0F1Eh
		call	sub_code_2E29
		retn
; ---------------------------------------------------------------------------

loc_code_2209:				; CODE XREF: sub_code_21E0+Bj
		clc
		retn
sub_code_21E0	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_2210	proc near		; CODE XREF: start+146p
		mov	byte ptr ds:1D59h, 0
		retn
sub_code_2210	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2216	proc near		; CODE XREF: start+19Dp
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:1D5Ah
		jnz	short loc_code_2221

locret_code_2220:			; CODE XREF: sub_code_2216+10j
					; sub_code_2216+19j ...
		retn
; ---------------------------------------------------------------------------

loc_code_2221:				; CODE XREF: sub_code_2216+8j
		mov	cx, dx
		call	sub_code_13D8
		jz	short locret_code_2220
		mov	ds:1D5Ah, cx
		call	sub_code_22F7
		jb	short locret_code_2220
		cmp	byte ptr ds:1D59h, 0
		jnz	short loc_code_226D
		cmp	byte ptr ds:57Bh, 86h ;	'�'
		jz	short loc_code_224E
		cmp	byte ptr ds:57Bh, 8Eh ;	'�'
		jz	short loc_code_224E
		call	sub_code_2DFD
		cmp	dl, 5
		ja	short locret_code_2220

loc_code_224E:				; CODE XREF: sub_code_2216+27j
					; sub_code_2216+2Ej
		call	sub_code_15D0
		add	dl, 3
		mov	ds:1D5Eh, dl
		call	sub_code_2DFD
		and	dx, 7
		add	cx, dx
		add	cx, 6
		mov	ds:1D5Ch, cx
		mov	byte ptr ds:1D59h, 1Bh

loc_code_226D:				; CODE XREF: sub_code_2216+20j
		dec	byte ptr ds:1D59h
		mov	cx, ds:1D5Ch
		mov	dl, ds:1D5Eh
		cmp	byte ptr ds:1D59h, 0Dh
		jbe	short loc_code_2291
		add	dl, ds:1D59h
		sub	dl, 0Fh
		mov	bx, 1B02h
		sub	bh, ds:1D59h
		jmp	short loc_code_229F
; ---------------------------------------------------------------------------
		nop

loc_code_2291:				; CODE XREF: sub_code_2216+68j
		add	dl, 0Ch
		sub	dl, ds:1D59h
		mov	bx, 2
		add	bh, ds:1D59h

loc_code_229F:				; CODE XREF: sub_code_2216+78j
		mov	ds:1D64h, bx
		mov	ds:1D5Fh, dl
		call	sub_code_2CB0
		mov	ds:1D62h, ax
		call	sub_code_22DC
		call	sub_code_22F7
		jb	short locret_code_22BC
		cmp	byte ptr ds:1D59h, 0
		jnz	short loc_code_22BD

locret_code_22BC:			; CODE XREF: sub_code_2216+9Dj
		retn
; ---------------------------------------------------------------------------

loc_code_22BD:				; CODE XREF: sub_code_2216+A4j
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:1D62h
		mov	si, 1CF0h
		mov	ds:1D60h, di
		mov	cx, ds:1D64h
		mov	ds:1D66h, cx
		mov	bp, 1D24h
		call	sub_code_2CCC
		retn
sub_code_2216	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_22DC	proc near		; CODE XREF: sub_code_2216+97p
		cmp	byte ptr ds:1D59h, 1Ah
		jz	short locret_code_22F6
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:1D60h
		mov	si, 1D24h
		mov	cx, ds:1D66h
		call	sub_code_2D9D

locret_code_22F6:			; CODE XREF: sub_code_22DC+5j
		retn
sub_code_22DC	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_22F7	proc near		; CODE XREF: sub_code_8E5+565p
					; sub_code_2216+16p ...
		cmp	byte ptr ds:1D59h, 0
		jnz	short loc_code_2300
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_2300:				; CODE XREF: sub_code_22F7+5j
		mov	cx, ds:1D64h
		xchg	ch, cl
		mov	ax, ds:1D5Ch
		mov	dl, ds:1D5Fh
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	ch, 0Eh
		call	sub_code_2E29
		jnb	short locret_code_2327
		mov	byte ptr ds:1D58h, 1

locret_code_2327:			; CODE XREF: sub_code_22F7+29j
		retn
sub_code_22F7	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_2330	proc near		; CODE XREF: start+149p
					; sub_code_5CB0+Ap
		mov	word ptr ds:1F6Ch, 0
		sub	ax, ax
		mov	dl, 1
		cmp	word ptr ds:579h, 0A0h ; '�'
		ja	short loc_code_2347
		mov	ax, 12Ch
		mov	dl, 0FFh

loc_code_2347:				; CODE XREF: sub_code_2330+10j
		mov	ds:1F30h, ax
		mov	ds:1F32h, ax
		mov	ds:1F34h, ax
		mov	ds:1F3Ch, dl
		mov	ds:1F3Dh, dl
		mov	ds:1F3Eh, dl
		mov	byte ptr ds:1F48h, 1
		mov	byte ptr ds:1F49h, 1
		mov	byte ptr ds:1F4Ah, 1
		mov	byte ptr ds:1F50h, 0
		mov	byte ptr ds:1F51h, 0
		mov	byte ptr ds:1F52h, 0
		retn
sub_code_2330	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_237B	proc near		; CODE XREF: start+1A0p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:1F65h
		jnz	short loc_code_2386

locret_code_2385:			; CODE XREF: sub_code_237B+14j
					; sub_code_237B+2Aj ...
		retn
; ---------------------------------------------------------------------------

loc_code_2386:				; CODE XREF: sub_code_237B+8j
		mov	ds:1F65h, dx
		cmp	byte ptr ds:55Ah, 0
		jnz	short locret_code_2385
		mov	bx, ds:1F6Ch
		inc	bx
		cmp	bx, 3
		jb	short loc_code_239E
		mov	bx, 0

loc_code_239E:				; CODE XREF: sub_code_237B+1Ej
		mov	ds:1F6Ch, bx
		call	sub_code_265E
		jb	short locret_code_2385
		call	sub_code_2567
		jb	short locret_code_2385
		mov	bx, ds:1F6Ch
		cmp	byte ptr [bx+1F50h], 0
		jz	short loc_code_23EB
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	bx, ds:1F6Ch
		shl	bl, 1
		sub	dx, [bx+1F53h]
		cmp	dx, 36h	; '6'
		jb	short locret_code_2385
		mov	dl, 1
		mov	ax, 0
		cmp	word ptr ds:579h, 0A0h ; '�'
		ja	short loc_code_23DC
		mov	ax, 12Ch
		mov	dl, 0FFh

loc_code_23DC:				; CODE XREF: sub_code_237B+5Aj
		mov	[bx+1F30h], ax
		shr	bl, 1
		mov	byte ptr [bx+1F50h], 0
		mov	[bx+1F3Ch], dl

loc_code_23EB:				; CODE XREF: sub_code_237B+3Aj
		mov	dl, [bx+1F3Ch]
		mov	[bx+1F3Fh], dl
		cmp	byte ptr ds:1664h, 0
		jz	short loc_code_2403
		mov	word ptr ds:1F69h, 0Ch
		jmp	short loc_code_2418
; ---------------------------------------------------------------------------
		nop

loc_code_2403:				; CODE XREF: sub_code_237B+7Dj
		mov	ax, 8
		cmp	byte ptr ds:57Bh, 60h ;	'`'
		jbe	short loc_code_240F
		shr	al, 1

loc_code_240F:				; CODE XREF: sub_code_237B+90j
		mov	ds:1F69h, ax
		cmp	bx, ds:52Fh
		jnz	short loc_code_2425

loc_code_2418:				; CODE XREF: sub_code_237B+85j
		cmp	byte ptr [bx+1F3Ch], 0
		jnz	short loc_code_2425
		call	sub_code_2DFD
		jmp	short loc_code_248A
; ---------------------------------------------------------------------------
		nop

loc_code_2425:				; CODE XREF: sub_code_237B+9Bj
					; sub_code_237B+A2j
		cmp	byte ptr ds:55Ch, 0
		jz	short loc_code_2466
		mov	al, [bx+1F36h]
		cmp	al, ds:57Bh
		ja	short loc_code_2466
		add	al, 10h
		cmp	al, ds:57Bh
		jb	short loc_code_2466
		call	sub_code_2DFD
		mov	si, ds:8
		cmp	dl, [si+1F6Eh]
		ja	short loc_code_2466
		mov	word ptr ds:1F69h, 0Ch
		mov	al, 1
		shl	bl, 1
		mov	cx, [bx+1F30h]
		shr	bl, 1
		cmp	cx, ds:579h
		jb	short loc_code_2463
		mov	al, 0FFh

loc_code_2463:				; CODE XREF: sub_code_237B+E4j
		jmp	short loc_code_2492
; ---------------------------------------------------------------------------
		nop

loc_code_2466:				; CODE XREF: sub_code_237B+AFj
					; sub_code_237B+B9j ...
		mov	cl, 18h
		cmp	byte ptr ds:57Bh, 60h ;	'`'
		jbe	short loc_code_247A
		mov	cl, 28h	; '('
		cmp	byte ptr [bx+1F3Ch], 0
		jnz	short loc_code_247A
		mov	cl, 10h

loc_code_247A:				; CODE XREF: sub_code_237B+F2j
					; sub_code_237B+FBj
		call	sub_code_2DFD
		cmp	dl, cl
		ja	short loc_code_2496
		mov	al, 0
		cmp	byte ptr [bx+1F3Ch], 0
		jnz	short loc_code_2492

loc_code_248A:				; CODE XREF: sub_code_237B+A7j
		mov	al, dl
		and	al, 1
		jnz	short loc_code_2492
		mov	al, 0FFh

loc_code_2492:				; CODE XREF: sub_code_237B:loc_code_2463j
					; sub_code_237B+10Dj ...
		mov	[bx+1F3Ch], al

loc_code_2496:				; CODE XREF: sub_code_237B+104j
		mov	dl, [bx+1F3Ch]
		shl	bl, 1
		mov	ax, [bx+1F30h]
		cmp	dl, 1
		jb	short loc_code_24C2
		jnz	short loc_code_24B8
		add	ax, ds:1F69h
		cmp	ax, 12Fh
		jb	short loc_code_24C2
		mov	ax, 12Eh
		mov	dl, 0FFh
		jmp	short loc_code_24C2
; ---------------------------------------------------------------------------
		nop

loc_code_24B8:				; CODE XREF: sub_code_237B+12Aj
		sub	ax, ds:1F69h
		jnb	short loc_code_24C2
		sub	ax, ax
		mov	dl, 1

loc_code_24C2:				; CODE XREF: sub_code_237B+128j
					; sub_code_237B+133j ...
		mov	[bx+1F30h], ax
		shr	bl, 1
		mov	[bx+1F3Ch], dl
		mov	dl, [bx+1F36h]
		mov	cx, ax
		call	sub_code_2CB0
		mov	ds:1F4Bh, ax
		mov	bx, ds:1F6Ch
		cmp	byte ptr [bx+1F48h], 0
		jnz	short loc_code_24F0
		mov	al, [bx+1F3Ch]
		or	al, [bx+1F3Fh]
		jz	short loc_code_24F0
		call	sub_code_254D

loc_code_24F0:				; CODE XREF: sub_code_237B+166j
					; sub_code_237B+170j
		call	sub_code_265E
		jb	short locret_code_24FA
		call	sub_code_2567
		jnb	short loc_code_24FB

locret_code_24FA:			; CODE XREF: sub_code_237B+178j
		retn
; ---------------------------------------------------------------------------

loc_code_24FB:				; CODE XREF: sub_code_237B+17Dj
		mov	bx, ds:1F6Ch
		mov	byte ptr [bx+1F48h], 0
		cmp	byte ptr [bx+1F3Ch], 0
		jnz	short loc_code_2518
		cmp	byte ptr [bx+1F3Fh], 0
		jz	short locret_code_254C
		mov	si, 1E30h
		jmp	short loc_code_2533
; ---------------------------------------------------------------------------
		nop

loc_code_2518:				; CODE XREF: sub_code_237B+18Ej
		mov	si, 1E50h
		inc	byte ptr [bx+1F4Dh]
		test	byte ptr [bx+1F4Dh], 1
		jnz	short loc_code_2529
		add	si, 20h	; ' '

loc_code_2529:				; CODE XREF: sub_code_237B+1A9j
		cmp	byte ptr [bx+1F3Ch], 1
		jz	short loc_code_2533
		add	si, 40h	; '@'

loc_code_2533:				; CODE XREF: sub_code_237B+19Aj
					; sub_code_237B+1B3j
		shl	bl, 1
		mov	di, ds:1F4Bh
		mov	[bx+1F42h], di
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, [bx+1F59h]
		mov	cx, 802h
		call	sub_code_2D35

locret_code_254C:			; CODE XREF: sub_code_237B+195j
		retn
sub_code_237B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_254D	proc near		; CODE XREF: sub_code_237B+172p
		mov	bx, ds:1F6Ch
		shl	bl, 1
		mov	ax, 0B800h
		mov	es, ax
		mov	di, [bx+1F42h]
		mov	si, [bx+1F59h]
		mov	cx, 802h
		call	sub_code_2D9D
		retn
sub_code_254D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2567	proc near		; CODE XREF: sub_code_237B+2Cp
					; sub_code_237B+17Ap
		mov	bx, ds:1F6Ch
		mov	dl, [bx+1F36h]
		shl	bl, 1
		mov	ax, [bx+1F30h]
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E08h
		call	sub_code_2E29
		jb	short loc_code_258E
		jmp	locret_code_265D
; ---------------------------------------------------------------------------

loc_code_258E:				; CODE XREF: sub_code_2567+22j
		mov	bx, ds:1F6Ch
		cmp	byte ptr [bx+1F50h], 0
		jnz	short loc_code_260C
		cmp	byte ptr ds:57Ch, 26h ;	'&'
		jb	short loc_code_260C
		cmp	byte ptr ds:55Ch, 0
		jz	short loc_code_260E
		mov	byte ptr ds:55Ch, 0
		mov	byte ptr ds:55Bh, 11h
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:56Eh, 0
		mov	bx, ds:1F6Ch
		shl	bl, 1
		mov	di, [bx+1F42h]
		cmp	word ptr [bx+1F30h], 10h
		jb	short loc_code_25CF
		sub	di, 4

loc_code_25CF:				; CODE XREF: sub_code_2567+63j
		mov	ds:1F67h, di
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 1D70h
		mov	bp, 0Eh
		mov	cx, 806h
		call	sub_code_2CCC
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:1F65h, dx

loc_code_25EC:				; CODE XREF: sub_code_2567+93j
		call	sub_code_5A90
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:1F65h
		cmp	dx, 8
		jb	short loc_code_25EC
		call	sub_code_5B21
		mov	di, ds:1F67h
		mov	si, 0Eh
		mov	cx, 806h
		call	sub_code_2D9D

loc_code_260C:				; CODE XREF: sub_code_2567+30j
					; sub_code_2567+37j
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_260E:				; CODE XREF: sub_code_2567+3Ej
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	bx, ds:1F6Ch
		mov	byte ptr [bx+1F50h], 1
		mov	byte ptr [bx+1F3Ch], 1
		shl	bl, 1
		mov	[bx+1F53h], dx
		call	sub_code_11E3
		mov	bx, ds:1F6Ch
		shl	bl, 1
		mov	si, [bx+1F5Fh]
		mov	di, [bx+1F42h]
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, 0Eh
		mov	cx, 802h
		call	sub_code_2CCC
		call	sub_code_1124
		mov	bx, ds:1F6Ch
		mov	al, [bx+1F39h]
		call	sub_code_2706
		mov	ax, 3E8h
		mov	bx, 2EEh
		call	sub_code_593B
		stc

locret_code_265D:			; CODE XREF: sub_code_2567+24j
		retn
sub_code_2567	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_265E	proc near		; CODE XREF: sub_code_237B+27p
					; sub_code_237B:loc_code_24F0p
		cmp	byte ptr ds:1673h, 0
		jnz	short loc_code_2667
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_2667:				; CODE XREF: sub_code_265E+5j
		mov	bx, ds:1F6Ch
		mov	dl, [bx+1F36h]
		shl	bl, 1
		mov	ax, [bx+1F30h]
		mov	si, 10h
		mov	di, si
		mov	bx, ds:1671h
		mov	dh, ds:1673h
		mov	cx, 0C08h
		call	sub_code_2E29
		retn
sub_code_265E	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_2690	proc near		; CODE XREF: start:loc_code_81p
		push	ds
		pop	es
		assume es:nothing
		mov	cx, 7
		mov	si, 1F82h

loc_code_2698:				; CODE XREF: sub_code_2690+12j
		lodsb
		mov	bx, 7
		sub	bx, cx
		cmp	al, [bx+1F89h]
		loope	loc_code_2698
		ja	short loc_code_26A7
		retn
; ---------------------------------------------------------------------------

loc_code_26A7:				; CODE XREF: sub_code_2690+14j
		mov	si, 1F82h
		mov	di, 1F89h
		mov	cx, 7
		rep movsb
		retn
sub_code_2690	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26B3	proc near		; CODE XREF: start+1A3p
					; sub_code_5CB0+89p
		mov	al, ds:1F80h
		cmp	al, ds:1F81h
		jnz	short loc_code_26BD
		retn
; ---------------------------------------------------------------------------

loc_code_26BD:				; CODE XREF: sub_code_26B3+7j
		mov	ds:1F81h, al
		sub	ah, ah
		mov	cl, 4
		shl	ax, cl
		add	ax, 2720h
		mov	si, ax
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	di, 1260h
		mov	cx, 801h
		call	sub_code_2D9D
		retn
sub_code_26B3	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26DA	proc near		; CODE XREF: start+6Bp	start+B9p
		mov	di, 1F82h
		call	sub_code_26E8
		retn
sub_code_26DA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26E1	proc near		; CODE XREF: start+68p
		mov	di, 1F89h
		call	sub_code_26E8
		retn
sub_code_26E1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26E8	proc near		; CODE XREF: sub_code_26DA+3p
					; sub_code_26E1+3p
		push	ds
		pop	es
		assume es:nothing
		mov	cx, 7
		sub	al, al
		rep stosb
		retn
sub_code_26E8	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26F2	proc near		; CODE XREF: start+14Cp
					; sub_code_5CB0+79p
		mov	bx, 1F89h
		mov	di, 12CAh
		call	sub_code_2739
		retn
sub_code_26F2	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_26FC	proc near		; CODE XREF: start+14Fp
					; sub_code_2706+14p ...
		mov	bx, 1F82h
		mov	di, 143Ch
		call	sub_code_2739
		retn
sub_code_26FC	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2706	proc near		; CODE XREF: sub_code_2567+E9p
		mov	cx, 6

loc_code_2709:				; CODE XREF: sub_code_2706+12j
		mov	bx, cx
		mov	ah, 0
		add	al, [bx+1F81h]
		aaa
		mov	[bx+1F81h], al
		mov	al, ah
		loop	loc_code_2709
		call	sub_code_26FC
		retn
sub_code_2706	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_271E	proc near		; CODE XREF: sub_code_38B0+71p
					; sub_code_38B0+9Dp ...
		push	cx
		push	ax
		push	bx
		clc
		pushf
		mov	cx, 7

loc_code_2726:				; CODE XREF: sub_code_271E+14j
		popf
		mov	bx, cx
		dec	bx
		mov	al, [bx+di]
		adc	al, [bx+si]
		aaa
		mov	[bx+di], al
		pushf
		loop	loc_code_2726
		popf
		pop	bx
		pop	ax
		pop	cx
		retn
sub_code_271E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2739	proc near		; CODE XREF: sub_code_26F2+6p
					; sub_code_26FC+6p
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	ds:1F90h, di
		mov	ds:1F93h, bx
		mov	byte ptr ds:1F92h, 0

loc_code_274B:				; CODE XREF: sub_code_2739+46j
					; sub_code_2739+4Dj
		mov	bx, ds:1F93h
		mov	al, [bx]
		sub	ah, ah
		mov	cl, 4
		shl	ax, cl
		add	ax, 2720h
		mov	si, ax
		mov	di, ds:1F90h
		mov	cx, 801h
		call	sub_code_2D9D
		add	word ptr ds:1F90h, 2
		inc	word ptr ds:1F93h
		inc	byte ptr ds:1F92h
		cmp	byte ptr ds:1F92h, 7
		jz	short locret_code_2788
		cmp	byte ptr ds:1F92h, 3
		jnz	short loc_code_274B
		add	word ptr ds:1F90h, 2
		jmp	short loc_code_274B
; ---------------------------------------------------------------------------

locret_code_2788:			; CODE XREF: sub_code_2739+3Fj
		retn
sub_code_2739	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_2790	proc near		; CODE XREF: start+269p start+2B3p ...
		mov	ax, 0B800h
		mov	es, ax
		cmp	word ptr ds:4, 2
		jnz	short loc_code_27EE
		cld
		sub	di, di
		mov	ax, 0AAAAh
		mov	cx, 50h	; 'P'
		rep stosw
		mov	di, 2000h
		mov	cx, 50h	; 'P'
		rep stosw
		mov	word ptr ds:2654h, 0

loc_code_27B5:				; CODE XREF: sub_code_2790+30j
					; sub_code_2790+5Bj
		call	sub_code_2DFD
		and	dx, 18h
		cmp	dl, ds:2653h
		jz	short loc_code_27B5
		mov	ds:2653h, dl
		mov	bx, ds:2654h
		mov	[bx+2656h], dl
		add	dx, 2020h
		mov	si, dx
		mov	di, bx
		shl	di, 1
		add	di, 0A0h ; '�'
		mov	cx, 401h
		call	sub_code_2D9D
		inc	word ptr ds:2654h
		cmp	word ptr ds:2654h, 28h ; '('
		jb	short loc_code_27B5
		retn
; ---------------------------------------------------------------------------

loc_code_27EE:				; CODE XREF: sub_code_2790+Aj
		cmp	word ptr ds:4, 7
		jnz	short loc_code_27F9
		call	sub_code_300F
		retn
; ---------------------------------------------------------------------------

loc_code_27F9:				; CODE XREF: sub_code_2790+63j
		cmp	word ptr ds:4, 6
		jnz	short loc_code_283E
		sub	ax, ax
		call	sub_code_29A0
		mov	bx, 2570h
		mov	ax, 64Ah
		call	sub_code_2B24
		mov	word ptr ds:2650h, 48h ; 'H'
		mov	byte ptr ds:2652h, 38h ; '8'
		mov	ax, 0DD2h
		call	sub_code_2958
		mov	ax, 0DF6h
		call	sub_code_2970
		mov	si, 1FA0h
		mov	di, 67Eh
		mov	cx, 1002h
		call	sub_code_2D9D
		mov	bx, 2344h
		mov	ax, 0B84h
		call	sub_code_2B24
		call	sub_code_4B47
		retn
; ---------------------------------------------------------------------------

loc_code_283E:				; CODE XREF: sub_code_2790+6Ej
		cmp	word ptr ds:4, 5
		jnz	short loc_code_288D
		mov	ax, 640h
		call	sub_code_29A0
		mov	bx, 2570h
		mov	ax, 0CB6h
		call	sub_code_2B24
		mov	word ptr ds:2650h, 0F8h	; '�'
		mov	byte ptr ds:2652h, 60h ; '`'
		mov	ax, 140Eh
		call	sub_code_2958
		mov	ax, 1434h
		call	sub_code_2970
		mov	ax, 143Eh
		call	sub_code_2970
		mov	ax, 16A0h
		call	sub_code_2988
		mov	bx, 2344h
		mov	ax, 1184h
		call	sub_code_2B24
		mov	si, 1FE0h
		mov	di, 0DD6h
		mov	cx, 1002h
		call	sub_code_2D9D
		retn
; ---------------------------------------------------------------------------

loc_code_288D:				; CODE XREF: sub_code_2790+B3j
		cmp	word ptr ds:4, 4
		jnz	short loc_code_28BE
		mov	ax, 640h
		call	sub_code_29A0
		mov	bx, 2570h
		mov	ax, 0CBAh
		call	sub_code_2B24
		mov	word ptr ds:2650h, 108h
		mov	byte ptr ds:2652h, 60h ; '`'
		mov	ax, 1439h
		call	sub_code_2958
		mov	ax, 16C0h
		call	sub_code_2945
		call	sub_code_3F9E
		retn
; ---------------------------------------------------------------------------

loc_code_28BE:				; CODE XREF: sub_code_2790+102j
		cmp	word ptr ds:4, 3
		jnz	short loc_code_2909
		mov	ax, 640h
		call	sub_code_29A0
		mov	bx, 2570h
		mov	ax, 0C90h
		call	sub_code_2B24
		mov	word ptr ds:2650h, 60h ; '`'
		mov	byte ptr ds:2652h, 60h ; '`'
		mov	ax, 140Ch
		call	sub_code_2958
		mov	ax, 1418h
		call	sub_code_2970
		mov	bx, 2344h
		mov	ax, 1184h
		call	sub_code_2B24
		mov	bx, 2344h
		mov	ax, 11A2h
		call	sub_code_2B24
		mov	bx, 2624h
		sub	ax, ax
		call	sub_code_2B24
		call	sub_code_3BDB
		retn
; ---------------------------------------------------------------------------

loc_code_2909:				; CODE XREF: sub_code_2790+133j
		mov	ax, 640h
		call	sub_code_29A0
		mov	bx, 2570h
		mov	ax, 0CA0h
		call	sub_code_2B24
		mov	word ptr ds:2650h, 0A0h	; '�'
		mov	byte ptr ds:2652h, 60h ; '`'
		mov	ax, 1406h
		call	sub_code_2958
		mov	bx, 2344h
		mov	ax, 11C4h
		call	sub_code_2B24
		mov	ax, 1422h
		call	sub_code_2970
		mov	ax, 1690h
		call	sub_code_2988
		mov	ax, 16B6h
		call	sub_code_2945
		retn
sub_code_2790	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2945	proc near		; CODE XREF: sub_code_2790+127p
					; sub_code_2790+1B1p
		mov	ds:2634h, ax
		mov	bx, 2384h
		call	sub_code_2B24
		mov	ax, ds:2634h
		mov	bx, 238Ch
		call	sub_code_2B24
		retn
sub_code_2945	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2958	proc near		; CODE XREF: sub_code_2790+8Cp
					; sub_code_2790+D2p ...
		mov	ds:2634h, ax
		mov	si, 8

loc_code_295E:				; CODE XREF: sub_code_2958+15j
		mov	ax, ds:2634h
		mov	bx, [si+2634h]
		push	si
		call	sub_code_2B24
		pop	si
		sub	si, 2
		jnz	short loc_code_295E
		retn
sub_code_2958	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2970	proc near		; CODE XREF: sub_code_2790+92p
					; sub_code_2790+D8p ...
		mov	ds:2634h, ax
		mov	si, 0Ah

loc_code_2976:				; CODE XREF: sub_code_2970+15j
		mov	ax, ds:2634h
		mov	bx, [si+263Ch]
		push	si
		call	sub_code_2B24
		pop	si
		sub	si, 2
		jnz	short loc_code_2976
		retn
sub_code_2970	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2988	proc near		; CODE XREF: sub_code_2790+E4p
					; sub_code_2790+1ABp
		mov	ds:2634h, ax
		mov	si, 8

loc_code_298E:				; CODE XREF: sub_code_2988+15j
		mov	ax, ds:2634h
		mov	bx, [si+2646h]
		push	si
		call	sub_code_2B24
		pop	si
		sub	si, 2
		jnz	short loc_code_298E
		retn
sub_code_2988	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_29A0	proc near		; CODE XREF: sub_code_2790+72p
					; sub_code_2790+B8p ...
		mov	ds:267Eh, ax
		mov	bx, 251Ch
		call	sub_code_2B24
		sub	ax, ax
		cld
		mov	di, ds:267Eh
		add	di, 284h
		mov	cx, 24h	; '$'
		rep stosw
		mov	di, ds:267Eh
		add	di, 1184h
		mov	cx, 24h	; '$'
		rep stosw
		mov	di, ds:267Eh
		add	di, 2284h
		mov	al, 2Ah	; '*'
		call	sub_code_29E1
		mov	di, ds:267Eh
		add	di, 22CBh
		mov	al, 0A8h ; '�'
		call	sub_code_29E1
		retn
sub_code_29A0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_29E1	proc near		; CODE XREF: sub_code_29A0+30p
					; sub_code_29A0+3Dp
		mov	cx, 5Fh	; '_'

loc_code_29E4:				; CODE XREF: sub_code_29E1:loc_code_29F4j
		mov	es:[di], al
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_29F4
		add	di, 50h	; 'P'

loc_code_29F4:				; CODE XREF: sub_code_29E1+Ej
		loop	loc_code_29E4
		retn
sub_code_29E1	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_2A00	proc near		; CODE XREF: start+108p
		mov	ax, 0B800h
		mov	es, ax
		cld
		sub	di, di
		mov	ax, 0AAAAh
		mov	cx, 0FA0h
		rep stosw
		mov	di, 2000h
		mov	cx, 0FA0h
		rep stosw
		call	sub_code_2B9E
		mov	bx, 28A0h
		sub	ax, ax
		call	sub_code_2B24
		call	sub_code_2A68
		call	sub_code_2C84
		call	sub_code_2B8B
		call	sub_code_2A80
		retn
sub_code_2A00	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2A30	proc near		; CODE XREF: sub_code_5CB0+Dp
		mov	ax, 0B800h
		mov	es, ax
		cld
		sub	di, di
		mov	ax, 0AAAAh
		mov	cx, 0FA0h
		rep stosw
		mov	di, 2000h
		mov	cx, 0FA0h
		rep stosw
		call	sub_code_2B9E
		mov	bx, 28A0h
		sub	ax, ax
		call	sub_code_2B24
		call	sub_code_2A68
		mov	ax, ds:8
		push	ax
		mov	word ptr ds:8, 1
		call	sub_code_2C84
		pop	ax
		mov	ds:8, ax
		retn
sub_code_2A30	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2A68	proc near		; CODE XREF: sub_code_2A00+23p
					; sub_code_2A30+23p
		mov	bx, ds:6DF8h
		and	bx, 3
		shl	bl, 1
		mov	si, [bx+2AD1h]
		mov	di, 1902h
		mov	cx, 801h
		call	sub_code_2D9D
		retn
sub_code_2A68	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2A80	proc near		; CODE XREF: sub_code_2A00+2Cp
		mov	bx, 0Fh

loc_code_2A83:				; CODE XREF: sub_code_2A80+9j
		mov	byte ptr [bx+1015h], 0
		dec	bx
		jnz	short loc_code_2A83
		mov	di, 140h
		mov	bh, 80h	; '�'
		mov	word ptr ds:2ACAh, 0
		call	sub_code_2AC6
		mov	di, 640h
		mov	bh, 30h	; '0'
		mov	word ptr ds:2ACAh, 5
		call	sub_code_2AC6
		mov	di, 0B40h
		mov	bh, 0
		mov	word ptr ds:2ACAh, 0Ah
		call	sub_code_2AC6
		mov	byte ptr ds:525h, 10h
		mov	word ptr ds:52Fh, 0
		mov	byte ptr ds:531h, 1
		retn
sub_code_2A80	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2AC6	proc near		; CODE XREF: sub_code_2A80+16p
					; sub_code_2A80+24p ...
		mov	ds:2AC9h, bh
		mov	byte ptr ds:2AC4h, 0

loc_code_2ACF:				; CODE XREF: sub_code_2AC6+5Bj
		push	di
		push	es
		mov	bx, ds:8
		mov	bl, [bx+2ABAh]
		mov	bh, ds:2AC9h
		mov	ax, seg	data
		mov	es, ax
		assume es:data
		mov	di, 4D7h
		call	sub_code_67D
		pop	es
		assume es:nothing
		pop	di
		push	di
		mov	si, 4D7h
		mov	cx, 1002h
		call	sub_code_2D9D
		sub	bh, bh
		mov	bl, ds:2AC4h
		mov	cl, bl
		shr	bl, 1
		shr	bl, 1
		not	cl
		and	cl, 3
		shl	cl, 1
		mov	al, ds:540h
		shl	al, cl
		mov	si, ds:2ACAh
		or	[bx+si+1016h], al
		pop	di
		add	di, 4
		inc	byte ptr ds:2AC4h
		cmp	byte ptr ds:2AC4h, 14h
		jb	short loc_code_2ACF
		retn
sub_code_2AC6	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2B24	proc near		; CODE XREF: sub_code_2790+7Bp
					; sub_code_2790+A7p ...
		mov	cx, [bx]
		mov	ds:2AC7h, cx
		mov	ds:2ACCh, ax
		add	bx, 2

loc_code_2B30:				; CODE XREF: sub_code_2B24+4Bj
		mov	si, [bx]
		cmp	si, 0FFFFh
		jnz	short loc_code_2B39
		retn
; ---------------------------------------------------------------------------

loc_code_2B39:				; CODE XREF: sub_code_2B24+12j
		mov	di, [bx+2]
		add	di, ds:2ACCh
		cld
		mov	ds:2AD0h, ch
		sub	ch, ch
		mov	ds:2ACEh, cx

loc_code_2B4B:				; CODE XREF: sub_code_2B24+42j
		mov	cx, ds:2ACEh
		rep movsb
		sub	di, ds:2ACEh
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_2B62
		add	di, 50h	; 'P'

loc_code_2B62:				; CODE XREF: sub_code_2B24+39j
		dec	byte ptr ds:2AD0h
		jnz	short loc_code_2B4B
		add	bx, 4
		mov	cx, ds:2AC7h
		jmp	short loc_code_2B30
sub_code_2B24	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2B71	proc near		; CODE XREF: sub_code_2B8B+3p
					; sub_code_2B8B+9p ...
		mov	byte ptr ds:2AC4h, 4

loc_code_2B76:				; CODE XREF: sub_code_2B71+17j
		mov	si, 2680h
		mov	cx, 1005h
		push	di
		call	sub_code_2D9D
		pop	di
		add	di, 14h
		dec	byte ptr ds:2AC4h
		jnz	short loc_code_2B76
		retn
sub_code_2B71	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2B8B	proc near		; CODE XREF: sub_code_2A00+29p
		mov	di, 3C5h
		call	sub_code_2B71
		mov	di, 8C5h
		call	sub_code_2B71
		mov	di, 0DC5h
		call	sub_code_2B71
		retn
sub_code_2B8B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2B9E	proc near		; CODE XREF: sub_code_2A00+18p
					; sub_code_2A30+18p
		mov	word ptr ds:2AC2h, 103Eh

loc_code_2BA4:				; CODE XREF: sub_code_2B9E+32j
		add	word ptr ds:2AC2h, 2
		mov	di, ds:2AC2h
		cmp	di, 1090h
		jnb	short loc_code_2BD2

loc_code_2BB3:				; CODE XREF: sub_code_2B9E+20j
		call	sub_code_2DFD
		and	dx, 30h
		cmp	dl, ds:2AC4h
		jz	short loc_code_2BB3
		mov	ds:2AC4h, dl
		add	dx, 2904h
		mov	si, dx
		mov	cx, 801h
		call	sub_code_2D9D
		jmp	short loc_code_2BA4
; ---------------------------------------------------------------------------

loc_code_2BD2:				; CODE XREF: sub_code_2B9E+13j
		mov	di, 1180h
		mov	ax, 5655h
		mov	cx, 500h
		cld
		rep stosw
		mov	di, 3180h
		mov	cx, 500h
		rep stosw
		mov	word ptr ds:2AC2h, 2944h

loc_code_2BEC:				; CODE XREF: sub_code_2B9E+7Bj
		mov	byte ptr ds:2AC4h, 9

loc_code_2BF1:				; CODE XREF: sub_code_2B9E+6Ej
		call	sub_code_2DFD
		and	dx, 776h
		add	dx, 12C0h
		mov	di, dx
		mov	si, ds:2AC2h
		mov	cx, 501h
		call	sub_code_2D9D
		dec	byte ptr ds:2AC4h
		jnz	short loc_code_2BF1
		add	word ptr ds:2AC2h, 0Ah
		cmp	word ptr ds:2AC2h, 296Ch
		jb	short loc_code_2BEC
		mov	byte ptr ds:2AC4h, 5

loc_code_2C20:				; CODE XREF: sub_code_2B9E+9Cj
		call	sub_code_2DFD
		and	dx, 3Eh
		add	dx, 3A98h
		mov	di, dx
		mov	si, 296Ch
		mov	cx, 501h
		call	sub_code_2D9D
		dec	byte ptr ds:2AC4h
		jnz	short loc_code_2C20
		retn
sub_code_2B9E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2C3D	proc near		; CODE XREF: sub_code_2C84:loc_code_2C9Ap
		mov	ds:2AC2h, di
		mov	al, 3
		cmp	di, 1720h
		jb	short loc_code_2C4B
		dec	al

loc_code_2C4B:				; CODE XREF: sub_code_2C3D+Aj
		mov	ds:2AC4h, al
		add	word ptr ds:2AC2h, 1E0h
		mov	si, 2976h
		mov	cx, 0C05h
		call	sub_code_2D9D

loc_code_2C5D:				; CODE XREF: sub_code_2C3D+37j
		mov	di, ds:2AC2h
		add	word ptr ds:2AC2h, 140h
		mov	si, 29EEh
		mov	cx, 804h
		call	sub_code_2D9D
		dec	byte ptr ds:2AC4h
		jnz	short loc_code_2C5D
		mov	di, ds:2AC2h
		mov	si, 2A2Eh
		mov	cx, 0B04h
		call	sub_code_2D9D
		retn
sub_code_2C3D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2C84	proc near		; CODE XREF: sub_code_2A00+26p
					; sub_code_2A30+30p
		mov	bx, ds:8
		mov	bl, [bx+2AB2h]

loc_code_2C8C:				; CODE XREF: sub_code_2C84+20j
		mov	ds:2AC5h, bx
		mov	di, [bx+2A86h]
		cmp	di, 0
		jnz	short loc_code_2C9A
		retn
; ---------------------------------------------------------------------------

loc_code_2C9A:				; CODE XREF: sub_code_2C84+13j
		call	sub_code_2C3D
		mov	bx, ds:2AC5h
		add	bx, 2
		jmp	short loc_code_2C8C
sub_code_2C84	endp

; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_2CB0	proc near		; CODE XREF: sub_code_70D+2Fp
					; sub_code_7A1+2Dp ...
		mov	al, dl
		mov	ah, 28h	; '('
		mul	ah
		test	dl, 1
		jz	short loc_code_2CBE
		add	ax, 1FD8h

loc_code_2CBE:				; CODE XREF: sub_code_2CB0+9j
		mov	dx, cx
		shr	dx, 1
		shr	dx, 1
		add	ax, dx
		and	cl, 3
		shl	cl, 1
		retn
sub_code_2CB0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2CCC	proc near		; CODE XREF: sub_code_1166+2Ep
					; sub_code_184B+D3p ...
		cld
		mov	ds:2AE0h, cl
		mov	ds:2AE2h, ch
		sub	ch, ch
		mov	dx, 0FF0h

loc_code_2CDA:				; CODE XREF: sub_code_2CCC+66j
		mov	cl, ds:2AE0h

loc_code_2CDE:				; CODE XREF: sub_code_2CCC+4Bj
		mov	dx, 30C0h
		mov	bx, es:[di]
		mov	ds:[bp+0], bx
		lodsw
		mov	ds:2AE3h, ax

loc_code_2CEC:				; CODE XREF: sub_code_2CCC+3Fj
		test	ah, dl
		jnz	short loc_code_2CF2
		or	ah, dl

loc_code_2CF2:				; CODE XREF: sub_code_2CCC+22j
		test	ah, dh
		jnz	short loc_code_2CF8
		or	ah, dh

loc_code_2CF8:				; CODE XREF: sub_code_2CCC+28j
		test	al, dl
		jnz	short loc_code_2CFE
		or	al, dl

loc_code_2CFE:				; CODE XREF: sub_code_2CCC+2Ej
		test	al, dh
		jnz	short loc_code_2D04
		or	al, dh

loc_code_2D04:				; CODE XREF: sub_code_2CCC+34j
		xor	dx, 33CCh
		test	dh, 3
		jnz	short loc_code_2CEC
		and	ax, bx
		or	ax, ds:2AE3h
		stosw
		add	bp, 2
		loop	loc_code_2CDE
		sub	di, ds:2AE0h
		sub	di, ds:2AE0h
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_2D2E
		add	di, 50h	; 'P'

loc_code_2D2E:				; CODE XREF: sub_code_2CCC+5Dj
		dec	byte ptr ds:2AE2h
		jnz	short loc_code_2CDA
		retn
sub_code_2CCC	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2D35	proc near		; CODE XREF: sub_code_8E5+D1p
					; sub_code_1069+4Dp ...
		cld
		mov	ds:2AE0h, cl
		mov	ds:2AE2h, ch
		sub	ch, ch

loc_code_2D40:				; CODE XREF: sub_code_2D35+38j
		mov	cl, ds:2AE0h

loc_code_2D44:				; CODE XREF: sub_code_2D35+1Dj
		mov	bx, es:[di]
		mov	ds:[bp+0], bx
		lodsw
		and	ax, bx
		stosw
		add	bp, 2
		loop	loc_code_2D44
		sub	di, ds:2AE0h
		sub	di, ds:2AE0h
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_2D69
		add	di, 50h	; 'P'

loc_code_2D69:				; CODE XREF: sub_code_2D35+2Fj
		dec	byte ptr ds:2AE2h
		jnz	short loc_code_2D40
		retn
sub_code_2D35	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2D70	proc near		; CODE XREF: sub_code_F87+38p
					; sub_code_2059+38p
		cld
		mov	ds:2AE9h, si
		mov	ds:2AE0h, cl
		mov	ds:2AE2h, ch
		shl	al, 1
		mov	ds:2AEBh, al
		sub	ch, ch

loc_code_2D84:				; CODE XREF: sub_code_2D70+2Aj
		mov	cl, ds:2AE0h
		rep movsw
		mov	cl, ds:2AEBh
		add	ds:2AE9h, cx
		mov	si, ds:2AE9h
		dec	byte ptr ds:2AE2h
		jnz	short loc_code_2D84
		retn
sub_code_2D70	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2D9D	proc near		; CODE XREF: sub_code_1166+67p
					; sub_code_11E3+10p ...
		cld
		mov	ds:2AE0h, cl
		mov	ds:2AE2h, ch
		sub	ch, ch

loc_code_2DA8:				; CODE XREF: sub_code_2D9D+2Aj
		mov	cl, ds:2AE0h
		rep movsw
		sub	di, ds:2AE0h
		sub	di, ds:2AE0h
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_2DC3
		add	di, 50h	; 'P'

loc_code_2DC3:				; CODE XREF: sub_code_2D9D+21j
		dec	byte ptr ds:2AE2h
		jnz	short loc_code_2DA8
		retn
sub_code_2D9D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2DCA	proc near		; CODE XREF: sub_code_1124+17p
					; sub_code_209B+31p ...
		cld
		mov	es:2AE0h, cl
		mov	es:2AE2h, ch
		sub	ch, ch

loc_code_2DD7:				; CODE XREF: sub_code_2DCA+30j
		mov	cl, es:2AE0h
		rep movsw
		sub	si, es:2AE0h
		sub	si, es:2AE0h
		xor	si, 2000h
		test	si, 2000h
		jnz	short loc_code_2DF5
		add	si, 50h	; 'P'

loc_code_2DF5:				; CODE XREF: sub_code_2DCA+26j
		dec	byte ptr es:2AE2h
		jnz	short loc_code_2DD7
		retn
sub_code_2DCA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2DFD	proc near		; CODE XREF: start:loc_code_1E5p
					; start:loc_code_20Ap ...
		mov	dx, ds:2AE5h
		xor	dl, dh
		shr	dl, 1
		shr	dl, 1
		rcr	word ptr ds:2AE5h, 1
		mov	dx, ds:2AE5h
		retn
sub_code_2DFD	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2E10	proc near		; CODE XREF: start:loc_code_65p
		mov	al, 0
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		nop
		nop
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	ah, al
		nop
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		cmp	ax, 0
		jnz	short loc_code_2E25
		mov	ax, 0FA59h

loc_code_2E25:				; CODE XREF: sub_code_2E10+10j
		mov	ds:2AE5h, ax
		retn
sub_code_2E10	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2E29	proc near		; CODE XREF: sub_code_16C6+2Ap
					; sub_code_1B05+18p ...
		add	ax, si
		cmp	ax, bx
		jb	short loc_code_2E4F
		sub	ax, si
		sub	ax, di
		jnb	short loc_code_2E37
		sub	ax, ax

loc_code_2E37:				; CODE XREF: sub_code_2E29+Aj
		cmp	ax, bx
		ja	short loc_code_2E4F
		add	dl, cl
		cmp	dl, dh
		jb	short loc_code_2E4F
		sub	dl, cl
		sub	dl, ch
		jnb	short loc_code_2E49
		sub	dl, dl

loc_code_2E49:				; CODE XREF: sub_code_2E29+1Cj
		cmp	dl, dh
		ja	short loc_code_2E4F
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_2E4F:				; CODE XREF: sub_code_2E29+4j
					; sub_code_2E29+10j ...
		clc
		retn
sub_code_2E29	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_2E60	proc near		; CODE XREF: start+290p
		cmp	word ptr ds:2E8Dh, 8
		jb	short loc_code_2E68

locret_code_2E67:			; CODE XREF: sub_code_2E60+Dj
		retn
; ---------------------------------------------------------------------------

loc_code_2E68:				; CODE XREF: sub_code_2E60+5j
		cmp	byte ptr ds:69Ah, 0
		jnz	short locret_code_2E67
		mov	word ptr ds:2E92h, 0FFFFh
		mov	byte ptr ds:2E91h, 0FFh
		mov	cx, 7

loc_code_2E7D:				; CODE XREF: sub_code_2E60:loc_code_2E98j
		mov	bx, cx
		dec	bx
		mov	al, ds:57Bh
		sub	al, [bx+2BD4h]
		jnb	short loc_code_2E8B
		not	al

loc_code_2E8B:				; CODE XREF: sub_code_2E60+27j
		cmp	al, ds:2E91h
		ja	short loc_code_2E98
		mov	ds:2E91h, al
		mov	ds:2E92h, bx

loc_code_2E98:				; CODE XREF: sub_code_2E60+2Fj
		loop	loc_code_2E7D
		cmp	word ptr ds:2E92h, 0FFFFh
		jnz	short loc_code_2EA8
		mov	word ptr ds:2E92h, 0

loc_code_2EA8:				; CODE XREF: sub_code_2E60+40j
		mov	bx, ds:2E8Dh
		mov	si, ds:2E92h
		mov	al, [si+2BD4h]
		mov	[bx+2B6Ah], al
		mov	ds:2E98h, al
		mov	ax, ds:579h
		shl	bl, 1
		cmp	ax, 108h
		jb	short loc_code_2EC8
		mov	ax, 107h

loc_code_2EC8:				; CODE XREF: sub_code_2E60+63j
		and	ax, 0FFCh
		mov	[bx+2B5Ah], ax
		mov	ds:2E96h, ax
		mov	cx, 8

loc_code_2ED5:				; CODE XREF: sub_code_2E60:loc_code_2F07j
		mov	bx, cx
		dec	bx
		cmp	bx, ds:2E8Dh
		jz	short loc_code_2F07
		cmp	byte ptr [bx+2B72h], 0
		jz	short loc_code_2F07
		push	cx
		mov	dl, [bx+2B6Ah]
		shl	bl, 1
		mov	ax, [bx+2B5Ah]
		mov	bx, ds:2E96h
		mov	dh, ds:2E98h
		mov	si, 18h
		mov	di, si
		mov	cx, 0F0Fh
		call	sub_code_2E29
		pop	cx
		jnb	short loc_code_2F07
		retn
; ---------------------------------------------------------------------------

loc_code_2F07:				; CODE XREF: sub_code_2E60+7Cj
					; sub_code_2E60+83j ...
		loop	loc_code_2ED5
		call	sub_code_11E3
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_2F16
		call	sub_code_622B

loc_code_2F16:				; CODE XREF: sub_code_2E60+B1j
		mov	bx, ds:2E8Dh
		mov	ds:2E94h, bx
		mov	byte ptr [bx+2B72h], 1
		mov	dl, [bx+2B6Ah]
		shl	bl, 1
		mov	cx, [bx+2B5Ah]
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 2AF0h
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	cx, 0F03h
		call	sub_code_2D9D
		mov	word ptr ds:2E8Dh, 0FFFFh
		sub	bx, bx
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		call	sub_code_4E3E
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_2F59
		call	sub_code_61FA

loc_code_2F59:				; CODE XREF: sub_code_2E60+F4j
		call	sub_code_1145
		mov	ax, 3E8h
		mov	bx, 4A5h
		call	sub_code_593B
		retn
sub_code_2E60	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_2F66	proc near		; CODE XREF: start+28Dp
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:2E8Fh
		jnz	short loc_code_2F71
		retn
; ---------------------------------------------------------------------------

loc_code_2F71:				; CODE XREF: sub_code_2F66+8j
		mov	ds:2E8Fh, dx
		cmp	word ptr ds:2E8Dh, 8
		jb	short loc_code_2FAC
		mov	cx, 8

loc_code_2F7F:				; CODE XREF: sub_code_2F66:loc_code_2FAAj
		mov	bx, cx
		dec	bx
		cmp	byte ptr [bx+2B72h], 0
		jz	short loc_code_2FAA
		push	cx
		mov	dl, [bx+2B6Ah]
		shl	bl, 1
		mov	ax, [bx+2B5Ah]
		mov	si, 18h
		mov	di, si
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	cx, 0E0Fh
		call	sub_code_2E29
		pop	cx
		jb	short loc_code_2FB3

loc_code_2FAA:				; CODE XREF: sub_code_2F66+21j
		loop	loc_code_2F7F

loc_code_2FAC:				; CODE XREF: sub_code_2F66+14j
		mov	word ptr ds:2E94h, 0FFFFh

locret_code_2FB2:			; CODE XREF: sub_code_2F66+54j
		retn
; ---------------------------------------------------------------------------

loc_code_2FB3:				; CODE XREF: sub_code_2F66+42j
		mov	bx, cx
		dec	bx
		cmp	bx, ds:2E94h
		jz	short locret_code_2FB2
		push	bx
		call	sub_code_11E3
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_2FCA
		call	sub_code_622B

loc_code_2FCA:				; CODE XREF: sub_code_2F66+5Fj
		pop	bx
		mov	byte ptr [bx+2B72h], 0
		mov	dl, [bx+2B6Ah]
		mov	ds:2E8Dh, bx
		shl	bl, 1
		mov	cx, [bx+2B5Ah]
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 2B7Ah
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 0F03h
		call	sub_code_2D9D
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_2FFB
		call	sub_code_61FA

loc_code_2FFB:				; CODE XREF: sub_code_2F66+90j
		call	sub_code_1145
		mov	bx, 1
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		mov	ax, 3E8h
		mov	bx, 349h
		call	sub_code_593B
		retn
sub_code_2F66	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_300F	proc near		; CODE XREF: sub_code_2790+65p
		sub	ax, ax
		mov	bx, 2E24h
		call	sub_code_2B24
		mov	byte ptr ds:2E8Ah, 0BFh	; '�'
		mov	word ptr ds:2E8Bh, 0

loc_code_3022:				; CODE XREF: sub_code_300F+7Aj
		mov	word ptr ds:2E88h, 20h ; ' '

loc_code_3028:				; CODE XREF: sub_code_300F+6Aj
		sub	bx, bx
		cmp	byte ptr ds:2E8Ah, 0BFh	; '�'
		jz	short loc_code_3039
		call	sub_code_2DFD
		mov	bl, dl
		and	bl, 2

loc_code_3039:				; CODE XREF: sub_code_300F+20j
		mov	cx, ds:2E88h
		mov	dl, ds:2E8Ah
		push	bx
		call	sub_code_30E3
		pop	bx
		mov	si, ds:2E8Bh
		mov	ax, ds:2E88h
		mov	cl, 4
		shr	ax, cl
		sub	ax, 2
		jnb	short loc_code_3058
		sub	ax, ax

loc_code_3058:				; CODE XREF: sub_code_300F+45j
		cmp	ax, 12h
		jb	short loc_code_3060
		mov	ax, 11h

loc_code_3060:				; CODE XREF: sub_code_300F+4Cj
		mov	dl, [si+2BDBh]
		sub	dh, dh
		add	ax, dx
		mov	si, ax
		mov	[si+2BE2h], bl
		add	word ptr ds:2E88h, 10h
		cmp	word ptr ds:2E88h, 111h
		jb	short loc_code_3028
		inc	word ptr ds:2E8Bh
		sub	byte ptr ds:2E8Ah, 18h
		cmp	byte ptr ds:2E8Ah, 2Fh ; '/'
		jnb	short loc_code_3022
		mov	ax, 0FFFFh
		mov	ds:2E8Dh, ax
		mov	ds:2E94h, ax
		sub	ax, ax
		mov	ds:2B72h, ax
		mov	ds:2B74h, ax
		mov	ds:2B76h, ax
		mov	ds:2B78h, ax
		mov	cx, ds:414h
		cmp	cx, 0
		jnz	short loc_code_30B0
		inc	cx
		mov	ds:414h, cx

loc_code_30B0:				; CODE XREF: sub_code_300F+9Aj
		cmp	cx, 8
		jbe	short loc_code_30B8
		mov	cx, 8

loc_code_30B8:				; CODE XREF: sub_code_300F+A4j
					; sub_code_300F+D1j
		mov	bx, cx
		dec	bx
		mov	byte ptr [bx+2B72h], 1
		mov	dl, 0B0h ; '�'
		mov	[bx+2B6Ah], dl
		push	cx
		shl	bl, 1
		mov	cx, [bx+2B4Ah]
		mov	[bx+2B5Ah], cx
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 2AF0h
		mov	cx, 0F03h
		call	sub_code_2D9D
		pop	cx
		loop	loc_code_30B8
		retn
sub_code_300F	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_30E3	proc near		; CODE XREF: sub_code_300F+33p
					; sub_code_6245+5Ap
		push	bx
		call	sub_code_2CB0
		mov	di, ax
		mov	ax, 0B800h
		mov	es, ax
		pop	bx
		mov	si, [bx+2E20h]
		mov	cx, 802h
		call	sub_code_2D9D
		retn
sub_code_30E3	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_30FA	proc near		; CODE XREF: sub_code_1608+7p
		mov	al, ds:57Bh
		sub	al, 5
		and	al, 0F8h
		mov	cx, 7

loc_code_3104:				; CODE XREF: sub_code_30FA+13j
		mov	bx, cx
		dec	bx
		cmp	al, [bx+2BD4h]
		jz	short loc_code_3111
		loop	loc_code_3104
		jmp	short loc_code_314D
; ---------------------------------------------------------------------------

loc_code_3111:				; CODE XREF: sub_code_30FA+11j
		mov	ch, al
		mov	ax, ds:579h
		add	ax, 7
		mov	cl, 4
		shr	ax, cl
		sub	ax, 2
		jnb	short loc_code_3124
		sub	ax, ax

loc_code_3124:				; CODE XREF: sub_code_30FA+26j
		cmp	ax, 12h
		jb	short loc_code_312C
		mov	ax, 11h

loc_code_312C:				; CODE XREF: sub_code_30FA+2Dj
		mov	dl, [bx+2BDBh]
		sub	dh, dh
		add	ax, dx
		mov	si, ax
		cmp	byte ptr [si+2BE2h], 0
		jnz	short loc_code_314D
		add	ch, 5
		mov	ds:57Bh, ch
		add	ch, 32h	; '2'
		mov	ds:57Ch, ch
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_314D:				; CODE XREF: sub_code_30FA+15j
					; sub_code_30FA+41j
		clc
		retn
sub_code_30FA	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================


sub_code_3150	proc near		; CODE XREF: start:loc_code_2E3p
					; start+32Bp ...
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	bx, ds:4
		shl	bl, 1
		mov	cx, [bx+32F2h]
		mov	ax, dx
		sub	ax, ds:328Ch
		cmp	ax, cx
		jnb	short loc_code_3169

locret_code_3168:			; CODE XREF: sub_code_3150+20j
					; sub_code_3150+25j
		retn
; ---------------------------------------------------------------------------

loc_code_3169:				; CODE XREF: sub_code_3150+16j
		mov	ds:328Ch, dx
		call	sub_code_33BA
		jb	short locret_code_3168
		call	sub_code_21E0
		jb	short locret_code_3168
		inc	byte ptr ds:32EAh
		call	sub_code_2DFD
		mov	al, ds:32EAh
		and	al, dl
		xor	ds:32EBh, al
		mov	ax, ds:327Dh
		sub	ax, ds:579h
		mov	dl, 0FFh
		jnb	short loc_code_3196
		not	ax
		mov	dl, 1

loc_code_3196:				; CODE XREF: sub_code_3150+40j
		mov	ds:32EDh, dl
		mov	bl, ds:327Fh
		add	bl, 14h
		sub	bl, ds:57Bh
		mov	dl, 0FFh
		jnb	short loc_code_31AD
		not	bl
		mov	dl, 1

loc_code_31AD:				; CODE XREF: sub_code_3150+57j
		mov	ds:32EEh, dl
		shr	ax, 1
		shr	ax, 1
		shr	bl, 1
		add	al, bl
		mov	ds:32ECh, al
		mov	bx, ds:328Ah
		cmp	bx, 27h	; '''
		jb	short loc_code_31CC
		mov	bx, 26h	; '&'
		mov	ds:328Ah, bx

loc_code_31CC:				; CODE XREF: sub_code_3150+73j
		cmp	byte ptr [bx+328Eh], 0
		jnz	short loc_code_324B
		dec	word ptr ds:328Ah
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:410h
		mov	cl, 3
		shr	dx, cl
		mov	al, ds:32ECh
		sub	al, dl
		jnb	short loc_code_31EC
		sub	al, al

loc_code_31EC:				; CODE XREF: sub_code_3150+98j
		cmp	al, ds:32EBh
		jb	short loc_code_3212
		mov	byte ptr ds:3281h, 1
		call	sub_code_2DFD
		cmp	dl, 0
		jz	short loc_code_320B
		cmp	dl, 7
		ja	short loc_code_320F
		and	dl, 1
		jnz	short loc_code_320B
		mov	dl, 0FFh

loc_code_320B:				; CODE XREF: sub_code_3150+ADj
					; sub_code_3150+B7j
		mov	ds:3280h, dl

loc_code_320F:				; CODE XREF: sub_code_3150+B2j
		jmp	loc_code_32AC
; ---------------------------------------------------------------------------

loc_code_3212:				; CODE XREF: sub_code_3150+A0j
		mov	al, ds:32EBh
		and	al, 2Fh
		jnz	short loc_code_3238
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_3223
		mov	dl, 0FFh

loc_code_3223:				; CODE XREF: sub_code_3150+CFj
		mov	ds:3280h, dl
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_3231
		mov	dl, 0FFh

loc_code_3231:				; CODE XREF: sub_code_3150+DDj
		mov	ds:3281h, dl
		jmp	short loc_code_32AC
; ---------------------------------------------------------------------------
		nop

loc_code_3238:				; CODE XREF: sub_code_3150+C7j
		and	al, 7
		jnz	short loc_code_32AC
		mov	al, ds:32EDh
		mov	ds:3280h, al
		mov	al, ds:32EEh
		mov	ds:3281h, al
		jmp	short loc_code_32AC
; ---------------------------------------------------------------------------
		nop

loc_code_324B:				; CODE XREF: sub_code_3150+81j
		mov	byte ptr ds:3281h, 1
		mov	ax, bx
		mov	cl, 3
		shl	ax, cl
		cmp	ds:327Dh, ax
		jz	short loc_code_3269
		mov	dl, 1
		jb	short loc_code_3262
		mov	dl, 0FFh

loc_code_3262:				; CODE XREF: sub_code_3150+10Ej
		mov	ds:3280h, dl
		jmp	short loc_code_32AC
; ---------------------------------------------------------------------------
		nop

loc_code_3269:				; CODE XREF: sub_code_3150+10Aj
		mov	byte ptr ds:3280h, 0
		cmp	byte ptr ds:327Fh, 0A5h	; '�'
		jnz	short loc_code_32AC
		mov	byte ptr ds:3281h, 0
		cmp	word ptr ds:327Ah, 6
		jz	short loc_code_3288
		cmp	word ptr ds:327Ah, 12h
		jnz	short loc_code_32AC

loc_code_3288:				; CODE XREF: sub_code_3150+12Fj
		push	bx
		mov	si, 31E8h
		mov	di, ds:3282h
		mov	cx, 1E02h
		mov	ax, 0B800h
		mov	es, ax
		call	sub_code_2D9D
		pop	bx
		dec	byte ptr [bx+328Eh]
		mov	al, [bx+328Eh]
		call	sub_code_347F
		mov	byte ptr ds:3286h, 1

loc_code_32AC:				; CODE XREF: sub_code_3150:loc_code_320Fj
					; sub_code_3150+E5j ...
		mov	cx, ds:327Dh
		mov	dl, ds:327Fh
		mov	ds:32EFh, cx
		mov	ds:32F1h, dl
		cmp	byte ptr ds:3280h, 1
		jb	short loc_code_32DA
		jnz	short loc_code_32D3
		add	cx, 8
		cmp	cx, 131h
		jb	short loc_code_32DA
		mov	cx, 130h
		jmp	short loc_code_32DA
; ---------------------------------------------------------------------------

loc_code_32D3:				; CODE XREF: sub_code_3150+173j
		sub	cx, 8
		jnb	short loc_code_32DA
		sub	cx, cx

loc_code_32DA:				; CODE XREF: sub_code_3150+171j
					; sub_code_3150+17Cj ...
		and	cx, 0FFF8h
		mov	ds:327Dh, cx
		cmp	byte ptr ds:3281h, 1
		jb	short loc_code_32FE
		jnz	short loc_code_32F7
		add	dl, 2
		cmp	dl, 0A6h ; '�'
		jb	short loc_code_32FE
		mov	dl, 0A5h ; '�'
		jmp	short loc_code_32FE
; ---------------------------------------------------------------------------

loc_code_32F7:				; CODE XREF: sub_code_3150+199j
		sub	dl, 2
		jnb	short loc_code_32FE
		sub	dl, dl

loc_code_32FE:				; CODE XREF: sub_code_3150+197j
					; sub_code_3150+1A1j ...
		mov	ds:327Fh, dl
		call	sub_code_2CB0
		mov	ds:3284h, ax
		call	sub_code_33BA
		jnb	short loc_code_3328

loc_code_330D:				; CODE XREF: sub_code_3150+1DBj
		mov	byte ptr ds:3280h, 0
		mov	byte ptr ds:3281h, 0
		mov	cx, ds:32EFh
		mov	ds:327Dh, cx
		mov	dl, ds:32F1h
		mov	ds:327Fh, dl
		retn
; ---------------------------------------------------------------------------

loc_code_3328:				; CODE XREF: sub_code_3150+1BBj
		call	sub_code_21E0
		jb	short loc_code_330D
		call	sub_code_33A0
		add	word ptr ds:327Ah, 2
		call	sub_code_3339
		retn
sub_code_3150	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3339	proc near		; CODE XREF: sub_code_3150+1E5p
					; sub_code_3339+10j ...
		mov	bx, ds:327Ah
		mov	ax, [bx+3260h]
		cmp	ax, 0
		jnz	short loc_code_334B
		mov	ds:327Ah, ax
		jmp	short sub_code_3339
; ---------------------------------------------------------------------------

loc_code_334B:				; CODE XREF: sub_code_3339+Bj
		mov	si, ax
		mov	di, ds:3284h
		mov	ds:3282h, di
		mov	bp, 31E8h
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 1E02h
		mov	byte ptr ds:3286h, 0
		cld
		mov	ds:3289h, ch
		sub	ch, ch
		mov	ds:3287h, cx

loc_code_3370:				; CODE XREF: sub_code_3339+64j
		mov	cx, ds:3287h

loc_code_3374:				; CODE XREF: sub_code_3339+49j
		mov	bx, es:[di]
		mov	ds:[bp+0], bx
		lodsw
		or	ax, bx
		stosw
		add	bp, 2
		loop	loc_code_3374
		sub	di, ds:3287h
		sub	di, ds:3287h
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_3399
		add	di, 50h	; 'P'

loc_code_3399:				; CODE XREF: sub_code_3339+5Bj
		dec	byte ptr ds:3289h
		jnz	short loc_code_3370
		retn
sub_code_3339	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_33A0	proc near		; CODE XREF: sub_code_3150+1DDp
					; sub_code_3E90+ACp ...
		cmp	byte ptr ds:3286h, 0
		jnz	short locret_code_33B9
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 31E8h
		mov	di, ds:3282h
		mov	cx, 1E02h
		call	sub_code_2D9D

locret_code_33B9:			; CODE XREF: sub_code_33A0+5j
		retn
sub_code_33A0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_33BA	proc near		; CODE XREF: sub_code_3150+1Dp
					; sub_code_3150+1B8p
		cmp	byte ptr ds:1CB8h, 0
		jnz	short loc_code_3403
		cmp	word ptr ds:4, 6
		jnz	short loc_code_33D3
		cmp	byte ptr ds:44BDh, 0
		jz	short loc_code_33D3
		call	sub_code_47B0
		retn
; ---------------------------------------------------------------------------

loc_code_33D3:				; CODE XREF: sub_code_33BA+Cj
					; sub_code_33BA+13j
		mov	ax, ds:327Dh
		mov	dl, ds:327Fh
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E1Eh
		call	sub_code_2E29
		jnb	short loc_code_3403
		cmp	word ptr ds:4, 4
		jnz	short loc_code_33FE
		cmp	byte ptr ds:39E1h, 0
		jnz	short loc_code_3401

loc_code_33FE:				; CODE XREF: sub_code_33BA+3Bj
		call	sub_code_872

loc_code_3401:				; CODE XREF: sub_code_33BA+42j
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_3403:				; CODE XREF: sub_code_33BA+5j
					; sub_code_33BA+34j
		clc
		retn
sub_code_33BA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3405	proc near		; CODE XREF: start+272p start+2BCp ...
		cld
		sub	ax, ax
		push	ds
		pop	es
		assume es:nothing
		mov	di, 328Eh
		mov	cx, 14h
		rep stosw
		mov	word ptr ds:32B6h, 0FFh
		mov	word ptr ds:327Ah, 0
		mov	word ptr ds:327Dh, 0
		mov	byte ptr ds:327Fh, 0A0h	; '�'
		mov	byte ptr ds:3286h, 1
		mov	byte ptr ds:3280h, 0
		mov	byte ptr ds:3281h, 0
		call	sub_code_2DFD
		mov	ds:32EBh, dl
		mov	byte ptr ds:32EAh, 6Ch ; 'l'
		retn
sub_code_3405	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3445	proc near		; CODE XREF: sub_code_8E5+65Dp
		cmp	byte ptr ds:57Bh, 0B4h ; '�'
		jb	short locret_code_347E
		cmp	byte ptr ds:56Eh, 0
		jz	short locret_code_347E
		mov	ax, ds:579h
		add	ax, 0Ch
		mov	cl, 3
		shr	ax, cl
		cmp	ax, 27h	; '''
		ja	short locret_code_347E
		cmp	ax, ds:32B6h
		jz	short locret_code_347E
		mov	ds:32B6h, ax
		mov	bx, ax
		mov	al, [bx+328Eh]
		cmp	al, 4
		jnb	short locret_code_347E
		inc	al
		mov	[bx+328Eh], al
		call	sub_code_347F

locret_code_347E:			; CODE XREF: sub_code_3445+5j
					; sub_code_3445+Cj ...
		retn
sub_code_3445	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_347F	proc near		; CODE XREF: sub_code_3150+154p
					; sub_code_3445+36p
		mov	ah, 0Ah
		mul	ah
		add	ax, 32B8h
		mov	si, ax
		mov	di, bx
		shl	di, 1
		add	di, 1E00h
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	cx, 501h
		call	sub_code_2D9D
		retn
sub_code_347F	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_34A0	proc near		; CODE XREF: sub_code_8E5+2BEp
		mov	word ptr ds:3511h, 0
		mov	byte ptr ds:351Bh, 0

loc_code_34AB:				; CODE XREF: sub_code_34A0+118j
		mov	bx, ds:3511h
		cmp	byte ptr [bx+34A7h], 0
		jz	short loc_code_34B9

loc_code_34B6:				; CODE XREF: sub_code_34A0+48j
		jmp	loc_code_35AD
; ---------------------------------------------------------------------------

loc_code_34B9:				; CODE XREF: sub_code_34A0+14j
		mov	si, bx
		shl	si, 1
		mov	ax, [si+3447h]
		mov	dl, [bx+3477h]
		mov	di, 0
		cmp	bx, 0Ch
		jb	short loc_code_34D0
		mov	di, 2

loc_code_34D0:				; CODE XREF: sub_code_34A0+2Bj
		mov	si, [di+3513h]
		mov	cx, [di+3517h]
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	ch, 0Eh
		call	sub_code_2E29
		jnb	short loc_code_34B6
		mov	bx, ds:3511h
		cmp	bx, 0Ch
		jb	short loc_code_356F
		cmp	byte ptr ds:553h, 0
		jnz	short loc_code_356F
		cmp	byte ptr ds:5F3h, 0
		jnz	short loc_code_356F
		mov	byte ptr ds:552h, 1
		mov	cx, ds:579h
		sub	cx, 8
		jnb	short loc_code_3511
		sub	cx, cx

loc_code_3511:				; CODE XREF: sub_code_34A0+6Dj
		cmp	cx, 117h
		jb	short loc_code_351A
		mov	cx, 116h

loc_code_351A:				; CODE XREF: sub_code_34A0+75j
		mov	dl, ds:57Bh
		cmp	dl, 0B5h ; '�'
		jb	short loc_code_3525
		mov	dl, 0B4h ; '�'

loc_code_3525:				; CODE XREF: sub_code_34A0+81j
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 3350h
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 1205h
		call	sub_code_2D9D
		call	sub_code_5797
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:3509h, dx

loc_code_3543:				; CODE XREF: sub_code_34A0+CCj
		push	dx

loc_code_3544:				; CODE XREF: sub_code_34A0+AAj
		call	sub_code_57A6
		call	sub_code_13D8
		jz	short loc_code_3544
		call	sub_code_57A6
		pop	dx
		mov	bx, 1
		test	dl, 1
		jnz	short loc_code_355A
		mov	bl, 0Fh

loc_code_355A:				; CODE XREF: sub_code_34A0+B6j
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		call	sub_code_57A6
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:3509h
		cmp	dx, 0Dh
		jb	short loc_code_3543
		retn
; ---------------------------------------------------------------------------

loc_code_356F:				; CODE XREF: sub_code_34A0+51j
					; sub_code_34A0+58j ...
		inc	byte ptr ds:351Bh
		mov	ax, 5DCh
		mov	bx, 425h
		call	sub_code_593B
		cmp	byte ptr ds:351Bh, 1
		jnz	short loc_code_3586
		call	sub_code_11E3

loc_code_3586:				; CODE XREF: sub_code_34A0+E1j
		mov	bx, ds:3511h
		call	sub_code_37C1
		mov	bx, ds:3511h
		mov	byte ptr [bx+34A7h], 1
		cmp	bx, 0Ch
		jnb	short loc_code_35AD
		dec	byte ptr ds:3410h
		jnz	short loc_code_35AD
		cmp	byte ptr ds:5F3h, 0
		jnz	short loc_code_35AD
		mov	byte ptr ds:553h, 1

loc_code_35AD:				; CODE XREF: sub_code_34A0:loc_code_34B6j
					; sub_code_34A0+F9j ...
		inc	word ptr ds:3511h
		cmp	word ptr ds:3511h, 18h
		jnb	short loc_code_35BB
		jmp	loc_code_34AB
; ---------------------------------------------------------------------------

loc_code_35BB:				; CODE XREF: sub_code_34A0+116j
		cmp	byte ptr ds:351Bh, 0
		jz	short loc_code_35C7
		call	sub_code_363D
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_35C7:				; CODE XREF: sub_code_34A0+120j
		clc
		retn
sub_code_34A0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_35C9	proc near		; CODE XREF: start+465p
		mov	word ptr ds:3411h, 0
		mov	word ptr ds:3415h, 0
		mov	byte ptr ds:3410h, 0Ch
		mov	cx, 18h

loc_code_35DD:				; CODE XREF: sub_code_35C9+47j
		mov	bx, cx
		dec	bx
		mov	byte ptr [bx+348Fh], 1
		mov	byte ptr [bx+34A7h], 0
		mov	al, [bx+34F1h]
		mov	[bx+3477h], al
		mov	byte ptr [bx+342Fh], 1
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_3601
		not	dl

loc_code_3601:				; CODE XREF: sub_code_35C9+34j
		mov	[bx+3417h], dl
		shl	bx, 1
		call	sub_code_2DFD
		sub	dh, dh
		mov	[bx+3447h], dx
		loop	loc_code_35DD
		mov	bx, ds:8
		mov	cl, [bx+351Ch]
		sub	ch, ch

loc_code_361C:				; CODE XREF: sub_code_35C9+5Cj
					; sub_code_35C9+6Aj ...
		call	sub_code_2DFD
		and	dl, 0Fh
		cmp	dl, 0Ch
		jnb	short loc_code_361C
		mov	bl, dl
		add	bl, 0Ch
		sub	bh, bh
		cmp	byte ptr [bx+34A7h], 0
		jnz	short loc_code_361C
		mov	byte ptr [bx+34A7h], 1
		loop	loc_code_361C
		retn
sub_code_35C9	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_363D	proc near		; CODE XREF: sub_code_34A0+122p
					; sub_code_363D+32j
		mov	cx, 0Ch

loc_code_3640:				; CODE XREF: sub_code_363D:loc_code_3672j
		mov	bx, cx
		add	bx, 0Bh
		cmp	byte ptr [bx+34A7h], 0
		jz	short loc_code_3672
		sub	ax, ax
		mov	dl, 1
		mov	[bx+34A7h], al
		cmp	word ptr ds:579h, 0A0h ; '�'
		ja	short loc_code_3661
		mov	ax, 12Eh
		mov	dl, 0FFh

loc_code_3661:				; CODE XREF: sub_code_363D+1Dj
		mov	[bx+3417h], dl
		shl	bl, 1
		mov	[bx+3447h], ax
		dec	byte ptr ds:351Bh
		jnz	short sub_code_363D
		retn
; ---------------------------------------------------------------------------

loc_code_3672:				; CODE XREF: sub_code_363D+Dj
		loop	loc_code_3640
		retn
sub_code_363D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3675	proc near		; CODE XREF: start+484p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:3509h
		jnz	short loc_code_3680

locret_code_367F:			; CODE XREF: sub_code_3675+51j
		retn
; ---------------------------------------------------------------------------

loc_code_3680:				; CODE XREF: sub_code_3675+8j
		mov	ds:350Bh, dx
		inc	word ptr ds:3415h
		mov	bx, ds:3415h
		cmp	bx, 18h
		jb	short loc_code_36A4
		sub	bx, bx
		mov	ds:3415h, bx
		xor	word ptr ds:3411h, 0Ch
		add	word ptr ds:3413h, 8
		jmp	short loc_code_36B7
; ---------------------------------------------------------------------------

loc_code_36A4:				; CODE XREF: sub_code_3675+1Aj
		cmp	bx, 0Ch
		jnz	short loc_code_36BD
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_36B7
		cmp	byte ptr ds:57Bh, 30h ;	'0'
		jb	short loc_code_36BD

loc_code_36B7:				; CODE XREF: sub_code_3675+2Dj
					; sub_code_3675+39j
		mov	ax, ds:350Bh
		mov	ds:3509h, ax

loc_code_36BD:				; CODE XREF: sub_code_3675+32j
					; sub_code_3675+40j
		mov	si, bx
		shl	si, 1
		cmp	byte ptr [bx+34A7h], 0
		jnz	short locret_code_367F
		call	sub_code_2DFD
		cmp	dl, 10h
		ja	short loc_code_36E9
		and	dl, 1
		jnz	short loc_code_36D7
		not	dl

loc_code_36D7:				; CODE XREF: sub_code_3675+5Ej
		mov	[bx+3417h], dl
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_36E5
		not	dl

loc_code_36E5:				; CODE XREF: sub_code_3675+6Cj
		mov	[bx+342Fh], dl

loc_code_36E9:				; CODE XREF: sub_code_3675+59j
		mov	cx, 4
		cmp	bx, 0Ch
		jb	short loc_code_36F3
		shr	cl, 1

loc_code_36F3:				; CODE XREF: sub_code_3675+7Aj
		mov	ax, [si+3447h]
		cmp	byte ptr [bx+3417h], 1
		jz	short loc_code_370B
		sub	ax, cx
		jnb	short loc_code_371A
		sub	ax, ax
		mov	byte ptr [bx+3417h], 1
		jmp	short loc_code_371A
; ---------------------------------------------------------------------------

loc_code_370B:				; CODE XREF: sub_code_3675+87j
		add	ax, cx
		cmp	ax, 12Fh
		jb	short loc_code_371A
		mov	ax, 12Eh
		mov	byte ptr [bx+3417h], 0FFh

loc_code_371A:				; CODE XREF: sub_code_3675+8Bj
					; sub_code_3675+94j ...
		mov	[si+3447h], ax
		mov	al, [bx+3477h]
		cmp	byte ptr [bx+342Fh], 1
		jz	short loc_code_373C
		dec	al
		cmp	al, [bx+34F1h]
		jnb	short loc_code_3750
		mov	al, [bx+34F1h]
		mov	byte ptr [bx+342Fh], 1
		jmp	short loc_code_3750
; ---------------------------------------------------------------------------

loc_code_373C:				; CODE XREF: sub_code_3675+B2j
		inc	al
		mov	dl, [bx+34F1h]
		add	dl, 18h
		cmp	al, dl
		jbe	short loc_code_3750
		mov	al, dl
		mov	byte ptr [bx+342Fh], 0FFh

loc_code_3750:				; CODE XREF: sub_code_3675+BAj
					; sub_code_3675+C5j ...
		mov	[bx+3477h], al
		mov	dl, al
		mov	cx, [si+3447h]
		call	sub_code_2CB0
		mov	ds:34EFh, ax
		mov	bx, ds:3415h
		call	sub_code_37C1
		mov	bx, ds:3415h
		mov	si, bx
		shl	si, 1
		mov	di, ds:34EFh
		mov	[si+34BFh], di
		mov	byte ptr [bx+348Fh], 0
		mov	ax, 0B800h
		mov	es, ax
		cmp	bx, 0Ch
		jb	short loc_code_379F
		mov	si, bx
		mov	cl, 3
		shl	si, cl
		add	si, ds:3413h
		and	si, 18h
		add	si, 3330h
		mov	cx, 202h
		call	sub_code_2D9D
		retn
; ---------------------------------------------------------------------------

loc_code_379F:				; CODE XREF: sub_code_3675+10Fj
		mov	si, ds:3411h
		test	bl, 1
		jnz	short loc_code_37AC
		xor	si, 0Ch

loc_code_37AC:				; CODE XREF: sub_code_3675+131j
		cmp	byte ptr [bx+3417h], 1
		jz	short loc_code_37B6
		add	si, 18h

loc_code_37B6:				; CODE XREF: sub_code_3675+13Cj
		add	si, 3300h
		mov	cx, 601h
		call	sub_code_2D9D
		retn
sub_code_3675	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_37C1	proc near		; CODE XREF: sub_code_34A0+EAp
					; sub_code_3675+EFp
		cmp	byte ptr [bx+348Fh], 0
		jnz	short locret_code_37E4
		shl	bx, 1
		mov	si, 3404h
		mov	di, [bx+34BFh]
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 601h
		cmp	bx, 18h
		jb	short loc_code_37E1
		mov	cx, 202h

loc_code_37E1:				; CODE XREF: sub_code_37C1+1Bj
		call	sub_code_2D9D

locret_code_37E4:			; CODE XREF: sub_code_37C1+5j
		retn
sub_code_37C1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_37E5	proc near		; CODE XREF: start+487p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:350Fh
		cmp	ax, 8
		jb	short locret_code_384A
		inc	word ptr ds:350Dh
		mov	bx, ds:350Dh
		cmp	bx, 28h	; '('
		jb	short loc_code_380B
		sub	bx, bx
		mov	ds:350Dh, bx
		mov	ds:350Fh, dx

loc_code_380B:				; CODE XREF: sub_code_37E5+1Aj
		mov	di, bx
		shl	di, 1
		cmp	byte ptr ds:57Bh, 7
		ja	short loc_code_3829
		mov	ax, ds:579h
		mov	cl, 2
		shr	ax, cl
		inc	ax
		sub	ax, di
		jnb	short loc_code_3824
		not	ax

loc_code_3824:				; CODE XREF: sub_code_37E5+3Bj
		cmp	ax, 4
		jb	short locret_code_384A

loc_code_3829:				; CODE XREF: sub_code_37E5+2Fj
		add	di, 0A0h ; '�'
		mov	al, [bx+2656h]
		add	al, 8
		mov	[bx+2656h], al
		and	ax, 18h
		add	ax, 2020h
		mov	si, ax
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 401h
		call	sub_code_2D9D

locret_code_384A:			; CODE XREF: sub_code_37E5+Dj
					; sub_code_37E5+42j
		retn
sub_code_37E5	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_3850	proc near		; CODE XREF: start+40Cp
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:35DAh
		cmp	ax, 6
		jnb	short loc_code_3860
		retn
; ---------------------------------------------------------------------------

loc_code_3860:				; CODE XREF: sub_code_3850+Dj
		mov	ds:35DAh, dx
		add	word ptr ds:35D8h, 2
		mov	bx, ds:35D8h
		and	bx, 6
		mov	si, [bx+35D0h]
		mov	di, 15C9h
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 0A02h
		call	sub_code_2D9D
		mov	ax, 0E4h ; '�'
		mov	dl, 8Ah	; '�'
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E0Ah
		call	sub_code_2E29
		jnb	short locret_code_38A3
		mov	byte ptr ds:554h, 1

locret_code_38A3:			; CODE XREF: sub_code_3850+4Cj
		retn
sub_code_3850	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_38B0	proc near		; CODE XREF: sub_code_1BF0:loc_code_1C41p
					; sub_code_5060+D8p
		cmp	word ptr ds:6, 7
		jnz	short loc_code_38BA
		jmp	short loc_code_38D3
; ---------------------------------------------------------------------------
		nop

loc_code_38BA:				; CODE XREF: sub_code_38B0+5j
		inc	word ptr ds:414h
		mov	byte ptr ds:418h, 1
		mov	dx, 0AAAAh
		call	sub_code_3A96
		sub	ax, ax
		mov	byte ptr ds:369Fh, 0
		call	sub_code_3AAC

loc_code_38D3:				; CODE XREF: sub_code_38B0+7j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	word ptr ds:6, 7
		jnz	short loc_code_38EF
		sub	dx, ds:412h
		mov	ax, 2A30h
		sub	ax, dx
		jnb	short loc_code_38EB
		sub	ax, ax

loc_code_38EB:				; CODE XREF: sub_code_38B0+37j
		shr	ax, 1
		jmp	short loc_code_390E
; ---------------------------------------------------------------------------

loc_code_38EF:				; CODE XREF: sub_code_38B0+2Cj
		sub	dx, ds:410h
		mov	ax, 546h
		cmp	word ptr ds:6, 6
		jnz	short loc_code_38FF
		shl	ax, 1

loc_code_38FF:				; CODE XREF: sub_code_38B0+4Bj
		sub	ax, dx
		jnb	short loc_code_3905
		sub	ax, ax

loc_code_3905:				; CODE XREF: sub_code_38B0+51j
		cmp	word ptr ds:6, 6
		jz	short loc_code_390E
		shl	ax, 1

loc_code_390E:				; CODE XREF: sub_code_38B0+3Dj
					; sub_code_38B0+5Aj
		mov	ds:3697h, ax
		call	sub_code_3AF4
		mov	bx, ds:6
		shl	bl, 1
		mov	si, [bx+36CCh]
		mov	di, 368Dh
		call	sub_code_271E
		cmp	word ptr ds:6, 7
		jnz	short loc_code_396E
		mov	bx, ds:8
		shl	bl, 1
		mov	ax, bx
		mov	cx, [bx+36DCh]
		cmp	word ptr ds:2E8Dh, 8
		jnb	short loc_code_3943
		shl	cx, 1
		add	ax, 10h

loc_code_3943:				; CODE XREF: sub_code_38B0+8Cj
		mov	ds:370Ch, ax

loc_code_3946:				; CODE XREF: sub_code_38B0+A1j
		mov	si, 368Dh
		mov	di, 1F82h
		push	cx
		call	sub_code_271E
		pop	cx
		loop	loc_code_3946
		call	sub_code_39FA
		mov	byte ptr ds:369Eh, 38h ; '8'
		mov	byte ptr ds:3699h, 1
		mov	word ptr ds:3722h, 44h ; 'D'
		call	sub_code_3A3A
		call	sub_code_3A6C
		jmp	short loc_code_39A7
; ---------------------------------------------------------------------------

loc_code_396E:				; CODE XREF: sub_code_38B0+79j
		mov	si, 368Dh
		mov	di, 1F82h
		call	sub_code_271E
		mov	byte ptr ds:3699h, 2
		mov	word ptr ds:3722h, 1Eh
		mov	dx, 0FFFFh
		call	sub_code_3A96
		mov	ax, 0A8Ch
		sub	ax, ds:3697h
		mov	cl, 4
		shr	ax, cl
		and	al, 0F0h
		mov	ds:369Eh, al
		mov	ah, 28h	; '('
		mul	ah
		mov	byte ptr ds:369Fh, 1
		call	sub_code_3AAC
		call	sub_code_3A3A

loc_code_39A7:				; CODE XREF: sub_code_38B0+BCj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:3695h, dx

loc_code_39AF:				; CODE XREF: sub_code_38B0+119j
		cmp	word ptr ds:6, 7
		jnz	short loc_code_39BB
		call	sub_code_5B63
		jmp	short loc_code_39BE
; ---------------------------------------------------------------------------

loc_code_39BB:				; CODE XREF: sub_code_38B0+104j
		call	sub_code_5835

loc_code_39BE:				; CODE XREF: sub_code_38B0+109j
		call	sub_code_3A1C
		sub	dx, ds:3695h
		cmp	dx, ds:3722h
		jb	short loc_code_39AF
		sub	bx, bx
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		cmp	word ptr ds:6, 7
		jz	short loc_code_39DC
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_39DC:				; CODE XREF: sub_code_38B0+126j
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 0Eh
		mov	di, 8E4h
		mov	cx, 804h
		call	sub_code_2D9D
		mov	si, 4Eh	; 'N'
		mov	di, 0C94h
		mov	cx, 814h
		call	sub_code_2D9D
		retn
sub_code_38B0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_39FA	proc near		; CODE XREF: sub_code_38B0+A3p
		push	ds
		pop	es
		assume es:nothing
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	cx, 804h
		mov	di, 0Eh
		mov	si, 8E4h
		call	sub_code_2DCA
		mov	cx, 814h
		mov	di, 4Eh	; 'N'
		mov	si, 0C94h
		call	sub_code_2DCA
		push	es
		pop	ds
		assume ds:nothing
		retn
sub_code_39FA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3A1C	proc near		; CODE XREF: sub_code_38B0:loc_code_39BEp
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		push	dx

loc_code_3A21:				; CODE XREF: sub_code_3A1C+8j
		call	sub_code_13D8
		jz	short loc_code_3A21
		pop	dx
		push	dx
		sub	bx, bx
		test	dx, 4
		jnz	short loc_code_3A34
		mov	bl, ds:3699h

loc_code_3A34:				; CODE XREF: sub_code_3A1C+12j
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		pop	dx
		retn
sub_code_3A1C	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3A3A	proc near		; CODE XREF: sub_code_38B0+B6p
					; sub_code_38B0+F4p
		mov	ah, 2
		mov	dh, ds:369Eh
		mov	cl, 3
		shr	dh, cl
		mov	dl, 12h
		sub	bh, bh
		int	10h		; - VIDEO - SET	CURSOR POSITION
					; DH,DL	= row, column (0,0 = upper left)
					; BH = page number
		mov	word ptr ds:36A0h, 3

loc_code_3A50:				; CODE XREF: sub_code_3A3A+2Fj
		mov	bx, ds:36A0h
		mov	al, [bx+368Dh]
		add	al, 30h	; '0'
		mov	ah, 0Eh
		mov	bl, 3
		int	10h		; - VIDEO - WRITE CHARACTER AND	ADVANCE	CURSOR (TTY WRITE)
					; AL = character, BH = display page (alpha modes)
					; BL = foreground color	(graphics modes)
		inc	word ptr ds:36A0h
		cmp	word ptr ds:36A0h, 7
		jb	short loc_code_3A50
		retn
sub_code_3A3A	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3A6C	proc near		; CODE XREF: sub_code_38B0+B9p
		mov	ah, 2
		mov	dl, 0Ah
		mov	dh, dl
		sub	bx, bx
		int	10h		; - VIDEO - SET	CURSOR POSITION
					; DH,DL	= row, column (0,0 = upper left)
					; BH = page number
		mov	bx, ds:370Ch
		mov	ax, [bx+36ECh]
		mov	ds:3720h, ax
		sub	bx, bx

loc_code_3A83:				; CODE XREF: sub_code_3A6C+27j
		mov	ah, 0Eh
		mov	al, [bx+370Eh]
		push	bx
		mov	bl, 3
		int	10h		; - VIDEO - WRITE CHARACTER AND	ADVANCE	CURSOR (TTY WRITE)
					; AL = character, BH = display page (alpha modes)
					; BL = foreground color	(graphics modes)
		pop	bx
		inc	bx
		cmp	bx, 14h
		jb	short loc_code_3A83
		retn
sub_code_3A6C	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3A96	proc near		; CODE XREF: sub_code_38B0+16p
					; sub_code_38B0+D5p
		cld
		mov	ax, seg	data
		mov	es, ax
		assume es:data
		mov	di, 0Eh
		mov	si, 35E0h
		mov	cx, 1Eh

loc_code_3AA5:				; CODE XREF: sub_code_3A96+13j
		lodsw
		and	ax, dx
		stosw
		loop	loc_code_3AA5
		retn
sub_code_3A96	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3AAC	proc near		; CODE XREF: sub_code_38B0+20p
					; sub_code_38B0+F1p
		mov	ds:369Ah, ax
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		call	sub_code_5829
		mov	ax, 1B80h

loc_code_3ABA:				; CODE XREF: sub_code_3AAC+42j
		mov	bx, 361Ch
		mov	ds:369Ch, ax
		call	sub_code_2B24
		cmp	byte ptr ds:369Fh, 0
		jz	short loc_code_3AE2
		call	sub_code_5869
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:3695h, dx

loc_code_3AD5:				; CODE XREF: sub_code_3AAC+34j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:3695h
		cmp	dx, 2
		jb	short loc_code_3AD5

loc_code_3AE2:				; CODE XREF: sub_code_3AAC+1Cj
		mov	ax, ds:369Ch
		sub	ax, 280h
		jb	short loc_code_3AF0
		cmp	ax, ds:369Ah
		jnb	short loc_code_3ABA

loc_code_3AF0:				; CODE XREF: sub_code_3AAC+3Cj
		call	sub_code_5B21
		retn
sub_code_3AAC	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3AF4	proc near		; CODE XREF: sub_code_38B0+61p
		mov	ds:368Bh, ax
		sub	ax, ax
		mov	ds:368Dh, ax
		mov	ds:368Fh, ax
		mov	ds:3691h, ax
		mov	ds:3693h, ax
		mov	bx, 3684h
		mov	dx, 1000h

loc_code_3B0B:				; CODE XREF: sub_code_3AF4+2Aj
		test	ds:368Bh, dx
		jz	short loc_code_3B19
		mov	si, bx
		mov	di, 368Dh
		call	sub_code_271E

loc_code_3B19:				; CODE XREF: sub_code_3AF4+1Bj
		sub	bx, 7
		shr	dx, 1
		jnb	short loc_code_3B0B
		retn
sub_code_3AF4	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_3B30	proc near		; CODE XREF: start+3A9p
		mov	byte ptr ds:37AFh, 3
		mov	ax, 1
		mov	ds:37B0h, ax
		mov	ds:37B2h, ax
		mov	ds:37B4h, ax
		retn
sub_code_3B30	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3B42	proc near		; CODE XREF: start+3C1p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:37B8h
		jnz	short loc_code_3B4D
		retn
; ---------------------------------------------------------------------------

loc_code_3B4D:				; CODE XREF: sub_code_3B42+8j
		mov	ds:37B8h, dx
		mov	word ptr ds:37B6h, 4

loc_code_3B57:				; CODE XREF: sub_code_3B42+5Ej
		mov	bx, ds:37B6h
		cmp	word ptr [bx+37B0h], 0
		jz	short loc_code_3B9B
		mov	ax, [bx+37A3h]
		mov	dl, 18h
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E10h
		call	sub_code_2E29
		jnb	short loc_code_3B9B
		mov	ax, 0C00h
		mov	bx, 8FDh
		call	sub_code_593B
		call	sub_code_11E3
		call	sub_code_3E38
		mov	bx, ds:37B6h
		call	sub_code_3BA3
		call	sub_code_1124
		call	sub_code_3E14
		retn
; ---------------------------------------------------------------------------

loc_code_3B9B:				; CODE XREF: sub_code_3B42+1Ej
					; sub_code_3B42+3Aj
		sub	word ptr ds:37B6h, 2
		jnb	short loc_code_3B57
		retn
sub_code_3B42	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3BA3	proc near		; CODE XREF: sub_code_3B42+4Fp
		mov	word ptr [bx+37B0h], 0
		push	ds
		pop	es
		assume es:nothing
		cld
		mov	ax, 0AAAAh
		mov	di, 0Eh
		mov	si, di
		mov	cx, 20h	; ' '
		rep stosw
		mov	di, [bx+37A9h]
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	cx, 1002h
		call	sub_code_2D9D
		dec	byte ptr ds:37AFh
		jnz	short locret_code_3BDA
		cmp	byte ptr ds:552h, 0
		jnz	short locret_code_3BDA
		mov	byte ptr ds:553h, 1

locret_code_3BDA:			; CODE XREF: sub_code_3BA3+29j
					; sub_code_3BA3+30j
		retn
sub_code_3BA3	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3BDB	proc near		; CODE XREF: sub_code_2790+175p
		mov	ax, 0B800h
		mov	es, ax
		mov	word ptr ds:37A0h, 66Ah
		mov	cx, 10h

loc_code_3BE9:				; CODE XREF: sub_code_3BDB+40j
		sub	ax, ax
		mov	bx, ax

loc_code_3BED:				; CODE XREF: sub_code_3BDB+38j
					; sub_code_3BDB+59j ...
		mov	ds:37A2h, al
		sub	ah, ah
		add	ax, 3730h
		mov	si, ax
		mov	di, ds:37A0h
		add	di, bx
		push	cx
		mov	cx, 801h
		push	bx
		call	sub_code_2D9D
		pop	bx
		pop	cx
		add	bx, 2
		cmp	bx, 1Eh
		jb	short loc_code_3C1E
		jnz	short loc_code_3C15
		mov	al, 20h	; ' '
		jmp	short loc_code_3BED
; ---------------------------------------------------------------------------

loc_code_3C15:				; CODE XREF: sub_code_3BDB+34j
		add	word ptr ds:37A0h, 140h
		loop	loc_code_3BE9
		retn
; ---------------------------------------------------------------------------

loc_code_3C1E:				; CODE XREF: sub_code_3BDB+32j
		cmp	byte ptr ds:37A2h, 50h ; 'P'
		jz	short loc_code_3C36
		test	cl, 1
		jnz	short loc_code_3C36
		call	sub_code_2DFD
		cmp	dl, 40h	; '@'
		jb	short loc_code_3C36
		mov	al, 10h
		jmp	short loc_code_3BED
; ---------------------------------------------------------------------------

loc_code_3C36:				; CODE XREF: sub_code_3BDB+48j
					; sub_code_3BDB+4Dj ...
		call	sub_code_2DFD
		mov	al, dl
		sub	al, bl
		and	al, 30h
		add	al, 30h	; '0'
		jmp	short loc_code_3BED
sub_code_3BDB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3C43	proc near		; CODE XREF: sub_code_16C6+3Dp
		mov	ax, ds:579h
		and	ax, 0FFFCh
		cmp	ax, 0A4h ; '�'
		jb	short loc_code_3C7F
		cmp	ax, 118h
		ja	short loc_code_3C7F
		mov	dl, ds:57Bh
		sub	dl, 2
		and	dl, 0F8h
		test	dl, 8
		jz	short loc_code_3C7F
		cmp	dl, 28h	; '('
		jb	short loc_code_3C7F
		cmp	dl, 0A0h ; '�'
		ja	short loc_code_3C7F
		mov	ds:579h, ax
		add	dl, 2
		mov	ds:57Bh, dl
		add	dl, 32h	; '2'
		mov	ds:57Ch, dl
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_3C7F:				; CODE XREF: sub_code_3C43+9j
					; sub_code_3C43+Ej ...
		clc
		retn
sub_code_3C43	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_3C90	proc near		; CODE XREF: start+3ACp
		mov	byte ptr ds:3966h, 8
		mov	byte ptr ds:396Ah, 1
		mov	byte ptr ds:3967h, 0
		mov	byte ptr ds:396Dh, 2
		mov	word ptr ds:3964h, 118h
		mov	word ptr ds:396Bh, 0
		retn
sub_code_3C90	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3CB1	proc near		; CODE XREF: start+3BEp
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:39C8h
		cmp	ax, 2
		jnb	short loc_code_3CC1

locret_code_3CC0:			; CODE XREF: sub_code_3CB1+17j
		retn
; ---------------------------------------------------------------------------

loc_code_3CC1:				; CODE XREF: sub_code_3CB1+Dj
		mov	ds:39C8h, dx
		call	sub_code_3E52
		jb	short locret_code_3CC0
		call	sub_code_3E6E
		jnb	short loc_code_3CD2
		jmp	loc_code_3D90
; ---------------------------------------------------------------------------

loc_code_3CD2:				; CODE XREF: sub_code_3CB1+1Cj
		mov	bx, ds:8
		shl	bl, 1
		mov	ax, [bx+39CCh]
		mov	ds:39C6h, ax
		mov	ax, ds:3964h
		mov	ds:39C3h, ax
		mov	dl, ds:3966h
		mov	ds:39C5h, dl
		cmp	dl, 8
		jnz	short loc_code_3D25
		and	ax, 0FFF8h
		mov	dx, ds:579h
		and	dx, 0FFF8h
		cmp	ax, dx
		jnz	short loc_code_3D0D
		mov	byte ptr ds:3967h, 1
		mov	byte ptr ds:396Eh, 1
		jmp	short loc_code_3D25
; ---------------------------------------------------------------------------

loc_code_3D0D:				; CODE XREF: sub_code_3CB1+4Ej
		mov	ax, ds:3964h
		jb	short loc_code_3D1C
		sub	ax, ds:39C6h
		jnb	short loc_code_3D20
		sub	ax, ax
		jmp	short loc_code_3D20
; ---------------------------------------------------------------------------

loc_code_3D1C:				; CODE XREF: sub_code_3CB1+5Fj
		add	ax, ds:39C6h

loc_code_3D20:				; CODE XREF: sub_code_3CB1+65j
					; sub_code_3CB1+69j
		mov	ds:3964h, ax
		jmp	short loc_code_3D79
; ---------------------------------------------------------------------------

loc_code_3D25:				; CODE XREF: sub_code_3CB1+3Fj
					; sub_code_3CB1+5Aj
		mov	al, ds:3966h
		inc	byte ptr ds:396Eh
		mov	dl, ds:396Eh
		shr	dl, 1
		shr	dl, 1
		and	dl, 3
		add	dl, 2
		cmp	byte ptr ds:3967h, 1
		jz	short loc_code_3D52
		sub	al, dl
		jb	short loc_code_3D49
		cmp	al, 9
		jnb	short loc_code_3D76

loc_code_3D49:				; CODE XREF: sub_code_3CB1+92j
		mov	al, 8
		mov	byte ptr ds:3967h, 0
		jmp	short loc_code_3D76
; ---------------------------------------------------------------------------

loc_code_3D52:				; CODE XREF: sub_code_3CB1+8Ej
		add	al, dl
		cmp	al, ds:57Bh
		ja	short loc_code_3D71
		mov	bx, ds:3964h
		sub	bx, ds:579h
		jnb	short loc_code_3D66
		not	bx

loc_code_3D66:				; CODE XREF: sub_code_3CB1+B1j
		cmp	bx, 30h	; '0'
		ja	short loc_code_3D71
		cmp	al, 0A0h ; '�'
		jb	short loc_code_3D76
		mov	al, 9Fh	; '�'

loc_code_3D71:				; CODE XREF: sub_code_3CB1+A7j
					; sub_code_3CB1+B8j
		mov	byte ptr ds:3967h, 0FFh

loc_code_3D76:				; CODE XREF: sub_code_3CB1+96j
					; sub_code_3CB1+9Fj ...
		mov	ds:3966h, al

loc_code_3D79:				; CODE XREF: sub_code_3CB1+72j
		call	sub_code_3E52
		jnb	short loc_code_3D8B
		mov	ax, ds:39C3h
		mov	ds:3964h, ax
		mov	al, ds:39C5h
		mov	ds:3966h, al
		retn
; ---------------------------------------------------------------------------

loc_code_3D8B:				; CODE XREF: sub_code_3CB1+CBj
		call	sub_code_3E6E
		jnb	short loc_code_3DEE

loc_code_3D90:				; CODE XREF: sub_code_3CB1+1Ej
		cmp	byte ptr ds:553h, 0
		jz	short loc_code_3D98
		retn
; ---------------------------------------------------------------------------

loc_code_3D98:				; CODE XREF: sub_code_3CB1+E4j
		mov	cx, ds:579h
		sub	cx, 0Ch
		jnb	short loc_code_3DA3
		sub	cx, cx

loc_code_3DA3:				; CODE XREF: sub_code_3CB1+EEj
		cmp	cx, 10Fh
		jb	short loc_code_3DAC
		mov	cx, 10Eh

loc_code_3DAC:				; CODE XREF: sub_code_3CB1+F6j
		mov	dl, ds:57Bh
		sub	dl, 4
		jnb	short loc_code_3DB7
		sub	dl, dl

loc_code_3DB7:				; CODE XREF: sub_code_3CB1+102j
		call	sub_code_2CB0
		mov	di, ax
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 37C0h
		mov	bp, 0Eh
		mov	cx, 1506h
		call	sub_code_2CCC
		call	sub_code_56F4
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:39C8h, dx

loc_code_3DD8:				; CODE XREF: sub_code_3CB1+135j
		call	sub_code_5704
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:39C8h
		cmp	dx, 9
		jb	short loc_code_3DD8
		mov	byte ptr ds:552h, 1
		retn
; ---------------------------------------------------------------------------

loc_code_3DEE:				; CODE XREF: sub_code_3CB1+DDj
		mov	cx, ds:3964h
		mov	dl, ds:3966h
		call	sub_code_2CB0
		mov	ds:39CAh, ax
		call	sub_code_3E38
		dec	byte ptr ds:396Dh
		jnz	short loc_code_3E10
		mov	byte ptr ds:396Dh, 2
		xor	word ptr ds:396Bh, 54h

loc_code_3E10:				; CODE XREF: sub_code_3CB1+152j
		call	sub_code_3E14
		retn
sub_code_3CB1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3E14	proc near		; CODE XREF: sub_code_3B42+55p
					; sub_code_3CB1:loc_code_3E10p
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:39CAh
		mov	ds:3968h, di
		mov	bp, 396Fh
		mov	byte ptr ds:396Ah, 0
		mov	si, ds:396Bh
		add	si, 38BCh
		mov	cx, 0E03h
		call	sub_code_2CCC
		retn
sub_code_3E14	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3E38	proc near		; CODE XREF: sub_code_3B42+48p
					; sub_code_3CB1+14Bp
		mov	ax, 0B800h
		mov	es, ax
		cmp	byte ptr ds:396Ah, 0
		jnz	short locret_code_3E51
		mov	di, ds:3968h
		mov	si, 396Fh
		mov	cx, 0E03h
		call	sub_code_2D9D

locret_code_3E51:			; CODE XREF: sub_code_3E38+Aj
		retn
sub_code_3E38	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3E52	proc near		; CODE XREF: sub_code_3CB1+14p
					; sub_code_3CB1:loc_code_3D79p
		mov	ax, ds:3964h
		mov	dl, ds:3966h
		mov	si, 18h
		mov	bx, ds:327Dh
		mov	dh, ds:327Fh
		mov	di, 10h
		mov	cx, 1E0Eh
		call	sub_code_2E29
		retn
sub_code_3E52	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3E6E	proc near		; CODE XREF: sub_code_3CB1+19p
					; sub_code_3CB1:loc_code_3D8Bp
		mov	ax, ds:3964h
		mov	dl, ds:3966h
		mov	si, 18h
		mov	di, si
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	cx, 0E0Eh
		call	sub_code_2E29
		retn
sub_code_3E6E	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_3E90	proc near		; CODE XREF: start+370p
		cmp	byte ptr ds:39E1h, 0
		jz	short loc_code_3EA4
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:3D16h
		jz	short locret_code_3EB9
		jmp	loc_code_3F35
; ---------------------------------------------------------------------------

loc_code_3EA4:				; CODE XREF: sub_code_3E90+5j
		cmp	byte ptr ds:584h, 0
		jnz	short locret_code_3EB9
		cmp	byte ptr ds:69Ah, 0
		jnz	short locret_code_3EB9
		cmp	byte ptr ds:39E0h, 0
		jnz	short loc_code_3EBA

locret_code_3EB9:			; CODE XREF: sub_code_3E90+Fj
					; sub_code_3E90+19j ...
		retn
; ---------------------------------------------------------------------------

loc_code_3EBA:				; CODE XREF: sub_code_3E90+27j
		call	sub_code_4065
		jb	short locret_code_3EB9
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:3D18h
		cmp	ax, 0Ch
		jb	short locret_code_3EB9
		mov	ds:3D18h, dx
		mov	byte ptr ds:55Ch, 0
		mov	bl, ds:39E0h
		dec	bl
		sub	bh, bh
		mov	si, bx
		mov	cl, 2
		shl	si, cl
		mov	ax, [si+3C5Ah]
		mov	ds:39E2h, ax
		sub	ax, ax
		cmp	bl, 3
		jnb	short loc_code_3EF5
		mov	al, 80h	; '�'

loc_code_3EF5:				; CODE XREF: sub_code_3E90+61j
		mov	ds:39E4h, ax
		mov	bl, [bx+3CE3h]
		mov	si, bx
		mov	cl, 2
		shl	si, cl
		mov	ax, [si+3C5Ah]
		mov	ds:39E6h, ax
		sub	ax, ax
		cmp	bl, 3
		jnb	short loc_code_3F12
		mov	al, 80h	; '�'

loc_code_3F12:				; CODE XREF: sub_code_3E90+7Ej
		mov	ds:39E8h, ax
		mov	al, [bx+1050h]
		mov	ds:3D05h, al
		shl	bl, 1
		mov	ax, [bx+1137h]
		add	ax, 8
		mov	ds:3D03h, ax
		call	sub_code_11E3
		mov	byte ptr ds:39E1h, 0Eh
		mov	byte ptr ds:69Ah, 10h

loc_code_3F35:				; CODE XREF: sub_code_3E90+11j
		cmp	byte ptr ds:1CBFh, 0
		jnz	short loc_code_3F3F
		call	sub_code_33A0

loc_code_3F3F:				; CODE XREF: sub_code_3E90+AAj
		sub	byte ptr ds:39E1h, 2
		sub	bh, bh
		mov	bl, ds:39E1h
		cmp	bl, 8
		jb	short loc_code_3F58
		mov	di, ds:39E2h
		mov	ax, ds:39E4h
		jmp	short loc_code_3F70
; ---------------------------------------------------------------------------

loc_code_3F58:				; CODE XREF: sub_code_3E90+BDj
		mov	di, ds:39E6h
		mov	al, ds:3D05h
		mov	ds:57Bh, al
		add	al, 32h	; '2'
		mov	ds:57Ch, al
		mov	ax, ds:3D03h
		mov	ds:579h, ax
		mov	ax, ds:39E8h

loc_code_3F70:				; CODE XREF: sub_code_3E90+C6j
		add	ax, [bx+3D06h]
		mov	si, ax
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 1002h
		call	sub_code_2D9D
		cmp	byte ptr ds:1CBFh, 0
		jnz	short loc_code_3F8B
		call	sub_code_3339

loc_code_3F8B:				; CODE XREF: sub_code_3E90+F6j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:3D16h, dx
		cmp	byte ptr ds:39E1h, 0
		jnz	short locret_code_3F9D
		call	sub_code_1112

locret_code_3F9D:			; CODE XREF: sub_code_3E90+108j
		retn
sub_code_3E90	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_3F9E	proc near		; CODE XREF: sub_code_2790+12Ap
		mov	ax, 0B800h
		mov	es, ax
		mov	byte ptr ds:39E0h, 0
		mov	byte ptr ds:39E1h, 0
		mov	word ptr ds:3CBFh, 506h
		mov	word ptr ds:3CC1h, 0

loc_code_3FB9:				; CODE XREF: sub_code_3F9E+61j
		mov	bx, ds:3CC1h
		mov	cl, [bx+3CAEh]
		sub	bx, bx
		mov	ch, bl

loc_code_3FC5:				; CODE XREF: sub_code_3F9E+50j
		mov	si, 3AEAh
		call	sub_code_2DFD
		cmp	dl, 30h	; '0'
		ja	short loc_code_3FDB
		mov	si, 3AF8h
		test	dl, 4
		jnz	short loc_code_3FDB
		mov	si, 3B02h

loc_code_3FDB:				; CODE XREF: sub_code_3F9E+30j
					; sub_code_3F9E+38j
		mov	di, ds:3CBFh
		add	di, bx
		push	cx
		push	bx
		mov	cx, 801h
		call	sub_code_2D9D
		pop	bx
		pop	cx
		add	bx, 2
		loop	loc_code_3FC5
		add	word ptr ds:3CBFh, 140h
		inc	word ptr ds:3CC1h
		cmp	word ptr ds:3CC1h, 11h
		jb	short loc_code_3FB9
		mov	bx, 3C22h
		sub	ax, ax
		call	sub_code_2B24
		mov	bx, 3C3Eh
		sub	ax, ax
		call	sub_code_2B24
		mov	bx, 3C9Ah
		sub	ax, ax
		call	sub_code_2B24
		mov	bx, 3C56h
		sub	ax, ax
		call	sub_code_2B24
		mov	si, 3CAAh
		mov	di, 8ECh
		mov	cx, 102h
		mov	bp, 0Eh
		call	sub_code_2D35
		sub	si, si
		mov	bx, ds:8
		mov	cl, 3
		and	bl, cl
		shl	bl, cl

loc_code_403C:				; CODE XREF: sub_code_3F9E+C4j
		mov	al, [bx+3CC3h]
		mov	ah, al
		mov	cl, 4
		shr	al, cl
		mov	[si+3CE3h], al
		mov	byte ptr [si+3CF3h], 0
		and	ah, 0Fh
		mov	[si+3CE4h], ah
		mov	byte ptr [si+3CF4h], 0
		add	si, 2
		inc	bx
		cmp	si, 10h
		jb	short loc_code_403C
		retn
sub_code_3F9E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4065	proc near		; CODE XREF: sub_code_3E90:loc_code_3EBAp
		mov	ax, ds:327Dh
		mov	dl, ds:327Fh
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E1Eh
		call	sub_code_2E29
		retn
sub_code_4065	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_4090	proc near		; CODE XREF: start+35Ep
		mov	cx, 4

loc_code_4093:				; CODE XREF: sub_code_4090+24j
		mov	bx, cx
		dec	bx
		mov	si, bx
		shl	si, 1
		mov	byte ptr [bx+3EAEh], 1
		mov	byte ptr [bx+3EB2h], 0
		call	sub_code_4277
		call	sub_code_2DFD
		and	dl, 0Fh
		add	dl, 14h
		mov	[bx+3EB6h], dl
		loop	loc_code_4093
		mov	word ptr ds:3EDAh, 0
		mov	byte ptr ds:3ED8h, 4
		retn
sub_code_4090	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_40C2	proc near		; CODE XREF: start+373p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:3EDCh
		jnz	short loc_code_40CD

locret_code_40CC:			; CODE XREF: sub_code_40C2+30j
					; sub_code_40C2+3Dj
		retn
; ---------------------------------------------------------------------------

loc_code_40CD:				; CODE XREF: sub_code_40C2+8j
		inc	word ptr ds:3EDAh
		mov	bx, ds:3EDAh
		cmp	bx, 2
		jbe	short loc_code_40E5
		cmp	bx, 4
		jb	short loc_code_40E9
		sub	bx, bx
		mov	ds:3EDAh, bx

loc_code_40E5:				; CODE XREF: sub_code_40C2+16j
		mov	ds:3EDCh, dx

loc_code_40E9:				; CODE XREF: sub_code_40C2+1Bj
		mov	si, bx
		shl	si, 1
		cmp	byte ptr [bx+3EB2h], 0
		jnz	short locret_code_40CC
		call	sub_code_42DB
		jnb	short loc_code_40FC
		jmp	short loc_code_4124
; ---------------------------------------------------------------------------
		nop

loc_code_40FC:				; CODE XREF: sub_code_40C2+35j
		call	sub_code_42FC
		jb	short locret_code_40CC
		cmp	byte ptr [bx+3EB6h], 0
		jnz	short loc_code_4118
		call	sub_code_4277
		call	sub_code_2DFD
		and	dl, 7
		add	dl, 14h
		mov	[bx+3EB6h], dl

loc_code_4118:				; CODE XREF: sub_code_40C2+44j
		dec	byte ptr [bx+3EB6h]
		call	sub_code_42DB
		jb	short loc_code_4124
		jmp	short loc_code_4181
; ---------------------------------------------------------------------------
		nop

loc_code_4124:				; CODE XREF: sub_code_40C2+37j
					; sub_code_40C2+5Dj
		cmp	byte ptr [bx+3EAEh], 0
		jnz	short locret_code_4132
		cmp	byte ptr [bx+3EB6h], 14h
		jb	short loc_code_4133

locret_code_4132:			; CODE XREF: sub_code_40C2+67j
		retn
; ---------------------------------------------------------------------------

loc_code_4133:				; CODE XREF: sub_code_40C2+6Ej
		call	sub_code_11E3
		call	sub_code_4254
		mov	bx, ds:3EDAh
		mov	byte ptr [bx+3EB2h], 1
		call	sub_code_1124
		mov	byte ptr ds:55Ch, 0
		dec	byte ptr ds:3ED8h
		jnz	short loc_code_4155
		mov	byte ptr ds:553h, 1

loc_code_4155:				; CODE XREF: sub_code_40C2+8Cj
		mov	al, 4
		sub	al, ds:3ED8h
		mov	cl, 2
		shl	al, cl
		sub	ah, ah
		add	ax, 51h	; 'Q'
		mov	di, ax
		mov	bp, 0Eh
		mov	si, 3D20h
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 0C02h
		call	sub_code_2D35
		mov	ax, 3E8h
		mov	bx, 2EEh
		call	sub_code_593B
		retn
; ---------------------------------------------------------------------------

loc_code_4181:				; CODE XREF: sub_code_40C2+5Fj
		call	sub_code_42B4
		mov	di, ds:8
		shl	di, 1
		mov	bp, [di+3EDEh]
		call	sub_code_431C
		jnb	short loc_code_41B0
		cmp	byte ptr [bx+3EB6h], 2
		jb	short loc_code_41B0
		mov	al, 1
		cmp	byte ptr [bx+3EB6h], 11h
		jbe	short loc_code_41AC
		cmp	byte ptr [bx+3EB6h], 14h
		jnb	short loc_code_41B0
		dec	al

loc_code_41AC:				; CODE XREF: sub_code_40C2+DFj
		mov	[bx+3EB6h], al

loc_code_41B0:				; CODE XREF: sub_code_40C2+CFj
					; sub_code_40C2+D6j ...
		mov	al, [bx+3EB6h]
		cmp	al, 1
		jbe	short loc_code_41D8
		cmp	al, 12h
		jb	short loc_code_41F8
		mov	al, 1
		cmp	word ptr [si+3EBAh], 3
		jnb	short loc_code_41C7
		mov	al, 3

loc_code_41C7:				; CODE XREF: sub_code_40C2+101j
		add	[bx+3ED4h], al
		cmp	byte ptr [bx+3EB6h], 13h
		jb	short loc_code_41F3
		jz	short loc_code_41EE
		sub	ax, ax
		jmp	short loc_code_4204
; ---------------------------------------------------------------------------

loc_code_41D8:				; CODE XREF: sub_code_40C2+F4j
		mov	al, 1
		cmp	word ptr [si+3EBAh], 3
		jnb	short loc_code_41E3
		mov	al, 3

loc_code_41E3:				; CODE XREF: sub_code_40C2+11Dj
		add	[bx+3ED4h], al
		cmp	byte ptr [bx+3EB6h], 1
		jnb	short loc_code_41F3

loc_code_41EE:				; CODE XREF: sub_code_40C2+110j
		mov	ax, 3DB0h
		jmp	short loc_code_4204
; ---------------------------------------------------------------------------

loc_code_41F3:				; CODE XREF: sub_code_40C2+10Ej
					; sub_code_40C2+12Aj
		mov	ax, 3D80h
		jmp	short loc_code_4204
; ---------------------------------------------------------------------------

loc_code_41F8:				; CODE XREF: sub_code_40C2+F8j
		shl	al, 1
		mov	di, ax
		and	di, 2
		mov	ax, [di+3DE0h]

loc_code_4204:				; CODE XREF: sub_code_40C2+114j
					; sub_code_40C2+12Fj ...
		mov	ds:3ECAh, ax
		mov	dl, [bx+3ED4h]
		mov	cx, [si+3ECCh]
		call	sub_code_2CB0
		mov	ds:3DE4h, ax
		call	sub_code_4254
		mov	bx, ds:3EDAh
		mov	si, bx
		shl	si, 1
		call	sub_code_42FC
		jnb	short loc_code_4226
		retn
; ---------------------------------------------------------------------------

loc_code_4226:				; CODE XREF: sub_code_40C2+161j
		cmp	word ptr ds:3ECAh, 0
		jnz	short loc_code_4233
		mov	byte ptr [bx+3EAEh], 1
		retn
; ---------------------------------------------------------------------------

loc_code_4233:				; CODE XREF: sub_code_40C2+169j
		mov	byte ptr [bx+3EAEh], 0
		mov	di, ds:3DE4h
		mov	[si+3EA6h], di
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, [si+3EC2h]
		mov	cx, 0C02h
		mov	si, ds:3ECAh
		call	sub_code_2D35
		retn
sub_code_40C2	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4254	proc near		; CODE XREF: sub_code_40C2+74p
					; sub_code_40C2+153p
		mov	bx, ds:3EDAh
		mov	si, bx
		shl	si, 1
		cmp	byte ptr [bx+3EAEh], 0
		jnz	short locret_code_4276
		mov	di, [si+3EA6h]
		mov	cx, 0C02h
		mov	si, [si+3EC2h]
		mov	ax, 0B800h
		mov	es, ax
		call	sub_code_2D9D

locret_code_4276:			; CODE XREF: sub_code_4254+Dj
		retn
sub_code_4254	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4277	proc near		; CODE XREF: sub_code_4090+14p
					; sub_code_40C2+46p
		mov	byte ptr ds:3ED9h, 20h ; ' '

loc_code_427C:				; CODE XREF: sub_code_4277+16j
					; sub_code_4277+3Aj
		call	sub_code_2DFD
		and	dx, 0Fh
		sub	di, di

loc_code_4285:				; CODE XREF: sub_code_4277+1Ej
		cmp	di, si
		jz	short loc_code_428F
		cmp	dx, [di+3EBAh]
		jz	short loc_code_427C

loc_code_428F:				; CODE XREF: sub_code_4277+10j
		add	di, 2
		cmp	di, 8
		jb	short loc_code_4285
		mov	[si+3EBAh], dx
		call	sub_code_42B4
		cmp	byte ptr ds:3ED9h, 0
		jz	short locret_code_42B3
		mov	bp, 32h	; '2'
		call	sub_code_431C
		jnb	short locret_code_42B3
		dec	byte ptr ds:3ED9h
		jmp	short loc_code_427C
; ---------------------------------------------------------------------------

locret_code_42B3:			; CODE XREF: sub_code_4277+2Cj
					; sub_code_4277+34j
		retn
sub_code_4277	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_42B4	proc near		; CODE XREF: sub_code_40C2:loc_code_4181p
					; sub_code_4277+24p
		mov	di, [si+3EBAh]
		mov	al, [di+1050h]
		mov	dl, 0Ah
		cmp	di, 3
		jnb	short loc_code_42C5
		sub	dl, dl

loc_code_42C5:				; CODE XREF: sub_code_42B4+Dj
		sub	al, dl
		add	al, 3
		mov	[bx+3ED4h], al
		shl	di, 1
		mov	ax, [di+1137h]
		add	ax, 8
		mov	[si+3ECCh], ax
		retn
sub_code_42B4	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_42DB	proc near		; CODE XREF: sub_code_40C2+32p
					; sub_code_40C2+5Ap
		push	si
		push	bx
		mov	ax, [si+3ECCh]
		mov	dl, [bx+3ED4h]
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E0Ch
		call	sub_code_2E29
		pop	bx
		pop	si
		retn
sub_code_42DB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_42FC	proc near		; CODE XREF: sub_code_40C2:loc_code_40FCp
					; sub_code_40C2+15Ep
		push	si
		push	bx
		mov	ax, [si+3ECCh]
		mov	dl, [bx+3ED4h]
		mov	si, 10h
		mov	bx, ds:327Dh
		mov	dh, ds:327Fh
		mov	di, si
		mov	cx, 1E0Ch
		call	sub_code_2E29
		pop	bx
		pop	si
		retn
sub_code_42FC	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_431C	proc near		; CODE XREF: sub_code_40C2+CCp
					; sub_code_4277+31p
		mov	ax, [si+3ECCh]
		sub	ax, ds:579h
		jnb	short loc_code_4328
		not	ax

loc_code_4328:				; CODE XREF: sub_code_431C+8j
		mov	dl, [bx+3ED4h]
		sub	dl, ds:57Bh
		jnb	short loc_code_4334
		not	dl

loc_code_4334:				; CODE XREF: sub_code_431C+14j
		sub	dh, dh
		add	ax, dx
		cmp	ax, bp
		jb	short loc_code_433E
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_433E:				; CODE XREF: sub_code_431C+1Ej
		stc
		retn
sub_code_431C	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4340	proc near		; CODE XREF: start+325p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:40B5h
		jnz	short loc_code_434B

locret_code_434A:			; CODE XREF: sub_code_4340+1Fj
					; sub_code_4340+27j
		retn
; ---------------------------------------------------------------------------

loc_code_434B:				; CODE XREF: sub_code_4340+8j
		inc	byte ptr ds:40FFh
		test	byte ptr ds:40FFh, 3
		jz	short loc_code_435A
		mov	ds:40B5h, dx

loc_code_435A:				; CODE XREF: sub_code_4340+14j
		cmp	byte ptr ds:40AAh, 0A4h	; '�'
		jb	short locret_code_434A
		call	sub_code_452D
		call	sub_code_4557
		jb	short locret_code_434A
		call	sub_code_2DFD
		cmp	dl, 30h	; '0'
		ja	short loc_code_439C
		call	sub_code_44FB
		mov	si, ds:8
		shl	si, 1
		mov	ax, [si+40CEh]
		cmp	ds:40CCh, ax
		ja	short loc_code_439C
		call	sub_code_595D
		mov	word ptr ds:40C8h, 0FFh
		mov	al, ds:40CAh
		mov	ds:40B7h, al
		mov	al, ds:40CBh
		mov	ds:40B8h, al
		jmp	loc_code_442E
; ---------------------------------------------------------------------------

loc_code_439C:				; CODE XREF: sub_code_4340+2Fj
					; sub_code_4340+42j
		cmp	word ptr ds:40C8h, 0Ah
		ja	short loc_code_43B1
		call	sub_code_2DFD
		cmp	dl, 6
		ja	short loc_code_43B4
		mov	word ptr ds:40C8h, 0FFh

loc_code_43B1:				; CODE XREF: sub_code_4340+61j
		jmp	short loc_code_4402
; ---------------------------------------------------------------------------
		nop

loc_code_43B4:				; CODE XREF: sub_code_4340+69j
		mov	bx, ds:40C8h
		mov	si, bx
		shl	si, 1
		sub	dl, dl
		mov	ax, ds:40B2h
		and	ax, 0FFCh
		cmp	ax, [si+40DEh]
		jz	short loc_code_43D0
		inc	dl
		jb	short loc_code_43D0
		mov	dl, 0FFh

loc_code_43D0:				; CODE XREF: sub_code_4340+88j
					; sub_code_4340+8Cj
		mov	ds:40B7h, dl
		sub	dl, dl
		mov	al, ds:40B4h
		and	al, 0FEh
		cmp	al, [bx+40F4h]
		jz	short loc_code_43E7
		inc	dl
		jb	short loc_code_43E7
		mov	dl, 0FFh

loc_code_43E7:				; CODE XREF: sub_code_4340+9Fj
					; sub_code_4340+A3j
		mov	ds:40B8h, dl
		or	dl, ds:40B7h
		jnz	short loc_code_442E
		call	sub_code_2DFD
		cmp	dl, 10h
		ja	short loc_code_442E
		mov	word ptr ds:40C8h, 0FFh
		call	sub_code_595D

loc_code_4402:				; CODE XREF: sub_code_4340:loc_code_43B1j
		call	sub_code_2DFD
		cmp	dl, 30h	; '0'
		ja	short loc_code_4423
		and	dl, 1
		jnz	short loc_code_4411
		mov	dl, 0FFh

loc_code_4411:				; CODE XREF: sub_code_4340+CDj
		mov	ds:40B7h, dl
		call	sub_code_2DFD
		and	dl, 1
		jnz	short loc_code_441F
		mov	dl, 0FFh

loc_code_441F:				; CODE XREF: sub_code_4340+DBj
		mov	ds:40B8h, dl

loc_code_4423:				; CODE XREF: sub_code_4340+C8j
		call	sub_code_2DFD
		and	dx, 0FFh
		mov	ds:40C8h, dx

loc_code_442E:				; CODE XREF: sub_code_4340+59j
					; sub_code_4340+AFj ...
		mov	al, ds:40B4h
		cmp	byte ptr ds:40B8h, 1
		jb	short loc_code_4459
		jnz	short loc_code_4449
		add	al, 2
		cmp	al, 0A8h ; '�'
		jb	short loc_code_4456
		mov	al, 0A7h ; '�'
		mov	byte ptr ds:40B8h, 0FFh
		jmp	short loc_code_4456
; ---------------------------------------------------------------------------

loc_code_4449:				; CODE XREF: sub_code_4340+F8j
		sub	al, 2
		cmp	al, 30h	; '0'
		jnb	short loc_code_4456
		mov	al, 30h	; '0'
		mov	byte ptr ds:40B8h, 1

loc_code_4456:				; CODE XREF: sub_code_4340+FEj
					; sub_code_4340+107j ...
		mov	ds:40B4h, al

loc_code_4459:				; CODE XREF: sub_code_4340+F6j
		mov	ax, ds:40B2h
		cmp	byte ptr ds:40B7h, 1
		jb	short loc_code_4486
		jnz	short loc_code_4477
		add	ax, 4
		cmp	ax, 136h
		jb	short loc_code_4483
		mov	ax, 135h
		mov	byte ptr ds:40B7h, 0FFh
		jmp	short loc_code_4483
; ---------------------------------------------------------------------------

loc_code_4477:				; CODE XREF: sub_code_4340+123j
		sub	ax, 4
		jnb	short loc_code_4483
		sub	ax, ax
		mov	byte ptr ds:40B7h, 1

loc_code_4483:				; CODE XREF: sub_code_4340+12Bj
					; sub_code_4340+135j ...
		mov	ds:40B2h, ax

loc_code_4486:				; CODE XREF: sub_code_4340+121j
		call	sub_code_452D
		mov	cx, ds:40B2h
		mov	dl, ds:40B4h
		call	sub_code_2CB0
		mov	ds:40BCh, ax
		mov	ax, 0B800h
		mov	es, ax
		cmp	byte ptr ds:40B9h, 0
		jnz	short loc_code_44B0
		mov	si, 3F2Ch
		mov	di, ds:40BAh
		mov	cx, 501h
		call	sub_code_2D9D

loc_code_44B0:				; CODE XREF: sub_code_4340+161j
		call	sub_code_4557
		jb	short locret_code_44E6
		mov	byte ptr ds:40B9h, 0
		add	word ptr ds:40BEh, 2
		mov	bx, ds:40BEh
		and	bx, 6
		mov	si, [bx+40C0h]
		cmp	byte ptr ds:40B7h, 0FFh
		jnz	short loc_code_44D5
		add	si, 1Eh

loc_code_44D5:				; CODE XREF: sub_code_4340+190j
		mov	di, ds:40BCh
		mov	ds:40BAh, di
		mov	bp, 3F2Ch
		mov	cx, 501h
		call	sub_code_2CCC

locret_code_44E6:			; CODE XREF: sub_code_4340+173j
		retn
sub_code_4340	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_44E7	proc near		; CODE XREF: sub_code_45AB+1Bp
					; sub_code_45AB+103p
		cmp	byte ptr ds:571h, 0
		jnz	short loc_code_44F9
		mov	al, ds:57Bh
		and	al, 0F8h
		cmp	al, 88h	; '�'
		jnz	short loc_code_44F9
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_44F9:				; CODE XREF: sub_code_44E7+5j
					; sub_code_44E7+Ej
		clc
		retn
sub_code_44E7	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_44FB	proc near		; CODE XREF: sub_code_4340+31p
					; sub_code_45AB+189p
		mov	ax, ds:40B2h
		mov	dl, 1
		sub	ax, ds:579h
		jnb	short loc_code_450A
		not	ax
		mov	dl, 0FFh

loc_code_450A:				; CODE XREF: sub_code_44FB+9j
		mov	ds:40CAh, dl
		mov	ds:40CCh, ax
		mov	al, ds:40B4h
		mov	dl, 1
		sub	al, ds:57Bh
		jnb	short loc_code_4520
		not	al
		mov	dl, 0FFh

loc_code_4520:				; CODE XREF: sub_code_44FB+1Fj
		mov	ds:40CBh, dl
		sub	ah, ah
		shl	ax, 1
		add	ds:40CCh, ax
		retn
sub_code_44FB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_452D	proc near		; CODE XREF: sub_code_4340+21p
					; sub_code_4340:loc_code_4486p
		mov	ax, ds:40B2h
		mov	dl, ds:40B4h
		mov	si, 8
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E05h
		call	sub_code_2E29
		jnb	short locret_code_4556
		cmp	byte ptr ds:552h, 0
		jnz	short locret_code_4556
		mov	byte ptr ds:553h, 1

locret_code_4556:			; CODE XREF: sub_code_452D+1Bj
					; sub_code_452D+22j
		retn
sub_code_452D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4557	proc near		; CODE XREF: sub_code_4340+24p
					; sub_code_4340:loc_code_44B0p
		mov	ax, ds:40B2h
		mov	dl, ds:40B4h
		mov	si, 8
		mov	bx, ds:327Dh
		mov	dh, ds:327Fh
		mov	di, 10h
		mov	cx, 1E05h
		call	sub_code_2E29
		jnb	short locret_code_4579
		mov	byte ptr ds:40B8h, 0FFh

locret_code_4579:			; CODE XREF: sub_code_4557+1Bj
		retn
sub_code_4557	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_457A	proc near		; CODE XREF: start+30Ap
		mov	cx, 90h	; '�'
		mov	dl, 86h	; '�'
		mov	ds:40A8h, cx
		mov	ds:40AAh, dl
		call	sub_code_2CB0
		mov	ds:40ABh, ax
		call	sub_code_4759
		mov	byte ptr ds:40AFh, 0
		mov	byte ptr ds:40B1h, 0
		mov	byte ptr ds:40B9h, 1
		mov	byte ptr ds:40B8h, 0
		mov	word ptr ds:40C8h, 0FFh
		retn
sub_code_457A	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_45AB	proc near		; CODE XREF: start+322p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:40ADh
		jnz	short loc_code_45B6

locret_code_45B5:			; CODE XREF: sub_code_45AB+14j
					; sub_code_45AB+1Ej
		retn
; ---------------------------------------------------------------------------

loc_code_45B6:				; CODE XREF: sub_code_45AB+8j
		mov	ds:40ADh, dx
		cmp	byte ptr ds:40AAh, 0A4h	; '�'
		jnb	short locret_code_45B5
		call	sub_code_4786
		jnb	short loc_code_45D6
		call	sub_code_44E7
		jnb	short locret_code_45B5
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:55Bh, 10h
		retn
; ---------------------------------------------------------------------------

loc_code_45D6:				; CODE XREF: sub_code_45AB+19j
		call	sub_code_473E
		jnb	short loc_code_4649
		cmp	byte ptr ds:40AFh, 0
		jnz	short loc_code_45FA
		mov	al, ds:56Eh
		cmp	al, 0
		jnz	short loc_code_45F7
		inc	al
		mov	bx, ds:40A8h
		cmp	bx, ds:579h
		ja	short loc_code_45F7
		mov	al, 0FFh

loc_code_45F7:				; CODE XREF: sub_code_45AB+3Cj
					; sub_code_45AB+48j
		mov	ds:40B0h, al

loc_code_45FA:				; CODE XREF: sub_code_45AB+35j
		mov	byte ptr ds:40AFh, 1
		mov	cx, 20h	; ' '

loc_code_4602:				; CODE XREF: sub_code_45AB+95j
		mov	ax, ds:579h
		mov	dl, 1
		cmp	byte ptr ds:40B0h, 1
		jnz	short loc_code_4615
		sub	ax, 8
		mov	dl, 0FFh
		jmp	short loc_code_4618
; ---------------------------------------------------------------------------

loc_code_4615:				; CODE XREF: sub_code_45AB+61j
		add	ax, 8

loc_code_4618:				; CODE XREF: sub_code_45AB+68j
		mov	ds:579h, ax
		mov	ds:56Eh, dl
		mov	al, ds:57Bh
		cmp	byte ptr ds:571h, 1
		jb	short loc_code_4639
		jnz	short loc_code_462F
		sub	al, 3
		jmp	short loc_code_4631
; ---------------------------------------------------------------------------

loc_code_462F:				; CODE XREF: sub_code_45AB+7Ej
		add	al, 3

loc_code_4631:				; CODE XREF: sub_code_45AB+82j
		mov	ds:57Bh, al
		add	al, 32h	; '2'
		mov	ds:57Ch, al

loc_code_4639:				; CODE XREF: sub_code_45AB+7Cj
		push	cx
		call	sub_code_473E
		pop	cx
		jnb	short loc_code_4642
		loop	loc_code_4602

loc_code_4642:				; CODE XREF: sub_code_45AB+93j
		call	sub_code_11E3
		call	sub_code_1112

locret_code_4648:			; CODE XREF: sub_code_45AB+AAj
		retn
; ---------------------------------------------------------------------------

loc_code_4649:				; CODE XREF: sub_code_45AB+2Ej
		cmp	byte ptr ds:40B1h, 0
		jnz	short loc_code_46A2
		cmp	byte ptr ds:40AFh, 0
		jz	short locret_code_4648
		mov	ax, ds:40A8h
		cmp	byte ptr ds:40B0h, 1
		jnz	short loc_code_4666
		add	ax, 8
		jmp	short loc_code_4669
; ---------------------------------------------------------------------------

loc_code_4666:				; CODE XREF: sub_code_45AB+B4j
		sub	ax, 8

loc_code_4669:				; CODE XREF: sub_code_45AB+B9j
		mov	ds:40A8h, ax
		call	sub_code_473E
		jnb	short loc_code_4672
		retn
; ---------------------------------------------------------------------------

loc_code_4672:				; CODE XREF: sub_code_45AB+C4j
		mov	ax, 0C00h
		mov	bx, 0B54h
		call	sub_code_593B
		mov	byte ptr ds:40AFh, 0
		mov	cx, ds:40A8h
		mov	dl, ds:40AAh
		call	sub_code_2CB0
		mov	ds:40ABh, ax
		call	sub_code_4773
		call	sub_code_4759
		mov	ax, ds:40A8h
		cmp	ax, 78h	; 'x'
		jb	short loc_code_46A2
		cmp	ax, 0A8h ; '�'
		ja	short loc_code_46A2
		retn
; ---------------------------------------------------------------------------

loc_code_46A2:				; CODE XREF: sub_code_45AB+A3j
					; sub_code_45AB+EFj ...
		mov	byte ptr ds:40B1h, 1
		cmp	byte ptr ds:1CBFh, 0
		jz	short loc_code_46BE
		call	sub_code_44E7
		jnb	short locret_code_46BD
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:55Bh, 10h

locret_code_46BD:			; CODE XREF: sub_code_45AB+106j
		retn
; ---------------------------------------------------------------------------

loc_code_46BE:				; CODE XREF: sub_code_45AB+101j
					; sub_code_45AB+161j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:40ADh
		jz	short loc_code_46A2
		mov	ds:40ADh, dx
		cmp	byte ptr ds:0, 0
		jz	short loc_code_46EC
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ds:40AAh
		sub	ah, ah
		shl	ax, 1
		shl	ax, 1
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_code_46EC:				; CODE XREF: sub_code_45AB+126j
		mov	dl, ds:40AAh
		cmp	dl, 0A4h ; '�'
		jnb	short loc_code_470E
		add	dl, 5
		mov	ds:40AAh, dl
		mov	cx, ds:40A8h
		call	sub_code_2CB0
		mov	ds:40ABh, ax
		call	sub_code_4773
		call	sub_code_4759
		jmp	short loc_code_46BE
; ---------------------------------------------------------------------------

loc_code_470E:				; CODE XREF: sub_code_45AB+148j
		call	sub_code_5B21
		call	sub_code_4773
		mov	bp, 401Eh
		dec	word ptr ds:40A6h
		mov	di, ds:40A6h
		mov	si, 3F36h
		mov	cx, 1104h
		call	sub_code_2D35
		mov	ax, ds:40A8h
		mov	ds:40B2h, ax
		mov	al, ds:40AAh
		mov	ds:40B4h, al
		call	sub_code_44FB
		mov	al, ds:40CAh
		mov	ds:40B7h, al
		retn
sub_code_45AB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_473E	proc near		; CODE XREF: sub_code_45AB:loc_code_45D6p
					; sub_code_45AB+8Fp ...
		mov	ax, ds:40A8h
		mov	dl, ds:40AAh
		mov	si, 18h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, si
		mov	cx, 0E10h
		call	sub_code_2E29
		retn
sub_code_473E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4759	proc near		; CODE XREF: sub_code_457A+13p
					; sub_code_45AB+E6p ...
		mov	ax, 0B800h
		mov	es, ax
		mov	bp, 401Eh
		mov	si, 3FBEh
		mov	di, ds:40ABh
		mov	ds:40A6h, di
		mov	cx, 1003h
		call	sub_code_2D35
		retn
sub_code_4759	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4773	proc near		; CODE XREF: sub_code_45AB+E3p
					; sub_code_45AB+15Bp ...
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 401Eh
		mov	di, ds:40A6h
		mov	cx, 1003h
		call	sub_code_2D9D
		retn
sub_code_4773	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4786	proc near		; CODE XREF: sub_code_45AB+16p
		cmp	byte ptr ds:327Fh, 66h ; 'f'
		jb	short loc_code_47A4
		mov	ax, ds:40A8h
		sub	ax, 14h
		cmp	ax, ds:327Dh
		ja	short loc_code_47A4
		add	ax, 30h	; '0'
		cmp	ax, ds:327Dh
		jb	short loc_code_47A4
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_47A4:				; CODE XREF: sub_code_4786+5j
					; sub_code_4786+11j ...
		clc
		retn
sub_code_4786	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_47B0	proc near		; CODE XREF: sub_code_33BA+15p
					; sub_code_4943+1A5p
		mov	ax, ds:327Dh
		mov	dl, ds:327Fh
		mov	si, 10h
		mov	bx, ds:579h
		sub	bx, 8
		jnb	short loc_code_47C5
		sub	bx, bx

loc_code_47C5:				; CODE XREF: sub_code_47B0+11j
		mov	dh, ds:57Bh
		add	dh, 3
		mov	di, 28h	; '('
		mov	cx, 0E1Eh
		call	sub_code_2E29
		retn
sub_code_47B0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_47D6	proc near		; CODE XREF: start+2D1p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:44D7h
		mov	si, ds:8
		shl	si, 1
		cmp	ax, [si+44DCh]
		ja	short loc_code_47ED

locret_code_47EC:			; CODE XREF: sub_code_47D6+20j
		retn
; ---------------------------------------------------------------------------

loc_code_47ED:				; CODE XREF: sub_code_47D6+14j
		mov	ds:44D7h, dx
		cmp	byte ptr ds:1CB8h, 0
		jnz	short locret_code_47EC
		mov	byte ptr ds:44FCh, 0
		mov	cx, 0Ch

loc_code_4800:				; CODE XREF: sub_code_47D6:loc_code_488Aj
		mov	bx, cx
		dec	bx
		shl	bl, 1
		cmp	word ptr [bx+4441h], 0
		jz	short loc_code_487D
		mov	ax, [bx+43F9h]
		cmp	al, ds:57Bh
		jnz	short loc_code_485D
		mov	ax, [bx+43E1h]
		sub	ax, ds:579h
		jnb	short loc_code_4822
		not	ax

loc_code_4822:				; CODE XREF: sub_code_47D6+48j
		mov	si, ds:8
		shl	si, 1
		cmp	ax, [si+44ECh]
		ja	short loc_code_485D
		cmp	word ptr [bx+4459h], 2
		jb	short loc_code_484C
		mov	ax, [bx+4411h]
		mov	ds:44DAh, ax
		call	sub_code_488D
		call	sub_code_48A1
		call	sub_code_3339
		call	sub_code_1145
		call	sub_code_2136
		retn
; ---------------------------------------------------------------------------

loc_code_484C:				; CODE XREF: sub_code_47D6+5Dj
		inc	word ptr [bx+4459h]
		cmp	word ptr [bx+4459h], 2
		jb	short loc_code_4870
		inc	byte ptr ds:44FCh
		jmp	short loc_code_4870
; ---------------------------------------------------------------------------

loc_code_485D:				; CODE XREF: sub_code_47D6+3Ej
					; sub_code_47D6+56j
		cmp	word ptr [bx+4459h], 0
		jz	short loc_code_487D
		call	sub_code_2DFD
		cmp	dl, 38h	; '8'
		ja	short loc_code_4870
		dec	word ptr [bx+4459h]

loc_code_4870:				; CODE XREF: sub_code_47D6+7Fj
					; sub_code_47D6+85j ...
		push	cx
		push	bx
		call	sub_code_48D7
		pop	bx
		call	sub_code_4916
		call	sub_code_48C1
		pop	cx

loc_code_487D:				; CODE XREF: sub_code_47D6+34j
					; sub_code_47D6+8Cj
		loop	loc_code_488A
		cmp	byte ptr ds:44FCh, 0
		jz	short locret_code_4889
		call	sub_code_5691

locret_code_4889:			; CODE XREF: sub_code_47D6+AEj
		retn
; ---------------------------------------------------------------------------

loc_code_488A:				; CODE XREF: sub_code_47D6:loc_code_487Dj
		jmp	loc_code_4800
sub_code_47D6	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_488D	proc near		; CODE XREF: sub_code_47D6+66p
		cmp	byte ptr ds:44BDh, 0
		jz	short loc_code_489D
		call	sub_code_4B03
		mov	byte ptr ds:44BDh, 0
		retn
; ---------------------------------------------------------------------------

loc_code_489D:				; CODE XREF: sub_code_488D+5j
		call	sub_code_11E3
		retn
sub_code_488D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_48A1	proc near		; CODE XREF: sub_code_47D6+69p
		push	ds
		pop	es
		assume es:nothing
		cld
		mov	di, 0Eh
		mov	si, di
		mov	ax, 0AAAAh
		mov	cx, 41h	; 'A'
		rep stosw
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	di, ds:44DAh
		mov	cx, 0D05h
		call	sub_code_2D9D
		retn
sub_code_48A1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_48C1	proc near		; CODE XREF: sub_code_47D6+A3p
		cmp	byte ptr ds:44D9h, 0
		jz	short locret_code_48D2
		cmp	byte ptr ds:44BDh, 0
		jz	short loc_code_48D3
		call	sub_code_4B1D

locret_code_48D2:			; CODE XREF: sub_code_48C1+5j
		retn
; ---------------------------------------------------------------------------

loc_code_48D3:				; CODE XREF: sub_code_48C1+Cj
		call	sub_code_1145
		retn
sub_code_48C1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_48D7	proc near		; CODE XREF: sub_code_47D6+9Cp
		mov	byte ptr ds:44D9h, 0
		mov	ax, [bx+43E1h]
		mov	dx, [bx+43F9h]
		sub	ax, 14h
		mov	si, 28h	; '('
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	cx, 0E06h
		mov	di, 18h
		call	sub_code_2E29
		jnb	short locret_code_4915
		mov	byte ptr ds:44D9h, 1

loc_code_4902:				; CODE XREF: sub_code_48D7+2Ej
		call	sub_code_13D8
		jz	short loc_code_4902
		cmp	byte ptr ds:44BDh, 0
		jz	short loc_code_4912
		call	sub_code_4B03
		retn
; ---------------------------------------------------------------------------

loc_code_4912:				; CODE XREF: sub_code_48D7+35j
		call	sub_code_11E3

locret_code_4915:			; CODE XREF: sub_code_48D7+24j
		retn
sub_code_48D7	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4916	proc near		; CODE XREF: sub_code_47D6+A0p
		mov	ax, [bx+4411h]
		mov	si, [bx+4459h]
		shl	si, 1
		add	si, 4100h
		add	ax, 0A7h ; '�'
		cmp	word ptr [bx+4429h], 429Ch
		jz	short loc_code_4935
		sub	ax, 6
		add	si, 6

loc_code_4935:				; CODE XREF: sub_code_4916+17j
		mov	di, ax
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 101h
		call	sub_code_2D9D
		retn
sub_code_4916	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4943	proc near		; CODE XREF: start+2CEp
		cmp	byte ptr ds:1CB8h, 0
		jnz	short locret_code_4966
		cmp	byte ptr ds:44BEh, 0
		jz	short loc_code_495C
		mov	al, ds:44BEh
		mov	ds:698h, al
		mov	byte ptr ds:699h, 0

loc_code_495C:				; CODE XREF: sub_code_4943+Cj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:44D3h
		jnz	short loc_code_4967

locret_code_4966:			; CODE XREF: sub_code_4943+5j
		retn
; ---------------------------------------------------------------------------

loc_code_4967:				; CODE XREF: sub_code_4943+21j
		mov	ds:44D3h, dx
		cmp	byte ptr ds:584h, 0
		jz	short loc_code_4995
		cmp	byte ptr ds:44BDh, 0
		jz	short locret_code_4994
		call	sub_code_4B03
		call	sub_code_33A0
		call	sub_code_1124
		call	sub_code_3339
		mov	byte ptr ds:44BDh, 0
		mov	byte ptr ds:43E0h, 1
		mov	byte ptr ds:44BEh, 0

locret_code_4994:			; CODE XREF: sub_code_4943+34j
		retn
; ---------------------------------------------------------------------------

loc_code_4995:				; CODE XREF: sub_code_4943+2Dj
		cmp	byte ptr ds:69Ah, 0
		jz	short loc_code_499F
		jmp	short loc_code_49F9
; ---------------------------------------------------------------------------
		nop

loc_code_499F:				; CODE XREF: sub_code_4943+57j
		mov	ax, 0FFFFh
		mov	ds:44C1h, ax
		mov	ds:44BFh, ax
		mov	cx, 0Ch
		mov	si, ds:579h
		mov	dl, ds:57Bh
		add	dl, 8

loc_code_49B6:				; CODE XREF: sub_code_4943:loc_code_49F0j
		mov	bx, cx
		dec	bx
		cmp	byte ptr [bx+44C4h], 1
		jb	short loc_code_49F0
		cmp	dl, [bx+4499h]
		jnz	short loc_code_49F0
		mov	ax, si
		shl	bl, 1
		mov	dh, 0FFh
		sub	ax, [bx+4481h]
		jnb	short loc_code_49D6
		not	ax
		mov	dh, 1

loc_code_49D6:				; CODE XREF: sub_code_4943+8Dj
		cmp	ax, ds:44BFh
		ja	short loc_code_49F0
		mov	ds:44BFh, ax
		mov	ax, [bx+44A5h]
		mov	ds:44D1h, ax
		shr	bl, 1
		mov	ds:44C1h, bx
		mov	ds:44C3h, dh

loc_code_49F0:				; CODE XREF: sub_code_4943+7Bj
					; sub_code_4943+81j ...
		loop	loc_code_49B6
		cmp	word ptr ds:44C1h, 0Ch
		jb	short loc_code_4A20

loc_code_49F9:				; CODE XREF: sub_code_4943+59j
					; sub_code_4943+106j
		cmp	byte ptr ds:44BDh, 0
		jz	short loc_code_4A0B
		call	sub_code_4B03
		call	sub_code_1145
		mov	byte ptr ds:69Ah, 10h

loc_code_4A0B:				; CODE XREF: sub_code_4943+BBj
		mov	byte ptr ds:44BDh, 0
		mov	byte ptr ds:43E0h, 1
		mov	byte ptr ds:44D0h, 0
		mov	byte ptr ds:44BEh, 0
		retn
; ---------------------------------------------------------------------------

loc_code_4A20:				; CODE XREF: sub_code_4943+B4j
		cmp	word ptr ds:44BFh, 4
		jb	short loc_code_4A4B
		cmp	word ptr ds:44BFh, 8
		ja	short loc_code_4A33
		mov	byte ptr ds:572h, 4

loc_code_4A33:				; CODE XREF: sub_code_4943+E9j
		mov	al, ds:44C3h
		mov	ds:698h, al
		mov	ds:56Eh, al
		mov	ds:44BEh, al
		mov	byte ptr ds:699h, 0
		mov	byte ptr ds:571h, 0
		jmp	short loc_code_49F9
; ---------------------------------------------------------------------------

loc_code_4A4B:				; CODE XREF: sub_code_4943+E2j
		mov	byte ptr ds:44BEh, 0
		cmp	byte ptr ds:44BDh, 0
		jnz	short loc_code_4A5D
		call	sub_code_11E3
		call	sub_code_1124

loc_code_4A5D:				; CODE XREF: sub_code_4943+112j
		mov	byte ptr ds:44BDh, 1
		sub	al, al
		add	byte ptr ds:44D0h, 30h ; '0'
		jnb	short loc_code_4A6D
		inc	al

loc_code_4A6D:				; CODE XREF: sub_code_4943+126j
		mov	ds:44D5h, al
		mov	cx, ds:579h
		and	cx, 0FFCh
		mov	dl, ds:57Bh
		add	dl, 3
		cmp	word ptr ds:44D1h, 410Ch
		jz	short loc_code_4A95
		add	cx, 8
		cmp	cx, 127h
		jb	short loc_code_4A9C
		mov	cx, 126h
		jmp	short loc_code_4A9C
; ---------------------------------------------------------------------------

loc_code_4A95:				; CODE XREF: sub_code_4943+142j
		sub	cx, 8
		jnb	short loc_code_4A9C
		sub	cx, cx

loc_code_4A9C:				; CODE XREF: sub_code_4943+14Bj
					; sub_code_4943+150j ...
		call	sub_code_2CB0
		mov	ds:43DCh, ax

loc_code_4AA2:				; CODE XREF: sub_code_4943+162j
		call	sub_code_13D8
		jz	short loc_code_4AA2
		call	sub_code_4B03
		cmp	byte ptr ds:44D5h, 0
		jz	short loc_code_4AFF
		mov	bx, ds:44C1h
		cmp	byte ptr [bx+44C4h], 0
		jz	short loc_code_4AFF
		dec	byte ptr [bx+44C4h]
		jnz	short loc_code_4AE7
		push	bx
		mov	ax, 8FDh
		mov	bx, 723h
		call	sub_code_593B
		pop	bx
		mov	byte ptr ds:698h, 0
		mov	byte ptr ds:44BEh, 0
		mov	byte ptr ds:69Ah, 10h
		dec	byte ptr ds:44D6h
		jnz	short loc_code_4AE7
		mov	byte ptr ds:553h, 1

loc_code_4AE7:				; CODE XREF: sub_code_4943+17Dj
					; sub_code_4943+19Dj
		push	bx
		call	sub_code_47B0
		pop	bx
		jnb	short loc_code_4AFC
		push	bx
		call	sub_code_33A0
		pop	bx
		call	sub_code_4BC8
		call	sub_code_3339
		jmp	short loc_code_4AFF
; ---------------------------------------------------------------------------
		nop

loc_code_4AFC:				; CODE XREF: sub_code_4943+1A9j
		call	sub_code_4BC8

loc_code_4AFF:				; CODE XREF: sub_code_4943+16Cj
					; sub_code_4943+177j ...
		call	sub_code_4B1D
		retn
sub_code_4943	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4B03	proc near		; CODE XREF: sub_code_488D+7p
					; sub_code_48D7+37p ...
		cmp	byte ptr ds:43E0h, 0
		jnz	short locret_code_4B1C
		mov	di, ds:43DEh
		mov	si, 43A0h
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 0A03h
		call	sub_code_2D9D

locret_code_4B1C:			; CODE XREF: sub_code_4B03+5j
		retn
sub_code_4B03	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4B1D	proc near		; CODE XREF: sub_code_48C1+Ep
					; sub_code_4943:loc_code_4AFFp
		mov	byte ptr ds:43E0h, 0
		mov	ax, 0B800h
		mov	es, ax
		mov	di, ds:43DCh
		mov	ds:43DEh, di
		mov	bp, 43A0h
		mov	si, ds:44D1h
		cmp	byte ptr ds:44D0h, 80h ; '�'
		jb	short loc_code_4B40
		add	si, 3Ch	; '<'

loc_code_4B40:				; CODE XREF: sub_code_4B1D+1Ej
		mov	cx, 0A03h
		call	sub_code_2D35
		retn
sub_code_4B1D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4B47	proc near		; CODE XREF: sub_code_2790+AAp
		push	ds
		pop	es
		assume es:nothing
		sub	ax, ax
		mov	di, 4441h
		mov	cx, 0Ch
		rep stosw
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	bx, ds:8
		mov	cl, [bx+4471h]
		sub	ch, ch

loc_code_4B62:				; CODE XREF: sub_code_4B47+27j
					; sub_code_4B47+2Ej ...
		call	sub_code_2DFD
		mov	bl, dl
		and	bx, 1Eh
		cmp	bl, 18h
		jnb	short loc_code_4B62
		cmp	word ptr [bx+4441h], 0
		jnz	short loc_code_4B62
		mov	word ptr [bx+4459h], 0
		mov	word ptr [bx+4441h], 1
		push	cx
		mov	si, [bx+4429h]
		mov	di, [bx+4411h]
		mov	cx, 0D05h
		call	sub_code_2D9D
		pop	cx
		loop	loc_code_4B62
		mov	cx, 0Ch

loc_code_4B98:				; CODE XREF: sub_code_4B47+65j
		mov	bx, cx
		dec	bx
		mov	si, ds:8
		mov	dl, [si+4479h]
		mov	[bx+44C4h], dl
		push	cx
		call	sub_code_4BC8
		pop	cx
		loop	loc_code_4B98
		mov	byte ptr ds:44D0h, 0
		mov	byte ptr ds:44BDh, 0
		mov	byte ptr ds:43E0h, 1
		mov	byte ptr ds:44D6h, 0Ch
		mov	byte ptr ds:44BEh, 0
		retn
sub_code_4B47	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4BC8	proc near		; CODE XREF: sub_code_4943+1B0p
					; sub_code_4943:loc_code_4AFCp	...
		call	sub_code_4BE8
		mov	di, ax
		mov	al, [bx+44C4h]
		sub	ah, ah
		mov	cl, 5
		shl	ax, cl
		add	ax, 41FCh
		mov	si, ax
		mov	cx, 802h
		mov	ax, 0B800h
		mov	es, ax
		call	sub_code_2D9D
		retn
sub_code_4BC8	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4BE8	proc near		; CODE XREF: sub_code_4BC8p
		push	bx
		mov	dl, [bx+4499h]
		shl	bl, 1
		mov	cx, [bx+4481h]
		call	sub_code_2CB0
		pop	bx
		retn
sub_code_4BE8	endp

; ---------------------------------------------------------------------------
		align 10h
; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS KEYPAD "+" TO EXPAND]
; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
		clc
		retn
; ---------------------------------------------------------------------------
		clc
		retn
; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_4C10	proc near		; CODE XREF: start+293p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:45B8h
		jnz	short loc_code_4C1B
		retn
; ---------------------------------------------------------------------------

loc_code_4C1B:				; CODE XREF: sub_code_4C10+8j
		inc	word ptr ds:45B6h
		mov	bx, ds:45B6h
		cmp	bx, 1
		jz	short loc_code_4C38
		cmp	bx, 4
		jz	short loc_code_4C38
		cmp	bx, 7
		jb	short loc_code_4C3C
		sub	bx, bx
		mov	ds:45B6h, bx

loc_code_4C38:				; CODE XREF: sub_code_4C10+16j
					; sub_code_4C10+1Bj
		mov	ds:45B8h, dx

loc_code_4C3C:				; CODE XREF: sub_code_4C10+20j
		call	sub_code_4FCD
		call	sub_code_502D
		jnb	short loc_code_4C45

locret_code_4C44:			; CODE XREF: sub_code_4C10+59j
		retn
; ---------------------------------------------------------------------------

loc_code_4C45:				; CODE XREF: sub_code_4C10+32j
		cmp	word ptr ds:454Fh, 0
		jz	short loc_code_4C8C
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:454Fh
		mov	bx, ds:8
		shl	bl, 1
		mov	ax, [bx+45C7h]
		cmp	word ptr ds:45B6h, 0
		jnz	short loc_code_4C67
		shl	ax, 1

loc_code_4C67:				; CODE XREF: sub_code_4C10+53j
		cmp	dx, ax
		jb	short locret_code_4C44
		mov	word ptr ds:454Fh, 0
		mov	byte ptr ds:454Eh, 1
		mov	ax, 24h	; '$'
		cmp	word ptr ds:579h, 0A0h ; '�'
		ja	short loc_code_4C84
		mov	ax, 108h

loc_code_4C84:				; CODE XREF: sub_code_4C10+6Fj
		mov	ds:4548h, ax
		mov	byte ptr ds:454Ah, 0

loc_code_4C8C:				; CODE XREF: sub_code_4C10+3Aj
		call	sub_code_4DD0
		jnb	short loc_code_4C99
		mov	bx, ds:45B6h
		call	sub_code_4FBB
		retn
; ---------------------------------------------------------------------------

loc_code_4C99:				; CODE XREF: sub_code_4C10+7Fj
		cmp	byte ptr ds:4553h, 0
		jz	short loc_code_4CB8
		dec	byte ptr ds:4553h
		jnz	short loc_code_4CB5
		mov	dl, 1
		cmp	byte ptr ds:454Ah, 0FFh
		jz	short loc_code_4CB1
		mov	dl, 0FFh

loc_code_4CB1:				; CODE XREF: sub_code_4C10+9Dj
		mov	ds:454Ah, dl

loc_code_4CB5:				; CODE XREF: sub_code_4C10+94j
		jmp	short loc_code_4D14
; ---------------------------------------------------------------------------
		nop

loc_code_4CB8:				; CODE XREF: sub_code_4C10+8Ej
		mov	al, ds:454Bh
		cmp	al, ds:57Bh
		ja	short loc_code_4D14
		cmp	word ptr ds:45B6h, 6
		jnz	short loc_code_4CCF
		cmp	byte ptr ds:57Bh, 28h ;	'('
		jb	short loc_code_4CDC

loc_code_4CCF:				; CODE XREF: sub_code_4C10+B6j
		call	sub_code_2DFD
		mov	bx, ds:8
		cmp	dl, [bx+45BFh]
		ja	short loc_code_4D14

loc_code_4CDC:				; CODE XREF: sub_code_4C10+BDj
		sub	dl, dl
		mov	ax, ds:4548h
		and	ax, 0FF8h
		mov	cx, ds:579h
		and	cx, 0FF8h
		cmp	ax, cx
		jz	short loc_code_4CF6
		mov	dl, 1
		jb	short loc_code_4CF6
		mov	dl, 0FFh

loc_code_4CF6:				; CODE XREF: sub_code_4C10+DEj
					; sub_code_4C10+E2j
		mov	ds:454Ah, dl
		cmp	byte ptr ds:57Bh, 28h ;	'('
		jb	short loc_code_4D14
		cmp	word ptr ds:45B6h, 6
		jnz	short loc_code_4D14
		mov	al, 1
		cmp	dl, 0FFh
		jz	short loc_code_4D11
		mov	al, 0FFh

loc_code_4D11:				; CODE XREF: sub_code_4C10+FDj
		mov	ds:454Ah, al

loc_code_4D14:				; CODE XREF: sub_code_4C10:loc_code_4CB5j
					; sub_code_4C10+AFj ...
		mov	word ptr ds:45BCh, 8
		cmp	byte ptr ds:4553h, 0
		jz	short loc_code_4D27
		mov	word ptr ds:45BCh, 4

loc_code_4D27:				; CODE XREF: sub_code_4C10+10Fj
		mov	ax, ds:4548h
		cmp	byte ptr ds:454Ah, 1
		jnb	short loc_code_4D46
		call	sub_code_2DFD
		cmp	dl, 10h
		ja	short loc_code_4DA1
		and	dl, 1
		jnz	short loc_code_4D40
		mov	dl, 0FFh

loc_code_4D40:				; CODE XREF: sub_code_4C10+12Cj
		mov	ds:454Ah, dl
		jmp	short loc_code_4DA1
; ---------------------------------------------------------------------------

loc_code_4D46:				; CODE XREF: sub_code_4C10+11Fj
		jnz	short loc_code_4D60
		add	ax, ds:45BCh
		cmp	ax, 10Bh
		jb	short loc_code_4D78
		mov	ax, 10Ah
		mov	byte ptr ds:454Ah, 0FFh
		mov	byte ptr ds:4553h, 0
		jmp	short loc_code_4D78
; ---------------------------------------------------------------------------

loc_code_4D60:				; CODE XREF: sub_code_4C10:loc_code_4D46j
		sub	ax, ds:45BCh
		jb	short loc_code_4D6B
		cmp	ax, 24h	; '$'
		ja	short loc_code_4D78

loc_code_4D6B:				; CODE XREF: sub_code_4C10+154j
		mov	ax, 25h	; '%'
		mov	byte ptr ds:454Ah, 1
		mov	byte ptr ds:4553h, 0

loc_code_4D78:				; CODE XREF: sub_code_4C10+13Fj
					; sub_code_4C10+14Ej ...
		mov	ds:4548h, ax
		add	word ptr ds:4551h, 2
		cmp	word ptr ds:4551h, 0Ch
		jb	short loc_code_4D8D
		mov	word ptr ds:4551h, 0

loc_code_4D8D:				; CODE XREF: sub_code_4C10+175j
		cmp	byte ptr ds:4553h, 0
		jnz	short loc_code_4DA1
		call	sub_code_2DFD
		cmp	dl, 8
		ja	short loc_code_4DA1
		mov	byte ptr ds:454Ah, 0

loc_code_4DA1:				; CODE XREF: sub_code_4C10+127j
					; sub_code_4C10+134j ...
		mov	cx, ds:4548h
		mov	dl, ds:454Bh
		call	sub_code_2CB0
		mov	ds:45BAh, ax
		call	sub_code_502D
		jnb	short loc_code_4DB5
		retn
; ---------------------------------------------------------------------------

loc_code_4DB5:				; CODE XREF: sub_code_4C10+1A2j
		call	sub_code_4DD0
		jb	short loc_code_4DC8
		call	sub_code_4F4A
		call	sub_code_4F10
		mov	byte ptr ds:45BEh, 0
		call	sub_code_4E75

loc_code_4DC8:				; CODE XREF: sub_code_4C10+1A8j
		mov	bx, ds:45B6h
		call	sub_code_4FBB
		retn
sub_code_4C10	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4DD0	proc near		; CODE XREF: sub_code_4C10:loc_code_4C8Cp
					; sub_code_4C10:loc_code_4DB5p
		mov	ax, ds:579h
		mov	dl, ds:57Bh
		mov	si, 18h
		mov	di, si
		mov	bx, ds:4548h
		mov	dh, ds:454Bh
		mov	cx, 0C0Eh
		call	sub_code_2E29
		jnb	short locret_code_4E3D
		cmp	word ptr ds:45B6h, 6
		jnz	short loc_code_4E00
		mov	byte ptr ds:553h, 1
		call	sub_code_11E3
		call	sub_code_4F4A
		stc
		retn
; ---------------------------------------------------------------------------

loc_code_4E00:				; CODE XREF: sub_code_4DD0+21j
		call	sub_code_11E3
		call	sub_code_4F4A
		call	sub_code_1145
		mov	byte ptr ds:55Bh, 4
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:576h, 4
		mov	byte ptr ds:578h, 8
		mov	byte ptr ds:4553h, 4
		mov	dl, 1
		mov	ax, ds:4548h
		cmp	ax, ds:579h
		ja	short loc_code_4E2F
		mov	dl, 0FFh

loc_code_4E2F:				; CODE XREF: sub_code_4DD0+5Bj
		mov	ds:454Ah, dl
		mov	ax, 0CE4h
		mov	bx, 123Bh
		call	sub_code_593B
		stc

locret_code_4E3D:			; CODE XREF: sub_code_4DD0+1Aj
		retn
sub_code_4DD0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4E3E	proc near		; CODE XREF: sub_code_2E60+ECp
		mov	byte ptr ds:45BEh, 1
		mov	ax, ds:45B6h
		push	ax
		mov	word ptr ds:45B6h, 0

loc_code_4E4D:				; CODE XREF: sub_code_4E3E+30j
		mov	bx, ds:45B6h
		call	sub_code_4FCD
		cmp	word ptr ds:454Fh, 0
		jnz	short loc_code_4E65
		call	sub_code_4E75
		mov	bx, ds:45B6h
		call	sub_code_4FBB

loc_code_4E65:				; CODE XREF: sub_code_4E3E+1Bj
		inc	word ptr ds:45B6h
		cmp	word ptr ds:45B6h, 7
		jb	short loc_code_4E4D
		pop	ax
		mov	ds:45B6h, ax
		retn
sub_code_4E3E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4E75	proc near		; CODE XREF: sub_code_4C10+1B5p
					; sub_code_4E3E+1Dp
		mov	cx, 8

loc_code_4E78:				; CODE XREF: sub_code_4E75:loc_code_4EA3j
		mov	bx, cx
		dec	bx
		cmp	byte ptr [bx+2B72h], 0
		jz	short loc_code_4EA3
		push	cx
		mov	dl, [bx+2B6Ah]
		shl	bl, 1
		mov	ax, [bx+2B5Ah]
		mov	si, 18h
		mov	di, si
		mov	bx, ds:4548h
		mov	dh, ds:454Bh
		mov	cx, 0C0Fh
		call	sub_code_2E29
		pop	cx
		jb	short loc_code_4EA6

loc_code_4EA3:				; CODE XREF: sub_code_4E75+Bj
		loop	loc_code_4E78
		retn
; ---------------------------------------------------------------------------

loc_code_4EA6:				; CODE XREF: sub_code_4E75+2Cj
		push	cx
		cmp	byte ptr ds:45BEh, 0
		jnz	short loc_code_4EBB
		call	sub_code_11E3
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_4EBB
		call	sub_code_622B

loc_code_4EBB:				; CODE XREF: sub_code_4E75+37j
					; sub_code_4E75+41j
		call	sub_code_4F4A
		pop	cx
		mov	bx, cx
		dec	bx
		mov	byte ptr [bx+2B72h], 0
		mov	dl, [bx+2B6Ah]
		shl	bl, 1
		mov	cx, [bx+2B5Ah]
		call	sub_code_2CB0
		mov	di, ax
		mov	si, 2B7Ah
		mov	ax, 0B800h
		mov	es, ax
		mov	cx, 0F03h
		call	sub_code_2D9D
		cmp	byte ptr ds:45BEh, 0
		jnz	short loc_code_4EF8
		cmp	byte ptr ds:70F2h, 0
		jz	short loc_code_4EF5
		call	sub_code_61FA

loc_code_4EF5:				; CODE XREF: sub_code_4E75+7Bj
		call	sub_code_1145

loc_code_4EF8:				; CODE XREF: sub_code_4E75+74j
		sub	dx, dx
		cmp	word ptr ds:45B6h, 6
		jz	short loc_code_4F0B
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, 0
		jnz	short loc_code_4F0B
		dec	dx

loc_code_4F0B:				; CODE XREF: sub_code_4E75+8Aj
					; sub_code_4E75+93j
		mov	ds:454Fh, dx
		retn
sub_code_4E75	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4F10	proc near		; CODE XREF: sub_code_4C10+1ADp
		mov	byte ptr ds:454Eh, 0
		mov	si, 4500h
		cmp	byte ptr ds:454Ah, 0
		jz	short loc_code_4F3E
		mov	bx, ds:4551h
		cmp	byte ptr ds:4553h, 0
		jz	short loc_code_4F30
		and	bl, 2
		add	bl, 0Ch

loc_code_4F30:				; CODE XREF: sub_code_4F10+18j
		cmp	byte ptr ds:454Ah, 0FFh
		jnz	short loc_code_4F3A
		add	bx, 10h

loc_code_4F3A:				; CODE XREF: sub_code_4F10+25j
		mov	si, [bx+4A60h]

loc_code_4F3E:				; CODE XREF: sub_code_4F10+Dj
		mov	di, ds:45BAh
		mov	ds:454Ch, di
		call	sub_code_4FDF
		retn
sub_code_4F10	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4F4A	proc near		; CODE XREF: sub_code_4C10+1AAp
					; sub_code_4DD0+2Bp ...
		cmp	byte ptr ds:454Eh, 0
		jnz	short locret_code_4F58
		mov	di, ds:454Ch
		call	sub_code_5008

locret_code_4F58:			; CODE XREF: sub_code_4F4A+5j
		retn
sub_code_4F4A	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4F59	proc near		; CODE XREF: start+278p
		mov	word ptr ds:45B6h, 0

loc_code_4F5F:				; CODE XREF: sub_code_4F59+59j
		call	sub_code_2DFD
		and	dx, 7Fh
		add	dx, 60h	; '`'
		mov	ds:4548h, dx
		mov	byte ptr ds:454Ah, 0
		mov	byte ptr ds:454Eh, 1
		mov	word ptr ds:4551h, 0
		mov	byte ptr ds:4553h, 0
		sub	dx, dx
		cmp	word ptr ds:45B6h, 0
		jnz	short loc_code_4F95
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, 0
		jnz	short loc_code_4F95
		dec	dx

loc_code_4F95:				; CODE XREF: sub_code_4F59+30j
					; sub_code_4F59+39j
		mov	ds:454Fh, dx
		mov	bx, ds:45B6h
		mov	al, [bx+2BD4h]
		add	al, 3
		mov	ds:454Bh, al
		call	sub_code_4FBB
		inc	word ptr ds:45B6h
		cmp	word ptr ds:45B6h, 7
		jb	short loc_code_4F5F
		mov	word ptr ds:45B6h, 0
		retn
sub_code_4F59	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4FBB	proc near		; CODE XREF: sub_code_4C10+85p
					; sub_code_4C10+1BCp ...
		push	ds
		pop	es
		assume es:nothing
		shl	bl, 1
		cld
		mov	di, [bx+45A8h]
		mov	si, 4548h
		mov	cx, 0Ch
		rep movsb
		retn
sub_code_4FBB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4FCD	proc near		; CODE XREF: sub_code_4C10:loc_code_4C3Cp
					; sub_code_4E3E+13p
		push	ds
		pop	es
		shl	bl, 1
		cld
		mov	si, [bx+45A8h]
		mov	di, 4548h
		mov	cx, 0Ch
		rep movsb
		retn
sub_code_4FCD	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_4FDF	proc near		; CODE XREF: sub_code_4F10+36p
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		cld
		mov	dh, 0Ch

loc_code_4FE7:				; CODE XREF: sub_code_4FDF+26j
		mov	cx, 3

loc_code_4FEA:				; CODE XREF: sub_code_4FDF+12j
		mov	bx, es:[di]
		lodsw
		or	ax, bx
		stosw
		loop	loc_code_4FEA
		sub	di, 6
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_5003
		add	di, 50h	; 'P'

loc_code_5003:				; CODE XREF: sub_code_4FDF+1Fj
		dec	dh
		jnz	short loc_code_4FE7
		retn
sub_code_4FDF	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5008	proc near		; CODE XREF: sub_code_4F4A+Bp
		mov	ax, 0B800h
		mov	es, ax
		cld
		mov	dh, 0Ch
		mov	ax, 5555h

loc_code_5013:				; CODE XREF: sub_code_5008+22j
		mov	cx, 3
		rep stosw
		sub	di, 6
		xor	di, 2000h
		test	di, 2000h
		jnz	short loc_code_5028
		add	di, 50h	; 'P'

loc_code_5028:				; CODE XREF: sub_code_5008+1Bj
		dec	dh
		jnz	short loc_code_5013
		retn
sub_code_5008	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_502D	proc near		; CODE XREF: sub_code_4C10+2Fp
					; sub_code_4C10+19Fp
		cmp	byte ptr ds:70F2h, 0
		jnz	short loc_code_5036
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_5036:				; CODE XREF: sub_code_502D+5j
		mov	ax, ds:70F3h
		mov	dl, ds:70F5h
		mov	si, 10h
		mov	bx, ds:4548h
		mov	dh, ds:454Bh
		mov	di, 18h
		mov	cx, 0C08h
		call	sub_code_2E29
		retn
sub_code_502D	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5060	proc near		; CODE XREF: sub_code_528B:loc_code_529Cp
		mov	ax, 0B800h
		mov	es, ax
		mov	ax, ds:579h
		cmp	ax, 117h
		jb	short loc_code_5070
		mov	ax, 116h

loc_code_5070:				; CODE XREF: sub_code_5060+Bj
		sub	ax, 10h
		jnb	short loc_code_5077
		sub	ax, ax

loc_code_5077:				; CODE XREF: sub_code_5060+13j
		and	ax, 0FF0h
		mov	ds:579h, ax
		mov	byte ptr ds:57Bh, 14h
		sub	ax, 80h	; '�'
		jnb	short loc_code_5089
		not	ax

loc_code_5089:				; CODE XREF: sub_code_5060+25j
		mov	cl, 3
		shr	ax, cl
		cmp	ax, 0Dh
		jbe	short loc_code_5095
		mov	ax, 0Dh

loc_code_5095:				; CODE XREF: sub_code_5060+30j
		add	ax, 2
		mov	ds:4D6Ah, ax
		mov	word ptr ds:4DD6h, 0Ah

loc_code_50A1:				; CODE XREF: sub_code_5060+E7j
		cmp	word ptr ds:4DD6h, 0Ah
		jz	short loc_code_50AB
		call	sub_code_5B63

loc_code_50AB:				; CODE XREF: sub_code_5060+46j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:4A80h, dx
		mov	ax, ds:579h
		mov	cx, ax
		and	cx, 0FF0h
		cmp	cx, 80h	; '�'
		jnz	short loc_code_50C6
		mov	ax, cx
		jmp	short loc_code_50D2
; ---------------------------------------------------------------------------

loc_code_50C6:				; CODE XREF: sub_code_5060+60j
		jb	short loc_code_50CE
		sub	ax, ds:4D6Ah
		jmp	short loc_code_50D2
; ---------------------------------------------------------------------------

loc_code_50CE:				; CODE XREF: sub_code_5060:loc_code_50C6j
		add	ax, ds:4D6Ah

loc_code_50D2:				; CODE XREF: sub_code_5060+64j
					; sub_code_5060+6Cj
		mov	ds:579h, ax
		cmp	byte ptr ds:57Bh, 54h ;	'T'
		jb	short loc_code_50DD
		retn
; ---------------------------------------------------------------------------

loc_code_50DD:				; CODE XREF: sub_code_5060+7Aj
		add	byte ptr ds:57Bh, 8
		mov	cx, ds:579h
		add	cx, 4
		mov	dl, ds:57Bh
		call	sub_code_2CB0
		mov	di, ax
		mov	ds:4DD8h, di
		mov	si, 4B8Ah
		mov	bp, 0Eh
		mov	cx, 2007h
		call	sub_code_2CCC
		mov	di, ds:4DD8h
		add	di, 0F3h ; '�'
		mov	si, 4A82h
		mov	cx, 0D04h
		call	sub_code_2D9D
		cmp	word ptr ds:4DD6h, 0Ah
		jnz	short loc_code_5120
		call	sub_code_572E
		call	sub_code_5B54

loc_code_5120:				; CODE XREF: sub_code_5060+B8j
					; sub_code_5060+CFj
		call	sub_code_5B63
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:4A80h
		cmp	dx, ds:4DD6h
		jb	short loc_code_5120
		cmp	word ptr ds:4DD6h, 0Ah
		jnz	short loc_code_5141
		call	sub_code_38B0
		sub	bx, bx
		mov	ah, 0Bh
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)

loc_code_5141:				; CODE XREF: sub_code_5060+D6j
		mov	word ptr ds:4DD6h, 2
		jmp	loc_code_50A1
sub_code_5060	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_514A	proc near		; CODE XREF: sub_code_528B+14p
		mov	cx, 3

loc_code_514D:				; CODE XREF: sub_code_514A+4Ej
		mov	bx, 3
		sub	bx, cx
		shl	bx, 1
		mov	ax, [bx+4DA4h]
		mov	ds:4D6Ah, ax
		mov	ax, [bx+4DAAh]
		mov	ds:4D6Ch, ax
		mov	ax, [bx+4D98h]
		mov	ds:4DCCh, ax
		mov	ax, [bx+4D9Eh]
		mov	ds:4DCEh, ax
		mov	ax, [bx+4DB0h]
		mov	ds:4DD0h, ax
		mov	ax, [bx+4DB6h]
		mov	ds:4DD2h, ax
		mov	ax, [bx+4DBCh]
		mov	ds:4DD4h, ax
		mov	ax, [bx+4D92h]
		mov	ds:4DCAh, ax
		mov	ax, [bx+4DC2h]
		mov	ds:4DC8h, ax
		push	cx
		call	sub_code_519B
		pop	cx
		loop	loc_code_514D
		retn
sub_code_514A	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_519B	proc near		; CODE XREF: sub_code_514A+4Ap
		mov	cx, 8
		mov	byte ptr ds:4D91h, 1

loc_code_51A3:				; CODE XREF: sub_code_519B+20j
		push	cx
		call	sub_code_5B63
		pop	cx
		mov	bx, cx
		dec	bx
		shl	bx, 1
		mov	ax, ds:4DCCh
		mov	[bx+4D4Ah], ax
		mov	ax, ds:4DCEh
		mov	[bx+4D5Ah], ax
		loop	loc_code_51A3
		mov	ax, 0B800h
		mov	es, ax
		mov	byte ptr ds:4D6Eh, 0

loc_code_51C7:				; CODE XREF: sub_code_519B+8Cj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:4A80h, dx
		mov	cx, 8

loc_code_51D2:				; CODE XREF: sub_code_519B+6Fj
		push	cx
		call	sub_code_5B63
		pop	cx
		mov	bx, cx
		dec	bx
		shl	bx, 1
		push	cx
		push	bx
		cmp	byte ptr ds:4D91h, 0
		jz	short loc_code_51EA
		cmp	cx, 8
		jnz	short loc_code_5205

loc_code_51EA:				; CODE XREF: sub_code_519B+48j
		mov	cx, [bx+4D4Ah]
		mov	dx, [bx+4D5Ah]
		call	sub_code_2CB0
		mov	di, ax
		mov	si, ds:4DCAh
		mov	bp, 0Eh
		mov	cx, ds:4DD4h
		call	sub_code_2CCC

loc_code_5205:				; CODE XREF: sub_code_519B+4Dj
		pop	bx
		pop	cx
		call	sub_code_522A
		loop	loc_code_51D2

loc_code_520C:				; CODE XREF: sub_code_519B+80j
		call	sub_code_5B63
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:4A80h
		cmp	dx, ds:4DC8h
		jb	short loc_code_520C
		mov	byte ptr ds:4D91h, 0
		cmp	byte ptr ds:4D6Eh, 0
		jz	short loc_code_51C7
		retn
sub_code_519B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_522A	proc near		; CODE XREF: sub_code_519B+6Cp
		mov	ax, [bx+4D4Ah]
		cmp	word ptr [bx+4D6Fh], 1
		jb	short loc_code_525A
		jnz	short loc_code_524A
		add	ax, ds:4D6Ah
		cmp	ax, ds:4DD0h
		jbe	short loc_code_5256
		mov	ax, ds:4DD0h
		inc	byte ptr ds:4D6Eh
		jmp	short loc_code_5256
; ---------------------------------------------------------------------------

loc_code_524A:				; CODE XREF: sub_code_522A+Bj
		sub	ax, ds:4D6Ah
		jnb	short loc_code_5256
		sub	ax, ax
		inc	byte ptr ds:4D6Eh

loc_code_5256:				; CODE XREF: sub_code_522A+15j
					; sub_code_522A+1Ej ...
		mov	[bx+4D4Ah], ax

loc_code_525A:				; CODE XREF: sub_code_522A+9j
		mov	ax, [bx+4D5Ah]
		cmp	word ptr [bx+4D7Fh], 1
		jb	short locret_code_528A
		jnz	short loc_code_527A
		add	ax, ds:4D6Ch
		cmp	ax, ds:4DD2h
		jbe	short loc_code_5286
		mov	ax, ds:4DD2h
		inc	byte ptr ds:4D6Eh
		jmp	short loc_code_5286
; ---------------------------------------------------------------------------

loc_code_527A:				; CODE XREF: sub_code_522A+3Bj
		sub	ax, ds:4D6Ch
		jnb	short loc_code_5286
		sub	ax, ax
		inc	byte ptr ds:4D6Eh

loc_code_5286:				; CODE XREF: sub_code_522A+45j
					; sub_code_522A+4Ej ...
		mov	[bx+4D5Ah], ax

locret_code_528A:			; CODE XREF: sub_code_522A+39j
		retn
sub_code_522A	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_528B	proc near		; CODE XREF: sub_code_1BF0+14p
		call	sub_code_5B54
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_529C
		mov	ah, 0Bh
		mov	bx, 101h
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)

loc_code_529C:				; CODE XREF: sub_code_528B+8j
		call	sub_code_5060
		call	sub_code_514A
		call	sub_code_5BBF
		cmp	byte ptr ds:1F80h, 9
		jnb	short loc_code_52B0
		inc	byte ptr ds:1F80h

loc_code_52B0:				; CODE XREF: sub_code_528B+1Fj
		cmp	word ptr ds:8, 7
		jnb	short loc_code_52BB
		inc	word ptr ds:8

loc_code_52BB:				; CODE XREF: sub_code_528B+2Aj
		mov	word ptr ds:414h, 0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:412h, dx
		call	sub_code_5B21
		retn
sub_code_528B	endp

; ---------------------------------------------------------------------------
		align 4

; =============== S U B	R O U T	I N E =======================================


sub_code_52D0	proc near		; CODE XREF: sub_code_5313:loc_code_5345p
					; sub_code_5368+33p
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5312
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:52C4h
		jz	short locret_code_5312
		mov	ds:52C4h, dx
		mov	bx, ds:52C6h
		add	word ptr ds:52C6h, 2
		mov	ax, [bx+52CAh]
		cmp	ax, ds:52C8h
		jnz	short loc_code_52FC
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_52FC:				; CODE XREF: sub_code_52D0+26j
		mov	ds:52C8h, ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:52C8h
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

locret_code_5312:			; CODE XREF: sub_code_52D0+5j
					; sub_code_52D0+Fj
		retn
sub_code_52D0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5313	proc near		; CODE XREF: sub_code_1BF0+4Cp
		cmp	word ptr ds:8, 2
		jb	short locret_code_5367
		mov	word ptr ds:5016h, 0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:52C0h, dx
		mov	ds:52C2h, dx
		mov	ds:52C4h, dx
		mov	word ptr ds:52C6h, 0
		mov	word ptr ds:52C8h, 0

loc_code_533C:				; CODE XREF: sub_code_5313+4Fj
		call	sub_code_5368
		xor	word ptr ds:5016h, 2

loc_code_5345:				; CODE XREF: sub_code_5313+42j
		call	sub_code_52D0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:52C0h
		cmp	ax, 5
		jb	short loc_code_5345
		mov	ds:52C0h, dx
		sub	dx, ds:52C2h
		cmp	dx, 28h	; '('
		jb	short loc_code_533C
		call	sub_code_5B21

locret_code_5367:			; CODE XREF: sub_code_5313+5j
		retn
sub_code_5313	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5368	proc near		; CODE XREF: sub_code_5313:loc_code_533Cp
		mov	ax, 0B800h
		mov	es, ax
		mov	bx, ds:8
		shl	bx, 1
		mov	ax, [bx+52AEh]
		mov	ds:5010h, ax

loc_code_537A:				; CODE XREF: sub_code_5368+3Bj
		mov	bx, ds:5010h
		mov	di, [bx]
		cmp	di, 0
		jnz	short loc_code_5386
		retn
; ---------------------------------------------------------------------------

loc_code_5386:				; CODE XREF: sub_code_5368+1Bj
		mov	bx, [bx+2]
		xor	bx, ds:5016h
		and	bx, 2
		mov	si, [bx+5012h]
		mov	cx, 2304h
		call	sub_code_2D9D
		call	sub_code_52D0
		add	word ptr ds:5010h, 4
		jmp	short loc_code_537A
sub_code_5368	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_53B0	proc near		; CODE XREF: sub_code_5CB0:loc_code_5DA7p
		cmp	byte ptr ds:0, 0
		jz	short locret_code_53F5
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:5322h
		jz	short locret_code_53F5
		mov	ds:5322h, dx
		mov	bx, ds:5320h
		mov	bl, [bx+538Ch]
		cmp	bl, 66h	; 'f'
		jz	short loc_code_53DD
		sub	bh, bh
		inc	word ptr ds:5320h
		cmp	bx, 0
		jnz	short loc_code_53E1

loc_code_53DD:				; CODE XREF: sub_code_53B0+20j
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_53E1:				; CODE XREF: sub_code_53B0+2Bj
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, [bx+5324h]
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

locret_code_53F5:			; CODE XREF: sub_code_53B0+5j
					; sub_code_53B0+Fj
		retn
sub_code_53B0	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5400	proc near		; CODE XREF: start+10Bp
		mov	ax, 0B800h
		mov	es, ax
		mov	bx, ds:8
		and	bx, 7
		shl	bx, 1
		mov	ax, bx
		mov	bx, [bx+5908h]
		mov	cl, 3
		shl	ax, cl
		mov	ds:5918h, ax

loc_code_541C:				; CODE XREF: sub_code_5400+45j
		mov	di, [bx]
		cmp	di, 0FFFFh
		jz	short locret_code_5447
		call	sub_code_2DFD
		and	dx, 0Eh
		add	dx, ds:5918h
		mov	si, dx
		mov	si, [si+5888h]
		mov	cx, [si+5858h]
		mov	si, [si+584Ch]
		push	bx
		call	sub_code_2D9D
		pop	bx
		add	bx, 2
		jmp	short loc_code_541C
; ---------------------------------------------------------------------------

locret_code_5447:			; CODE XREF: sub_code_5400+22j
		retn
sub_code_5400	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5450	proc near		; CODE XREF: sub_code_1E40+1Fp
		mov	byte ptr ds:5B0Fh, 0Ch
		mov	word ptr ds:5B0Ch, 1
		mov	word ptr ds:5B12h, 1FFh
		mov	word ptr ds:5B0Ah, 0Fh
		mov	byte ptr ds:5B0Eh, 1
		retn
sub_code_5450	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_546D	proc near		; CODE XREF: start:loc_code_191p
					; start+284p ...
		cmp	byte ptr ds:0, 0
		jz	short locret_code_54A5
		cmp	byte ptr ds:1CB8h, 0
		jz	short loc_code_54F8
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	byte ptr ds:5B0Fh, 0
		jnz	short loc_code_54A6
		cmp	dx, ds:5B10h
		jz	short locret_code_54A5
		mov	ds:5B10h, dx
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:5B12h
		and	ax, 1FFh
		add	ax, 0C8h ; '�'
		call	sub_code_5889
		sub	word ptr ds:5B12h, 4Bh ; 'K'

locret_code_54A5:			; CODE XREF: sub_code_546D+5j
					; sub_code_546D+1Dj
		retn
; ---------------------------------------------------------------------------

loc_code_54A6:				; CODE XREF: sub_code_546D+17j
		cmp	dx, ds:5B10h
		jz	short loc_code_54B4
		mov	ds:5B10h, dx
		dec	byte ptr ds:5B0Fh

loc_code_54B4:				; CODE XREF: sub_code_546D+3Dj
		dec	byte ptr ds:5B0Eh
		jnz	short locret_code_54F7
		mov	al, 1
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jz	short loc_code_54C5
		shl	al, 1

loc_code_54C5:				; CODE XREF: sub_code_546D+54j
		mov	ds:5B0Eh, al
		call	sub_code_2DFD
		cmp	dl, 4
		ja	short loc_code_54D4
		inc	word ptr ds:5B0Ch

loc_code_54D4:				; CODE XREF: sub_code_546D+61j
		test	word ptr ds:5B0Ch, 1
		jz	short loc_code_54E1
		add	word ptr ds:5B0Ah, 7

loc_code_54E1:				; CODE XREF: sub_code_546D+6Dj
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	sub_code_2DFD
		mov	ax, dx
		and	ax, ds:5B0Ah
		and	ax, 1FFh
		add	ax, 190h
		call	sub_code_5889

locret_code_54F7:			; CODE XREF: sub_code_546D+4Bj
		retn
; ---------------------------------------------------------------------------

loc_code_54F8:				; CODE XREF: sub_code_546D+Cj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	byte ptr ds:5920h, 0
		jz	short loc_code_5522
		cmp	dx, ds:5921h
		jz	short locret_code_5562
		mov	ds:5921h, dx
		dec	byte ptr ds:5920h
		jz	short loc_code_551E
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:5923h
		call	sub_code_5889
		retn
; ---------------------------------------------------------------------------

loc_code_551E:				; CODE XREF: sub_code_546D+A4j
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_5522:				; CODE XREF: sub_code_546D+94j
		cmp	dx, ds:5925h
		jz	short locret_code_5562
		mov	si, 3
		mov	al, ds:1CBFh
		or	al, ds:5B07h
		jnz	short loc_code_5549
		mov	si, 1
		cmp	word ptr ds:4, 0
		jnz	short loc_code_5549
		dec	si
		cmp	byte ptr ds:1673h, 0
		jz	short loc_code_5549
		mov	si, 2

loc_code_5549:				; CODE XREF: sub_code_546D+C5j
					; sub_code_546D+CFj ...
		mov	di, si
		shl	di, 1
		mov	al, ds:584h
		or	al, ds:5B07h
		jnz	short loc_code_5563
		mov	ax, dx
		sub	ax, ds:5925h
		cmp	ax, [di+59F2h]
		jnb	short loc_code_5563

locret_code_5562:			; CODE XREF: sub_code_546D+9Aj
					; sub_code_546D+B9j
		retn
; ---------------------------------------------------------------------------

loc_code_5563:				; CODE XREF: sub_code_546D+E7j
					; sub_code_546D+F3j
		mov	ds:5925h, dx
		cmp	byte ptr ds:1CBFh, 0
		jnz	short loc_code_5579
		cmp	byte ptr ds:5B07h, 0
		jz	short loc_code_559E
		dec	byte ptr ds:5B07h

loc_code_5579:				; CODE XREF: sub_code_546D+FFj
		mov	word ptr ds:592Eh, 1200h
		mov	bx, ds:59BAh
		cmp	bx, 6
		jb	short loc_code_558E
		sub	bx, bx
		mov	ds:59BAh, bx

loc_code_558E:				; CODE XREF: sub_code_546D+119j
		add	word ptr ds:59BAh, 2
		mov	ax, [bx+5A44h]
		mov	ds:592Ah, ax
		call	sub_code_5B28
		retn
; ---------------------------------------------------------------------------

loc_code_559E:				; CODE XREF: sub_code_546D+106j
		cmp	si, 2
		jnz	short loc_code_55BB
		mov	al, ds:1673h
		sub	ah, ah
		mov	cl, 4
		shl	ax, cl
		add	ax, 200h
		mov	ds:592Ah, ax
		mov	word ptr ds:592Eh, 1800h
		jmp	loc_code_568D
; ---------------------------------------------------------------------------

loc_code_55BB:				; CODE XREF: sub_code_546D+134j
		mov	ax, [di+5A02h]
		mov	ds:592Eh, ax
		shr	byte ptr ds:5927h, 1
		jnb	short loc_code_5623
		mov	word ptr ds:592Eh, 1000h
		mov	byte ptr ds:5927h, 80h ; '�'
		inc	byte ptr ds:5928h
		mov	al, ds:5928h
		and	al, [si+59FAh]
		jnz	short loc_code_5616
		mov	dl, [si+5A0Ah]
		add	ds:5929h, dl
		call	sub_code_2DFD
		cmp	dl, [si+5A0Ch]
		ja	short loc_code_55F8
		and	dl, 7
		mov	ds:592Dh, dl

loc_code_55F8:				; CODE XREF: sub_code_546D+182j
		call	sub_code_2DFD
		and	dx, 0FFh
		shl	dx, 1
		mov	cl, 1
		test	dl, 2
		jz	short loc_code_560E
		mov	cl, 0FFh
		add	dx, 300h

loc_code_560E:				; CODE XREF: sub_code_546D+199j
		mov	ds:592Ah, dx
		mov	ds:592Ch, cl

loc_code_5616:				; CODE XREF: sub_code_546D+171j
		mov	ah, ds:5929h
		and	ah, [si+59FCh]
		or	al, ah
		mov	ds:5928h, al

loc_code_5623:				; CODE XREF: sub_code_546D+159j
		cmp	byte ptr ds:592Ch, 0FFh
		jz	short loc_code_5640
		add	word ptr ds:5A54h, 2
		mov	bx, ds:5A54h
		and	bx, 0Eh
		mov	ax, [bx+5A44h]
		mov	ds:592Ah, ax
		jmp	short loc_code_5653
; ---------------------------------------------------------------------------

loc_code_5640:				; CODE XREF: sub_code_546D+1BBj
		cmp	word ptr ds:592Ah, 0C8h	; '�'
		ja	short loc_code_564E
		mov	word ptr ds:592Ah, 500h

loc_code_564E:				; CODE XREF: sub_code_546D+1D9j
		sub	word ptr ds:592Ah, 19h

loc_code_5653:				; CODE XREF: sub_code_546D+1D1j
		cmp	byte ptr ds:584h, 0
		jz	short loc_code_5667
		mov	word ptr ds:592Eh, 2000h
		mov	byte ptr ds:592Ch, 0FFh
		jnz	short loc_code_568D

loc_code_5667:				; CODE XREF: sub_code_546D+1EBj
		mov	bl, ds:5928h
		sub	bh, bh
		add	bx, [di+59FEh]
		mov	al, [bx+59C2h]
		and	al, ds:5927h
		jnz	short loc_code_568D
		cmp	byte ptr ds:592Dh, 0
		jz	short locret_code_5690
		dec	byte ptr ds:592Dh
		mov	ax, [di+5A06h]
		mov	ds:592Eh, ax

loc_code_568D:				; CODE XREF: sub_code_546D+14Bj
					; sub_code_546D+1F8j ...
		call	sub_code_5B28

locret_code_5690:			; CODE XREF: sub_code_546D+213j
		retn
sub_code_546D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5691	proc near		; CODE XREF: sub_code_47D6+B0p
		call	sub_code_5B21
		mov	ah, 0Bh
		mov	bx, 4
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5AE2h, dx
		mov	word ptr ds:5AE4h, 0
		mov	al, 2
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_56B4
		shr	al, 1

loc_code_56B4:				; CODE XREF: sub_code_5691+1Fj
		mov	ds:5B06h, al

loc_code_56B7:				; CODE XREF: sub_code_5691+52j
		cmp	byte ptr ds:0, 0
		jz	short loc_code_56D8
		inc	word ptr ds:5AE4h
		mov	bx, ds:5AE4h
		mov	cl, ds:5B06h
		shr	bx, cl
		and	bx, 1Fh
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		xor	al, [bx+5AE6h]
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_code_56D8:				; CODE XREF: sub_code_5691+2Bj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:5AE2h
		cmp	dx, 2
		jb	short loc_code_56B7
		mov	ah, 0Bh
		sub	bx, bx
		int	10h		; - VIDEO - SET	COLOR PALETTE
					; BH = 00h, BL = border	color
					; BH = 01h, BL = palette (0-3)
		mov	byte ptr ds:5B07h, 0Ch
		call	sub_code_5B21
		retn
sub_code_5691	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_56F4	proc near		; CODE XREF: sub_code_3CB1+11Cp
		mov	ax, 200h
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_5700
		shl	ax, 1

loc_code_5700:				; CODE XREF: sub_code_56F4+8j
		mov	ds:5AD0h, ax
		retn
sub_code_56F4	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5704	proc near		; CODE XREF: sub_code_3CB1:loc_code_3DD8p
		inc	word ptr ds:5AD0h
		mov	bx, ds:5AD0h
		mov	dx, bx
		mov	cl, 9
		shr	dx, cl
		mov	cl, dl
		and	cl, 0Fh
		shr	bx, cl
		and	bx, 0Fh
		mov	dl, [bx+5AD2h]
		and	dl, ds:0
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		or	al, dl
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5704	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_572E	proc near		; CODE XREF: sub_code_5060+BAp
		mov	word ptr ds:5ACBh, 1F4h

loc_code_5734:				; CODE XREF: sub_code_572E+14j
		call	sub_code_576E
		sub	word ptr ds:5ACBh, 1Eh
		cmp	word ptr ds:5ACBh, 0C8h	; '�'
		ja	short loc_code_5734
		mov	word ptr ds:5ACBh, 1F4h

loc_code_574A:				; CODE XREF: sub_code_572E+2Aj
		call	sub_code_576E
		sub	word ptr ds:5ACBh, 14h
		cmp	word ptr ds:5ACBh, 12Ch
		ja	short loc_code_574A

loc_code_575A:				; CODE XREF: sub_code_572E+3Aj
		call	sub_code_576E
		add	word ptr ds:5ACBh, 1Eh
		cmp	word ptr ds:5ACBh, 320h
		jb	short loc_code_575A
		call	sub_code_5B21
		retn
sub_code_572E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_576E	proc near		; CODE XREF: sub_code_572E:loc_code_5734p
					; sub_code_572E:loc_code_574Ap	...
		mov	cx, 1000h
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_577A
		shr	cx, 1

loc_code_577A:				; CODE XREF: sub_code_576E+8j
					; sub_code_576E:loc_code_577Aj
		loop	loc_code_577A
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5796
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:5ACBh
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

locret_code_5796:			; CODE XREF: sub_code_576E+13j
		retn
sub_code_576E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5797	proc near		; CODE XREF: sub_code_34A0+98p
		call	sub_code_5B21
		mov	byte ptr ds:5ACFh, 0
		mov	word ptr ds:5ACDh, 8
		retn
sub_code_5797	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_57A6	proc near		; CODE XREF: sub_code_34A0:loc_code_3544p
					; sub_code_34A0+ACp ...
		inc	byte ptr ds:5ACFh
		sub	dl, dl
		mov	al, ds:5ACFh
		and	al, 3Fh
		jnz	short loc_code_57B7
		inc	word ptr ds:5ACDh

loc_code_57B7:				; CODE XREF: sub_code_57A6+Bj
		mov	bx, ds:5ACDh
		mov	cl, 2
		shr	bx, cl
		and	bl, 1Fh
		cmp	al, bl
		jb	short loc_code_57C8
		mov	dl, 2

loc_code_57C8:				; CODE XREF: sub_code_57A6+1Ej
		and	dl, ds:0
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FDh
		or	al, dl
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_57A6	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_57D5	proc near		; CODE XREF: sub_code_1D76:loc_code_1D81p
		mov	word ptr ds:5A85h, 0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5A83h, dx
		retn
sub_code_57D5	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_57E4	proc near		; CODE XREF: sub_code_1D76:loc_code_1DDFp
					; sub_code_5BE0:loc_code_5C0Dp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5828
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:5A83h
		cmp	ax, 2
		jb	short locret_code_5828
		mov	ds:5A83h, dx
		mov	bx, ds:5A85h
		add	word ptr ds:5A85h, 2
		cmp	byte ptr ds:552h, 0
		jz	short loc_code_581B
		mov	ax, [bx+5AA3h]
		cmp	ax, 0
		jnz	short loc_code_581F
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_581B:				; CODE XREF: sub_code_57E4+28j
		mov	ax, [bx+5A87h]

loc_code_581F:				; CODE XREF: sub_code_57E4+31j
		push	ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ax
		call	sub_code_5889

locret_code_5828:			; CODE XREF: sub_code_57E4+5j
					; sub_code_57E4+14j
		retn
sub_code_57E4	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5829	proc near		; CODE XREF: sub_code_3AAC+8p
		mov	word ptr ds:5A62h, 0
		mov	byte ptr ds:5A82h, 0
		retn
sub_code_5829	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5835	proc near		; CODE XREF: sub_code_38B0:loc_code_39BBp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5846
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:5A80h
		jnz	short loc_code_5847

locret_code_5846:			; CODE XREF: sub_code_5835+5j
		retn
; ---------------------------------------------------------------------------

loc_code_5847:				; CODE XREF: sub_code_5835+Fj
		mov	ds:5A80h, dx
		inc	byte ptr ds:5A82h
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	bx, ds:5A62h
		test	byte ptr ds:5A82h, 1
		jnz	short loc_code_5861
		add	bx, 2

loc_code_5861:				; CODE XREF: sub_code_5835+27j
		mov	ax, [bx+5A64h]
		call	sub_code_5889
		retn
sub_code_5835	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5869	proc near		; CODE XREF: sub_code_3AAC+1Ep
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5888
		push	bx
		push	ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	bx, ds:5A62h
		add	word ptr ds:5A62h, 2
		mov	ax, [bx+5A64h]
		call	sub_code_5889
		pop	ax
		pop	bx

locret_code_5888:			; CODE XREF: sub_code_5869+5j
		retn
sub_code_5869	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5889	proc near		; CODE XREF: sub_code_546D+30p
					; sub_code_546D+87p ...
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5889	endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_2. PRESS KEYPAD "+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================


sub_code_5897	proc near		; CODE XREF: sub_code_1C67:loc_code_1C8Cp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_58BC
		push	ax
		push	cx
		push	dx
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	bx, ds:5A56h
		and	bx, 6
		add	word ptr ds:5A56h, 2
		mov	ax, [bx+5A5Ah]
		call	sub_code_5889
		pop	dx
		pop	cx
		pop	ax

locret_code_58BC:			; CODE XREF: sub_code_5897+5j
		retn
sub_code_5897	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_58BD	proc near		; CODE XREF: start+152p start+27Bp ...
		mov	byte ptr ds:5927h, 80h ; '�'
		mov	byte ptr ds:5928h, 0
		mov	byte ptr ds:5929h, 0
		mov	word ptr ds:592Ah, 500h
		mov	byte ptr ds:592Ch, 0FFh
		mov	byte ptr ds:592Dh, 0
		mov	byte ptr ds:5920h, 0
		mov	byte ptr ds:5B07h, 0
		mov	word ptr ds:5B08h, 0
		mov	word ptr ds:5B0Ch, 1
		mov	byte ptr ds:5B0Eh, 1
		retn
sub_code_58BD	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_58F8	proc near		; CODE XREF: sub_code_8E5+64Bp
		cmp	byte ptr ds:1CBFh, 0
		jnz	short loc_code_5908
		mov	bx, 390h
		mov	cx, 1800h
		call	sub_code_59A3

loc_code_5908:				; CODE XREF: sub_code_58F8+5j
		mov	byte ptr ds:127Ch, 0
		retn
sub_code_58F8	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_590E	proc near		; CODE XREF: sub_code_1657+6Ap
		cmp	byte ptr ds:1CBFh, 0
		jnz	short locret_code_591E
		mov	bx, 400h
		mov	cx, 1800h
		call	sub_code_59A3

locret_code_591E:			; CODE XREF: sub_code_590E+5j
		retn
sub_code_590E	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_591F	proc near		; CODE XREF: sub_code_8E5+578p
		mov	bx, 7D0h
		mov	cx, 1800h
		call	sub_code_59A3
		mov	bx, 0A6Eh
		mov	cx, 1800h
		call	sub_code_59A3
		mov	bx, 0DECh
		mov	cx, 1800h
		call	sub_code_59A3
		retn
sub_code_591F	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_593B	proc near		; CODE XREF: sub_code_2567+F2p
					; sub_code_2E60+102p ...
		cmp	byte ptr ds:0, 0
		jz	short locret_code_595C
		mov	ds:5923h, bx
		push	ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ax
		call	sub_code_5889
		mov	byte ptr ds:5920h, 2
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5921h, dx

locret_code_595C:			; CODE XREF: sub_code_593B+5j
		retn
sub_code_593B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_595D	proc near		; CODE XREF: sub_code_4340+44p
					; sub_code_4340+BFp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_597E
		cmp	byte ptr ds:5920h, 0
		jnz	short locret_code_597E
		call	sub_code_2DFD
		mov	ax, dx
		and	ax, 7Fh
		add	ax, 0AAh ; '�'
		mov	bx, ax
		add	ax, 1Eh
		call	sub_code_593B

locret_code_597E:			; CODE XREF: sub_code_595D+5j
					; sub_code_595D+Cj
		retn
sub_code_595D	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_597F	proc near		; CODE XREF: sub_code_8E5+92p
		cmp	byte ptr ds:0, 0
		jz	short locret_code_59A2
		mov	ax, 1200h
		mov	bx, 1312h
		add	ax, ds:5B08h
		add	bx, ds:5B08h
		add	word ptr ds:5B08h, 15Eh
		call	sub_code_593B
		mov	byte ptr ds:5B07h, 18h

locret_code_59A2:			; CODE XREF: sub_code_597F+5j
		retn
sub_code_597F	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_59A3	proc near		; CODE XREF: sub_code_58F8+Dp
					; sub_code_590E+Dp ...
		cmp	byte ptr ds:0, 0
		jz	short locret_code_59CA
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, bx
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_59C5
		shr	cx, 1

loc_code_59C5:				; CODE XREF: sub_code_59A3+1Ej
					; sub_code_59A3:loc_code_59C5j
		loop	loc_code_59C5
		call	sub_code_5B21

locret_code_59CA:			; CODE XREF: sub_code_59A3+5j
		retn
sub_code_59A3	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_59CB	proc near		; CODE XREF: sub_code_8E5+52Dp
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FEh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5A40h, dx
		mov	word ptr ds:5A42h, 0

loc_code_59DF:				; CODE XREF: sub_code_59CB+4Bj
		mov	ax, ds:5A42h
		mov	cl, 6
		shr	ax, cl
		jnz	short loc_code_59E9
		inc	ax

loc_code_59E9:				; CODE XREF: sub_code_59CB+1Bj
		mov	cx, ax

loc_code_59EB:				; CODE XREF: sub_code_59CB+2Dj
					; sub_code_59CB+34j
		push	cx
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		pop	cx
		sub	dx, ds:5A40h
		cmp	dx, 2
		jb	short loc_code_59EB
		cmp	dx, 7
		jnb	short loc_code_5A18
		loop	loc_code_59EB
		call	sub_code_2DFD
		and	dl, 2
		and	dl, ds:0
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		xor	al, dl
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		add	word ptr ds:5A42h, 7
		jmp	short loc_code_59DF
; ---------------------------------------------------------------------------

loc_code_5A18:				; CODE XREF: sub_code_59CB+32j
		call	sub_code_5B21
		retn
sub_code_59CB	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5A1C	proc near		; CODE XREF: sub_code_1166:loc_code_11ABp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5A34
		call	sub_code_13B7
		mov	bx, ds:5A16h
		sub	bx, ax
		jb	short loc_code_5A35
		cmp	bx, 260h
		ja	short loc_code_5A35

locret_code_5A34:			; CODE XREF: sub_code_5A1C+5j
		retn
; ---------------------------------------------------------------------------

loc_code_5A35:				; CODE XREF: sub_code_5A1C+10j
					; sub_code_5A1C+16j
		mov	ds:5A16h, ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		inc	word ptr ds:5A18h
		mov	bx, ds:5A18h
		and	bx, 1Eh
		mov	ax, ds:5A3Ch
		and	ax, 3FFh
		cmp	ax, 180h
		jb	short loc_code_5A59
		mov	cx, 180h
		sub	cx, ax
		xchg	ax, cx

loc_code_5A59:				; CODE XREF: sub_code_5A1C+35j
		shr	ax, 1
		shr	ax, 1
		add	ax, [bx+5A1Ah]
		mov	bx, 1
		cmp	byte ptr ds:697h, 0FDh ; '�'
		jnz	short loc_code_5A6D
		shl	bl, 1

loc_code_5A6D:				; CODE XREF: sub_code_5A1C+4Dj
		add	ds:5A3Eh, bx
		shl	bx, 1
		shl	bx, 1
		add	ds:5A3Ch, bx
		mov	dx, ds:5A3Eh
		mov	cl, 3
		shr	dx, cl
		add	ax, dx
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5A1C	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5A90	proc near		; CODE XREF: sub_code_2567:loc_code_25ECp
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5AA1
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:5A14h
		jnz	short loc_code_5AA2

locret_code_5AA1:			; CODE XREF: sub_code_5A90+5j
		retn
; ---------------------------------------------------------------------------

loc_code_5AA2:				; CODE XREF: sub_code_5A90+Fj
		mov	ds:5A14h, dx
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	sub_code_2DFD
		mov	ax, dx
		and	ax, 70h
		add	ax, 200h
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5A90	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5AC2	proc near		; CODE XREF: sub_code_8E5+466p
		mov	word ptr ds:5A12h, 338h
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5A10h, dx
		call	sub_code_13B7
		mov	ds:5A0Eh, ax

loc_code_5AD6:				; CODE XREF: sub_code_5AC2+59j
		call	sub_code_13B7
		mov	dx, ax
		sub	ax, ds:5A0Eh
		cmp	ax, 9C40h
		jb	short loc_code_5B10
		mov	ds:5A0Eh, dx
		cmp	byte ptr ds:0, 0
		jz	short loc_code_5B10
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	sub_code_2DFD
		mov	ax, dx
		and	ax, 7FFh
		add	ax, ds:5A12h
		sub	word ptr ds:5A12h, 2
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_code_5B10:				; CODE XREF: sub_code_5AC2+20j
					; sub_code_5AC2+2Bj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:5A10h
		cmp	dx, 2
		jb	short loc_code_5AD6
		call	sub_code_5B21
		retn
sub_code_5AC2	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5B21	proc near		; CODE XREF: start+93p	start+99p ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5B21	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5B28	proc near		; CODE XREF: sub_code_546D+12Dp
					; sub_code_546D:loc_code_568Dp
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:592Ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		call	sub_code_13B7
		mov	cx, ax

loc_code_5B40:				; CODE XREF: sub_code_5B28+23j
		call	sub_code_13B7
		mov	dx, cx
		sub	dx, ax
		cmp	dx, ds:592Eh
		jb	short loc_code_5B40
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5B28	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5B54	proc near		; CODE XREF: sub_code_5060+BDp
					; sub_code_528Bp
		mov	word ptr ds:59BEh, 0
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:59C0h, dx
		retn
sub_code_5B54	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5B63	proc near		; CODE XREF: sub_code_38B0+106p
					; sub_code_5060+48p ...
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5B79
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:59C0h
		cmp	ax, 2
		jnb	short loc_code_5B7A

locret_code_5B79:			; CODE XREF: sub_code_5B63+5j
		retn
; ---------------------------------------------------------------------------

loc_code_5B7A:				; CODE XREF: sub_code_5B63+14j
		mov	ds:59C0h, dx
		mov	bx, ds:59BEh
		and	bx, 0FEh
		cmp	bx, 86h	; '�'
		jb	short loc_code_5B92
		sub	bx, bx
		mov	ds:59BEh, bx

loc_code_5B92:				; CODE XREF: sub_code_5B63+27j
		add	word ptr ds:59BEh, 2
		mov	ax, [bx+5934h]
		mov	cx, ds:59BCh
		mov	ds:59BCh, ax
		cmp	ax, cx
		jnz	short loc_code_5BAA
		call	sub_code_5B21
		retn
; ---------------------------------------------------------------------------

loc_code_5BAA:				; CODE XREF: sub_code_5B63+41j
		mov	cx, ax
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, cx
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
sub_code_5B63	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5BBF	proc near		; CODE XREF: sub_code_528B+17p
					; sub_code_5BBF+Fj
		cmp	byte ptr ds:0, 0
		jz	short locret_code_5BD0
		call	sub_code_5B63
		cmp	word ptr ds:59BEh, 7Ch ; '|'
		jb	short sub_code_5BBF

locret_code_5BD0:			; CODE XREF: sub_code_5BBF+5j
		retn
sub_code_5BBF	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5BE0	proc near		; CODE XREF: sub_code_1D76+49p
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:5F66h, dx
		mov	word ptr ds:5F60h, 0

loc_code_5BEE:				; CODE XREF: sub_code_5BE0+76j
		mov	ax, 0B800h
		mov	es, ax
		mov	bx, ds:5F60h
		add	word ptr ds:5F60h, 2
		and	bx, 2
		mov	si, [bx+5F62h]
		mov	di, 0A74h
		mov	cx, 4404h
		call	sub_code_2D9D

loc_code_5C0D:				; CODE XREF: sub_code_5BE0+3Dj
		call	sub_code_57E4
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, ds:5F66h
		cmp	ax, 4
		jb	short loc_code_5C0D
		mov	ds:5F66h, dx
		cmp	word ptr ds:5F60h, 4
		jnz	short loc_code_5C36
		mov	si, 5F68h
		mov	di, 668h
		mov	cx, 1004h
		call	sub_code_2D9D

loc_code_5C36:				; CODE XREF: sub_code_5BE0+48j
		mov	bx, ds:5F60h
		sub	bx, 8
		jb	short loc_code_5C51
		cmp	bx, 6
		jnb	short loc_code_5C51
		mov	si, 5FE8h
		mov	di, [bx+60E4h]
		mov	cx, 1506h
		call	sub_code_2D9D

loc_code_5C51:				; CODE XREF: sub_code_5BE0+5Dj
					; sub_code_5BE0+62j
		cmp	word ptr ds:5F60h, 10h
		jb	short loc_code_5BEE
		call	sub_code_5B21
		retn
sub_code_5BE0	endp

; ---------------------------------------------------------------------------
		align 8

; =============== S U B	R O U T	I N E =======================================


sub_code_5C60	proc near		; CODE XREF: start+5p
		int	11h		; EQUIPMENT DETERMINATION
					; Return: AX = equipment flag bits
		and	al, 30h
		cmp	al, 30h	; '0'
		jnz	short locret_code_5C95
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	ax, 55AAh
		mov	ds:0, ax
		mov	ax, ds:0
		cmp	ax, 55AAh
		jnz	short loc_code_5C96
		mov	si, 60F0h
		call	sub_code_5C9E
		mov	ax, 40h	; '@'
		mov	ds, ax
		assume ds:nothing
		mov	ax, ds:10h
		and	al, 0CFh
		or	al, 10h
		mov	ds:10h,	ax
		mov	ax, 4
		int	10h		; - VIDEO - SET	VIDEO MODE
					; AL = mode

locret_code_5C95:			; CODE XREF: sub_code_5C60+6j
		retn
; ---------------------------------------------------------------------------

loc_code_5C96:				; CODE XREF: sub_code_5C60+19j
		mov	si, 6112h
		call	sub_code_5C9E

loc_code_5C9C:				; CODE XREF: sub_code_5C60:loc_code_5C9Cj
		jmp	short loc_code_5C9C
sub_code_5C60	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5C9E	proc near		; CODE XREF: sub_code_5C60+1Ep
					; sub_code_5C60+39p
		mov	ax, seg	data
		mov	ds, ax
		assume ds:data
		call	sub_code_5E2B
		retn
sub_code_5C9E	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5CB0	proc near		; CODE XREF: start+96p
		cld
		mov	word_data_4, 0
		call	sub_code_1830
		call	sub_code_2330
		call	sub_code_2A30
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 6152h
		mov	cx, 1D0Bh
		mov	di, 0BDh ; '�'
		call	sub_code_2D9D
		mov	si, 63D0h
		mov	cx, 160Eh
		mov	di, 69Eh
		call	sub_code_2D9D
		mov	si, 6638h
		mov	cx, 0C03h
		mov	di, 0A78h
		call	sub_code_2D9D
		mov	si, 6680h
		mov	cx, 80Eh
		mov	di, 0CA8h
		call	sub_code_2D9D
		mov	si, 6760h
		mov	cx, 0B0Ch
		mov	di, 1D6Eh
		call	sub_code_2D9D
		mov	si, 6868h
		mov	cx, 804h
		mov	di, 1DECh
		call	sub_code_2D9D
		mov	word_data_6A8D,	0
		call	sub_code_5E3B
		mov	word_data_8+571h, 0
		call	sub_code_70D
		mov	byte ptr word_data_8+573h, 60h ; '`'
		mov	byte ptr word_data_8+574h, 92h ; '�'
		call	sub_code_26F2
		call	sub_code_26FC
		mov	byte ptr word_data_8+1F78h, 9
		mov	byte ptr word_data_8+1F79h, 0FFh
		call	sub_code_26B3
		call	sub_code_1E40
		mov	byte ptr word_data_8+690h, 0
		mov	byte ptr word_data_8+691h, 0
		mov	byte_data_6A8A,	0
		mov	ax, word_data_8+68Bh
		mov	word_data_8+6148h, ax

loc_code_5D54:				; CODE XREF: sub_code_5CB0+ECj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word_data_6A8B,	dx
		mov	word_data_8+531Ah, dx
		mov	word_data_6A93,	dx
		sub	dx, 30h	; '0'
		mov	word_data_6A88,	dx
		mov	word_data_8+5318h, 0

loc_code_5D71:				; CODE XREF: sub_code_5CB0+121j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, word_data_6A93
		cmp	ax, 24h	; '$'
		jb	short loc_code_5D89
		mov	word_data_6A93,	dx
		push	dx
		call	sub_code_5E3B
		pop	dx

loc_code_5D89:				; CODE XREF: sub_code_5CB0+CEj
		sub	dx, word_data_6A8B
		mov	ax, word_data_8+56D2h
		cmp	byte ptr word_data_8+412h, 0
		jz	short loc_code_5DA0
		add	ax, 48h	; 'H'
		cmp	dx, ax
		jnb	short loc_code_5D54
		jmp	short loc_code_5DA7
; ---------------------------------------------------------------------------

loc_code_5DA0:				; CODE XREF: sub_code_5CB0+E5j
		add	ax, 6
		cmp	dx, ax
		ja	short locret_code_5DD3

loc_code_5DA7:				; CODE XREF: sub_code_5CB0+EEj
		call	sub_code_53B0
		call	sub_code_5DD4
		cmp	byte ptr word_data_8+693h, 0
		jz	short loc_code_5DCA
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	al, 10h
		jz	short loc_code_5DC3
		mov	byte_data_6A8A,	1
		jmp	short loc_code_5DCA
; ---------------------------------------------------------------------------

loc_code_5DC3:				; CODE XREF: sub_code_5CB0+10Aj
		cmp	byte_data_6A8A,	0
		jnz	short locret_code_5DD3

loc_code_5DCA:				; CODE XREF: sub_code_5CB0+102j
					; sub_code_5CB0+111j
		mov	ax, word_data_8+6148h
		cmp	ax, word_data_8+68Bh
		jz	short loc_code_5D71

locret_code_5DD3:			; CODE XREF: sub_code_5CB0+F5j
					; sub_code_5CB0+118j
		retn
sub_code_5CB0	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5DD4	proc near		; CODE XREF: sub_code_5CB0+FAp
		cmp	word_data_8+571h, 20h ;	' '
		ja	short loc_code_5DE2
		mov	byte ptr word_data_8+690h, 1
		jmp	short loc_code_5E1C
; ---------------------------------------------------------------------------

loc_code_5DE2:				; CODE XREF: sub_code_5DD4+5j
		cmp	word_data_8+571h, 120h
		jb	short loc_code_5DF1
		mov	byte ptr word_data_8+690h, 0FFh
		jmp	short loc_code_5E1C
; ---------------------------------------------------------------------------

loc_code_5DF1:				; CODE XREF: sub_code_5DD4+14j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ax, dx
		sub	ax, word_data_6A88
		cmp	ax, 12h
		jb	short loc_code_5E1C
		mov	word_data_6A88,	dx
		call	sub_code_2DFD
		mov	byte ptr word_data_8+690h, 0
		cmp	dl, 0A0h ; '�'
		ja	short loc_code_5E1C
		and	dl, 1
		jnz	short loc_code_5E18
		mov	dl, 0FFh

loc_code_5E18:				; CODE XREF: sub_code_5DD4+40j
		mov	byte ptr word_data_8+690h, dl

loc_code_5E1C:				; CODE XREF: sub_code_5DD4+Cj
					; sub_code_5DD4+1Bj ...
		call	sub_code_13D8
		jz	short locret_code_5E2A
		mov	word_data_8+56Ah, 4
		call	sub_code_8E5

locret_code_5E2A:			; CODE XREF: sub_code_5DD4+4Bj
		retn
sub_code_5DD4	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5E2B	proc near		; CODE XREF: sub_code_5C9E+5p
					; sub_code_5E2B+Dj ...
		lodsb
		cmp	al, 0
		jz	short locret_code_5E3A
		push	si
		mov	bl, 2
		mov	ah, 0Eh
		int	10h		; - VIDEO - WRITE CHARACTER AND	ADVANCE	CURSOR (TTY WRITE)
					; AL = character, BH = display page (alpha modes)
					; BL = foreground color	(graphics modes)
		pop	si
		jmp	short sub_code_5E2B
; ---------------------------------------------------------------------------

locret_code_5E3A:			; CODE XREF: sub_code_5E2B+3j
		retn
sub_code_5E2B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5E3B	proc near		; CODE XREF: sub_code_5CB0+63p
					; sub_code_5CB0+D5p
		mov	ax, 0B800h
		mov	es, ax
		add	word_data_6A8D,	2
		mov	bx, word_data_6A8D
		and	bx, 2
		mov	si, [bx+6A8Fh]
		mov	cx, 0C0Ah
		mov	di, 1D38h
		call	sub_code_2D9D
		retn
sub_code_5E3B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5E5B	proc near		; CODE XREF: sub_code_5FB1+8p
		mov	dl, 0
		mov	bh, dl
		mov	ah, 2
		int	10h		; - VIDEO - SET	CURSOR POSITION
					; DH,DL	= row, column (0,0 = upper left)
					; BH = page number
		retn
sub_code_5E5B	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_5E70	proc near		; CODE XREF: sub_code_1338+1Cp
		call	sub_code_5B21
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word ptr byte_data_6D37+0C5h, dx
		mov	word ptr byte_data_6D37+0C7h, cx
		push	ds
		push	ds
		pop	es
		assume es:data
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	si, 0DCAh
		mov	di, 0Eh
		mov	cx, 1020h
		call	sub_code_2DCA
		pop	ds
		assume ds:nothing
		mov	dx, 0B05h
		mov	bh, 0
		mov	ah, 2
		int	10h		; - VIDEO - SET	CURSOR POSITION
					; DH,DL	= row, column (0,0 = upper left)
					; BH = page number
		mov	si, 6D91h
		cld
		call	sub_code_5E2B
		mov	dx, 0C05h
		mov	bh, 0
		mov	ah, 2
		int	10h		; - VIDEO - SET	CURSOR POSITION
					; DH,DL	= row, column (0,0 = upper left)
					; BH = page number
		mov	si, 6DB2h
		cmp	byte ptr ds:69Bh, 0
		jz	short loc_code_5EBA
		mov	si, 6DD3h

loc_code_5EBA:				; CODE XREF: sub_code_5E70+45j
		cld
		call	sub_code_5E2B
		call	sub_code_5F97
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		mov	si, 0Eh
		mov	di, 0DCAh
		mov	cx, 1020h
		call	sub_code_2D9D
		mov	ah, 1
		mov	cx, ds:6DFEh
		mov	dx, ds:6DFCh
		int	1Ah		; CLOCK	- SET TIME OF DAY
					; CX:DX	= clock	count
					; Return: time of day set
		mov	ax, ds:693h
		mov	ds:6E00h, ax
		retn
sub_code_5E70	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5EE5	proc near		; CODE XREF: start+A6p
		call	sub_code_5B21

loc_code_5EE8:				; CODE XREF: sub_code_5EE5+30j
		call	sub_code_5FCD
		mov	word ptr ds:6D8Fh, 0
		call	sub_code_5FB1

loc_code_5EF4:				; CODE XREF: sub_code_5EE5+24j
		mov	ax, ds:693h

loc_code_5EF7:				; CODE XREF: sub_code_5EE5+16j
		cmp	ax, ds:693h
		jz	short loc_code_5EF7
		test	byte ptr ds:6C1h, 80h
		jz	short loc_code_5F12
		test	byte ptr ds:6C2h, 80h
		jnz	short loc_code_5EF4
		mov	byte ptr ds:69Bh, 0
		jmp	short loc_code_5F1C
; ---------------------------------------------------------------------------

loc_code_5F12:				; CODE XREF: sub_code_5EE5+1Dj
		call	sub_code_5FE5
		jb	short loc_code_5EE8
		mov	byte ptr ds:69Bh, 1

loc_code_5F1C:				; CODE XREF: sub_code_5EE5+2Bj
		mov	cx, 5

loc_code_5F1F:				; CODE XREF: sub_code_5EE5+3Fj
		push	cx
		call	sub_code_5FB1
		pop	cx
		loop	loc_code_5F1F

loc_code_5F26:				; CODE XREF: sub_code_5EE5+69j
		mov	ax, ds:693h

loc_code_5F29:				; CODE XREF: sub_code_5EE5+48j
		cmp	ax, ds:693h
		jz	short loc_code_5F29
		sub	ax, ax
		test	byte ptr ds:6C3h, 80h
		jz	short loc_code_5F50
		inc	ax
		test	byte ptr ds:6C4h, 80h
		jz	short loc_code_5F50
		inc	ax
		test	byte ptr ds:6C5h, 80h
		jz	short loc_code_5F50
		inc	ax
		test	byte ptr ds:6C6h, 80h
		jnz	short loc_code_5F26

loc_code_5F50:				; CODE XREF: sub_code_5EE5+51j
					; sub_code_5EE5+59j ...
		mov	ds:6DF8h, ax
		mov	cx, 5

loc_code_5F56:				; CODE XREF: sub_code_5EE5+76j
		push	cx
		call	sub_code_5FB1
		pop	cx
		loop	loc_code_5F56
		cmp	byte ptr ds:69Bh, 0
		jz	short loc_code_5F7E
		mov	word ptr ds:6D8Fh, 20h ; ' '
		call	sub_code_5FB1
		call	sub_code_5FB1
		mov	word ptr ds:6D8Fh, 18h
		call	sub_code_5FB1
		call	sub_code_5FB1
		jmp	short loc_code_5F93
; ---------------------------------------------------------------------------

loc_code_5F7E:				; CODE XREF: sub_code_5EE5+7Dj
		mov	word ptr ds:6D8Fh, 1Ch
		call	sub_code_5FB1
		call	sub_code_5FB1
		mov	word ptr ds:6D8Fh, 16h
		call	sub_code_5FB1

loc_code_5F93:				; CODE XREF: sub_code_5EE5+97j
		call	sub_code_5F97
		retn
sub_code_5EE5	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5F97	proc near		; CODE XREF: sub_code_5E70+4Ep
					; sub_code_5EE5:loc_code_5F93p
		cmp	byte ptr ds:69Bh, 0
		jz	short loc_code_5FA7

loc_code_5F9E:				; CODE XREF: sub_code_5F97+Dj
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	al, 10h
		jnz	short loc_code_5F9E
		retn
; ---------------------------------------------------------------------------

loc_code_5FA7:				; CODE XREF: sub_code_5F97+5j
		mov	ax, ds:693h

loc_code_5FAA:				; CODE XREF: sub_code_5F97+17j
		cmp	ax, ds:693h
		jz	short loc_code_5FAA
		retn
sub_code_5F97	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5FB1	proc near		; CODE XREF: sub_code_5EE5+Cp
					; sub_code_5EE5+3Bp ...
		mov	bx, ds:6D8Fh
		mov	dx, [bx+6D63h]
		call	sub_code_5E5B
		mov	bx, ds:6D8Fh
		add	word ptr ds:6D8Fh, 2
		mov	si, [bx+6D37h]
		call	sub_code_5E2B
		retn
sub_code_5FB1	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5FCD	proc near		; CODE XREF: sub_code_5EE5:loc_code_5EE8p
		cld
		mov	ax, 0B800h
		mov	es, ax
		sub	ax, ax
		mov	di, ax
		mov	cx, 0FA0h
		rep stosw
		mov	di, 2000h
		mov	cx, 0FA0h
		rep stosw
		retn
sub_code_5FCD	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_5FE5	proc near		; CODE XREF: sub_code_5EE5:loc_code_5F12p
		int	11h		; EQUIPMENT DETERMINATION
					; Return: AX = equipment flag bits
		test	ax, 1000h
		jz	short loc_code_5FF6
		call	sub_code_600F
		jnb	short locret_code_600E
		call	sub_code_600F
		jnb	short locret_code_600E

loc_code_5FF6:				; CODE XREF: sub_code_5FE5+5j
		mov	word ptr ds:6D8Fh, 24h ; '$'
		mov	cx, 4

loc_code_5FFF:				; CODE XREF: sub_code_5FE5+1Dj
		call	sub_code_5FB1
		loop	loc_code_5FFF
		mov	ax, ds:693h

loc_code_6007:				; CODE XREF: sub_code_5FE5+26j
		cmp	ax, ds:693h
		jz	short loc_code_6007
		stc

locret_code_600E:			; CODE XREF: sub_code_5FE5+Aj
					; sub_code_5FE5+Fj
		retn
sub_code_5FE5	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_600F	proc near		; CODE XREF: sub_code_5FE5+7p
					; sub_code_5FE5+Cp
		mov	dx, 201h
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	ds:6DFAh, dx

loc_code_601B:				; CODE XREF: sub_code_600F+21j
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		test	al, 3
		jnz	short loc_code_6025
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_6025:				; CODE XREF: sub_code_600F+12j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		sub	dx, ds:6DFAh
		cmp	dx, 12h
		jb	short loc_code_601B
		stc
		retn
sub_code_600F	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_6040	proc near		; CODE XREF: sub_code_1D76+7p
		cld
		push	ds
		pop	es
		assume es:nothing
		mov	di, 0Eh
		mov	cx, 24h	; '$'
		sub	ax, ax
		rep stosw
		mov	word ptr ds:6F24h, 25h ; '%'
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing

loc_code_6058:				; CODE XREF: sub_code_6040+1Bj
					; sub_code_6040+6Dj
		call	sub_code_13D8
		jz	short loc_code_6058
		mov	si, 0Eh
		mov	di, ds:6F24h
		mov	cx, 0C03h
		call	sub_code_2D9D
		add	word ptr ds:6F24h, 1E0h
		mov	si, 6E10h
		mov	di, ds:6F24h
		mov	cx, 0C03h
		call	sub_code_2D9D

loc_code_607D:				; CODE XREF: sub_code_6040+45j
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:6F26h
		jz	short loc_code_607D
		mov	ds:6F26h, dx
		cmp	byte ptr ds:0, 0
		jz	short loc_code_60A7
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, ds:6F24h
		shr	ax, 1
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	��� OR	03H=spkr ON
					; 1: Tmr 2 data	ͼ  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_code_60A7:				; CODE XREF: sub_code_6040+50j
		cmp	word ptr ds:6F24h, 1A40h
		jb	short loc_code_6058
		mov	si, 6E58h
		mov	di, ds:6F24h
		mov	cx, 1106h
		call	sub_code_2D9D

loc_code_60BC:				; CODE XREF: sub_code_6040+84j
					; sub_code_6040+ADj
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:6F28h
		jz	short loc_code_60BC
		mov	ds:6F28h, dx
		cmp	byte ptr ds:0, 0
		jz	short loc_code_60E6
		mov	al, 0B6h ; '�'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, 0C00h
		test	dl, 1
		jz	short loc_code_60E0
		mov	ax, 0B54h

loc_code_60E0:				; CODE XREF: sub_code_6040+9Bj
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).

loc_code_60E6:				; CODE XREF: sub_code_6040+8Fj
		sub	dx, ds:6F26h
		cmp	dx, 12h
		jb	short loc_code_60BC
		call	sub_code_5B21
		retn
sub_code_6040	endp

; ---------------------------------------------------------------------------
		align 10h

; =============== S U B	R O U T	I N E =======================================


sub_code_6100	proc near		; CODE XREF: start+275p
		mov	byte ptr ds:70F2h, 0
		retn
sub_code_6100	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_6106	proc near		; CODE XREF: start+28Ap
		sub	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		cmp	dx, ds:70EEh
		jnz	short loc_code_6111
		retn
; ---------------------------------------------------------------------------

loc_code_6111:				; CODE XREF: sub_code_6106+8j
		mov	ds:70EEh, dx
		call	sub_code_62A6
		jnb	short loc_code_6129
		call	sub_code_11E3
		call	sub_code_622B
		call	sub_code_1145
		mov	byte ptr ds:70F2h, 0
		retn
; ---------------------------------------------------------------------------

loc_code_6129:				; CODE XREF: sub_code_6106+12j
		cmp	byte ptr ds:70F2h, 0
		jnz	short loc_code_619E

loc_code_6130:				; CODE XREF: sub_code_6106+3Ej
		call	sub_code_2DFD
		mov	bx, dx
		and	bx, 1Fh
		cmp	bl, 10h
		jb	short loc_code_6166
		sub	bl, 10h
		cmp	bl, 9
		ja	short loc_code_6130
		mov	dl, 1
		cmp	bl, 5
		jb	short loc_code_614F
		mov	dl, 0FFh

loc_code_614F:				; CODE XREF: sub_code_6106+45j
		mov	ds:70F6h, dl
		mov	byte ptr ds:70F5h, 6
		shl	bl, 1
		mov	ax, [bx+70B8h]
		add	ax, 4
		mov	ds:70F3h, ax
		jmp	short loc_code_6188
; ---------------------------------------------------------------------------

loc_code_6166:				; CODE XREF: sub_code_6106+36j
		mov	ax, 0Ch
		mov	dl, 1
		test	bl, 8
		jz	short loc_code_6175
		mov	ax, 120h
		mov	dl, 0FFh

loc_code_6175:				; CODE XREF: sub_code_6106+68j
		mov	ds:70F3h, ax
		mov	ds:70F6h, dl
		and	bl, 7
		mov	al, [bx+70B0h]
		add	al, 8
		mov	ds:70F5h, al

loc_code_6188:				; CODE XREF: sub_code_6106+5Ej
		mov	byte ptr ds:70F2h, 1
		mov	byte ptr ds:70F7h, 1
		mov	word ptr ds:70F0h, 0
		mov	word ptr ds:70ECh, 0FFFFh

loc_code_619E:				; CODE XREF: sub_code_6106+28j
		cmp	word ptr ds:70F0h, 0A0h	; '�'
		jnb	short loc_code_61AB
		add	word ptr ds:70F0h, 4

loc_code_61AB:				; CODE XREF: sub_code_6106+9Ej
		add	byte ptr ds:70F5h, 2
		cmp	byte ptr ds:70F5h, 0BFh	; '�'
		ja	short loc_code_61D4
		cmp	byte ptr ds:70F6h, 1
		jz	short loc_code_61C7
		sub	word ptr ds:70F3h, 5
		jb	short loc_code_61D4
		jmp	short loc_code_61DD
; ---------------------------------------------------------------------------

loc_code_61C7:				; CODE XREF: sub_code_6106+B6j
		add	word ptr ds:70F3h, 5
		cmp	word ptr ds:70F3h, 12Ch
		jb	short loc_code_61DD

loc_code_61D4:				; CODE XREF: sub_code_6106+AFj
					; sub_code_6106+BDj ...
		mov	byte ptr ds:70F2h, 0
		call	sub_code_622B
		retn
; ---------------------------------------------------------------------------

loc_code_61DD:				; CODE XREF: sub_code_6106+BFj
					; sub_code_6106+CCj
		mov	cx, ds:70F3h
		mov	dl, ds:70F5h
		call	sub_code_2CB0
		mov	ds:70FAh, ax
		call	sub_code_62A6
		jb	short loc_code_61D4
		call	sub_code_6245
		call	sub_code_622B
		call	sub_code_61FA
		retn
sub_code_6106	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_61FA	proc near		; CODE XREF: sub_code_2E60+F6p
					; sub_code_2F66+92p ...
		mov	ax, 0B800h
		mov	es, ax
		mov	byte ptr ds:70F7h, 0
		mov	ax, ds:70F0h
		and	ax, 1E0h
		add	ax, 6F30h
		cmp	byte ptr ds:70F6h, 0FFh
		jz	short loc_code_6217
		add	ax, 0C0h ; '�'

loc_code_6217:				; CODE XREF: sub_code_61FA+18j
		mov	si, ax
		mov	di, ds:70FAh
		mov	ds:70F8h, di
		mov	bp, 70CCh
		mov	cx, 802h
		call	sub_code_2CCC
		retn
sub_code_61FA	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_622B	proc near		; CODE XREF: sub_code_2E60+B3p
					; sub_code_2F66+61p ...
		cmp	byte ptr ds:70F7h, 0
		jnz	short locret_code_6244
		mov	ax, 0B800h
		mov	es, ax
		mov	si, 70CCh
		mov	di, ds:70F8h
		mov	cx, 802h
		call	sub_code_2D9D

locret_code_6244:			; CODE XREF: sub_code_622B+5j
		retn
sub_code_622B	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_6245	proc near		; CODE XREF: sub_code_6106+EAp
		mov	al, ds:70F5h
		sub	al, 8
		and	al, 0F8h
		mov	cx, 7

loc_code_624F:				; CODE XREF: sub_code_6245+13j
		mov	bx, cx
		dec	bx
		cmp	al, [bx+2BD4h]
		jz	short loc_code_625B
		loop	loc_code_624F

locret_code_625A:			; CODE XREF: sub_code_6245+20j
					; sub_code_6245+25j ...
		retn
; ---------------------------------------------------------------------------

loc_code_625B:				; CODE XREF: sub_code_6245+11j
		mov	ax, ds:70F3h
		mov	cl, 4
		shr	ax, cl
		sub	ax, 2
		jb	short locret_code_625A
		cmp	ax, 10h
		jnb	short locret_code_625A
		mov	di, ax
		mov	dl, [bx+2BDBh]
		sub	dh, dh
		add	ax, dx
		cmp	ax, ds:70ECh
		jz	short locret_code_625A
		mov	ds:70ECh, ax
		mov	si, ax
		xor	byte ptr [si+2BE2h], 2
		mov	al, [si+2BE2h]
		sub	ah, ah
		shl	di, 1
		mov	cx, [di+70FCh]
		mov	dl, [bx+7120h]
		push	ax
		push	cx
		push	dx
		call	sub_code_622B
		pop	dx
		pop	cx
		pop	bx
		call	sub_code_30E3
		call	sub_code_61FA
		retn
sub_code_6245	endp


; =============== S U B	R O U T	I N E =======================================


sub_code_62A6	proc near		; CODE XREF: sub_code_6106+Fp
					; sub_code_6106+E5p
		cmp	byte ptr ds:70F2h, 0
		jnz	short loc_code_62AF
		clc
		retn
; ---------------------------------------------------------------------------

loc_code_62AF:				; CODE XREF: sub_code_62A6+5j
		mov	ax, ds:70F3h
		mov	dl, ds:70F5h
		mov	si, 10h
		mov	bx, ds:579h
		mov	dh, ds:57Bh
		mov	di, 18h
		mov	cx, 0E08h
		call	sub_code_2E29
		jnb	short locret_code_62EA
		mov	byte ptr ds:571h, 1
		mov	byte ptr ds:576h, 2
		mov	byte ptr ds:578h, 20h ;	' '
		mov	byte ptr ds:55Bh, 8
		mov	ax, 91Dh
		mov	bx, 0CE4h
		call	sub_code_593B
		stc

locret_code_62EA:			; CODE XREF: sub_code_62A6+24j
		retn
sub_code_62A6	endp

code		ends


		end start
