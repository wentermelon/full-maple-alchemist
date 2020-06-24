; How to use: Open your inventory in expanded view, then open the enhancement window.
; Align the inventory so it snaps to the top right of the enhancement window, then close the enhancement window
; Have the items you want to make TA ready across the top line of your inventory and nothing else there, have your hammers in the 4th slot of the top row of your cash inventory
; Open the cash tab of your inventory and then press Ctrl+J and it should work. Sometimes it's glitchy and only scrolls 9 times, hammers once, or star forces once so sorry idk why it does that

SendMode Input

^j::
CoordMode, Mouse, Window
Count = 10
X = 0
Loop, 16{
	Loop, 2{
		AutoHammer(X)
	}
	StartEnhance(X)
	Loop, 10 {
		Gosub, AutoEnhance
	}
	MouseMove 960, 620, 5
	Click
	MouseMove 1120, 410, 5
	Click
	Send {tab 4}
	X += 35
}
Click
Return

AutoHammer(X) {
MouseMove 1268, 462, 5 ; top right slot in inventory
Click, 2
MouseMove 1155, 432, 5 ; equip tab
Click
MouseMove 1155+X, 469, 5 ; Item Inventory Slot
Click
MouseMove 924, 560, 5 ; Hammer window
Click
MouseMove 935, 650, 5 ; Hammer Upgrade
Click
Sleep 4200
Send {enter}
Sleep 50
Send {tab 4}
}

StartEnhance(X) {
MouseMove 1155, 432, 5 ; equip tab
Click
MouseMove 1530, 740, 5 ; Enhance button
Click
MouseMove 1155+X, 469, 5 ; First slot in top left of inventory
Click
Sleep 280
MouseMove 960, 530, 5 ; Enhance window
Click
Sleep 780
MouseMove 940, 525, 5 ; Watk Scroll 100%
Click
}

AutoEnhance:
MouseMove 900, 660, 5 ; Enhance
Click
MouseMove 915, 620, 5 ; Ok Enhance
Click
Sleep 4200
MouseMove 960, 620, 5 ; Ok Success
Click
Return

f8::
Reload
return

f9::
Pause, toggle
return