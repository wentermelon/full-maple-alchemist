#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/* 
	INITIALIZE VARIABLES
*/

toggle = 0

/*
	HOTKEY: { ALT + ` }
	
	MACRO: "TOGGLE" 
		toggles the "toggle" variable from 0->1 and vice versa for macro scripts below.
*/

!`::
	if ( toggle )
	{
		toggle = 0
		Send, I
	}
	else
	{
		toggle = 1
		Send, I
	}

return

/*
	HOTKEY: { ALT + 1 }
	
	MACRO: "SWIM"
		traverses map from left->right and right->left using flash_jump_attack()
*/

!1::

	; jump variables indicate how many jumps from one side of the map to the other
	jump_count = 0
	jump_max = 5

	; loop variables indicate how many times the loop should execute until buffing again
	loop_count = 0
	loop_max = 5
	
	While ( toggle == 1 )
	{
	
		;buff()
		
		While ( toggle == 1 And loop_count < loop_max ) 
		{
			Send, {Right down}
			Sleep 200
			Send, {Right up}
			
			While ( toggle == 1 And jump_count < jump_max ) 
			{
				flash_jump_attack()
				jump_count += 1
			}

			if ( toggle == 0 )
				break
			
			jump_count = 0

			Send, {Left down}
			Sleep 200
			Send, {Left up}
			
			While ( toggle == 1 And jump_count < jump_max ) 
			{
				flash_jump_attack()
				jump_count += 1
			}

			if ( toggle == 0 )
				break
			
			jump_count = 0
			loop_count += 1
		}
		
		loop_count = 0
		
	}

return

/*

	HOTKEY: { ALT + 2 }

	MACRO: FLAT PLAT LEFT/RIGHT
*/
!2:: 
	attack_count = 0
	attack_max = 5000

	loop_count = 0
	loop_max = 5

	While ( toggle == 1 )
	{

		;buff()

		While ( toggle == 1 And loop_count < loop_max )
		{ 
			Send {Left down}
			Sleep 200
			Send {Left up}

			While ( toggle == 1 And attack_count < attack_max )
			{
				Send {z down}
				Sleep 30
				attack_count += 30
			}

			Send {z up}

			attack_count = 0

			if ( toggle == 0 )
				break

			Sleep 500

			Send {Right down}
			Sleep 200
			Send {Right up}

			While ( toggle == 1 And attack_count < attack_max )
			{
				Send {z down}
				Sleep 30
				attack_count += 30
			}

			Send {z up}

			Sleep 500

			attack_count = 0

			loop_count += 1
		}

		loop_count = 0
	}

return

/* 
	HOTKEY: { ALT + 3 }

	MACRO: FPOT TOP LEFT

*/
!3::
	attack_count = 0
	attack_max = 10000

	loop_count = 0
	loop_max = 5

	While ( toggle == 1 )
	{

		;buff()

		While ( toggle == 1 And loop_count < loop_max )
		{
			While ( toggle == 1 And attack_count < attack_max )
			{
				Send {x down}
				Sleep 30
				attack_count += 30
			}

			Send {x up}

			attack_count = 0

			if ( toggle == 0 )
				break

			Sleep 500

			Send {Right down}
			Sleep 800
			Send {Right up}

			Sleep 500

			Send {Left down}		
			Sleep 100
			Send {Left up}

			Sleep 500

			While ( toggle == 1 And attack_count < attack_max )
			{
				Send {x down}
				Sleep 30
				attack_count += 30
			}

			Send {x up}

			if ( toggle == 0 )
				break	

			attack_count = 0

			Send {Left down}
			Sleep 800
			Send {Left up}

			Sleep 500

			Send {Right down}		
			Sleep 100
			Send {Right up}

			Sleep 500



			loop_count += 1
		}

		loop_count = 0
	}

return

/* 
	HOTKEY: { ALT + 4 }

	MACRO: JUMP ATTACK SIDE-TO-SIDE
*/
!4::

	attack_count = 0
	attack_max = 15

	while ( toggle == 1 )
	{
		while ( toggle == 1 And attack_count < attack_max )
		{
			Send {Space}
			Sleep 90
			Send {z}
			Sleep 700
			attack_count += 1
		}

		if ( toggle == 0 )
			break

		attack_count = 0
		
		Sleep 1000

		Send {Right down}
		Sleep 500
		Send {Right up}
		
		Sleep 500

		Send {Left down}
		Sleep 200
		Send {Left up}

		Sleep 500

		while ( toggle == 1 And attack_count < attack_max )
		{
			Send {Space}
			Sleep 90
			Send {z}
			attack_count += 1
			Sleep 700
		}

		if ( toggle == 0 )
			break

		attack_count = 0

		Sleep 1000

		Send {Left down}
		Sleep 500
		Send {Left up}
		
		Sleep 500

		Send {Right down}
		Sleep 200
		Send {Right up}
	}

return

/*
	HOTKEY: { ALT + 5 }

	MACRO: AUTO GATHERING
*/
!5::

	While ( toggle == 1 )
	{
		Send, ``
		Sleep 5000

		Send, {Left down}
		Sleep 200
		Send, {Left up}
		Sleep 200

		if ( toggle == 0 )
			break

		Send, ``
		Sleep 5000

		Send, {Right down}
		Sleep 200
		Send, {Right up}
		Sleep 200
	}

return

/* 
	HOTKEY: { ALT + 6 }

	MACRO: AUTO CHAOS DOJO
*/
!6::

	attack_count = 0
	attack_max = 30000

	While ( toggle == 1 )
	{
		Send, {LButton}
		Sleep 2000

		Send, {Enter}
		Sleep 2000

		Send, {Down}
		Sleep 100
		
		Send, {Down}
		Sleep 100
		
		Send, {Down}
		Sleep 100

		Send, {Down}
		Sleep 100
		
		Send, {Enter}
		
		Sleep 2000

		buff()

		; Set 1
		Send, {Right down}
		Sleep 800
		Send, {Right up}

		While ( toggle == 1 And attack_count < attack_max )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0

		; Set 2
		Send, {Left down}
		Sleep 300
		Send, {Left up}

		Send, {Right down}
		Sleep 500
		Send, {Right up}

		While ( toggle == 1 And attack_count < attack_max )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0

		; Set 3
		Send, {Left down}
		Sleep 300
		Send, {Left up}

		Send, {Right down}
		Sleep 400
		Send, {Right up}

		While ( toggle == 1 And attack_count < attack_max )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0

		; Set 4
		Send, {Left down}
		Sleep 300
		Send, {Left up}

		Send, {Right down}
		Sleep 500
		Send, {Right up}

		While ( toggle == 1 And attack_count < attack_max )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0

		; Set 5
		Send, {Left down}
		Sleep 300
		Send, {Left up}

		Send, {Right down}
		Sleep 500
		Send, {Right up}

		While ( toggle == 1 And attack_count < 16000 )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		Send, e
		Sleep 1000
		Send, w
		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0

		While ( toggle == 1 And attack_count < 10000 )
		{
			Send, {z down}
			Sleep 30
			attack_count += 30
		}

		Send, {z up}

		Sleep 500

		if ( toggle == 0 )
			break

		attack_count = 0
		
		Sleep 1000

		Send, {Space}

		Sleep 1000

		Send, {PgDn}

		Sleep 2000
	}

return

/*
	FUNCTION: activate buffs on the listed keys
*/
buff()
{
	buff_delay = 1000

	Send, 1
	Sleep %buff_delay%
	
	Send, 2
	Sleep %buff_delay%
	
	Send, 3
	Sleep %buff_delay%
	
	Send, 4
	Sleep %buff_delay%

	Send, 6
	Sleep %buff_delay%

	;Send, y
	;Sleep %buff_delay%

	;Send, 5
	;Sleep %buff_delay%

	;Send, t
	;Sleep %buff_delay%

	return
}

/*
	FUNCTION: flash jump + attack macro
*/
flash_jump_attack()
{
		Send, {Space down}
		Sleep 98
		Send, {Space up}
		Sleep 87
		
		Send, {Space down}
		Sleep 45
		Send, {z down}
		Sleep 2
		Send, {Space up}
		
		Sleep 84
		Send, {z up}
		Sleep 750

		return
}




	

