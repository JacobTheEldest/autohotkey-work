#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DriveStep := 1
RemoveStep := 1
PrintStep := 1
RPM := 5400
Manufacturer := hgst




~^+!/::		;Shows Hotkeys
	Gui, DDE:New, , DDE Hotkeys
	Gui, DDE:Add, Text,, Ctrl + Alt + Shift + 
	Gui, DDE:Add, Text,, /   ->  Show Hotkeys
	Gui, DDE:Add, Text,, .   ->  Hide Hotkeys
	Gui, DDE:Add, Text,, '   ->  Customize defaults
	Gui, DDE:Add, Text,, r   ->  Remove Drive (Repeat)
	Gui, DDE:Add, Text,, d   ->  Autofill Drive (Repeat)
	Gui, DDE:Add, Text,, n   ->  Next Step
	Gui, DDE:Add, Text,, c   ->  Complete Stage
	Gui, DDE:Add, Text,, p   ->  Print Labels (Repeat)
	Gui, DDE:Show, X500 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, DDE:Destroy
Return

^+!'::		;Customize defaults
	Gui, EditManufacturer:New, , Edit Test Autofill
	Gui, EditManufacturer:Add, Text,, Manufacturer?
	Gui, EditManufacturer:Add, Radio, vManufacturer, Hitachi (HGST)
	Gui, EditManufacturer:Add, Radio, , Toshiba
	Gui, EditManufacturer:Add, Radio, , Seagate
	Gui, EditManufacturer:Add, Radio, , Western Digital
	Gui, EditManufacturer:Add, Button, Default gOKManufacturer, OK
	Gui, EditManufacturer:Show
	return
	
OKManufacturer:
	Gui, EditManufacturer:Submit
	Gui, EditManufacturer:Destroy
	
	InputBox, RPM, RPM, RPM? (Currently %RPM%), , 300, 125
return

Return

^+!r::		;Remove Drive
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

If RemoveStep = 1					;Contains Data-containing media
{
	MouseMove, 833, 327
	Sleep, 5
	Click
}

If RemoveStep = 2					;Media will be removed
{
	MouseMove, 833, 374
	Sleep, 5
	Click
}

RemoveStep += 1

If RemoveStep = 3
{
	RemoveStep := 1
}

Return

^+!n::		;Clicks Next step button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1167, 284
Sleep, 10
Click
Sleep, 50

Return

^+!d::		;Begins filling out Drive component
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

	If Manufacturer = 1
	{
		Manufacturer := "hgst"
	}
	If Manufacturer = 2
	{
		Manufacturer := "toshiba"
	}
	If Manufacturer = 3
	{
		Manufacturer := "seagate"
	}
	If Manufacturer = 4
	{
		Manufacturer := "western digital"
	}

If DriveStep = 1					;Add component
{
	MouseMove, 440, 330
	Sleep, 5
	Click
}

If DriveStep = 2					;Drive
{
	MouseMove, 800, 360
	Sleep, 10
	Click
	Sleep, 50
	Send, drive
	Sleep, 10
	Send, {Enter}
}

If DriveStep = 3					;hdd, rpm, b grade, manufacturer
{
	MouseMove, 630, 420
	Sleep, 10
	Click
	Sleep, 50
	Send, hdd
	Sleep, 10
	Send, {Enter}
	Sleep, 50
	
	MouseMove, 1050, 550
	Sleep, 10
	Click
	Sleep, 50
	Send, %RPM%
	Sleep, 10
	Send, {Enter}
	Sleep, 50
	
	MouseMove, 1050, 610
	Sleep, 10
	Click
	Sleep, 50
	Send, b
	Sleep, 10
	Send, {Enter}
	Sleep, 50
	
	MouseMove, 1050, 420
	Sleep, 10
	Click
	Sleep, 200
	Send, %Manufacturer%
	Sleep, 10
	Send, {Enter}
}

If DriveStep = 4					;Save Component
{
	MouseMove, 1250, 410
	Sleep, 10
	Click
	Sleep, 10

	Send, {End}
	Sleep, 500
	MouseMove, 750, 585
	Sleep, 10
	Click
}

DriveStep += 1

If DriveStep = 5
{
	DriveStep := 1
}

Return

^+!c::		;Clicks Complete Stage
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 375
Sleep, 10
Click
Sleep, 50

Return

^+!p::		;Prints labels using default printer
CoordMode, Mouse, Client

If PrintStep = 1				;Click Print All
{
	Send, {End}
	Sleep, 500
	MouseMove, 440, 515
	Sleep, 5
	Click
}
If PrintStep = 2				;Accept Default printer. Go to homepage.
{
	Send, {Enter}
	Sleep, 1000
	Send, !{Home}
}

PrintStep += 1

If PrintStep = 3
{
	PrintStep := 1
}

Return
