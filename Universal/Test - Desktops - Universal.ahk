#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



		;Must Fill out Front Panel Manually then press shortcut.
^+!t::		;Passes all desktop tests. Not installed for Graphics Card and Drive.
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sides
Send, {Tab}
Send, {Tab}

Send, {Space}		;Rear Panel
Send, {Tab}
Send, {Tab}

Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Right}
Send, {Space}		;Graphics Card
Send, {Tab}
Send, {Tab}

Send, {Space}		;Power Supply
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


		;Must Fill out Front Panel Manually then press shortcut.
^+!w::		;Passes all desktop tests. Not Installed for Drive
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sides
Send, {Tab}
Send, {Tab}

Send, {Space}		;Rear Panel
Send, {Tab}
Send, {Tab}

Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

Send, {Space}		;Graphics Card
Send, {Tab}
Send, {Tab}

Send, {Space}		;Power Supply
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


		;Must Fill out Front Panel Manually then press shortcut.
^+!-::		;Fail Other. Not tested all else.
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Sides
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Rear Panel
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;CPU
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Memory
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Fan
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Graphics Card
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Power Supply
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Mainboard
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Space}		;Other
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Drive
Send, {Tab}
Send, {Tab}

Send, {Enter}		;Save & Process Test

Send, {End}

Return