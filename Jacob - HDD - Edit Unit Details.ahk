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


^+!t::		;
OpenWindow("MARRc")
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

Loop %LoopNumber% {
Send, ^l
Sleep, 50
Send, http://web01.marrc.int/Admin/MaintainUnit
Sleep, 800
Send, {Enter}
Sleep, 200

If (LoopNumber > 1) {
	Send, ^{Tab}
	Sleep, 50
	}
}
Return


^+!u::		;Opens x number of spreadsheet cells in x number of tabs
Send, ^c
Sleep, 500
Loop %LoopNumber% {
	Send, ^c
	Sleep, 100
	
	OpenWindow("MARRc")
	Sleep, 100
	Send, {Home}
	Sleep, 500
	CoordMode, Mouse, Client
	MouseMove, 765, 285
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

Send, {Right}		;Moves to original row, next column
Sleep, 30
Loop %LoopNumber% {
	Send, {Up}
	Sleep, 30
}

OpenWindow("MARRc")
Return


^+!e::		;Clicks Options > Edit Component
Loop %LoopNumber% {
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1305, 385
Sleep, 10
Click
Sleep, 50
MouseMove, 1265, 415
Sleep, 10
Click
Sleep, 50

Send, ^{Tab}
Sleep, 100
}

OpenWindow("Excel")
Return


^+!2::		;Copies each spreadsheet cell and pastes it in the model field
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
	MouseMove, 700, 530
	Sleep, 50
	Click
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

Send, {Right}		;Moves to original row, next column
Sleep, 30
Loop %LoopNumber% {
	Send, {Up}
	Sleep, 30
}
Return


^+!3::		;Copies each spreadsheet cell and pastes it in the oem number field
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
	MouseMove, 1200, 595
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

Send, {Right}		;Moves to original row, next column
Sleep, 30
Loop %LoopNumber% {
	Send, {Up}
	Sleep, 30
}
Return


^+!4::		;Copies each spreadsheet cell and pastes it in the oem name field
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
	MouseMove, 700, 595
	Sleep, 50
	Click
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

Send, {Left}		;Moves to original row, next column
	Sleep, 50
Send, {Left}
	Sleep, 50
Send, {Left}
	Sleep, 50

OpenWindow("MARRc")
Return


^+!s::		;Clicks Save component
Loop %LoopNumber% {
CoordMode, Mouse, Client
MouseMove, 1420, 500
Sleep, 10
Click
Sleep, 100
Send, {End}
Sleep, 500

MouseMove, 840, 695
Sleep, 10
Click
Sleep, 50

Send, ^{Tab}
Sleep, 100
}

OpenWindow("Excel")
Return


