	  #include <MsgBoxConstants.au3>
; Script Start - Add your code below here
$r = True
$i = 0

;True Means Left, False means right
$Side = "Left"

$LeftoRight = True
$25LeftoRight = True
;How Many Punches?
$Punches = 3
If $Side == "Right" Then
   $LeftoRight = @DesktopWidth/20
   $2LeftoRight = @DesktopWidth/20 * 2
Else
   $LeftoRight = @DesktopWidth/-20
   $2LeftoRight = @DesktopWidth/-20 * 2
EndIf


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
Func SwitchSide()
   if $Side == "Left" Then
	  $LeftoRight = @DesktopWidth/20
	  $2LeftoRight = $LeftoRight*2
   ElseIf $Side == "Right" Then
	  $LeftoRight = @DesktopWidth/-20
	  $2LeftoRight = $LeftoRight * 2
   Else
	  ConsoleWrite("Critical Data Error, please contact Neeesh for a bug fix")
	  Exit
   EndIf
EndFunc

Func Repeat($PlayerPlaceX,$PlayerPlaceY)
   MouseClick("left",$PlayerPlaceX,$PlayerPlaceY,1,0)
   Sleep(200)
EndFunc

HotKeySet("]","Kill")
HotKeySet("!p","Pause")
HotKeySet("!k","Kill")
HotKeySet("!s","SwitchSide")

MsgBox($MB_SYSTEMMODAL, "Initialize", "Hold your mouse over your fist and please wait",10)
Global $PlayerFist = MouseGetPos()
MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerFist[0] & "," & $PlayerFist[1],5)
MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over the remote and please wait",10)
Global $PlayerRemote = MouseGetPos()
MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerRemote[0] & "," & $PlayerRemote[1],5)
MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over where you want to place/break",10)
Global $PlayerPlace = MouseGetPos()
MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerPlace[0] & "," & $PlayerPlace[1],5)


While True
   While $r == True
MouseClick("left",$PlayerRemote[0],$PlayerRemote[1],1,0)
Sleep(50)
MouseClick("left",$PlayerPlace[0],$PlayerPlace[1],1,0)
Sleep(50)
MouseClick("left",$PlayerPlace[0] + $LeftoRight,400,1,0)
Sleep(50)
MouseClick("left",$PlayerPlace[0] + $2LeftoRight,400,1,0)
Sleep(50)
MouseClick("left",$PlayerFist[0],$PlayerFist[1],1,0)
Sleep(50)
While $i < $Punches
   Call("Repeat",$PlayerPlace[0],$PlayerPlace[1])
   $i = $i + 1
WEnd
$i = 0
WEnd
WEnd
