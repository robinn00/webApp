@echo off
title Ӳ������
echo           -----------------------------------------------------------
echo          ^|                                                           ^|
echo          ^|                                                           ^|
echo          ^|  ��ʾ���˽ű����Զ��Ѷ����Ӳ�����ݵ����һ���̷�         ^|
echo          ^|        ����ǰ������Ҫ���ݵ��ķ����Ƿ������������ڴ�     ^|
echo          ^|                                                           ^|
echo           -----------------------------------------------------------
echo.
echo ��ȷ��������Ϣ�����������& pause>nul&cls&echo.&echo ����ִ���У������ĵȴ�����������
::���һ���̷�
for /f "skip=1" %%i in ('wmic logicaldisk where "drivetype=3" get caption ^| find /I ":"') do  ( @set lastdirve=%%i)
set lastd=%lastdirve:~0,-1%
echo list volume >C:\Windows\Temp\tmp.txt
for /f "tokens=2" %%j in ('diskpart /s C:\Windows\Temp\tmp.txt ^| find "��" ^|find /I "%lastd%"') do ( @set juan=%%j)
echo.&echo ��⵽���һ���̷���: %lastd% ��Ӧ���: %juan%
echo.&echo ��ʼ����.....
echo select volume %juan% >C:\Windows\Temp\tmp.txt
echo extend>>C:\Windows\Temp\tmp.txt
diskpart /s C:\Windows\Temp\tmp.txt
IF %ERRORLEVEL% NEQ 0 echo. &echo ����ʧ�ܣ�������Ҫ��չ���ķ����Ƿ����������ڴ�����ύ������˾�ֹ����� &echo.& pause>nul &exit
del C:\Windows\Temp\tmp.txt
echo.&echo ���ݳɹ�,��������˳� &pause >nul &exit