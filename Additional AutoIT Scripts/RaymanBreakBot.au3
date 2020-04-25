#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon="gems_UW5_icon.ico"
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
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
Global $FileLocation = @TempDir & "\BreakBot.ini"
Global $section = "NeeeshA5utoIT"
Global $dll = DllOpen("user32.dll")
Global $r = True
Global $sleep = 0
Global $PlayerFist[2]
Global $PlayerRemote[2]
Global $PlayerPlace[2]
$i = 0
;True Means Left, False means right
$Side = "Left"

$LeftoRight = True
$2LeftoRight = True
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
   Exit
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
Func Pause()
   if $r == True Then
	  $r = False
   ElseIf $r == False Then
	  $r = True
   Else
	  ConsoleWrite("Critical Data Error, please contact Neeesh for a bug fix")
   EndIf
EndFunc
Func Repeat($PlayerPlaceX,$PlayerPlaceY)
   MouseClick("left",$PlayerPlaceX,$PlayerPlaceY,1,0)
   Sleep(200)
EndFunc

HotKeySet("!p","Pause")
HotKeySet("!k","Kill")
#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("License Information", 258, 126, -1, -1)
Global $Label1 = GUICtrlCreateLabel("Input Your Lisence Key.", 24, 16, 214, 27)
GUICtrlSetFont(-1, 15, 400, 0, "Arial")
Global $Input1 = GUICtrlCreateInput("ENTER LISENCE HERE", 10, 48, 201, 23, BitOR($GUI_SS_DEFAULT_INPUT,$ES_UPPERCASE,$ES_NUMBER))
GUICtrlSetLimit(-1, 10)
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
			Global $UserData = GUICtrlRead($Input1)
			if StringLen($UserData) < 10 Then
			   MsgBox($MB_SYSTEMMODAL,"Error","License is too short to be valid",10)
			   Exit
			EndIf
			Global $Cypher = _StringShiftCipher($UserData,20)
			ExitLoop
	EndSwitch
 WEnd
 GUIDelete("Form1")

Global $URL = "YOUR WEBSITE URL HERE!" ;Put your website url here where the keys are stored.
Global $StringLength = StringLen($URL) + 2
$oIE = _IECreate ($URL, 0, 0, 0)
_IELoadWait ($oIE)
$sText = _IEBodyReadText ($oIE)
global $check = StringInStr($sText,$Cypher,1)
_IELinkClickByText($oIE,$Cypher)
$NEWURL = _IEPropertyGet($oIE,"locationurl")
Global $Date = StringTrimLeft($NEWURL,$StringLength)
_IEQuit($oIE)

