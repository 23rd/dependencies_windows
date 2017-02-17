@echo off

:: This script should be executed after build the dependencies.
:: It removes all files, which are not necessary for building TDesktop.

call:deleteSourceFiles
call:deleteProjectFiles
call:deleteScripts
call:deleteLogFiles
call:deleteImages
call:deleteDocumentation
call:deleteOther

GOTO:EOF

:: FUNCTIONS
:logInfo
    echo [INFO] %~1
GOTO:EOF

:deleteSourceFiles
    call:logInfo "Deleting source files"

	PowerShell Remove-Item .\*\* -include *.cpp  -force -recurse
	PowerShell Remove-Item .\*\* -include *.c    -force -recurse
	PowerShell Remove-Item .\*\* -include *.cc   -force -recurse
	PowerShell Remove-Item .\*\* -include *.asm  -force -recurse
	PowerShell Remove-Item .\*\* -include *.S    -force -recurse
	PowerShell Remove-Item .\*\* -include *.v    -force -recurse
	PowerShell Remove-Item .\*\* -include *.java -force -recurse
GOTO:EOF

:deleteProjectFiles
    call:logInfo "Deleting solution and project files"

	PowerShell Remove-Item .\*\* -include *.mk      -force -recurse
	PowerShell Remove-Item .\*\* -include *.sln     -force -recurse
	PowerShell Remove-Item .\*\* -include *.vcproj  -force -recurse
	PowerShell Remove-Item .\*\* -include *.vcxproj -force -recurse
	PowerShell Remove-Item .\*\* -include *.gyp     -force -recurse
	PowerShell Remove-Item .\*\* -include *.pro     -force -recurse
GOTO:EOF

:deleteScripts
    call:logInfo "Deleting scripts"

	::keep ninja/ninja.exe
	rename .\ninja\ninja.exe ninja.KEEP_ME
	PowerShell Remove-Item .\*\* -include *.exe -force -recurse
	rename .\ninja\ninja.KEEP_ME ninja.exe

	PowerShell Remove-Item .\*\* -include *.sh  -force -recurse
	PowerShell Remove-Item .\*\* -include *.ps1 -force -recurse
	PowerShell Remove-Item .\*\* -include *.bat -force -recurse
	PowerShell Remove-Item .\*\* -include *.dll -force -recurse
GOTO:EOF

:deleteLogFiles
    call:logInfo "Deleting log files"

	PowerShell Remove-Item .\*\* -include *.log  -force -recurse
	PowerShell Remove-Item .\*\* -include *.tlog -force -recurse
GOTO:EOF

:deleteImages
    call:logInfo "Deleting images"

	PowerShell Remove-Item .\*\* -include *.jpg  -force -recurse
	PowerShell Remove-Item .\*\* -include *.jpeg -force -recurse
	PowerShell Remove-Item .\*\* -include *.png  -force -recurse
GOTO:EOF

:deleteDocumentation
    call:logInfo "Deleting documentation"

	PowerShell Remove-Item .\*\* -include *.md  -force -recurse
	PowerShell Remove-Item .\*\* -include *.qdoc  -force -recurse
	PowerShell Remove-Item .\*\* -include *.txt  -force -recurse
GOTO:EOF

:deleteOther
    call:logInfo "Deleting other files"

	PowerShell Remove-Item .\*\* -include *.js        -force -recurse
	PowerShell Remove-Item .\*\* -include *.css       -force -recurse
	PowerShell Remove-Item .\*\* -include *.xsl       -force -recurse
	PowerShell Remove-Item .\*\* -include *.mo        -force -recurse
	PowerShell Remove-Item .\*\* -include *.m4        -force -recurse
	PowerShell Remove-Item .\*\* -include *.gitignore -force -recurse
GOTO:EOF
