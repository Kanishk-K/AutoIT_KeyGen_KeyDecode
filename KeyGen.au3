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
HotKeySet("!p","Pause")
HotKeySet("!k","Kill")
#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("License Information", 258, 126, -1, -1)
Global $Label1 = GUICtrlCreateLabel("Input Your Lisence Key.", 24, 16, 214, 27)
GUICtrlSetFont(-1, 15, 400, 0, "Arial")
Global $Input1 = GUICtrlCreateInput("", 25, 48, 201, 23, BitOR($GUI_SS_DEFAULT_INPUT,$ES_UPPERCASE,$ES_NUMBER))
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
			ConsoleWrite($UserData)
			ConsoleWrite("The Key Is : " & $Cypher & @LF)
			ExitLoop
	EndSwitch
 WEnd
 GUIDelete("Form1")
 ClipPut($Cypher)
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
