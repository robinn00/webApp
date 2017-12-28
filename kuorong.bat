@echo off
title 硬盘扩容
echo           -----------------------------------------------------------
echo          ^|                                                           ^|
echo          ^|                                                           ^|
echo          ^|  提示：此脚本会自动把多余的硬盘扩容到最后一个盘符         ^|
echo          ^|        运行前请检查您要扩容到的分区是否有设置虚拟内存     ^|
echo          ^|                                                           ^|
echo           -----------------------------------------------------------
echo.
echo 请确认以上信息后按任意键继续& pause>nul&cls&echo.&echo 程序执行中，请耐心等待·····
::最后一个盘符
for /f "skip=1" %%i in ('wmic logicaldisk where "drivetype=3" get caption ^| find /I ":"') do  ( @set lastdirve=%%i)
set lastd=%lastdirve:~0,-1%
echo list volume >C:\Windows\Temp\tmp.txt
for /f "tokens=2" %%j in ('diskpart /s C:\Windows\Temp\tmp.txt ^| find "卷" ^|find /I "%lastd%"') do ( @set juan=%%j)
echo.&echo 检测到最后一个盘符是: %lastd% 对应卷标: %juan%
echo.&echo 开始扩容.....
echo select volume %juan% >C:\Windows\Temp\tmp.txt
echo extend>>C:\Windows\Temp\tmp.txt
diskpart /s C:\Windows\Temp\tmp.txt
IF %ERRORLEVEL% NEQ 0 echo. &echo 扩容失败，请检查您要扩展到的分区是否设有虚拟内存或者提交工单我司手工扩容 &echo.& pause>nul &exit
del C:\Windows\Temp\tmp.txt
echo.&echo 扩容成功,按任意键退出 &pause >nul &exit