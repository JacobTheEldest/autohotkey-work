#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



^+!t::		;Passes all laptop tests. Must Fill out Top Cover manually then press shortcut.
Send, {Tab}		;Base
Send, {Tab}
Send, {Space}

Send, {Tab}		;Bezel
Send, {Tab}
Send, {Space}

Send, {Tab}		;Palm Rest/Mousepad
Send, {Tab}
Send, {Space}

Send, {Tab}		;Keyboard
Send, {Tab}
Send, {Space}

Send, {Tab}		;Display
Send, {Tab}
Send, {Space}
Send, {Tab}

Send, {Tab}		;Ports
Send, {Tab}
Send, {Space}

Send, {Tab}		;Sound
Send, {Tab}
Send, {Space}

Send, {Tab}		;Graphics
Send, {Tab}
Send, {Space}

Send, {Tab}		;Battery
Send, {Tab}
Send, {Space}

Send, {Tab}		;CPU
Send, {Tab}
Send, {Space}

Send, {Tab}		;Memory
Send, {Tab}
Send, {Space}

Send, {Tab}		;Fan
Send, {Tab}
Send, {Space}

Send, {Tab}		;Optical Drive
Send, {Tab}
Send, {Space}

Send, {Tab}		;Webcam
Send, {Tab}
Send, {Right}
Send, {Right}
Send, {Right}
Send, {Space}

Send, {Tab}		;Other
Send, {Tab}
Send, {Space}

Send, {Tab}		;Drive
Send, {Tab}
Send, {Space}

Send, {Tab}		;Save & Process Test
Send, {Tab}
Send, {Enter}

Send, {End}

Return