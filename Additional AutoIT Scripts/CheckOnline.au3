#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <IE.au3>
#include <File.au3>
#include <Date.au3>
#include <MsgBoxConstants.au3>
Func Kill()
   Exit
EndFunc
HotKeySet("!k","Kill")

$r = 0
$FileName = "InformationFile.txt"
_FileCreate($FileName)
FileWriteLine($FileName,"Time, Users" & @CRLF)
$oIE = _IECreate("www.growtopiagame.com")
$IEhWnd = WinWait("[CLASS:IEFrame]","",100)
WinMove($IEhWnd,"",@DesktopWidth/2,0,@DesktopWidth/2,@DesktopHeight)
Sleep(2000)
While $r < 2880
   $tags = $oIE.document.GetElementsByTagName("span")
   For $tag in $tags
	  $class_value = $tag.className
	  If $class_value = "counter" Then
		 FileWriteLine($FileName,_DateAdd('h',1,_NowCalc()) & ", " & $tag.innerHTML & @CRLF)
	  EndIf
   Next
   WinActivate($IEhWnd)
   Sleep(30000)
   Send("^r")
   Sleep(3000)
   $r = $r + 1
WEnd
_IEQuit($oIE)
FileMove($FileName,"InformationFile.csv")