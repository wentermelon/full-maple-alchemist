﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Initialize main loop control variable

toggle = 0

/*
	HOTKEY: F11
	FUNCTION: "TOGGLE" 
	EXPLANATION: Toggles the "toggle" variable from 0 -> 1 (off -> on). The 'Equipment' window is opened to indicate that the variable is on.
*/

F11::
	Send, E
	
	if (toggle == 1)
	{
		toggle = 0
	}
	else
	{
		toggle = 1
	}	
	return

/*
	HOTKEY: F12
	CATEGORY: "Fast Farm", "No Movement"
	MAP: The Nest of a Dead Dragon, Lachelein Ballroom, Lachelein Clocktower
	FLOW:
	
		1. Use Dark Genesis
		2. Move left and wait
		3. Use Sweeping Staff
		4. Move right and wait
*/

F12::
	While (toggle == 1)
	{
		Send, T
		Sleep 1500
		position_left(1000)
		
		if ( toggle == 0)
			break
				
		Send, A
		Sleep 1500
		position_right(3500)
		
		if ( toggle == 0)
			break
	}
	return


/* 
	HOTKEY: F7
	CATEGORY: "Stasis Farm", "Swimming"
	MAP: Inside the Stone Colossus 2
	ADDITIONAL COMMENTS: Marked for refactoring - improve logic to replace redundant break conditions.
	FLOW:
	
		1. Hold Left
		2. Battle Burst, TP, Finishing Blow
		3. Hold Right
		4. Battle Burst, TP, Finishing Blow
*/

F7::
	While (toggle == 1)
	{
		swimming_loop_right()
		
		if (toggle == 0)
		{
			break
		}
		
		swimming_loop_right()
		
		if (toggle == 0)
		{
			break
		}
		
		swimming_loop_right()
		
		if (toggle == 0)
		{
			break
		}
			
		swimming_loop_left()
		
		if (toggle == 0)
		{
			break
		}
		
		swimming_loop_left()
		
		if (toggle == 0)
		{	
			break
		}
		
		swimming_loop_left()
		
		if (toggle == 0)
		{
			break
		}
	}
	return
	

	
/*
	HOTKEY: 'Minus' sign
	CATEGORY: "Stasis Farm", "No Movement"
	MAP: Nest of a Dead Dragon
	FLOW:
	
		1. Use Dark Genesis
		2. Move left and wait
		3. Use Sweeping Staff
		4. Use Dark Chain
		5. Use Final Blow
		6. Move right and wait
		7. Use Sweeping Staff
*/	

-::
	While ( toggle == 1 )
	{
		if ( toggle == 0 )
		{
			break
		}
	
		Send, T 
			; Dark Genesis cooldown starts: 12,000
		
		Sleep 1500
		position_left(3000)
		
		if ( toggle == 0 )
		{
			break
		}
		
		Send, A
			; Dark Genesis cooldown: 7,400 
			; Sweeping Staff cooldown starts: 6,000
		
		Sleep 2000
		Send, {Space down}
		Sleep 300
		Send, {Space up}
		Sleep 1500
		
		if ( toggle == 0 )
		{
			break
		}
		
		Send, V
			; Dark Genesis cooldown: 3,600
			; Sweeping Staff cooldown: 2,900
			
		Sleep 2000
		position_right(1000)
		
			; Sweeping Staff off cooldown!
		
		Send, A
		Sleep 3000
			
			; Dark Gensis off cooldown!
		
		if ( toggle == 0 )
		{
			break
		}
	}
	return

/*		
	HOTKEY: Numpad5
	CATEGORY: "Stasis Farm", "Climbing"
	MAP: Warped Path of Time <2>
	ADDITIONAL COMMENTS: Marked for refactoring - improve logic to replace redundant break conditions.
	FLOW:
	
		1. Chain into 3 Finishing Blows
		2. Rope lift
		3. Chain into 3 Finishing Blows
		4. Dark Genesis
		5. Sweeping Staff
		6. Teleport down
*/

