@echo off
chcp 65001 > nul
echo ========================================
echo KCAP Repacker v1.1 for White Album 2
echo [FIXED] Shift-JIS encoding for fonts!
echo ========================================
echo.

if "%~1"=="" (
    echo ERROR: Drag and drop a folder onto this batch file!
    echo.
    echo Usage:
    echo   1. Drag the extracted folder onto this .bat file
    echo   2. Enter the output filename when prompted
    echo.
    pause
    exit /b 1
)

set "INPUT_FOLDER=%~1"

echo Input folder: %INPUT_FOLDER%
echo.

if not exist "%INPUT_FOLDER%" (
    echo ERROR: Folder not found: %INPUT_FOLDER%
    pause
    exit /b 1
)

REM Ask for output filename
echo Enter output PAK filename (without path):
echo Example: en.pak, script.pak, cg.pak
echo.
set /p "OUTPUT_NAME=Output filename: "

REM If empty, use folder name
if "%OUTPUT_NAME%"=="" (
    set "OUTPUT_PAK=%~dpn1.pak"
    echo No name entered, using: %~n1.pak
) else (
    REM Remove .pak if user typed it
    set "OUTPUT_NAME=%OUTPUT_NAME:.pak=%"
    set "OUTPUT_PAK=%~dp1%OUTPUT_NAME%.pak"
)

echo.
echo ----------------------------------------
echo Input:  %INPUT_FOLDER%
echo Output: %OUTPUT_PAK%
echo ----------------------------------------
echo.

REM Confirm
choice /C YN /M "Continue with repack"
if errorlevel 2 (
    echo Cancelled.
    pause
    exit /b 0
)

echo.
echo Repacking with Shift-JIS encoding...
echo (Japanese font files will be encoded correctly)
echo.

python "%~dp0kcap_repack_v1.1.py" "%INPUT_FOLDER%" "%OUTPUT_PAK%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! PAK file created.
    echo ========================================
    echo.
    echo Output: %OUTPUT_PAK%
    echo.
    echo Next steps:
    echo   1. Backup your original .pak file
    echo   2. Replace it with: %OUTPUT_PAK%
    echo   3. Test in game
    echo.
) else (
    echo.
    echo ========================================
    echo ERROR! Failed to create PAK file.
    echo ========================================
    echo.
)

pause
