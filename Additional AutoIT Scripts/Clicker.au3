#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$r = True
Func Kill()
   Exit 0
EndFunc
Func Pause()
   if $r == True Then
	  $r = False
   ElseIf $r == False Then
	  $r = True
   Else
	  ConsoleWrite("Critical Data Error, please contact Neeesh for a bug fix")
   EndIf
EndFunc
HotKeySet("!p","Pause")
HotKeySet("!k","Kill")

While True
   While $r == True
	  WinActivate("Minecraft 1.8.9")
	  MouseClick("left",682, 241,1)
	  Sleep(650)
	  MouseClick("left",682, 241,1)
	  Sleep(250)
   WEnd
WEnd
