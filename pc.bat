@echo off
title System Hardware Information
echo.
echo =======================================
echo        SYSTEM HARDWARE INFORMATION
echo =======================================
echo.

REM CPU Information
echo --- CPU Information ---
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed
echo.

REM RAM Information
echo --- RAM Information ---
wmic memorychip get Manufacturer,Capacity,Speed
echo.

REM GPU Information
echo --- GPU Information ---
wmic path win32_videocontroller get Name,AdapterRAM,CurrentRefreshRate,DriverVersion
echo.

REM Storage Information
echo --- Storage Information ---
wmic diskdrive get Model,Size,MediaType
echo.

REM Network Interfaces
echo --- Network Interfaces ---
wmic nic where "NetConnectionStatus=2" get Name,MACAddress,Speed
echo.

REM Battery Information
echo --- Battery Information ---
for /f "tokens=1,*" %%a in ('wmic path Win32_Battery get EstimatedRunTime /value') do set runtime=%%b
set /a hours=%runtime% / 60
set /a minutes=%runtime% %% 60
echo Estimated Runtime: %hours% hours %minutes% minutes
echo.

REM Motherboard Information
echo --- Motherboard Information ---
wmic baseboard get Manufacturer,Product,Version
echo.

REM BIOS Information
echo --- BIOS Information ---
wmic bios get Manufacturer,Name,Version,ReleaseDate
echo.

REM Operating System Information
echo --- Operating System Information ---
wmic os get Caption,OSArchitecture,Version,BuildNumber,RegisteredUser
echo.

echo =======================================
echo        END OF SYSTEM HARDWARE
echo =======================================
pause
