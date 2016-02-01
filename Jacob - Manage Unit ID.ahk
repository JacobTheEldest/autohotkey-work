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

;Lists the Hotkey help dialog box
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

;Allows user to set number of tabs to use at a time
^+!l::
	InputBox, LoopNumber, LoopNumber, Number of tabs? (Currently %LoopNumber%), , 300, 125
Return

;Opens the correct number of tabs
^+!b::
	CoordMode, Mouse, Client
	MouseMove, 35, 25 		;First tab in firefox
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

;clicks the search field in all open maintain UID tabs
^+!q::
	Loop %LoopNumber% {
		Send, {Home}
		Sleep, 500
		CoordMode, Mouse, Client
		MouseMove, 700, 325			;between the scanbox in tag search and Manage UID
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

;Changes all tabs to homepage
^+!h::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, !{Home}
		Sleep, 50

		Send, ^{Tab}
		Sleep, 50
	}
Return

;Opens Manage Unit ID on all tabs
^+!m::
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

;Opens x number of spreadsheet cells in x number of tabs
^+!o::
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
		MouseMove, 700, 316				;ManageUID scanbox
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

;Clicks Options > Print Tag
^+!p::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {Home}
		Sleep, 500

		MouseMove, 1095, 425		;ManageUID Options Button
		Sleep, 10
		Click
		Sleep, 50
		MouseMove, 1050, 485		;Print UID Tag option
		Sleep, 10
		Click
		Sleep, 50

		Send, ^{Tab}
		Sleep, 100
	}
Return

;Clicks Print Button
^+![::
	CoordMode, Mouse, Client
	Send, {Home}
	Sleep, 500

	MouseMove, 630, 350				;Print button
	Sleep, 10
	Click
	Sleep, 50
Return

;Accepts default printer
^+!0::
	CoordMode, Mouse, Client
	Send, {Enter}
	Sleep, 500

	MouseMove, 1260, 500			;After print dialog box is gone. Clicks empty space on webpage  to activate the window.
	Sleep, 10
	Click
	Sleep, 50

	MouseMove, 810, 255				;Not sure. Clicks done or something, maybe.
	Sleep, 10
	Click
	Sleep, 50
	Click
	Sleep, 50

	Send, ^{Tab}
	Sleep, 100
Return

;Selects the Disposition step
^+!d::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {Home}
		Sleep, 500

		MouseMove, 330, 450 		;ManageUID Disposition Step
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects Add to Inventory
^+!a::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, add to inventory
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects Repair
^+!r::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, repair
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects Scrap Teardown
^+!s::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, scrap teardown
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects Data Device Entry
^+!e::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, data device entry
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects Systems Test
^+!y::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, system test
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Selects System Teardown
^+!x::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {End}
		Sleep, 500

		MouseMove, 810, 540			;Clicks the disposition dropdown.
		Sleep, 10
		Click
		Sleep, 50
		Send, system teardown
		Sleep, 10
		Send, {Enter}
		Sleep, 200

		MouseMove, 750, 600			;Clicks submit
		Sleep, 5
		Click
		Sleep, 5

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Clicks Next step button
^+!n::
	Loop %LoopNumber% {
		CoordMode, Mouse, Client
		Send, {Home}
		Sleep, 500

		MouseMove, 1120, 380		;Next step button
		Sleep, 10
		Click
		Sleep, 50

		If (LoopNumber > 1) {
			Send, ^{Tab}
			Sleep, 50
		}
	}
Return

;Deletes Bottom Entry in Configuration
^+!`::
	CoordMode, Mouse, Client
	Send, {End}
	Sleep, 500

	MouseMove, 460, 550				;Clicks delete button on lowest component.
	Sleep, 10
	Click
	Sleep, 100

	Send, delete
	Sleep, 100
	Send, {Enter}
	Sleep, 100

	Send, ^{Tab}
Return

;Goes to Home
^+!-::
	Loop %LoopNumber% {
		Send, {Home}
		Sleep, 100
		Send, ^{Tab}
		Sleep, 50
	}
Return

;Goes to End
^+!=::
	Loop %LoopNumber% {
		Send, {End}
		Sleep, 100
		Send, ^{Tab}
		Sleep, 50
	}
Return