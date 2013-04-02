
@echo off

set MasmHome=%PROGRAMFILES(x86)%\Masm32
set FbcHome=%PROGRAMFILES(x86)%\FreeBasic 0.24.0

echo *** assembling ***
"%MasmHome%\Bin\ML.EXE" /c /coff /I"%MasmHome%\Include" "intsqrt.asm"       || goto ERR_Exit

echo *** compiling / linking ***
"%FbcHome%\fbc.exe" -v MixLang_Test.bas -a intsqrt.obj                      || goto ERR_Exit

erase *.obj



:OK_Exit
echo .
echo ------------------------
echo --- OK - Batch ready ---
echo ------------------------
pause
exit 0

:ERR_Exit
echo .
echo ********************************
echo *** ERROR - Batch terminated ***
echo ********************************
pause
exit 1