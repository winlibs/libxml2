@echo off

cd win32

if "%1"=="" goto HELP
if "%2"=="" goto HELP
if "%3"=="" goto HELP
if "%4"=="" goto HELP

set WL_VC=%1
set WL_ENV=%2
set WL_PLATFORM=%3
set WL_DEPS=%4

if NOT "debug"=="%WL_ENV%" (
	if NOT "release"=="%WL_ENV%" (
		echo Invalid env
		goto HELP
	)
)

rem set debug option
set WL_DEBUG=no
if "debug"=="%WL_ENV%" (
	set WL_DEBUG=debug=yes mem_debug=yes
)

if NOT "x86"=="%WL_PLATFORM%" (
	if NOT "x64"=="%WL_PLATFORM%" (
		echo Invalid platform
		goto HELP
	)
)

if "vc9"=="%WL_VC%" (
	if "x86"=="%WL_PLATFORM%" (
		call "%ProgramFiles%\Microsoft Visual Studio 9.0\VC\bin\vcvars32.bat" 
		rem "%ProgramFiles%\Microsoft SDKs\Windows\v6.1\Bin\SetEnv.Cmd" /%WL_ENV% /%WL_PLATFORM% /xp 
		setenv /%WL_ENV% /%WL_PLATFORM% /xp
		rem call c:\php-sdk\bin\phpsdk_setvars.bat
	) else (
		rem call "%ProgramFiles%\Microsoft Visual Studio 9.0\VC\bin\vcvarsx86_amd64.bat" 
		echo only x86 build for vc9 are supported
		goto EXIT_BAD 
	)
) else if "vc11"=="%WL_VC%" (

	call "%ProgramFiles%\Microsoft Visual Studio 11.0\VC\vcvarsall.bat" %WL_PLATFORM%

) else (
	echo Unsupported Visual C++ version
)

cscript configure.js lib=%WL_DEPS%\lib include=%WL_DEPS%\include %WL_DEBUG% vcmanifest=yes
nmake


:EXIT_GOOD
	cd ..
	exit /b 0

:EXIT_BAD
	cd ..
	exit /b 3

:HELP
	cd ..
	echo Builds a winlibs project
	echo Usage: build.bat <CRT version> <mode> <arch> deps
	echo     vc - vc9 or vc11
	echo     env - release or debug
	echo     platform - x86 or x64
	echo     deps - path to the deps, iconv is what's important
