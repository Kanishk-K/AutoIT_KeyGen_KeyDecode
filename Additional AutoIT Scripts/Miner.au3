#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

WinActivate("[CLASS:LWJGL]")
Func kill()
   Exit 0
EndFunc
$Mega = 0
While $Mega > -1
HotKeySet("{F9}", "kill")
$Rep1 = 0
$Rep2 = 0
$MovementTime = 225
$MoveMulti = 1

Sleep(8000)

While $Rep1 < 10
	HotKeySet("{F9}", "kill")
	Sleep(1000)
	Opt("SendKeyDownDelay",$MovementTime * $MoveMulti) ; 15.4 MillSecond Delay
	Send("a")
	Opt("SendKeyDownDelay",5) ;Reset
	Sleep(1000)
	MouseMove(682.5,650,0)
	MouseDown("left")
	Opt("SendKeyDownDelay",10000) ; 15.4 MillSecond Delay
	Send("w")
	Opt("SendKeyDownDelay",5) ;Reset
	MouseUp("left")
	Send("{ENTER}")
	Sleep(1000)
	Send("/warp d")
	Send("{ENTER}")
	Sleep(1000)
	$Rep1 = $Rep1 + 1
	$MoveMulti = $MoveMulti + 1
WEnd
$MoveMulti = 1

While $Rep2 < 10
	HotKeySet("{F9}", "kill")
	Sleep(1000)
	Opt("SendKeyDownDelay",$MovementTime * $MoveMulti) ; 15.4 MillSecond Delay
	Send("d")
	Opt("SendKeyDownDelay",5) ;Reset
	Sleep(1000)
	MouseMove(682.5,650,0)
	MouseDown("left")
	Opt("SendKeyDownDelay",10000) ; 15.4 MillSecond Delay
	Send("w")
	Opt("SendKeyDownDelay",5) ;Reset
	MouseUp("left")
	Send("{ENTER}")
	Sleep(1000)
	Send("/warp d")
	Send("{ENTER}")
	Sleep(1000)
	$Rep2 = $Rep2 + 1
	$MoveMulti = $MoveMulti + 1
WEnd
WEnd