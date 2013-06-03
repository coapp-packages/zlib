@echo off
setlocal

if "%1"=="clean" goto :clean
if "%1"=="noclean" (
	set __NOCLEAN__=true
	shift)

setlocal
REM call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" amd64
REM call :build x64 Release v110 || goto :eof
REM call :build x64 Debug v110 || goto :eof
endlocal

setlocal
call "C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" x86
call :build Win32 Release v110 || goto :eof
call :build Win32 Debug v110 || goto :eof
endlocal

setlocal
REM call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" amd64
REM call :build x64 Release v100 || goto :eof
REM call :build x64 Debug v100 || goto :eof
endlocal

setlocal
REM call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" x86
REM call :build Win32 Release v100 || goto :eof
REM call :build Win32 Debug v100 || goto :eof
endlocal

if "%__NOCLEAN__%"=="true" goto :eof

goto :clean

:build
REM msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:UsesConfigurationType=Dynamic /P:CallingConvention=cdecl .\zlib.vcxproj || goto :eof
REM msbuild /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:UsesConfigurationType=Static /P:CallingConvention=cdecl .\zlib.vcxproj || goto :eof
msbuild /v:d /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:UsesConfigurationType=Dynamic /P:CallingConvention=stdcall .\zlib.vcxproj || goto :eof
msbuild /v:d /P:Platform=%1 /P:Configuration=%2 /P:PlatformToolset=%3 /P:UsesConfigurationType=Static /P:CallingConvention=stdcall .\zlib.vcxproj || goto :eof
goto :eof

:clean
REM rd /s /q v90
rd /s /q Intermediate