Numpad5::

	While (toggle == 1)
	{
		Send, T
		Sleep 2000
	
		if (toggle == 0)
		{
			break
		}

		chain_neutral(1000)
		scythe_neutral(750)
		
		if (toggle == 0)
		{
			break
		}
		
		Sleep 1000
		Send, X
		Sleep 2000
		
		chain_neutral(1000)
		scythe_neutral(750)
		Sleep 1000
		
		if (toggle == 0)
		{
			break
		}
		
		teleport_down()
		Sleep 500
		Send, A
		Sleep 2000
		
		if (toggle == 0)
		{
			break
		}


	}
	return
	
/*		
	HOTKEY: F6
	CATEGORY: "Stasis Farm", "Climbing"
	MAP: Slurpy Forest Depths, Lachelein Ballroom 3
	FLOW:
	
		1. Chain into 3 Finishing Blows
		2. Teleport up
		3. Chain
		4. Sweeping Staff
		5. Teleport down
		6. Chain into 3 Finishing Blows
		7. Teleport down
		8. Dark Genesis
*/	

F6::
	While (toggle == 1)
	{
		Sleep 1000
		chain_neutral(1000)
		Sleep 100
		scythe_neutral(300)
		Sleep 100
		teleport_up()
		Sleep 500
		chain_neutral(1000)
		Sleep 100
		
		if (toggle == 0)
		{
			break
		}
		
		Send, A
		Sleep 1000
		
		teleport_down()
		Sleep 500
		chain_neutral(1000)
		Sleep 100
		scythe_neutral(300)
		Sleep 100
		
		if (toggle == 0)
		{
			break
		}
		
		teleport_down()
		Sleep 500
		Send, T
		Sleep 2000
		teleport_up()
	}
	return
	
/*		
	HOTKEY: F5
	FUNCTION: "Stasis Farm", "No Movement"
	MAP: Forgotten Path of Time <1>
	FLOW:
	
		1. Facing left, Chain 
		2. Finishing Sweep
		3. Facing right, Chain
		4. Finishing Sweep
*/	

F5::
	While (toggle == 1)
	{
		Sleep 1500
		position_left(100)
		chain_neutral(1000)
		finishing_sweep()
		Send, {V down}
		Sleep 300
		Send, {V up}
		Send, {V down}
		Sleep 300
		Send, {V up}
		
		if (toggle == 0)
		{
			break
		}
		
		Sleep 1500
		position_right(100)
		chain_neutral(1000)
		finishing_sweep()
		Sleep 300
		Send, {V up}
		Send, {V down}
		Sleep 300
		Send, {V up}
		
		if (toggle == 0)
		{
			break
		}
	}
	return
	
/*		
	HOTKEY: F4
	FUNCTION: "Timed Movement", "Swimming"
	MAP: Monster Park Extreme Forbidden Time
	FLOW:
	
		1. Wait 5 seconds
		2. Walk left, jump, rope-lift onto upper platform
		3. Repeat the nested loop 18 times
*/	
	
F4::
	While (toggle == 1)
	{
		Sleep 5000
		Send, {Left down}
		Sleep 3750
		Send, {Left up}
		Send, {CTRL down}
		Sleep 100
		Send, X
		Send, {CTRL up}
		Sleep 3500
		
		Loop, 18
		{
			Loop, 3
			{
				burst_left(50)
				scythe_left(50)
			}
	
			Loop, 3
			{
				burst_right(50)
				scythe_right(50)
			}

		}
		
	}
	
	
/* 
	HOTKEY: F1
	EXPLANATION: Immediate exit from AHK
*/

F1::
ExitApp

