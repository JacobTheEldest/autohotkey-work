#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


TopCover := 1
Base := 1
Bezel := 1
Mousepad := 1
Keyboard := 1
Display := 1
Ports := 1
Sounds := 1
Graphics := 1
Battery := 1
CPU := 1
Memory := 1
Fan := 1
OpticalDrive := 1
Webcam := 1
Other := 1
Drive := 1


~^+!/::		;Shows Hotkeys
	Gui, Desktop:New, , Laptop Hotkeys
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
	Gui, EditTestDefault:New, , Edit Test Autofill
	Gui, EditTestDefault:Add, Text,, Default?
	Gui, EditTestDefault:Add, Radio, vDefault, Pass
	Gui, EditTestDefault:Add, Radio, , Fail
	Gui, EditTestDefault:Add, Radio, , NoTest
	Gui, EditTestDefault:Add, Radio, , NoInstall
	Gui, EditTestDefault:Add, Button, Default gOKDefault, OK
	Gui, EditTestDefault:Show
	return
	
	TopCover := Default
	Base := Default
	Bezel := Default
	Mousepad := Default
	Keyboard := Default
	Display := Default
	Ports := Default
	Sounds := Default
	Graphics := Default
	Battery := Default
	CPU := Default
	Memory := Default
	Fan := Default
	OpticalDrive := Default
	Webcam := Default
	Other := Default
	Drive := Default
	
OKDefault:
	Gui, EditTestOD:New, , Edit Test Autofill
	Gui, EditTestOD:Add, Text,, Optical Drive?
	Gui, EditTestOD:Add, Radio, vOpticalDrive, Pass
	Gui, EditTestOD:Add, Radio, , Fail
	Gui, EditTestOD:Add, Radio, , NoTest
	Gui, EditTestOD:Add, Radio, , NoInstall
	Gui, EditTestOD:Add, Button, Default gOKOD, OK
	Gui, EditTestOD:Show
	return
return
	
OKOD:
	Gui, EditTestOD:Submit
	Gui, EditTestOD:Destroy
	
	Gui, EditTestWebcam:New, , Edit Test Autofill
	Gui, EditTestWebcam:Add, Text,, Webcam?
	Gui, EditTestWebcam:Add, Radio, vWebcam, Pass
	Gui, EditTestWebcam:Add, Radio, , Fail
	Gui, EditTestWebcam:Add, Radio, , NoTest
	Gui, EditTestWebcam:Add, Radio, , NoInstall
	Gui, EditTestWebcam:Add, Button, Default gOKWebcam, OK
	Gui, EditTestWebcam:Show
	return
return
	
OKWebcam:
	Gui, EditTestWebcam:Submit
	Gui, EditTestWebcam:Destroy
	
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

^+!t::		;Autofill Test
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

;Top Cover
IfInString, TopCover, 1
{
	MouseMove, 525, 385
}
IfInString, TopCover, 2
{
	MouseMove, x, y
}
IfInString, TopCover, 3
{
	MouseMove, x, y
}
IfInString, TopCover, 4
{
	MouseMove, x, y
}

Sleep, 5
Click
Sleep, 5
Send, {Tab}
Send, {Tab}

IfInString, Base, 2
{
	Send, {Right}
}
IfInString, Base, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Base, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Base
Send, {Tab}
Send, {Tab}

IfInString, Bezel, 2
{
	Send, {Right}
}
IfInString, Bezel, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Bezel, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Bezel
Send, {Tab}
Send, {Tab}

IfInString, Mousepad, 2
{
	Send, {Right}
}
IfInString, Mousepad, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Mousepad, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Palm Rest/Mousepad
Send, {Tab}
Send, {Tab}

IfInString, Keyboard, 2
{
	Send, {Right}
}
IfInString, Keyboard, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Keyboard, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Keyboard
Send, {Tab}
Send, {Tab}

IfInString, Display, 2
{
	Send, {Right}
}
IfInString, Display, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Display, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Display
Send, {Tab}
Send, {Tab}
Send, {Tab}

IfInString, Ports, 2
{
	Send, {Right}
}
IfInString, Ports, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Ports, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

IfInString, Sound, 2
{
	Send, {Right}
}
IfInString, Sound, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Sound, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

IfInString, Graphics, 2
{
	Send, {Right}
}
IfInString, Graphics, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Graphics, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Graphics
Send, {Tab}
Send, {Tab}

IfInString, Battery, 2
{
	Send, {Right}
}
IfInString, Battery, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Battery, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Battery
Send, {Tab}
Send, {Tab}

IfInString, CPU, 2
{
	Send, {Right}
}
IfInString, CPU, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, CPU, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

IfInString, Memory, 2
{
	Send, {Right}
}
IfInString, Memory, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Memory, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

IfInString, Fan, 2
{
	Send, {Right}
}
IfInString, Fan, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Fan, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

IfInString, OpticalDrive, 2
{
	Send, {Right}
}
IfInString, OpticalDrive, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, OpticalDrive, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

IfInString, Webcam, 2
{
	Send, {Right}
}
IfInString, Webcam, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Webcam, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
Send, {Space}		;Webcam
Send, {Tab}
Send, {Tab}

IfInString, Other, 2
{
	Send, {Right}
}
IfInString, Other, 3
{
	Send, {Right}
	Send, {Right}
}
IfInString, Other, 4
{
	Send, {Right}
	Send, {Right}
	Send, {Right}
}
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