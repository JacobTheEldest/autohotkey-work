#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CPUStep := 1
MemoryStep := 1


~^+!/::		;Shows Hotkeys
	Gui, Optiplex:New, , Optiplex 760 Hotkeys
	Gui, Optiplex:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Optiplex:Add, Text,, /   ->  Show Hotkeys
	Gui, Optiplex:Add, Text,, .   ->  Hide Hotkeys
	Gui, Optiplex:Add, Text,, c   ->  Autofill CPU (Repeat)
	Gui, Optiplex:Add, Text,, m   ->  Autofill Memory (Repeat)
	Gui, Optiplex:Show, X500 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Optiplex:Destroy
Return

^+!c::		;Selects CPU (Intel)
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

If CPUStep = 1
{
	MouseMove, 800, 360
	Sleep, 10
	Click
	Sleep, 50
	Send, cpu (intel)
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 2
{
	MouseMove, 620, 420
	Sleep, 10
	Click
	Sleep, 50
	Send, core 2 duo
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 3
{
	MouseMove, 1050, 420
	Sleep, 10
	Click
	Sleep, 50
	Send, e7400
	Sleep, 10
	Send, {Enter}
}

If CPUStep = 4
{
	MouseMove, 800, 400
	Sleep, 10
	Click
	Sleep, 10
	Send, ^a
	Sleep, 50
	Send, {Delete}
	Sleep, 200

	MouseMove, 620, 525
	Sleep, 10
	Click
	Sleep, 50
	Send, 2.8
	Sleep, 10
	Send, {Enter}
	Sleep, 500

	MouseMove, 1050, 525
	Sleep, 10
	Click
	Sleep, 50
	Send, 2
	Sleep, 10
	Send, {Enter}
	Sleep, 500

	MouseMove, 1250, 400
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

If MemoryStep = 1
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
MouseMove, 800, 400
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, 2
Sleep, 200

MouseMove, 620, 450
Sleep, 10
Click
Sleep, 50
Send, 1 gb
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 450
Sleep, 10
Click
Sleep, 50
Send, dimm
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 520
Sleep, 10
Click
Sleep, 50
Send, pc2
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 520
Sleep, 10
Click
Sleep, 50
Send, 6400
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 580
Sleep, 10
Click
Sleep, 50
Send, no
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