/*
	EXPERIMENTAL FUNCTION
	HOTKEY: F3
	FUNCTION REFERENCE: ControlSend,, {Key}, {Window}
	PROBLEM: We need to find a way to reference the Kastia window, even when it is not active
	
	CURRENT PROGRESS: We can reference Kastia through the following:
	
	ahk_class MapleStoryClass
	ahk_pid [PROCESS ID (from Task Manager)]
	ahk_exe MapleStory.exe
	
	
	
*/

F3::
SetTitleMatchMode, 2 ; This sets it so that the windows title can contain WinTitle anywhere inside it to be a match

if WinExist("ahk_exe kastia.exe")
{
	/*
	Run notepad.exe
	Sleep 500
	ControlSend,, {h}, Notepad
	ControlSend,, {e}, Notepad
	ControlSend,, {l}, Notepad
	ControlSend,, {l}, Notepad
	ControlSend,, {o}, Notepad
	ControlSend,, {Enter}, Notepad
	ControlSend,, {w}, Notepad
	ControlSend,, {o}, Notepad
	ControlSend,, {r}, Notepad
	ControlSend,, {l}, Notepad
	ControlSend,, {d}, Notepad
	*/
	
	ControlSend,, {Ctrl}, Maple Story
	Sleep 500
	ControlSend,, {Ctrl}, ahk_exe MapleStory.exe

}
return

; ***** FUNCTIONS ***** 
	
position_left(time)
{
	Send, {Left down}
	Sleep 100
	Send, {Left up}
	Sleep time
}

position_right(time)
{
	Send, {Right down}
	Sleep 100
	Send, {Right up}
	Sleep time
}

teleport_up()
{
	Send, {+ down}
	Send, {up down}
	Sleep 400
	Send, {+ up}
	Send, {up up}
}

teleport_down()
{
	Send, {+ down}
	Send, {down down}
	Sleep 400
	Send, {+ up}
	Send, {down up}
}

scythe_left(time)
{
	position_left(200)
	Send, V
	Sleep 1500
	Sleep time
}

scythe_right(time)
{
	position_right(200)
	Send, V
	Sleep 1500
	Sleep time
}

scythe_neutral(time)
{
	Send, {V down}
	Sleep time
	Send, {V up}
	Send, {V down}
	Sleep time
	Send, {V up}
	Send, {V down}
	Sleep time
	Send, {V up}
}

chain_left(time)
{
	position_left(200)
	Send, {Space down}
	Sleep 300
	Send, {Space up}
	Sleep 1500
	Sleep time
	
}

chain_right(time)
{
	position_right(200)
	Send, {Space down}
	Sleep 300
	Send, {Space up}
	Sleep 1500
	Sleep time
}

chain_neutral(time)
{
	Send, {Space down}
	Sleep 500
	Send, {Space up}
	Sleep time
}

burst_left(time)
{
	position_left(200)
	Send, {C down}
	Sleep 300
	Send, {C up}
	Sleep 2500
	Sleep time
	
}

burst_right(time)
{
	position_right(200)
	Send, {C down}
	Sleep 300
	Send, {C up}
	Sleep 2500
	Sleep time
}

burst_neutral(time)
{
	Send, {C down}
	Sleep 300
	Send, {C up}
	Sleep time
}

swimming_loop_right()
{
	Send, {Right down}
	Sleep 750
	Send, {+ down}
	Sleep 750
	Send, {Right up}
	Send, {+ up}	
	burst_neutral(750)
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 500
	Send, {V up}
	Sleep 300
}

swimming_loop_left()
{
	Send, {Left down}
	Sleep 750
	Send, {+ down}
	Sleep 750
	Send, {Left up}
	Send, {+ up}	
	burst_neutral(750)
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 300
	Send, {V up}
	Sleep 300
	Send, {V down}
	Sleep 500
	Send, {V up}
	Sleep 300
}

; NTS: Refactor this function....
finishing_sweep()
{
	Send A,
	Sleep 1000
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
	Send, {V down}
	Sleep 200
	Send, {V up}
}