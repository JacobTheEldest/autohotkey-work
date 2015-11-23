#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



^+!g::		;Clicks add component button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 440, 330
Sleep, 5
Click

Return


^+!i::		;Selects CPU (Intel)
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

Return


^+!2::		;Selects Atom
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 630, 450
Sleep, 10
Click
Sleep, 50
Send, atom
Sleep, 10
Send, {Enter}
Sleep, 500

Return


^+!3::		;Selects n550
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1055, 450
Sleep, 10
Click
Sleep, 50
Send, n550
Sleep, 10
Send, {Enter}
Sleep, 500

Return


^+!4::		;Selects 1.50 GHZ, 2 Cores and saves component
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
Send, 1.50
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

Return


^+!u::		;Selects Memory
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

Return


^+!1::		;Selects Quantity 1, 2 gb, So-Dimm, PC3, 10600, Small Outline
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

MouseMove, 620, 450
Sleep, 10
Click
Sleep, 50
Send, 2 gb
Sleep, 10
Send, {Enter}
Sleep, 200

MouseMove, 1050, 450
Sleep, 10
Click
Sleep, 50
Send, so
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
Send, small
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

Return


^+!7::		;Selects Primary System Battery
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 800, 360
Sleep, 10
Click
Sleep, 50
Send, primary system battery
Sleep, 10
Send, {Enter}

Return


^+!8::		;Selects laptop and 6-cell. Empties quantity field
CoordMode, Mouse, Client
MouseMove, 1250, 400 
Sleep, 500
Click
Sleep, 100
Send, {Home}
Sleep, 500

MouseMove, 800, 400		;Empties quantity field
Sleep, 10
Click
Sleep, 10
Send, ^a
Sleep, 50
Send, {Delete}
Sleep, 200

MouseMove, 630, 450		;Selects Laptop
Sleep, 10
Click
Sleep, 50
Send, laptop
Sleep, 10
Send, {Enter}
Sleep, 100

MouseMove, 1055, 450	;selects 6-cell
Sleep, 10
Click
Sleep, 50
Send, 6
Sleep, 10
Send, {Enter}
Sleep, 100

MouseMove, 1055, 590	;selects 56 Whr
Sleep, 10
Click
Sleep, 50
Send, 56
Sleep, 10
Send, {Enter}
Sleep, 100

MouseMove, 630, 735		;Inputs N/A for Burn in Time
Sleep, 10
Click
Sleep, 50
Send, N/A
Sleep, 10
Send, {Enter}
Sleep, 100

MouseMove, 1250, 400 
Sleep, 500
Click
Sleep, 100

Send, {End}
Sleep, 500
MouseMove, 750, 585
Sleep, 10
Click

Return


^+!t::		;Passes all laptop tests. Notest webcam. Noinstall Optical Drive. Fail Drive.
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 525, 385	;Top Cover
Sleep, 5
Click
Sleep, 5
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


^+!n::		;Clicks Next step button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 1167, 284
Sleep, 10
Click
Sleep, 50

Return


^+!c::		;Completes Systems Test Stage
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 840, 325
Sleep, 5
Click
Sleep, 50
MouseMove, 800, 430
Sleep, 5
Click

Return


^+!v::		;Clicks 'Print Systems Test Label' button
CoordMode, Mouse, Client
Send, {Home}
Sleep, 500

MouseMove, 475, 475
Sleep, 5
Click

Return


^+!f::		;Oks Default printer and goes to home page
CoordMode, Mouse, Client
Send, {Enter}
Sleep, 1000

Send, !{Home}

Return