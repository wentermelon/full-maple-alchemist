#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/* 
	INITIALIZE VARIABLES
*/

toggle = 1


/*
	HOTKEY: {CTRL + `}
	
	FUNCTION: "TOGGLE" 
		toggles the "toggle" variable from 0->1 and vice versa for macro scripts below.
*/

^`::
	if ( toggle )
		toggle = 0
	else
		toggle = 1
return

/*
	HOTKEY: {CTRL + 1}
	
	FUNCTION: "FLAT MAP TRAVEL"
		traverses map from left->right using flash_jump_attack()
		
		logic exits when toggle == 0
		
		1. basic buffs first using buff()
		
		2. loops the traversal loop_count times
		
		3. reverses direction after jump_count times 
*/

^1::

	jump_times = 5
	loop_count = 0
	
	While ( toggle == 1 )
	{
	
		buff()
		
		While ( toggle == 1 ) 
		{
			if ( loop_count > 5 )
				break
		
			Send, {Right down}
			Sleep 200
			Send, {Right up}
			
			Loop %jump_times% 
			{
				flash_jump_attack()
			}
			
			if ( toggle == 0 )
				break
			
			Send, {Left down}
			Sleep 200
			Send, {Left up}
			
			Loop %jump_times%
			{
				flash_jump_attack()
			}
			
			loop_count += 1
		}
		
		loop_count = 0
		
	}
	
	loop_count = 0

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
	
	Send, 6
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


	

