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
	
	FUNCTION: "TOGGLE" 
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
	
	FUNCTION: "SWIM"
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
	
		buff()
		
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

	FUNCTION: "AUTO HELL-DOJO"
		runs the user through hell Dojo 
		menu timing can vary if server is lagging

	TODO: FIX AND TEST
*/
!2:: 

	attack_count = 0

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
		
		Send, {Enter}
		
		Sleep 2000

		buff()

		; Set 1
		Send, {Right down}
		Sleep 800
		Send, {Right up}

		While ( toggle == 1 And attack_count < 30000 )
		{
			Send, {z down}
			Sleep 1000
			Send, {z up}
			attack_count += 1000
		}

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

		While ( toggle == 1 And attack_count < 30000 )
		{
			Send, {z down}
			Sleep 1000
			Send, {z up}
			attack_count += 1000
		}

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

		While ( toggle == 1 And attack_count < 30000 )
		{
			Send, {z down}
			Sleep 1000
			Send, {z up}
			attack_count += 1000
		}

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

		While ( toggle == 1 And attack_count < 10000 ) 
		{
			Send, {z down}
			Sleep 1000
			Send, {z up}
			attack_count += 1000
		}

		if ( toggle == 0 )
			break

		attack_count = 0

		Send, {PgDn}

		Sleep 2000
	}

return

/* 
	HOTKEY: { ALT + 3 }

	FUNCTION: "AUTO-GATHERING"
		harvests nodes on the left and right of the character
		repeatedly

	TODO: FIX AND TEST

*/
!3:
	While ( toggle == 1 )
	{
		Send, {Left down}
		Sleep 200
		Send, {Left up}

		Sleep 200

		Send, {`}

		Sleep 5000

		if ( toggle == 0 )
			break

		Send, {Right down}
		Sleep 200
		Send, {Right up}

		Sleep 200

		Send, {`}

		Sleep 5000
	}

return

/* 
	HOTKEY: { ALT + 4 }

	FUNCTION: STATIONARY FPOT1
*/
!4::
	attack_count = 0

	While ( toggle == 1 )
	{ 
		While ( toggle == 1 And attack_count < 20000)
		{
			Send, {x down}
			Sleep 30
			attack_count += 30
		}

		Send, {x up}

		if ( toggle == 0 )
			break

		attack_count = 0

		Send, {Space}
		Sleep 800

		Send, {Left down}
		Sleep 100
		Send, {Left up}

		Sleep 500
		Send, x
		Sleep 500

		Send, {Right down}
		Sleep 100
		Send, {Right up}

		Sleep 500
	}

return

/*
	FUNCTION: activate buffs on the listed keys
*/
buff()
{
	Send, 1
	Sleep 1000
	
	Send, 2
	Sleep 1000
	
	Send, 3
	Sleep 1000
	
	Send, 4
	Sleep 1000
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
}


	

