#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Cycle := 0

^+!p::		;Cycle Printers
If Cycle = 0	
{
	printer := "\\dc02\netusblpr01"
	Run, "cycleprinter.bat" "%printer%"
	Cycle++
	MsgBox Default Printer: %printer%
	Return
}

If Cycle = 1
{
	printer := "\\dc02\HP LaserJet M5035 mfp PCL6"
	Run, "cycleprinter.bat" "%printer%"
	Cycle++
	MsgBox Default Printer: %printer%
	Return
}

If Cycle = 2
{
	printer := "\\marrc-113\ZDesigner LP 2824 Plus (ZPL)"
	Run, "cycleprinter.bat" "%printer%"
	Cycle := 0
	MsgBox Default Printer: %printer%
	Return
}
