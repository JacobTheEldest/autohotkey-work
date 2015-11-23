#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

OpenWindow(TheWindowTitle)
{
    SetTitleMatchMode,2
    DetectHiddenWindows, Off
    IfWinActive, %TheWindowTitle%
    {
        
    }
    Else
    {
        IfWinExist, %TheWindowTitle%
        {
            WinActivate
        }
        Else
        {
            DetectHiddenWindows, On
            IfWinExist, %TheWindowTitle%
            {
                WinShow
                WinActivate
            }
        }
    }
}


LoopNumber = 1

^+!l::		;Allows user to set number of tabs to use at a time
InputBox, LoopNumber, LoopNumber, Number of tabs? (Currently %LoopNumber%), , 300, 125
Return


^+!b::		;Opens the correct number of tabs
CoordMode, Mouse, Client
MouseMove, 35, 25
Sleep, 5
Click right
Sleep, 50
Send, o
Sleep, 400
Send, {Enter}
Sleep, 100

AddTabs := LoopNumber - 1

If (LoopNumber > 1) {
	Loop %AddTabs% {
	Send, ^t
	Sleep, 50
	}
}
Send, ^{Tab}
Return


^+!h::		;Changes all tabs to homepage
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, !{Home}
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!o::		;Opens x number of spreadsheet cells in x number of tabs
Send, ^c
Sleep, 500
Loop %LoopNumber% {
	Send, ^c
	Sleep, 100
	
	OpenWindow("MARRc")
	Sleep, 50
	Send, {Home}
	Sleep, 500
	CoordMode, Mouse, Client
	MouseMove, 675, 300
	Sleep, 50
	Click
	Sleep, 50
	Send, ^a
	Sleep, 50
	Send, ^v
	Sleep, 50
	Send, {Enter}
	Sleep, 100
	If (LoopNumber > 1) {
		Send, ^{Tab}
		Sleep, 50
		}
	
	OpenWindow("Excel")
	Sleep, 30
	Send, {Down}
	Sleep, 30
}
OpenWindow("MARRc")
Return


^+!n::		;Clicks Next step button
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1167, 284
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!r::		;Answer yes to contains removable media
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 832, 325
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!x::		;Answer no to media will be removed
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 865, 325
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!z::		;Clicks DDE Complete Step
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 275, 340
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!c::		;Clicks DDE Complete Stage
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 800, 370
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
}
}
Return


^+!p::		;Clicks DDE print drive label button
{
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1000, 490
Sleep, 10
Click
Sleep, 50
}
Return


^+![::		;Accepts default printer and switches tab
{
CoordMode, Mouse, Client
Send, {Enter}
Sleep, 500

MouseMove, 1260, 300
Sleep, 10
Click
Sleep, 50

Send, ^{Tab}
Sleep, 50
}
Return


