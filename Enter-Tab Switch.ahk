#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Flip := 1


~^+!/::		;Shows Hotkeys
	Gui, Optiplex:New, , Hotkeys
	Gui, Optiplex:Add, Text,, Ctrl + Alt + Shift + 
	Gui, Optiplex:Add, Text,, /   ->  Show Hotkeys
	Gui, Optiplex:Add, Text,, .   ->  Hide Hotkeys
	Gui, Optiplex:Add, Text,, r   ->  Restart Script
	Gui, Optiplex:Show, X500 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, Optiplex:Destroy
Return

~Enter::		;
If Flip = 1	
{
	Send, {Up}
	Send, {Tab}
	Flip := 0
	Return
}

If Flip = 0
{
	Send, {Up}
	Send, {Enter}
	Flip := 1
}
Return

^+!r::		;Resets Script
Reload
Return