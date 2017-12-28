;Author:Robinn
;Email:Robinn@163.com
#Region
#PRE_Icon=autotools.ico
#PRE_OutFile=自动点击工具.exe
#PRE_UseX64=n
#PRE_Res_Language=2052
#PRE_Res_requestedExecutionLevel=None
#EndRegion

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <GUIConstants.au3>
#include <Array.au3>


Opt('MustDeclareVars', 1)
Global $total = 0
Global $flags = True
Global $num,$topnum,$arrX,$arrY
Global $controls[5][10] = [["chk_6","lbl_6","txt_6","lbl_6_2","txt_6_2","lbl_6_3","txt_6_3","radio6_left","radio6_leftdb","radio6_right"],["chk_7","lbl_7","txt_7","lbl_7_2","txt_7_2","lbl_7_3","txt_7_3","radio7_left","radio7_leftdb","radio7_right"],["chk_8","lbl_8","txt_8","lbl_8_2","txt_8_2","lbl_8_3","txt_8_3","radio8_left","radio8_leftdb","radio8_right"],["chk_9","lbl_9","txt_9","lbl_9_2","txt_9_2","lbl_9_3","txt_9_3","radio9_left","radio9_leftdb","radio9_right"],["chk_10","lbl_10","txt_10","lbl_10_2","txt_10_2","lbl_10_3","txt_10_3","radio10_left","radio10_leftdb","radio10_right"]]
$num = 6
$topnum = -820
$arrX = 0
$arrY = 0
HotKeySet("{ESC}", "captureESC")

TOOLS()

