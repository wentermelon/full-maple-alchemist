;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
	CGP ADDITON: NO BUFFS ARE INCLUDED IN THIS MACRO. SKILL KEYS ARE AS FOLLOWS:
	CANNON BAZOOKA (MAIN MOBBING SKILL) -> Z
	INSERT -> BIG HUGE MISSILE
	CONTROL -> ROLLING RAINBOW
	NAUTILIUS STRIKE -> DELETE

	TIME DELAYS USED FOR MOVING CHAR LEFT & RIGHT WILL NEED TO BE ADJUSTED ACCORDING TO END-USERS SETTINGS. RIGHT NOW THIS MACRO HAS YOUR CHARACTER FACING
	RIGHT THE MAJORITY OF THE TIME SO THAT MISSILE / R.R / BAZOOKA FACE THE CORRECT DIRECTION (TO THE RIGHT). 
	CHARACTER APPEARS TO OCCASIONALLY ATTACK THE LEFT HAND SIDE - NOOO FUCKING CLUE HOW TO FIX THIS ATM WITHOUT CAUSING TOO MUCH CHAR. DRIFT ZZZZ


*/
!8:: 

	Send, leesgooo

	
	attack_count=0
	attack_max=30
	loop_count = 0
	loop_max = 10
	
	While ( toggle == 1 )
	{

		

		While ( toggle == 1 And loop_count < loop_max ) 
		{
				While ( toggle == 1 And attack_count < attack_max )
				{	
					Send {z down}
					Sleep 100
					attack_count += 1
				}
			Send, {z up}
			Sleep 100
			Send, {Insert down}
			Sleep 200
			Send, {Insert up}
			Send, {Ctrl down}
			Sleep 100
			Send, {Ctrl up}
			Send, {Del down}
			Sleep 200
			Send, {Del up}
			attack_count=0
			if ( toggle == 0 )
				break	
			loop_count+=1		
		}
		
		Send, {Left down}
		Sleep 100
		Send, {Left up}
		Send, {Right down}
		Sleep 220		
		Send, {Right up}
		loop_count = 0
	}

return