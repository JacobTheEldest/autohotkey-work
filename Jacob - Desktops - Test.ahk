#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


~^+!/::		;Shows Hotkeys
	Gui, Desktop:New, , Desktop Hotkeys
	Gui, Desktop:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Desktop:Add, Text,, /   ->  Show Hotkeys
	Gui, Desktop:Add, Text,, .   ->  Hide Hotkeys
	Gui, Desktop:Add, Text,, t   ->  Autofill Test
	Gui, Desktop:Add, Text,,         Pass All
	Gui, Desktop:Add, Text,,         NoInstall Graphics Card
	Gui, Desktop:Add, Text,,         NoInstall Drive
	Gui, Desktop:Show, X750 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Desktop:Destroy
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

Send, {Space}		;Drive
Send, {Tab}
Send, {Tab}

Send, {Enter}		;Save & Process Test

Send, {End}

Return