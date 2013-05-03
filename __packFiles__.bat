@ECHO OFF

:://////////////////////////////////
::
:: Quick Save Maps packaging tool
:: ==============================
::
:: This script assembles QuickSaveMaps for distribution.
:: For your own distribution, adjust the variables 
:: "XMNGR" and "WINRAR" below.
::
:://///////////////////////////////

REM SET GLOBALS
SET DEST=QSM-v0.6.4
SET FLAGS=/Y
SET XMNGR="C:\Program Files (x86)\Adobe\Adobe Extension Manager CS5\Adobe Extension Manager CS5.exe"
SET ZIP7="C:\Program Files\7-Zip\7z.exe"

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