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
	Gui, ManageUID:New, , Hotkeys
	Gui, ManageUID:Add, Text,, Ctrl + Alt + Shift + 
	Gui, ManageUID:Add, Text,, /   ->  Show Hotkeys
	Gui, ManageUID:Add, Text,, .   ->  Hide Hotkeys
	Gui, ManageUID:Add, Text,, l   ->  Number of Tabs
	Gui, ManageUID:Add, Text,, b   ->  Opens Tabs
	Gui, ManageUID:Add, Text,, h   ->  Opens Homepage
	Gui, ManageUID:Add, Text,, o   ->  Opens UIDs from Excel
	Gui, ManageUID:Add, Text,, n   ->  Next Step
	Gui, ManageUID:Add, Text,, a   ->  Add Component
	Gui, ManageUID:Add, Text,, m   ->  Autofill Memory 
	Gui, ManageUID:Add, Text,, ~   ->  Deletes Bottom Component
	Gui, ManageUID:Add, Text,, -   ->  Top of Page
	Gui, ManageUID:Add, Text,, =   ->  Bottom of Page
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
	MouseMove, xxx, yyy
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

MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!a::		;Clicks Add Component
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!`::		;Deletes Bottom Entry in Configuration
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 100

Send, delete
Sleep, 100
Send, {Enter}
Sleep, 100

Send, ^{Tab}
Return


^+!m::		;Fills out memory

OpenWindow("Excel")
Sleep, 50

Loop %LoopNumber% {
	Send, {Up}
	Sleep, 20
}
	
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

;Quantity
OpenWindow("Excel")
Sleep, 50
Send, {Right}
sleep, 20
Send, ^c
Sleep, 20
OpenWindow("MARRc")
Sleep, 50
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 100
Send, ^v
Sleep, 200

;Capacity
OpenWindow("Excel")
Sleep, 50
Send, {Right}
sleep, 20
Send, ^c
Sleep, 20
OpenWindow("MARRc")
Sleep, 50
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, ^v
Sleep, 100

;Form Factor
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, dimm
Sleep, 100

;Type (PCx)
OpenWindow("Excel")
Sleep, 50
Send, {Right}
sleep, 20
Send, ^c
Sleep, 20
OpenWindow("MARRc")
Sleep, 50
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, ^v
Sleep, 100

;Clock Speed
OpenWindow("Excel")
Sleep, 50
Send, {Right}
sleep, 20
Send, ^c
Sleep, 20
OpenWindow("MARRc")
Sleep, 50
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, ^v
Sleep, 100

;Bandwith Type
OpenWindow("Excel")
Sleep, 50
Send, ^c
Sleep, 20
Send, {Down}
Sleep, 20
Send, {Left}
Sleep, 20
Send, {Left}
Sleep, 20
Send, {Left}
Sleep, 20
Send, {Left}
Sleep, 20
Send, {Left}
Sleep, 20
OpenWindow("MARRc")
Sleep, 50
MouseMove, xxx, yyy
Sleep, 10
Click
Sleep, 10
Send, ^v
Sleep, 100

MouseMove, xxx, yyy
Sleep, 100
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, xxx, yyy
Sleep, 10
Click
}

Return


^+!-::		;Goes to Home
Loop %LoopNumber% {
Send, {Home}
Sleep, 100
Send, ^{Tab}
Sleep, 50
}
Return


^+!=::		;Goes to End
Loop %LoopNumber% {
Send, {End}
Sleep, 100
Send, ^{Tab}
Sleep, 50
}
Return