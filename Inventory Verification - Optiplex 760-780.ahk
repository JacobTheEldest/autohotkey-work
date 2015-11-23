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
	MouseMove, 670, 300
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

MouseMove, 280, 395
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


^+!,::		;Clicks print UID tag option
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1145, 385
Sleep, 10
Click
Sleep, 50
MouseMove, 1110, 445
Sleep, 10
Click
Sleep, 50

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!.::		;Clicks Print button
CoordMode, Mouse, Client
MouseMove, 630, 350
Sleep, 10
Click
Return


^+!/::		;Accepts default printer and switches tab
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


^+!g::		;Clicks add component button
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 440, 330
Sleep, 5
Click

Send, ^{Tab}
Sleep, 50
}
Return


^+!i::		;Selects CPU (Intel)
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 360
Sleep, 10
Click
Sleep, 50
Send, cpu (intel)
Sleep, 10
Send, {Enter}

Send, ^{Tab}
Sleep, 50
}
Return


^+!4::		;Selects 2.8 GHZ, 2 Cores and saves component
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 400
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, {Delete}
Sleep, 200

MouseMove, 620, 525
Sleep, 10
Click
Sleep, 50
Send, 2.8
Sleep, 10
Send, {Enter}
Sleep, 500

MouseMove, 1050, 525
Sleep, 10
Click
Sleep, 50
Send, 2
Sleep, 10
Send, {Enter}
Sleep, 500

MouseMove, 1250, 400
Sleep, 500
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 750, 580
Sleep, 10
Click

Send, ^{Tab}
Sleep, 50
}
Return


^+!5::		;Selects 2.93 GHZ, 2 Cores and saves component
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 400
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, {Delete}
Sleep, 200

MouseMove, 620, 525
Sleep, 10
Click
Sleep, 50
Send, 2.93
Sleep, 10
Send, {Enter}
Sleep, 500

MouseMove, 1050, 525
Sleep, 10
Click
Sleep, 50
Send, 2
Sleep, 10
Send, {Enter}
Sleep, 500

MouseMove, 1250, 400
Sleep, 500
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 750, 580
Sleep, 10
Click

Send, ^{Tab}
Sleep, 50
}
Return


^+!u::		;Selects Memory
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 360
Sleep, 10
Click
Sleep, 50
Send, memory
Sleep, 10
Send, {Enter}

Send, ^{Tab}
Sleep, 50
}
Return


^+!1::		;Selects Quantity 2, Dimm, PC3, 10600, U: Unbuffered, no ECC
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 400
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, 2
Sleep, 200

MouseMove, 620, 450
Sleep, 10
Click
Sleep, 50
Send, 1 gb
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 450
Sleep, 10
Click
Sleep, 50
Send, dimm
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 520
Sleep, 10
Click
Sleep, 50
Send, pc3
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 520
Sleep, 10
Click
Sleep, 50
Send, 10600
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 580
Sleep, 10
Click
Sleep, 50
Send, no
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1250, 400
Sleep, 100
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 745, 600
Sleep, 10
Click

Send, ^{Tab}
Sleep, 50
}
Return


^+!6::		;Selects Quantity 2, Dimm, PC2, 6400, U: Unbuffered, no ECC
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 400
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, 2
Sleep, 200

MouseMove, 620, 450
Sleep, 10
Click
Sleep, 50
Send, 1 gb
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 450
Sleep, 10
Click
Sleep, 50
Send, dimm
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 520
Sleep, 10
Click
Sleep, 50
Send, pc2
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 520
Sleep, 10
Click
Sleep, 50
Send, 6400
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 620, 580
Sleep, 10
Click
Sleep, 50
Send, no
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1250, 400
Sleep, 100
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 745, 600
Sleep, 10
Click

Send, ^{Tab}
Sleep, 50
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