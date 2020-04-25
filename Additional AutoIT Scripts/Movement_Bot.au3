#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$Rep = 0
Func kill()
   Exit 0
EndFunc
While $Rep < 1
	HotKeySet("{F9}", "kill")
	$RepRep = 0
	WinActivate("RobocraftClient")
	MouseMove(691,75,10)
	MouseClick("left")
	MouseMove(782,310,10)
	MouseClick("left")
	Sleep(240000)
	While $RepRep < 40
		HotKeySet("{F9}", "kill")
		Sleep(15000)
		Opt("SendKeyDownDelay",1500) ; 1.5 Second Delay
		Send("d")
		Opt("SendKeyDownDelay",5) ;Reset
		Opt("SendKeyDownDelay",1500) ; 1.5 Second Delay
		Send("a")
		Opt("SendKeyDownDelay",5) ;Reset
		$RepRep = $RepRep + 1
	WEnd
	HotKeySet("{F9}", "kill")
	MouseMove(687,493,10)
	MouseClick("left")
	Sleep(5000)
	MouseClick("left")
	Sleep(5000)
	MouseMove(702,414,10)
	MouseClick("left")
	Sleep(10000)
	MouseMove(578,727,10)
	MouseClick("left")
WEnd
