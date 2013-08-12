@ECHO OFF

:://////////////////////////////////
::
:: Quick Save Maps packaging tool
:: ==============================
::
:: This script assembles QuickSaveMaps for distribution.
:: For your own distribution, adjust the variables 
:: "XMNGR" and "ZIP7" below.
::
:://///////////////////////////////
REM GO TO ROOT
CD /D ".."

REM SET GLOBALS
SET "DEST=QSM-REV-%1"
SET "XMNGR=%2"
SET "ZIP7=%3"
SET FLAGS=/Y

REM CREATE MXP
%XMNGR% -suppress -package mxi=QuickSaveMaps.mxi mxp=QuickSaveMaps.mxp

REM DELETE DIR
rmdir %DEST% /S /Q
mkdir %DEST%

REM COPY FILES
xcopy "README.txt" %DEST% %FLAGS%
xcopy "QuickSaveMaps.atn" %DEST% %FLAGS%
xcopy "quickSaveMaps.mxp" %DEST% %FLAGS%

REM REMOVE MXP FILE
rm QuickSaveMaps.mxp

REM ZIP THE FOLDER UP
rm %DEST%.zip
%ZIP7% a -Y %DEST%.zip %DEST%

REM REMOVE DEST DIR
rmdir %DEST% /S /Q
