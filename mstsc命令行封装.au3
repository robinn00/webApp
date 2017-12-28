;Author:Robinn
;Email:Robinn@163.com
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <GUIConstants.au3>


if $CmdLine[1]="211.149.241.190" or $CmdLine[1]="115.159.53.71" or $CmdLine[1]="122.114.57.123" or 	$CmdLine[1]="123.56.84.115" or $CmdLine[1]="211.149.245.220" or $CmdLine[1]="139.129.109.217" then
   $uadmin = "Administrator"
   $admin_ = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint")
   if $admin_<>"" and StringInStr(StringLower($admin_),$uadmin)>0 Then
	  ;RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint")
   Else
	  RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint", "REG_SZ", $uadmin)
   EndIf


   RunWait(@ComSpec & " /c start /MAX mstsc /console /v:"&$CmdLine[1]&":"&$CmdLine[2],@SystemDir,@SW_HIDE)
   Sleep(2000)
   Send($CmdLine[3]&"{ENTER}")
   Sleep(20000)
   ;WinWaitActive("远程桌面连接", "", 20)
   Send("+{TAB 1}")
   Send("{ENTER}")
   ;WinWaitActive("[CLASS:DirectUIHWND]")
   Sleep(2000)
   ProcessClose("mstsc_.exe")

Else
   $uadmin = "Administrator"
   $admin_ = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint")
   if $admin_<>"" and StringInStr(StringLower($admin_),$uadmin)>0 Then
	  ;RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint")
   Else
	  RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\"&$CmdLine[1], "UsernameHint", "REG_SZ", $uadmin)
   EndIf


   RunWait(@ComSpec & " /c start /MAX mstsc /console /v:"&$CmdLine[1]&":"&$CmdLine[2],@SystemDir,@SW_HIDE)
   Sleep(2000)
   Send("+{TAB 1}")
   Send("{ENTER}")
   Sleep(2000)
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Send($CmdLine[3]&"{ENTER}")
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Sleep(2000)
   ProcessClose("mstsc_.exe")
EndIf


#comments-start
$uadmin = "Administrator"
$admin_ = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\211.149.184.201", "UsernameHint")
if $admin_<>"" and StringInStr(StringLower($admin_),$uadmin)>0 Then
Else
   RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers\211.149.184.201", "UsernameHint", "REG_SZ", $uadmin)
EndIf


RunWait(@ComSpec & " /c start /MAX mstsc /console /v:211.149.184.201:37120",@SystemDir,@SW_HIDE)
Sleep(2000)
Send("+{TAB 1}")
Send("{ENTER}")
Sleep(2000)
WinWaitActive("[CLASS:TscShellContainerClass]")
Send("jxpd45xxbu1x2e3h5n{ENTER}")
WinWaitActive("[CLASS:TscShellContainerClass]")
Sleep(2000)
ProcessClose("mstsc_.exe")
#comments-end








;MsgBox(4096, "Test",$admin_, 10)

#comments-start
if $admin_<>"" and StringInStr(StringLower($admin_),$uadmin)>0 Then
   RunWait(@ComSpec & " /c start /MAX mstsc /console /v:"&$CmdLine[1]&":"&$CmdLine[2],@SystemDir,@SW_SHOW)
   Sleep(2000)
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Send($CmdLine[3]&"{ENTER}")
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Sleep(1000)
   ProcessClose("mstsc.exe")
Else
   RunWait(@ComSpec & " /c start /MAX mstsc /console /v:"&$CmdLine[1]&":"&$CmdLine[2],@SystemDir,@SW_SHOW)
   Sleep(2000)
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Send($uadmin)
   Sleep(1000)
   Send("{TAB}")
   Sleep(1000)
   Send($CmdLine[3]&"{ENTER}")
   WinWaitActive("[CLASS:TscShellContainerClass]")
   Sleep(1000)
   ProcessClose("mstsc.exe")
EndIf
#comments-end

#comments-start
RunWait(@ComSpec & " /c start /MAX mstsc /console /v:"&$CmdLine[1]&":"&$CmdLine[2],@SystemDir,@SW_SHOW)
Sleep(2000)
WinWaitActive("[CLASS:TscShellContainerClass]")
Send($CmdLine[3]&"{ENTER}")
WinWaitActive("[CLASS:TscShellContainerClass]")
Sleep(1000)
ProcessClose("mstsc.exe")
#comments-end