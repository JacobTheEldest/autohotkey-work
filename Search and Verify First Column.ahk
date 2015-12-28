#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ColorX = 0
ColorY = 0

~^+!/::		;Shows Hotkeys
	Gui, Optiplex:New, , Hotkeys
	Gui, Optiplex:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Optiplex:Add, Text,, /   ->  Show Hotkeys
	Gui, Optiplex:Add, Text,, .   ->  Hide Hotkeys	
	Gui, Optiplex:Add, Text,, r   ->  Restart Script
	Gui, Optiplex:Add, Text,, c   ->  Change Color
	Gui, Optiplex:Show, X500 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Optiplex:Destroy
Return

;Enter Coordinates
^+!c::		;Allows user to set the color highlighted
InputBox, ColorX, ColorX, Move right X? (Currently %ColorX%), , 300, 125
InputBox, ColorY, ColorY, Move down Y? (Currently %ColorY%), , 300, 125
Return

~Enter::		;
Sleep, 500
Send, {Escape}
Sleep, 20
Send, {Home}
Sleep, 20
Send, {Alt}
Sleep, 20
Send, h
Send, h
Sleep, 20
Loop %ColorX% {
	Send, {Right}
}
Loop %ColorY% {
	Send, {Down}
}
Sleep, 20
Send, {Enter}
Sleep, 20
Send, ^f
Sleep, 20
Send, ^a
Return

^+!r::		;Resets Script
Reload
Return
