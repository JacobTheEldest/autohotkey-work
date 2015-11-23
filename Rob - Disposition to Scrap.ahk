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


~^+!/::		;Shows Hotkeys
	Gui, ManageUID:New, , Moved to Scrap Hotkeys
	Gui, ManageUID:Add, Text,, Ctrl + Alt + Shift + 
	Gui, ManageUID:Add, Text,, /   ->  Show Hotkeys
	Gui, ManageUID:Add, Text,, .   ->  Hide Hotkeys
	Gui, ManageUID:Add, Text,, l   ->  Number of Tabs
	Gui, ManageUID:Add, Text,, b   ->  Opens Tabs
	Gui, ManageUID:Add, Text,, h   ->  Opens Homepage
	Gui, ManageUID:Add, Text,, o   ->  Opens UIDs from Excel
	Gui, ManageUID:Add, Text,, d   ->  Disposition Step
	Gui, ManageUID:Add, Text,, s   ->  Scrap Teardown
	Gui, ManageUID:Show, X250 Y100
Return
~^+!.::		;Hides Hotkeys
	Gui, ManageUID:Destroy
Return

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

Send, ^{Tab}
Sleep, 50
}
Return


^+!o::		;Opens x number of spreadsheet cells in x number of tabs
OpenWindow("Excel")
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
	MouseMove, 780, 275
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


^+!d::		;Selects the Disposition step
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 290, 375
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!s::		;Selects Scrap Teardown
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 900, 640
Sleep, 10
Click
Sleep, 50
Send, scrap teardown
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 830, 705
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return
Loop %LoopNumber% {
Send, {End}
Sleep, 100
Send, ^{Tab}
Sleep, 50
}
Return