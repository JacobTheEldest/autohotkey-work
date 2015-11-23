#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Send, ~^+!'

~^+!/::		;Shows Hotkeys
	Gui, Desktop:New, , Desktop Hotkeys
	Gui, Desktop:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Desktop:Add, Text,, /   ->  Show Hotkeys
	Gui, Desktop:Add, Text,, .   ->  Hide Hotkeys
	Gui, Desktop:Add, Text,, a   ->  Add Component
	Gui, Desktop:Add, Text,, t   ->  Autofill Test
	Gui, Desktop:Add, Text,, n   ->  Next Step
	Gui, Desktop:Add, Text,, d   ->  Complete Stage
	Gui, Desktop:Add, Text,, p   ->  Click Print
	Gui, Desktop:Add, Text,, o   ->  Accept Default Printer
	Gui, Desktop:Add, Text,, '   ->  Edit Test Autofill
	Gui, Desktop:Show, X250 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Desktop:Destroy
Return

~^+!'::		;Edit Test Autofill
	Gui, EditTestGC:New, , Edit Test Autofill
	Gui, EditTestGC:Add, Text,, Graphics Card?
	Gui, EditTestGC:Add, Radio, vGraphicsCard, Pass
	Gui, EditTestGC:Add, Radio, , Fail
	Gui, EditTestGC:Add, Radio, , NoTest
	Gui, EditTestGC:Add, Radio, , NoInstall
	Gui, EditTestGC:Add, Button, Default gOKGC, OK
	Gui, EditTestGC:Show
	return
	
OKGC:
	Gui, EditTestGC:Submit
	Gui, EditTestGC:Destroy
	
	Gui, EditTestDrive:New, , Edit Test Autofill
	Gui, EditTestDrive:Add, Text,, Drive?
	Gui, EditTestDrive:Add, Radio, vDrive, Pass
	Gui, EditTestDrive:Add, Radio, , Fail
	Gui, EditTestDrive:Add, Radio, , NoTest
	Gui, EditTestDrive:Add, Radio, , NoInstall
	Gui, EditTestDrive:Add, Button, Default gOKDrive, OK
	Gui, EditTestDrive:Show
	return
return
	
OKDrive:
	Gui, EditTestDrive:Submit
	Gui, EditTestDrive:Destroy
return

Return

^+!a::		;Clicks add component button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 440, 330
Sleep, 5
Click

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

^+!t::		;Passes all desktop tests
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 495, 385	;Front Panel
Sleep, 5
Click
Sleep, 5
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sides
Send, {Tab}
Send, {Tab}

Send, {Space}		;Rear Panel
Send, {Tab}
Send, {Tab}

Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

IfInString, GraphicsCard, 2
{
	Send, {Right}
}
IfInString, GraphicsCard, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, GraphicsCard, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Graphics Card
Send, {Tab}
Send, {Tab}

Send, {Space}		;Power Supply
Send, {Tab}
Send, {Tab}

Send, {Space}		;Mainboard
Send, {Tab}
Send, {Tab}

Send, {Space}		;Other
Send, {Tab}
Send, {Tab}

IfInString, Drive, 2
{
	Send, {Right}
}
IfInString, Drive, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Drive, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Drive
Send, {Tab}
Send, {Tab}

Send, {Enter}		;Save & Process Test

Send, {End}

Return

^+!d::		;Completes Systems Test Stage
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 840, 325
Sleep, 5
Click
Sleep, 50
MouseMove, 800, 430
Sleep, 5
Click

Return

^+!p::		;Clicks 'Print Systems Test Label' button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 475, 475
Sleep, 5
Click

Return

^+!o::		;Oks Default printer and goes to home page
CoordMode, Mouse, Client
Send, {Enter}
Sleep, 1000

Send, !{Home}

Return