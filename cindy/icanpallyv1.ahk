;#NoEnv  
; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/* 
	
	EDITED BY CGP on 6/27/20 FROM WENCY'S "WENSTIA" FILE
	THINGS ADDED: INITIALIZATION / TURN-OFF INDICATORS

*/

toggle = 0

/*
	HOTKEY: { ALT + ` }
	
	MACRO: "TOGGLE" 
		toggles the "toggle" variable from 0->1 and vice versa for macro scripts below.

	CGP ADDITION: "OFF" WILL BE SENT IN CHAT BOX WHEN TOGGLE IS TURNED OFF, "ON" WILL BE SENT WHEN TURNED ON.
	MUST HAVE TOGGLE SET TO "ON" BEFORE ALT+8 HOTKEY CAN PROPERLY EXECUTE MACRO.

*/

!`::
	if ( toggle )
	{
		toggle = 0
		Send, off
	}
	else
	{
		toggle = 1
		Send, on
	}

return

/*
	HOTKEY: { ALT + 8 }
	MACRO: FLAT PLAT LEFT/RIGHT

	CGP ADDITON: NO BUFFS ARE INCLUDED IN THIS MACRO, ITS JUST HEAVEN'S HAMMER (SET TO CONTROL) WITH GENTLE L/R/MID MOVEMENT.
	THE AMT. OF TIME TO HAVE CHAR MOVE L/R APPEARS TO SLIGHTLY VARY DEPENDING ON LAG?? WILL PROB. NEED TO ADJUST DEPENDING ON END-USERS LAG. 
	"LEESGOOO" WILL SEND IN CHAT BOX WHEN HOT KEY PROPERLY EXECUTED.
*/ 
!8:: 

	Send, leesgooo

	
	attack_count_left=0
	attack_count_mid=0
	attack_count_right=0
	attack_max=50
	loop_count = 0
	loop_max = 100
	
	While ( toggle == 1 )
	{

		

		While ( toggle == 1 And loop_count < loop_max ) 
		{
				While ( toggle == 1 And attack_count_mid < attack_max )
				{	
					Send {Ctrl down}
					Sleep 333
					attack_count_mid += 1
				}
			Send, {Ctrl up}
			Send, {Left down}
			Sleep, 100
			Send, {Left up}
				While ( toggle == 1 And attack_count_left < attack_max)
				{
					Send {Ctrl down}
					Sleep 333
					attack_count_left += 1
				}
			Send, {Right down}
			Sleep, 200
			Send, {Right up}
				While ( toggle == 1 And attack_count_right < attack_max)
				{
					Send {Ctrl down}
					Sleep 333
					attack_count_right += 1
				}
			Send, {Left down}
			Sleep, 100
			Send, {Left up}

			attack_count_left=0
			attack_count_mid=0
			attack_count_right=0

			if ( toggle == 0 )
				break	
			loop_count+=1		
		}
		
		
		loop_count = 0
	}

return