If $check = true Then

   MsgBox($MB_SYSTEMMODAL, "Success", "This key is valid until " & $Date & ", thanks for your purchase" , 120)
   if FileExists($FileLocation) then
	  $PlayerFist[0] = IniRead($FileLocation,$section,"PlayerFistX","NULL VALUE DO NOT START")
	  $PlayerFist[1] = IniRead($FileLocation,$section,"PlayerFistY","NULL VALUE DO NOT START")
	  $PlayerRemote[0] = IniRead($FileLocation,$section,"PlayerRemoteX","NULL VALUE DO NOT START")
	  $PlayerRemote[1] = IniRead($FileLocation,$section,"PlayerRemoteY","NULL VALUE DO NOT START")
	  $PlayerPlace[0] = IniRead($FileLocation,$section,"PlayerPlaceX","NULL VALUE DO NOT START")
	  $PlayerPlace[1] = IniRead($FileLocation,$section,"PlayerPlaceY","NULL VALUE DO NOT START")
	  $ValueCheck = MsgBox(4,"Previous Values","Are These Positions Valid?" & @LF & "Player Fist Location:" & $PlayerFist[0] & "," & $PlayerFist[1] & @LF & "Player Remote Location:" & $PlayerRemote[0] & "," & $PlayerRemote[1] & @LF & "Player Break/Place Location:" & $PlayerPlace[0] & "," & $PlayerPlace[1])
	  if $ValueCheck = 6 Then

	  Else
		 MsgBox($MB_SYSTEMMODAL, "Initialize", "Hold your mouse over your fist and please wait",10)
		 Global $PlayerFist = MouseGetPos()
		 MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerFist[0] & "," & $PlayerFist[1],5)
		 MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over the remote and please wait",10)
		 Global $PlayerRemote = MouseGetPos()
		 MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerRemote[0] & "," & $PlayerRemote[1],5)
		 MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over where you want to place/break",10)
		 Global $PlayerPlace = MouseGetPos()
		 MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerPlace[0] & "," & $PlayerPlace[1],5)
		 IniWrite($FileLocation,$section,"PlayerFistX",$PlayerFist[0])
		 IniWrite($FileLocation,$section,"PlayerFistY",$PlayerFist[1])
		 IniWrite($FileLocation,$section,"PlayerRemoteX",$PlayerRemote[0])
		 IniWrite($FileLocation,$section,"PlayerRemoteY",$PlayerRemote[1])
		 IniWrite($FileLocation,$section,"PlayerPlaceX",$PlayerPlace[0])
		 IniWrite($FileLocation,$section,"PlayerPlaceY",$PlayerPlace[1])
	  EndIf
   Else
	  MsgBox($MB_SYSTEMMODAL, "Initialize", "Hold your mouse over your fist and please wait",10)
	  Global $PlayerFist = MouseGetPos()
	  MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerFist[0] & "," & $PlayerFist[1],5)
	  MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over the remote and please wait",10)
	  Global $PlayerRemote = MouseGetPos()
	  MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerRemote[0] & "," & $PlayerRemote[1],5)
	  MsgBox($MB_SYSTEMMODAL, "Initalize", "Hold your mouse over where you want to place/break",10)
	  Global $PlayerPlace = MouseGetPos()
	  MsgBox($MB_SYSTEMMODAL, "Initalize", "Mouse Positions are " & $PlayerPlace[0] & "," & $PlayerPlace[1],5)
	  IniWrite($FileLocation,$section,"PlayerFistX",$PlayerFist[0])
	  IniWrite($FileLocation,$section,"PlayerFistY",$PlayerFist[1])
	  IniWrite($FileLocation,$section,"PlayerRemoteX",$PlayerRemote[0])
	  IniWrite($FileLocation,$section,"PlayerRemoteY",$PlayerRemote[1])
	  IniWrite($FileLocation,$section,"PlayerPlaceX",$PlayerPlace[0])
	  IniWrite($FileLocation,$section,"PlayerPlaceY",$PlayerPlace[1])
   EndIf

   #Region ### START Koda GUI section ### Form=
   $Form2 = GUICreate("Begin", 405, 153, -1, -1)
   $Radio1 = GUICtrlCreateRadio("Pepper/Ftank", 24, 16, 113, 17)
   $Radio2 = GUICtrlCreateRadio("Steel/Gold", 24, 80, 113, 17)
   $Radio3 = GUICtrlCreateRadio("Chands/Ice", 24, 48, 113, 17)
   $Label2 = GUICtrlCreateLabel("Made By Neeesh",176,32,133,17)
   $Label1 = GUICtrlCreateLabel("ALT + P to pause the script", 176, 16, 133, 17)
   $Label3 = GUICtrlCreateLabel("ALT + K  kills the script.", 176, 80, 115, 17)
   GUISetState(@SW_SHOW)
   #EndRegion ### END Koda GUI section ###

   While 1
	  $nMsg = GUIGetMsg()
		 Switch $nMsg
			Case $GUI_EVENT_CLOSE
			   Exit
			Case $Radio1
			   if GUICtrlRead($Radio1) = 1 Then
				  $sleep = 3
			   EndIf
			   ExitLoop
			Case $Radio2
			   if GUICtrlRead($Radio2) = 1 Then
				  $sleep = 15
			   EndIf
			   ExitLoop
			Case $Radio3
			   if GUICtrlRead($Radio3) = 1 Then
				  $sleep = 6
			   EndIf
			   ExitLoop
		 EndSwitch
	  WEnd
	  GUIDelete()
   While True
	  While $r == True
		 WinActivate("Growtopia")
		 HotKeySet("!p","Pause")
		 HotKeySet("!k","Kill")
		 MouseClick("left",$PlayerRemote[0],$PlayerRemote[1],1,0)
		 Sleep(0)
		 MouseClick("left",$PlayerPlace[0],$PlayerPlace[1],2,0)
		 Sleep(50)
		 MouseClick("left",$PlayerPlace[0] + $LeftoRight,400,1,0)
		 Sleep(50)
		 MouseClick("left",$PlayerPlace[0] + $2LeftoRight,400,1,0)
		 Sleep(50)
		 MouseClick("left",$PlayerFist[0],$PlayerFist[1],1,0)
		 MouseMove($PlayerPlace[0],$PlayerPlace[1],0)
		 While $i < $sleep
		 Call("Repeat",$PlayerPlace[0],$PlayerPlace[1])
		 $i = $i + 1
	  WEnd
	  $i = 0
	  WEnd
	  HotKeySet("!p","Pause")
	  HotKeySet("!k","Kill")
   WEnd

Else
   MsgBox($MB_SYSTEMMODAL, "Error", "This key is invalid, please contact Neeesh for assistance.", 120)
   Exit
EndIf



Func _StringShiftCipher($s_Data, $i_Key, $v_Decrypt = False)
    If Not IsArray($i_Key) Then
        If $v_Decrypt Then $i_Key *= -1
        $v_Decrypt = $i_Key; reduce, reuse, recycle!
        Dim $i_Key[1] = [$v_Decrypt]; Dim $v[1] = [$v], dosn't work
    ElseIf $v_Decrypt Then; Modified Cipher
        For $i_Iteration = 0 To UBound($i_Key)-1
            $i_Key[$i_Iteration] *= -1
        Next
    EndIf
    $s_Buffer = ""
    For $i_Iteration = 1 To StringLen($s_Data)
        $s_Buffer &= Chr(Mod(Asc(StringMid($s_Data, $i_Iteration, 1))+$i_Key[Mod($i_Iteration-1, UBound($i_Key))]+256, 256))
    Next
    Return $s_Buffer
EndFunc
