@echo off
chcp 65001 > nul
echo ========================================
echo KCAP Repacker v1.1 - Simple Version
echo ========================================
echo.

if "%~1"=="" (
    echo Usage: repack_simple.bat ^<folder^> [output.pak]
    echo.
    echo Examples:
    echo   repack_simple.bat extracted_en
    echo   repack_simple.bat extracted_en en.pak
    echo   repack_simple.bat C:\wa2\en_folder en.pak
    echo.
    pause
    exit /b 1
)

set "INPUT_FOLDER=%~1"

if not exist "%INPUT_FOLDER%" (
    echo ERROR: Folder not found: %INPUT_FOLDER%
    pause
    exit /b 1
)

REM Set output name
if "%~2"=="" (
    REM No output specified, use folder name
    set "OUTPUT_PAK=%~dpn1.pak"
) else (
    REM Output specified
    if "%~d2"=="" (
        REM No drive/path specified, put in same dir as input folder
        set "OUTPUT_PAK=%~dp1%~2"
    ) else (
        REM Full path specified
        set "OUTPUT_PAK=%~2"
    )
)

echo Input:  %INPUT_FOLDER%
echo Output: %OUTPUT_PAK%
echo.

python "%~dp0kcap_repack_v1.1.py" "%INPUT_FOLDER%" "%OUTPUT_PAK%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Created: %OUTPUT_PAK%
    echo ========================================
) else (
    echo.
    echo ERROR! Failed to create PAK file.
)

echo.
pause
