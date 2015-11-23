#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



^+!t::		;Passes all laptop tests. Must Fill out Top Cover manually then press shortcut.
Send, {Tab}
Send, {Tab}

Send, {Space}		;Base
Send, {Tab}
Send, {Tab}

Send, {Space}		;Bezel
Send, {Tab}
Send, {Tab}

Send, {Space}		;Palm Rest/Mousepad
Send, {Tab}
Send, {Tab}

Send, {Space}		;Keyboard
Send, {Tab}
Send, {Tab}

Send, {Space}		;Display
Send, {Tab}
Send, {Tab}
Send, {Tab}

Send, {Space}		;Ports
Send, {Tab}
Send, {Tab}

Send, {Space}		;Sound
Send, {Tab}
Send, {Tab}

Send, {Space}		;Graphics
Send, {Tab}
Send, {Tab}

Send, {Space}		;Battery
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

Send, {Right}
Send, {Right}
Send, {Right}
Send, {Space}		;Optical Drive
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Right}
Send, {Space}		;Webcam
Send, {Tab}
Send, {Tab}

Send, {Space}		;Other
Send, {Tab}
Send, {Tab}

Send, {Right}
Send, {Space}		;Drive
Send, {Tab}
Send, {Tab}

Send, {Enter}		;Save & Process Test

Send, {End}

Return