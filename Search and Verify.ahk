#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



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
Sleep, 500
Send, {Escape}
Sleep, 20
Send, {Alt}
Sleep, 20
Send, h
Send, h
Sleep, 20
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Right}
Send, {Right}
Send, {Right}
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
