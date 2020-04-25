#include <INet.au3>
#include <IE.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Crypt.au3>
#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <WinAPIFiles.au3>
#include <InetConstants.au3>
Func Kill()
   Exit 0
EndFunc
HotKeySet("]","Kill")
HotKeySet("!k","Kill")

$MagplantNumber = 1
if $MagplantNumber = 1 Then
   $MagX = 289
   $MagY = 352
   $RetButtonX = 538
   $RetButtonY = 383
Else
   $MagX = 352
   $MagY = 359
   $RetButtonX = 538
   $RetButtonY = 352
EndIf
#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("License Information", 258, 126, -1, -1)
Global $Label1 = GUICtrlCreateLabel("Magplant Items?", 24, 16, 214, 27)
GUICtrlSetFont(-1, 15, 400, 0, "Arial")
Global $Input1 = GUICtrlCreateInput("How many items are in the magplant?", 10, 48, 201, 23, BitOR($GUI_SS_DEFAULT_INPUT,$ES_UPPERCASE,$ES_NUMBER))
GUICtrlSetLimit(-1, 4)
GUICtrlSetFont(-1, 8, 800, 0, "Arial Narrow")
GUICtrlSetTip(-1, "Enter Here")
Global $Button1 = GUICtrlCreateButton("Enter.", 24, 80, 75, 25)
Global $Button2 = GUICtrlCreateButton("Close", 152, 80, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button2
			Exit
		 Case $Button1
			Global $UserData = Int(GUICtrlRead($Input1))
			if $UserData > 5000 Then
			   MsgBox($MB_SYSTEMMODAL,"Error","A Magplant can only hold 5000 items, try again.",10)
			   Exit
			EndIf
			Global $Repeat = 0
			if Mod($UserData, 200) = 0 Then
			   $Repeat = $UserData/200
			Else
			   $Repeat = Ceiling($UserData/200)
			EndIf
			ExitLoop
	EndSwitch
 WEnd
 GUIDelete("Form1")
 $r = 0
 if $Repeat > 20 Then
	$Repeat = 20
 EndIf
While $r < $Repeat
   MouseClick("left",$MagX,$MagY,1,0)
   Sleep(1500)
   MouseClick("left",$RetButtonX,$RetButtonY,1,0)
   MouseClick("left",$RetButtonX,$RetButtonY,1,0)
   Sleep(1000)
   MouseClick("left",552,470,1,0)
   Sleep(1000)
   MouseClick("left",497,494,1,0)
   Sleep(20)
   MouseClick("left",1245,598,1,0)
   Sleep(1000)
   MouseClick("left",684,466,1,0)
   Sleep(1000)
   MouseClick("left",535,364,1,0)
   Sleep(1000)
   HotKeySet("]","Kill")
   HotKeySet("!k","Kill")
   $r = $r + 1
WEnd
Exit