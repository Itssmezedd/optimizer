:: by Itssmezedd

@echo off
setlocal enabledelayedexpansion
REM Put (_clean pc) on startup
echo adding cleaner in startup...
echo:
timeout /t 1 >nul
copy ".\cleaner.bat" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
echo Done!
echo:
echo -------------------------------------------------------


REM Adds Multiple reg files to optimize PC
echo adding multiple reg files...
echo:
timeout /t 1 >nul
regedit /s ".\_modified settings.reg"
echo Done!
echo:
echo -------------------------------------------------------



REM Optimize Internet Connection
echo optimizing internet...
echo:
timeout /t 1 >nul
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
echo Done!
echo:
echo -------------------------------------------------------


REM Disable Unuse Services
echo disabling unuse services...
echo:
timeout /t 1 >nul
sc config "CDPSvc" start= disabled
sc config "Sysmain" start= disabled
sc config "WSearch" start= disabled
sc config "Spooler" start= disabled
sc config "iphlpsvc" start= disabled
echo Done!
echo:
echo -------------------------------------------------------

REM Delete Unnecessary Files
echo deleting unnecessary files...
echo: 
timeout /t 1 >nul
rd /s /q C:\Windows\Prefetch\
rd /s /q C:\Windows\Temp\
rd /s /q %userprofile%\appdata\local\temp\
echo Done!
echo:
echo -------------------------------------------------------
echo.
echo.

REM Reference: https://github.com/windows-powertool/Powertool
set /p input=Open WinndowsPowerTool? [Y/N]  
if %input%==y ( powershell -command "iwr -useb tool.windowpowertool.workers.dev | iex" ) else ( exit )
if %input%==Y ( powershell -command "iwr -useb tool.windowpowertool.workers.dev | iex" ) else ( exit )
