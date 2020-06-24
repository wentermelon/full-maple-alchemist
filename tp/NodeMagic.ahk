; How to use: Open up the enhance/craft nodes screen through the node NPC.
; To disassemble nodes: Mouse over the first node you want to disassemble and press Ctrl+J. All nodes after will be disassembled until you press f2 to stop the program.
; To Enhance nodes: Mouse over the node you want to enhance. Press Ctrl+F. Press f2 to stop it.
; To craft nodes: Press nodecrafting button. Find node you want to craft. Click on it. Hover over Craft button. Press Ctrl+0. Press f2 to stop crafting.

^j:: ; 
MouseGetPos, X, Y
Loop {
Click
MouseMove X, Y, 5
Click, right
MouseMove X+5, Y+5, 5
Sleep 25
Click
Sleep 25
MouseMove 840, 620, 5
Click
Sleep 25
MouseMove 880, 720, 5
Click
Sleep 1500
}
return

^f::
MouseGetPos, X, Y
Loop {
	MouseMove X, Y, 5
	Click, right
	MouseMove X+10, Y+25, 5
	Sleep 50
	Click
	Sleep 50
	Send {enter}
	Sleep 1500
	Send {enter}
}
return

^0::
MouseGetPos, X, Y
Loop {
MouseMove 880, 700, 5
Click
Sleep 50
Send {enter}
MouseMove X, Y, 5
Sleep 50
Click
}
return

f1::
Pause
return

f2::
Reload
return