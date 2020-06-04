#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
	CATEGORY: "Fast Farm" 
	MAP: Any
	GENERAL STATEMENT: Used when equipping skill cooldown reduction equipment to reduce the cooldown of Dark Genesis to a minimum. This farming method focuses on spamming both Dark Genesis and Sweeping Staff as often as possible.
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
		position_left(3000)
		
		if ( toggle == 0)
			break
				
		Send, A
		Sleep 1500
		position_right(2000)
		
		if ( toggle == 0)
			break
	}
	return


/* 
	HOTKEY: F7
	CATEGORY: "Stasis Farm", "Swimming"
	MAP: Inside the Stone Colossus 2
	GENERAL STATEMENT: Used with standard equipment along with Mark of Stasis to increase the effectiveness of the Mark of Stasis. This farming method utilizes additional skill inputs to buy time for the lengthier Dark Genesis cooldown.
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
	CATEGORY: "Stasis Farm"
	MAP: Nest of a Dead Dragon
	GENERAL STATEMENT: Used with standard equipment along with Mark of Stasis to increase the effectiveness of the Mark of Stasis. This farming method utilizes additional skill inputs to buy time for the lengthier Dark Genesis cooldown.
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
	CATEGORY: "Stasis Farm"
	MAP: Warped Path of Time <2>
	GENERAL STATEMENT: Used with standard equipment along with Mark of Stasis to increase the effectiveness of the Mark of Stasis. This farming method utilizes additional skill inputs to buy time for the lengthier Dark Genesis cooldown.
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
		if (toggle == 0)
		{
			break
		}

		chain_neutral(1000)
		scythe_neutral(300)
		
		if (toggle == 0)
		{
			break
		}
		
		Sleep 1000
		Send, X
		Sleep 2000
		
		chain_neutral(1000)
		scythe_neutral(300)
		Sleep 1000
		
		if (toggle == 0)
			break
		
		Send, T
		Sleep 2000
		Send, A
		Sleep 2000
		
		if (toggle == 0)
		{
			break
		}
		
		teleport_down()
		Sleep 500
		
		if (toggle == 0)
		{
			break
		}


	}
	return
	
/*		
	HOTKEY: F6
	CATEGORY: "Stasis Farm", "Climbing"
	MAP: Slurpy Forest Depths
	GENERAL STATEMENT: Used with standard equipment along with Mark of Stasis to increase the effectiveness of the Mark of Stasis. This farming method utilizes additional skill inputs to buy time for the lengthier Dark Genesis cooldown.
	FLOW:
	
		1. Chain into 3 Finishing Blows
		2. Rope lift
		3. Chain into 3 Finishing Blows
		4. Dark Genesis
		5. Sweeping Staff
		6. Teleport down

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
	FUNCTION: "Stasis Farm"
	MAP: Forgotten Path of Time <1>
	GENERAL STATEMENT: Used with standard equipment along with Mark of Stasis to increase the effectiveness of the Mark of Stasis. This farming method utilizes additional skill inputs to buy time for the lengthier Dark Genesis cooldown.
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
		
		if (toggle == 0)
		{
			break
		}
		
		Sleep 1500
		position_right(100)
		chain_neutral(1000)
		finishing_sweep()
		
		if (toggle == 0)
		{
			break
		}
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
	burst_neutral(500)
	Send, {V down}
	Sleep 100
	Send, {V up}
	Sleep 100
}

swimming_loop_left()
{
	Send, {Left down}
	Sleep 750
	Send, {+ down}
	Sleep 750
	Send, {Left up}
	Send, {+ up}	
	burst_neutral(500)
	Send, {V down}
	Sleep 100
	Send, {V up}
	Sleep 100
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