;Global $checkCN_&$num,$lbl_&$num,$TXT_&$num,$lbl_&$num&_2,$TXT_&$num&_2,$lbl_&$num&_3,$TXT_&$num&_3
Func TOOLS()
    Global $radio1_left,$radio1_leftdb,$radio1_right,$radio2_left,$radio2_leftdb,$radio2_right,$radio3_left,$radio3_leftdb,$radio3_right,$radio4_left,$radio4_leftdb,$radio4_right,$radio5_left,$radio5_leftdb,$radio5_right
    Global $msg,$checkCN_1,$checkCN_2,$BUTTION_1,$lblcount,$lbldy,$checkCN_333,$BUTTION_ADD,$BUTTION_DEL
	Global $TXT_1,$TXT_2,$TXT_3,$TXT_4,$TXT_333,$lbl_1,$lbl_1_2,$lbl_1_3,$TXT_1_2,$TXT_1_3,$lbl_2,$lbl_2_2,$lbl_2_3,$TXT_2_2,$TXT_2_3,$lbl_333,$lbl_333_2,$TXT_333_2,$lbl_333_3,$TXT_333_3,$checkCN_444,$lbl_444,$TXT_444,$lbl_444_2,$TXT_444_2,$lbl_444_3,$TXT_444_3,$checkCN_5,$lbl_5,$TXT_5,$lbl_5_2,$TXT_5_2,$lbl_5_3,$TXT_5_3
    GUICreate("自动点击工具",180,330,(@DesktopWidth - 180-8),0,$WS_SIZEBOX + $WS_SYSMENU) ;$WS_SYSMENU 去掉可以保持固定窗口
	GUISetIcon("autotools.ico")
    Opt("GUICoordMode",0)
	$checkCN_1 = GUICtrlCreateCheckbox("按F1捕获窗口焦点坐标",20, 10, 150, 20)
	$lbl_1 = GUICtrlCreateLabel("点1坐标:",0,30,60)
	$TXT_1 = GUICtrlCreateInput("",55,-2,80)
	GUICtrlSetStyle($TXT_1,$ES_READONLY)
    GUICtrlSetTip($TXT_1,"请按F1捕获窗口焦点坐标")
    $lbl_1_2  = GUICtrlCreateLabel("延迟时间:",-55,30,60)
	$TXT_1_2 = GUICtrlCreateInput("0",55,-2,80)
	$lbl_1_3  = GUICtrlCreateLabel("发送文本:",-55,30,60)
	$TXT_1_3 = GUICtrlCreateInput("",55,-2,80)
	GUIStartGroup()
	$radio1_left = GUICtrlCreateRadio("单击", -55,25,40)
	$radio1_leftdb = GUICtrlCreateRadio("双击",50,0,40)
	$radio1_right = GUICtrlCreateRadio("右击", 50,0,40)
    GUICtrlSetResizing($checkCN_1, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($lbl_1, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($TXT_1, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
    GUICtrlSetResizing($lbl_1_2, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($TXT_1_2, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($lbl_1_3, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($TXT_1_3, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($radio1_left, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($radio1_leftdb, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
	GUICtrlSetResizing($radio1_right, $GUI_DOCKLEFT + $GUI_DOCKTOP+$GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)


    $lblcount = GUICtrlCreateLabel("点击次数",-100, 35, 150, 20)
	$TXT_3 = GUICtrlCreateInput("", 0, 20,150)
	GUICtrlSetTip($TXT_3,"请输入点击次数(数值)")
	GUICtrlSetData($TXT_3,"1")
	;GUICtrlSetResizing($lblcount, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT + $GUI_DOCKHCENTER)

    $lbldy = GUICtrlCreateLabel("延迟执行",0, 35, 150, 20)
	$TXT_4 = GUICtrlCreateInput("", 0, 20,150)
	GUICtrlSetTip($TXT_4,"请输入延迟(数值)")
	GUICtrlSetData($TXT_4,"3000")
	;GUICtrlSetResizing($lbldy, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT + $GUI_DOCKHCENTER)


    $BUTTION_1 = GUICtrlCreateButton("开始任务", 0, 25, 150,30)
	GUICtrlSetResizing($BUTTION_1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT + $GUI_DOCKHCENTER)
    GUISetState()
	WinSetOnTop("自动点击工具","",1)



    ;核心主程序
    While 1
        $msg = GUIGetMsg()
        Select
             Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
			 Case $msg = $BUTTION_1
				  Local $posx1

				if 1=MsgBox(1, '温馨提示', '确定要开始任务吗？') Then
				   LoadKeyboardLayout("00000409", $TXT_1);
				   BlockInput(1) ;禁止用户操作鼠标键盘
				   If  GUICtrlRead($TXT_4)<>"" Then
					 Sleep(Number(GUICtrlRead($TXT_4)))
				  endif

				  ;WinSetOnTop("Microsoft Excel","",1)

				   $posx1 = StringSplit(GUICtrlRead($TXT_1), ",")

				   Local $totalnum = Number(GUICtrlRead($TXT_3))
				   For $i = 1 to $totalnum Step 1
					 If  GUICtrlRead($TXT_1)<>"" Then

						MouseMove(Number($posx1[1]), Number($posx1[2]))
						if BitAND(GUICtrlRead($radio1_left), $GUI_CHECKED) = $GUI_CHECKED Then
						   MouseClick("left",Number($posx1[1]),Number($posx1[2]))
						ElseIf BitAND(GUICtrlRead($radio1_leftdb), $GUI_CHECKED) = $GUI_CHECKED Then
						   MouseClick("left",Number($posx1[1]),Number($posx1[2]),2)
						elseif BitAND(GUICtrlRead($radio1_right), $GUI_CHECKED) = $GUI_CHECKED Then
						   MouseClick("right",Number($posx1[1]),Number($posx1[2]))
						Else
						   MouseClick("left",Number($posx1[1]),Number($posx1[2]))
						EndIf


						If  GUICtrlRead($TXT_1_2)<>"" Then
						   Sleep(Number(GUICtrlRead($TXT_1_2)))
						EndIf



						If  GUICtrlRead($TXT_1_3)<>"" Then
						   Send(GUICtrlRead($TXT_1_3))
						EndIf
					 EndIf

					 WinActivate("自动点击工具", "")

				   Next

				   BlockInput(0)
			    endif
				;EndIf

			 Case $msg = $checkCN_1
				If BitAND(GUICtrlRead($checkCN_1), $GUI_UNCHECKED) Then
				  GUICtrlSetData($TXT_1,"")
				  GUICtrlSetData($TXT_1_2,"0")
				  GUICtrlSetData($TXT_1_3,"")
				  HotKeySet("{F1}")
			    Else
				  HotKeySet("{F1}", "captureF1")
			    endif

        EndSelect
    WEnd
 EndFunc


;热键定义
Func captureESC()
   Exit
EndFunc

Func captureF1()
   Local $pos = MouseGetPos()
   GUICtrlSetData($TXT_1,$pos[0] & "," & $pos[1])
EndFunc



;改变键盘输入法状态
Func _GetKeyboardLayout($hWnd)
    Local $ret = DllCall("user32.dll", "long", "GetWindowThreadProcessId", "hwnd", $hWnd, "ptr", 0)
          $ret = DllCall("user32.dll", "long", "GetKeyboardLayout", "long", $ret[0])
          Return Hex($ret[0], 8)
EndFunc
Func LoadKeyboardLayout($sLayoutID, $hWnd)
    Local $WM_INPUTLANGCHANGEREQUEST = 0x50
    Local $ret = DllCall("user32.dll", "long", "LoadKeyboardLayout", "str", $sLayoutID, "int", 1 + 0)
    DllCall("user32.dll", "ptr", "SendMessage", "hwnd", $hWnd, "int", $WM_INPUTLANGCHANGEREQUEST, "int", 1, "int", $ret[0])
EndFunc   ;==>LoadKeyboardLayout