#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Script1 = none
Script2 = none
Script3 = none
Send, ^+!\


^+!/::		;Shows Hotkeys
	Gui, ManageScripts:New, , Manage Scripts Hotkeys
	Gui, ManageScripts:Add, Text,, Ctrl + Alt + Shift + 
	Gui, ManageScripts:Add, Text,, /   ->  Show Hotkeys
	Gui, ManageScripts:Add, Text,, .   ->  Hide Hotkeys
	Gui, ManageScripts:Add, Text,, ]   ->  Reloads Manage Script
	Gui, ManageScripts:Add, Text,, \   ->  Script Selection
	Gui, ManageScripts:Show, X0 Y100
Return
^+!.::		;Hides Hotkeys
	Gui, ManageScripts:Destroy
Return

^+!]::		;Reloads script
DetectHiddenWindows On  ; Allows a script's hidden main window to be detected.
SetTitleMatchMode 2  ; Avoids the need to specify the full path of the file below.
IfInString, Script1, AutoHotkey
{
	WinClose %Script1%
	Script1 = none
}
IfInString, Script2, AutoHotkey
{
	WinClose %Script2%
	Script2 = none
}
IfInString, Script3, AutoHotkey
{
	WinClose %Script3%
	Script3 = none
}
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
Return

^+!\::		;Shows Buttons to Select Different Scripts

;Close all other running scripts. Only works on scripts opened with Manage Scripts
DetectHiddenWindows On  ; Allows a script's hidden main window to be detected.
SetTitleMatchMode 2  ; Avoids the need to specify the full path of the file below.
IfInString, Script1, AutoHotkey
{
	WinClose %Script1%
	Script1 = none
}
IfInString, Script2, AutoHotkey
{
	WinClose %Script2%
	Script2 = none
}
IfInString, Script3, AutoHotkey
{
	WinClose %Script3%
	Script3 = none
}

Gui, Main:New, , Select Scripts
Gui, Main:Add, Button, gButtonManageUnitID, Manage Unit ID
Gui, Main:Add, Button, gButtonDDE, DDE
Gui, Main:Add, Button, gButtonDesktops, Desktops
Gui, Main:Add, Button, gButtonLaptops, Laptops
Gui, Main:Add, Button, gButtonKillOtherScripts, Kill Other Scripts
Gui, Main:Add, Button, gButtonKillAllScripts, Kill All Scripts
Gui, Main:Show
return


ButtonManageUnitID:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Manage Unit ID.ahk"
	Script1 = Jacob - Manage Unit ID.ahk - AutoHotkey
	Gui, Main:Destroy
return

ButtonDDE:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - DDE.ahk"
	Script1 = Jacob - DDE.ahk - AutoHotkey
	Gui, Main:Destroy
return

ButtonDesktops:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Desktops.ahk"
	Script1 = Jacob - Desktops.ahk - AutoHotkey
	Gui, Main:Destroy
	Gui, Desktop:New, , Select Model
	Gui, Desktop:Add, Button, gButtonOptiplex760, Optiplex 760
	Gui, Desktop:Add, Button, gButtonOptiplex780, Optiplex 780
	Gui, Desktop:Show
	return
return

ButtonOptiplex760:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Optiplex 760.ahk"
	Script2 = Jacob - Optiplex 760.ahk - AutoHotkey
	Gui, Desktop:Destroy
return

ButtonOptiplex780:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Optiplex 780.ahk"
	Script2 = Jacob - Optiplex 780.ahk - AutoHotkey
	Gui, Desktop:Destroy
	return
return

ButtonLaptops:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Laptops.ahk"
	Script1 = Jacob - Laptops.ahk - AutoHotkey
	Gui, Main:Destroy
	Gui, Laptop:New, , Select Model
	Gui, Laptop:Add, Button, gButtonLatitude2120, Latitude 2120
	Gui, Laptop:Add, Button, gButtonLatitudeE5420, Latitude E5420
	Gui, Laptop:Show
	return
return

ButtonLatitude2120:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Latitude 2120.ahk"
	Script2 = Jacob - Latitude 2120.ahk - AutoHotkey
	Gui, Laptop:Destroy
	return
return

ButtonLatitudeE5420:
	Run, "%A_AhkPath%" "C:\Users\Systems.Test\Documents\Code\autohotkey-work\Jacob - Latitude E5420.ahk"
	Script2 = Jacob - Latitude E5420.ahk - AutoHotkey
	Gui, Laptop:Destroy
	return
return

ButtonKillOtherScripts:
	Gui, Main:Destroy
return

ButtonKillAllScripts:
	PID:=DllCall("GetCurrentProcessId") 
	for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process where name = 'Autohotkey.exe' and processID  <> " PID )
		process, close, % process.ProcessId
	process, close, % PID ; If you want to close also this script
return

Return