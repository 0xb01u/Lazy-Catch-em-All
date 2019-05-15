ld hl, $D321		; Loads the address of the 2nd item's quantity.
ld a, (hli)		; Loads the quantity of the 2nd item, used as loop control (should be -19).
ld bc, $0164		; Loads in b the ID of the Pokémon to give to the player;
			; Loads in c the level of that Pokémon (100).
push bc
push af			; Stores a, b and c on the stack.
ld b, b			; Useless instruction to make item placement easier.
call $3E48		; Calls the 'givePokemonToPlayer' function.
ld b, b			; Useless instruction to make item placement easier.
pop af
pop bc			; Restores a, b and c.
ld d, d			; Useless instruction to make item placement easier.
inc b			; Loads next Pokémon's ID.
inc a			; Increases loop counter.
jr nz, F5		; Jumps to 5 if a != 0
ld a, b
ld hl $D328		; Loads the address of the 5th item
ld (hli), a		; Stores the ID of the next Pokémon given to the player on next execution
ld a, 64
ld (hli), a
ret

; Program as hex string, and item bag:
; 21 21		Thunderstone		x33
; D3 2A		TM11			x42
; 01 64		Master Ball		x100
; 01 C5		Master Ball		x197
; F5 40		TM45			x64
; CD 48		TM05			x72
; 3E 40		Lemonade		x64
; F1 C1		Elixer			x04
; 52 04		Fresh Water		x32
; 3C 20		Fresh Water		x32
; F5 78		TM42			x120
; 21 28		Thunderstone		x04
; D3 22		TM11			x34
; 3E 64		Lemonade		x100
; 22 C9		Water Stone		x201