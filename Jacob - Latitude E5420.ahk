#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CPUStep := 1
MemoryStep := 1
BatteryStep := 1


~^+!/::		;Shows Hotkeys
	Gui, Optiplex:New, , Optiplex 760 Hotkeys
	Gui, Optiplex:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Optiplex:Add, Text,, /   ->  Show Hotkeys
	Gui, Optiplex:Add, Text,, .   ->  Hide Hotkeys
	Gui, Optiplex:Add, Text,, c   ->  Autofill CPU (Repeat)
	Gui, Optiplex:Add, Text,, m   ->  Autofill Memory (Repeat)
	Gui, Optiplex:Add, Text,, b   ->  Autofill Battery
	Gui, Optiplex:Add, Text,, (Press Once. Fill Capacity fields.
	Gui, Optiplex:Add, Text,,  Press again.)
	Gui, Optiplex:Show, X500 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Optiplex:Destroy
Return

^+!c::		;Selects CPU (Intel)
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

If CPUStep = 1					;CPU (Intel)
{
	MouseMove, 800, 360
	Sleep, 10
	Click
	Sleep, 50
	Send, cpu (intel)
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 2					;Model
{
	MouseMove, 620, 455
	Sleep, 10
	Click
	Sleep, 50
	Send, i5
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 3					;Model #
{
	MouseMove, 1050, 455
	Sleep, 10
	Click
	Sleep, 50
	Send, 2410m
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 4					;Quantity
{
	MouseMove, 800, 400
	Sleep, 10
	Click
	Sleep, 10
	Send, ^a
	Sleep, 50
	Send, {Delete}
	Sleep, 200

	MouseMove, 620, 525			;Clock Speed
	Sleep, 10
	Click
	Sleep, 50
	Send, 2.30
	Sleep, 10
	Send, {Enter}
	Sleep, 500

	MouseMove, 1050, 525		;# cores
	Sleep, 10
	Click
	Sleep, 50
	Send, 2
	Sleep, 10
	Send, {Enter}
	Sleep, 500

	MouseMove, 1250, 410
	Sleep, 500
	Click
	Sleep, 100

	Send, {End}
	Sleep, 500
	MouseMove, 750, 580
	Sleep, 10
	Click
}

CPUStep += 1

If CPUStep = 5
{
	CPUStep := 1
}

Return

^+!m::		;Selects Memory
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

If MemoryStep = 1					;Memory
{
	MouseMove, 800, 360
	Sleep, 10
	Click
	Sleep, 50
	Send, memory
	Sleep, 10
	Send, {Enter}
}

If MemoryStep = 2
{
MouseMove, 800, 400					;Quantity
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 100
Send, 2
Sleep, 200

MouseMove, 620, 450					;Capacity
Sleep, 10
Click
Sleep, 50
Send, 2 gb
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 450				;Form Factor
Sleep, 10
Click
Sleep, 50
Send, so
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 520					;Type (PCx)
Sleep, 10
Click
Sleep, 50
Send, pc3
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 520				;Clock Speed
Sleep, 10
Click
Sleep, 50
Send, 10600
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 580					;Bandwith Type
Sleep, 10
Click
Sleep, 50
Send, small
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1250, 400
Sleep, 100
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 745, 600
Sleep, 10
Click
}

MemoryStep += 1

If MemoryStep = 3
{
	MemoryStep := 1
}

Return

^+!b::		;Selects Primary System Battery
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

If BatteryStep = 1					;Primary System Battery
{
	MouseMove, 800, 360
	Sleep, 10
	Click
	Sleep, 50
	Send, primary system battery
	Sleep, 10
	Send, {Enter}
}

If BatteryStep = 2
{
	MouseMove, 1250, 400 
	Sleep, 500
	Click
	Sleep, 100
	Send, {Home}
	Sleep, 500

	MouseMove, 800, 400		;Empties quantity field
	Sleep, 10
	Click
	Sleep, 10
	Send, ^a
	Sleep, 50
	Send, {Delete}
	Sleep, 200

	MouseMove, 630, 450		;Selects Laptop
	Sleep, 10
	Click
	Sleep, 50
	Send, laptop
	Sleep, 10
	Send, {Enter}
	Sleep, 100

	MouseMove, 1055, 450	;selects Cells
	Sleep, 10
	Click
	Sleep, 50
	Send, 9
	Sleep, 10
	Send, {Enter}
	Sleep, 100

	MouseMove, 1055, 590	;selects Capacity Whr
	Sleep, 10
	Click
	Sleep, 50
	Send, 87
	Sleep, 10
	Send, {Enter}
	Sleep, 100

	MouseMove, 630, 735		;Inputs N/A for Burn in Time
	Sleep, 10
	Click
	Sleep, 50
	Send, N/A
	Sleep, 10
	Send, {Enter}
	Sleep, 100

	MouseMove, 1250, 400 
	Sleep, 500
	Click
	Sleep, 100

	Send, {End}
	Sleep, 500
	MouseMove, 750, 585
	Sleep, 10
	Click
}

BatteryStep += 1

If BatteryStep = 3
{
	BatteryStep := 1
}

Return