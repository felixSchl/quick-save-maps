@ECHO OFF

REM GO TO ROOT
REM ---------------------------------------------------------------------------- 
CD /D ".."
FOR /F %%i IN ('CHDIR') DO SET CWD=%%i

REM SET GLOBALS
REM ---------------------------------------------------------------------------- 
SET "DEST=QSM-REV-%1"
SET "XMNGR=%2"
SET "ZIP7=%3"
SET "MXI=%CWD%\QuickSaveMaps.mxi"
SET "MXP=%CWD%\QuickSaveMaps.mxp"

REM CREATE MXP
REM ---------------------------------------------------------------------------- 
echo %MXI%

REM For some reasons -suppress causes the command not to work...
REM %XMNGR% -suppress -package mxi=%MXI% mxp=%MXP%
%XMNGR% -package mxi=%MXI% mxp=%MXP%

REM DELETE DIR
REM ---------------------------------------------------------------------------- 
rmdir %DEST% /S /Q
mkdir %DEST%

REM COPY FILES
REM ---------------------------------------------------------------------------- 
xcopy "README.md"         %DEST% /Y
xcopy "QuickSaveMaps.atn" %DEST% /Y
xcopy "QuickSaveMaps.mxp" %DEST% /Y

REM REMOVE MXP FILE
REM ---------------------------------------------------------------------------- 
RM QuickSaveMaps.mxp

REM ZIP THE FOLDER UP
REM ---------------------------------------------------------------------------- 
RM %DEST%.zip
%ZIP7% a -Y %DEST%.zip %DEST%

REM REMOVE DEST DIR
REM ---------------------------------------------------------------------------- 
RMDIR %DEST% /S /Q
