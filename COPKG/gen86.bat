@echo off
REM this makes it so that DLLs can have their own SxS Activation Context in an embedded resource.
if not defined CL set CL= /D ISOLATION_AWARE_ENABLED /U NOUSER 
echo %CL% | findstr ISOLATION_AWARE || set CL=%CL% /D ISOLATION_AWARE_ENABLED /U NOUSER 

REM This avoids problems of ambiguity later...
rem Do zlibwapi build...
pushd contrib\masmx86\
	call bld_ml32.bat
popd 
msbuild /p:Platform=win32 /p:Configuration=Release contrib\vstudio\vc10\zlibvc.sln || goto failed

rem lets clean out all the obj's first, otherwise we might accidentally link to another arch
nmake -f win32/Makefile.msc clean || goto failed

rem Do zlib1 build...
copy contrib\masmx86\inffas32.obj inffas32.obj || goto failed
copy contrib\masmx86\match686.obj match686.obj || goto failed

mkdir temp
nmake -f win32/Makefile.msc LOC="-DASMV -DASMINF" OBJA="match686.obj inffas32.obj" || goto failed

rem make my output locations
md output\%1\x86\Release\lib
md output\%1\x86\Release\bin

rem grab out outputs and put them in a consistent location.
copy temp\zlib1.lib output\%1\x86\Release\lib\zlib1.lib                 || goto failed
copy temp\zlib1.exp output\%1\x86\Release\lib\zlib1.exp                 || goto failed
copy temp\zlib1.dll output\%1\x86\Release\bin\zlib1.dll                 || goto failed

copy contrib\vstudio\vc10\x86\MiniUnzipRelease\miniunz.exe     output\%1\x86\Release\bin\miniunz.exe    || goto failed 
copy contrib\vstudio\vc10\x86\MiniZipRelease\minizip.exe       output\%1\x86\Release\bin\minizip.exe    || goto failed 
copy contrib\vstudio\vc10\x86\TestZlibDllRelease\testzlibdll.exe  output\%1\x86\Release\bin\testzlibdll.exe   || goto failed 
copy contrib\vstudio\vc10\x86\TestZlibRelease\testzlib.exe     output\%1\x86\Release\bin\testzlibstatic.exe   || goto failed 
copy contrib\vstudio\vc10\x86\ZlibDllRelease\zlibwapi.dll      output\%1\x86\Release\bin\zlibwapi.dll   || goto failed 
copy contrib\vstudio\vc10\x86\ZlibDllRelease\zlibwapi.lib      output\%1\x86\Release\lib\zlibwapi.lib   || goto failed 
copy contrib\vstudio\vc10\x86\ZlibStatRelease\zlibstat.lib     output\%1\x86\Release\lib\zlibstat.lib   || goto failed 
copy example.exe	output\%1\x86\Release\bin\example.exe	|| goto failed 
copy minigzip.exe	output\%1\x86\Release\bin\minigzip.exe	|| goto failed 
copy example_d.exe	output\%1\x86\Release\bin\example_d.exe	|| goto failed 
copy minigzip_d.exe	output\%1\x86\Release\bin\minigzip_d.exe	|| goto failed 

@goto :eof
:failed
@echo Bad things happened...
@exit /b 1;

