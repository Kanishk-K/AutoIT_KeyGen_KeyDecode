#Region ;**** Directives created by AutoIt3Wrapper_GUI ****

$r = True
Func Kill()
   Exit
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
HotKeySet("+!p","Pause")
HotKeySet("+!k","Kill")

   While True
	  While $r == True
		 WinActivate("Minecraft 1.14.3")
		 ;Send("{SHIFTDOWN}")
		 MouseDown("left")
	  WEnd
   WEnd

