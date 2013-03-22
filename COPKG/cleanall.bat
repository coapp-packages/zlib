@echo off
REM erase contrib\masmx86\inffas32.lst  > nul 2> nul
REM erase contrib\masmx86\inffas32.obj  > nul 2> nul
REM erase contrib\masmx86\match686.lst  > nul 2> nul
REM erase contrib\masmx86\match686.obj  > nul 2> nul
REM erase contrib\masmx64\inffasx64.lst  > nul 2> nul
REM erase contrib\masmx64\inffasx64.obj  > nul 2> nul
REM erase contrib\masmx64\gvmat64.lst  > nul 2> nul
REM erase contrib\masmx64\gvmat64.obj  > nul 2> nul
REM erase inffas8664.c  > nul 2> nul
REM if exist contrib\vstudio\vc10\x86 rmdir /s /q contrib\vstudio\vc10\x86  > nul 2> nul
REM if exist contrib\vstudio\vc10\x64 rmdir /s /q contrib\vstudio\vc10\x64  > nul 2> nul
REM if exist temp rmdir /s /q temp > nul 2> nul
REM if exist Release rmdir /s /q Release > nul 2> nul
REM nmake -f win32/Makefile.msc clean  > nul 2> nul

erase contrib\masmx86\inffas32.lst
erase contrib\masmx86\inffas32.obj
erase contrib\masmx86\match686.lst
erase contrib\masmx86\match686.obj
erase contrib\masmx64\inffasx64.lst
erase contrib\masmx64\inffasx64.obj
erase contrib\masmx64\gvmat64.lst  
erase contrib\masmx64\gvmat64.obj  
erase inffas8664.c  
if exist contrib\vstudio\vc10\x86 rmdir /s /q contrib\vstudio\vc10\x86  
if exist contrib\vstudio\vc10\x64 rmdir /s /q contrib\vstudio\vc10\x64  
if exist temp rmdir /s /q temp 
if exist Release rmdir /s /q Release 
nmake -f win32/Makefile.msc clean  
