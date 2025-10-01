@echo off
setlocal enabledelayedexpansion

echo Scanning static/ for unused files...

for /R static %%F in (*) do (
    set "filename=%%~nxF"
    findstr /S /I /C:"!filename!" content\*.md layouts\*.html >nul
    if errorlevel 1 (
        echo Unused: %%F
        del "%%F"
    )
)

echo Cleanup complete.