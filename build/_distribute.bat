@ECHO OFF

REM GO TO ROOT
REM ---------------------------------------------------------------------------- 
CD /D ".."
FOR /F %%i IN ('CHDIR') DO SET CWD=%%i

REM SET GLOBALS
REM ---------------------------------------------------------------------------- 
ECHO "Set Globals"
SET "DEST=%CWD%\QSM-REV-%1"
SET "XMNGR=%2"
SET "ZIP7=%3"
SET "MXI=%CWD%\QuickSaveMaps.mxi"
SET "ZXP=%CWD%\QuickSaveMaps.zxp"

REM CREATE ZXP
REM ---------------------------------------------------------------------------- 
ECHO "Create ZXP"
%XMNGR% -suppress -package mxi=%MXI% zxp=%ZXP%

REM DELETE DIR
REM ---------------------------------------------------------------------------- 
ECHO "Delete dir"
RMDIR %DEST% /S /Q
ECHO "Make dir"
MKDIR %DEST%

REM COPY FILES
REM ---------------------------------------------------------------------------- 
ECHO %DEST%
ECHO "Copy files"
XCOPY "README.md"         %DEST% /Y
XCOPY "QuickSaveMaps.atn" %DEST% /Y
XCOPY "QuickSaveMaps.zxp" %DEST% /Y

REM REMOVE ZXP FILE
REM ---------------------------------------------------------------------------- 
RM QuickSaveMaps.zxp

REM ZIP THE FOLDER UP
REM ---------------------------------------------------------------------------- 
RM %DEST%.zip
%ZIP7% a -Y %DEST%.zip %DEST%

REM REMOVE DEST DIR
REM ---------------------------------------------------------------------------- 
RMDIR %DEST% /S /Q
