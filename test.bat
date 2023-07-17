:: a simple script that updates the extension folder in visual studio
:: code's extensions folder and reopens it.

@echo off

setlocal enabledelayedexpansion

set "vscode_path=%USERPROFILE%\.vscode\extensions"
set "source_folder=sigma-syntax-support"
set "current_path=%~dp0"
set "folder_path=%vscode_path%\%source_folder%"

if exist "%vscode_path%" (
    if exist "%source_folder%" (
        if exist "%folder_path%" (
            RD /S /Q "%folder_path%"
        )

        xcopy /E /I /Y "%source_folder%" "%folder_path%" 
        start cmd.exe /c "taskkill /IM Code.exe /F & timeout /t 0 /nobreak >nul & code ""%current_path%"" & exit"
    )
) else (
    echo visual studio code not found
)

exit