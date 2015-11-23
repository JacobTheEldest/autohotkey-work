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
	Gui, ManageUID:New, , Manage UID Hotkeys
	Gui, ManageUID:Add, Text,, Ctrl + Alt + Shift + 
	Gui, ManageUID:Add, Text,, /   ->  Show Hotkeys
	Gui, ManageUID:Add, Text,, .   ->  Hide Hotkeys
	Gui, ManageUID:Add, Text,, l   ->  Number of Tabs
	Gui, ManageUID:Add, Text,, b   ->  Opens Tabs
	Gui, ManageUID:Add, Text,, q   ->  Selects UID field
	Gui, ManageUID:Add, Text,, h   ->  Opens Homepage
	Gui, ManageUID:Add, Text,, m   ->  Opens Manage UID
	Gui, ManageUID:Add, Text,, o   ->  Opens UIDs from Excel
	Gui, ManageUID:Add, Text,, p   ->  Clicks Options > Print Tag
	Gui, ManageUID:Add, Text,, [   ->  Clicks Print Button
	Gui, ManageUID:Add, Text,, 0   ->  Accepts Default Printer
	Gui, ManageUID:Add, Text,, d   ->  Disposition Step
	Gui, ManageUID:Add, Text,, a   ->  Add to Inventory
	Gui, ManageUID:Add, Text,, r   ->  Repair
	Gui, ManageUID:Add, Text,, s   ->  Scrap Teardown
	Gui, ManageUID:Add, Text,, e   ->  Data Device Entry
	Gui, ManageUID:Add, Text,, y   ->  Systems Test
	Gui, ManageUID:Add, Text,, x   ->  System Teardown
	Gui, ManageUID:Add, Text,, n   ->  Next Step
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


^+!q::		;Opens click the field in all open maintain UID tabs
Loop %LoopNumber% {
	Send, {Home}
	Sleep, 500
	CoordMode, Mouse, Client
	MouseMove, 700, 325
	Sleep, 50
	Click
	Sleep, 50
	Send, ^a
	Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
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


^+!m::		;Opens Manage Unit ID on 5 tabs
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
	MouseMove, 700, 316
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


^+!p::		;Clicks Options > Print Tag
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1095, 425
Sleep, 10
Click
Sleep, 50
MouseMove, 1050, 485
Sleep, 10
Click
Sleep, 50

Send, ^{Tab}
Sleep, 100
}

Return
^+![::		;Clicks Print Button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 630, 350
Sleep, 10
Click
Sleep, 50

Return
^+!0::		;Accepts default printer
CoordMode, Mouse, Client
Send, {Enter}
Sleep, 500

MouseMove, 1260, 500
Sleep, 10
Click
Sleep, 50

MouseMove, 810, 255
Sleep, 10
Click
Sleep, 50
Click
Sleep, 50

Send, ^{Tab}
Sleep, 100

Return


^+!d::		;Selects the Disposition step
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 330, 450
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!a::		;Selects Add to Inventory
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, add to inventory
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!r::		;Selects Repair
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, repair
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
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

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, scrap teardown
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!e::		;Selects Data Device Entry
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, data device entry
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!y::		;Selects Systems Test
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, system test
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!x::		;Selects System Teardown
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {End}
Sleep, 500

MouseMove, 810, 540
Sleep, 10
Click
Sleep, 50
Send, system teardown
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 750, 600
Sleep, 5
Click
Sleep, 5

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!n::		;Clicks Next step button
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1120, 380
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

MouseMove, 460, 550
Sleep, 10
Click
Sleep, 100

Send, delete
Sleep, 100
Send, {Enter}
Sleep, 100

Send, ^{Tab}
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