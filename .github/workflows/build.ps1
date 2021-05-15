param (
    [Parameter(Mandatory)] $vs,
    [Parameter(Mandatory)] $arch,
    [Parameter(Mandatory)] $libiconv
)

$ErrorActionPreference = "Stop"

New-Item winlib_deps -ItemType directory
$temp = New-TemporaryFile | Rename-Item -NewName {$_.Name + ".zip"} -PassThru
Invoke-WebRequest https://windows.php.net/downloads/php-sdk/deps/$vs/$arch/libiconv-$libiconv-$vs-$arch.zip -OutFile $temp
Expand-Archive $temp -DestinationPath winlib_deps

Set-Location win32

cscript configure.js include=..\winlib_deps\include lib=..\winlib_deps\lib prefix=..\winlib_build debug=yes mem_debug=yes vcmanifest=yes
nmake /f Makefile.msvc
nmake /f Makefile.msvc install

nmake /f Makefile.msvc clean

cscript configure.js include=..\winlib_deps\include lib=..\winlib_deps\lib prefix=..\winlib_build vcmanifest=yes
nmake /f Makefile.msvc
nmake /f Makefile.msvc install

Set-Location ..
Remove-Item winlib_build\bin\run*
Remove-Item winlib_build\bin\test*
Remove-Item winlib_build\bin\xml*.pdb
