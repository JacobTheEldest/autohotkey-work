
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
Weight = 16


~^+!/::		;Shows Hotkeys
	Gui, ManageUID:New, , Manage UID Hotkeys
	Gui, ManageUID:Add, Text,, Ctrl + Alt + Shift + 
	Gui, ManageUID:Add, Text,, ?   ->  Show Hotkeys
	Gui, ManageUID:Add, Text,, .   ->  Hide Hotkeys
	Gui, ManageUID:Add, Text,, l   ->  Number of Tabs
	Gui, ManageUID:Add, Text,, b   ->  Opens Tabs
	Gui, ManageUID:Add, Text,, m   ->  Opens Manage UID
	Gui, ManageUID:Add, Text,, o   ->  Opens UIDs/Serials from Excel
	Gui, ManageUID:Add, Text,, u   ->  Copies UIDs to Excel
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


^+!m::		;Opens Manage Unit ID on tabs
Loop %LoopNumber% {
Send, ^l
Sleep, 50
Send, http://web01.marrc.int/Admin/MaintainUnit
Sleep, 800
Send, {Enter}
Sleep, 100

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
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
	MouseMove, 700, 270
	Sleep, 50
	Click
	Sleep, 50
	Send, ^a
	Sleep, 50
	Send, ^v
	Sleep, 50
	Send, {Enter}
	Sleep, 100
	Send, ^{Tab}
	Sleep, 100
	
	OpenWindow("Excel")
	Sleep, 30
	Send, {Down}
	Sleep, 30
}
OpenWindow("MARRc")
Return


^+!u::		;Copies UIDs to Excel (Adjacent column)

;Selects cell right of start point
OpenWindow("Excel")
Sleep, 500
Send, {Right}
Sleep, 10
Loop %LoopNumber% {
	Send, {Up}
	Sleep, 10
}

OpenWindow("MARRc")
Sleep, 50

Loop %LoopNumber% {
	Send, {Home}
	Sleep, 500
	CoordMode, Mouse, Client
	MouseMove, 435, 355
	Sleep, 50
	Click 2
	Sleep, 50
	Send, +{Right}
	Send, +{Right}
	Send, +{Right}
	Send, +{Right}
	Send, +{Right}
	Send, +{Right}
	Send, +{Right}
	Sleep, 50
	Send, ^c
	Sleep, 50
	
	OpenWindow("Excel")
	Sleep, 30
	Send, ^v
	Sleep, 50
	Send, {Down}
	Sleep, 30

	OpenWindow("MARRc")
	Sleep, 100
	Send, ^{Tab}
	Sleep, 30
}
OpenWindow("Excel")
Sleep, 100
Send, {Left}
Return