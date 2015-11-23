#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



^+!t::		;Passes all server tests. Must Fill out Front Panel Manually then press shortcut.
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sides
Send, {Tab}
Send, {Tab}

Send, {Space}		;Rear Panel
Send, {Tab}
Send, {Tab}

Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Raid Controller
Send, {Tab}
Send, {Tab}

Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

Send, {Space}		;Power Supply
Send, {Tab}
Send, {Tab}

Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

Send, {Space}		;Mainboard
Send, {Tab}
Send, {Tab}

Send, {Space}		;Other
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Right}
Send, {Space}		;Drive
Send, {Tab}
Send, {Tab}

Send, {Enter}		;Save & Process Test

Send, {End}

Return