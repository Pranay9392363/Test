@echo off
setlocal

echo ========================================
echo   Building Streamlit EXE
echo ========================================

echo.
echo Installing dependencies...
python -m pip install -r requirements.txt

echo.
echo Cleaning previous build...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist MyStreamlitApp.spec del /q MyStreamlitApp.spec

echo.
echo Building EXE...

pyinstaller ^
    --onefile ^
    --noconsole ^
    --name MyStreamlitApp ^
    --add-data "app.py;." ^
    --collect-all streamlit ^
    --collect-all plotly ^
    --collect-all openai ^
    --collect-all pandas ^
    --collect-all numpy ^
    launcher.py

echo.
echo ========================================
echo   BUILD COMPLETED
echo ========================================
echo.
echo Your EXE is:
echo.
echo     dist\MyStreamlitApp.exe
echo.
echo ========================================

pause
