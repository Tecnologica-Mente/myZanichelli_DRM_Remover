@setlocal DisableDelayedExpansion
@echo off


::========================================================================================================================
::
::   This script is a DRM Protection Removal and Downloader for myZanichelli Platform.
::   (It can be used to download books in PDF format from Booktab and Kitaboo Web Readers)
::
::   Homepage: https://github.com/Tecnologica-Mente
::      Email: <not available>
::
::   ******************************************************************************************************************
::
::   Born from an idea of ​​Enrico and Compa. Thanks to Francesco for providing me the access credentials to myZanichelli
::
::========================================================================================================================




::========================================================================================================================================
:MainMenu

cls
color 07
title  myZanichelli DRM Remover AIO v1.1.0
mode 100, 30
set "mzdrmrtemp=%SystemRoot%\Temp\__MZDRMR"
if exist "%mzdrmrtemp%\.*" rmdir /s /q "%mzdrmrtemp%\" %nul%

echo:
echo:
echo:             Welcome to myZanichelli DRM Remover AIO v1.1.0
echo:
echo:       ______________________________________________________________________________________
echo:
echo:             Please select:
echo:
echo:             [1] To install/upgrade all the required dependencies
echo:             [2] To remove the DRM protection and download your myZanichelli
echo:                 Kitaboo PDF eBooks
echo:             [3] To remove the DRM protection and download your myZanichelli
echo:                 Booktab PDF eBooks
echo:             __________________________________________________________________________
echo:                                                                     
echo:             [4] Read Me
echo:             [5] Exit
echo:       ______________________________________________________________________________________
echo:
echo:             Enter a menu option in the Keyboard [1,2,3,4,5]:
echo:
choice /C:12345 /N
set _erl=%errorlevel%

if %_erl%==5 exit /b
if %_erl%==4 start https://github.com/Tecnologica-Mente/myZanichelli_DRM_Remover & goto :MainMenu
if %_erl%==3 setlocal & call :DownloadPDF_booktab  & cls & endlocal & goto :MainMenu
if %_erl%==2 setlocal & call :DownloadPDF_kitaboo  & cls & endlocal & goto :MainMenu
if %_erl%==1 setlocal & call :IUDependencies       & cls & endlocal & goto :MainMenu
goto :MainMenu

::========================================================================================================================================
:IUDependencies
@setlocal DisableDelayedExpansion
@echo off

set mypath=%cd%
::@echo %mypath%

echo Stage 1 of 2. Installing/Updating Node's dependencies... Wait for it to finish...
if not exist "package.json" (
   echo Cannot find the package.json file. Operation aborted
   goto :End
)
if not exist "%mypath%\node_modules\npm\bin\npm-cli.js" (
   echo All the required dependencies has been already installed/updated
) else (
if exist "npm.cmd" (
   call npm i
   echo All the required dependencies has been installed/updated
) else (
   echo Cannot find the npm.cmd file. Make sure Node.js has been installed correctly
)
)
echo:
echo Stage 2 of 2. Installing/Updating Python's dependencies... Wait for it to finish...
if not exist "requirements.txt" (
   echo Cannot find the requirements.txt file. Operation aborted
   goto :End
)
if not exist "Console-Launcher.exe" (
   echo Cannot find the Console-Launcher.exe file. Operation aborted
   goto :End
)
if exist "%mypath%\App\Python\Scripts\pip.exe" (
   if not exist "%mypath%\App\Python\Scripts\normalizer.exe" (
      REM START /wait "" Console-Launcher.exe "pip install -r requirements.txt"
      echo|set/p="pip install -r requirements.txt"|clip
      START /wait "" Console-Launcher.exe
      echo All the required dependencies has been installed/updated
   ) else (
      echo All the required dependencies has been already installed/updated
   )
) else (
   echo Cannot find the pip.exe file. Make sure Portable Python has been installed correctly
)
)
:End
echo:
echo Press any key to continue...
pause >nul
popd
exit /b

::========================================================================================================================================
:DownloadPDF_kitaboo
@setlocal DisableDelayedExpansion
@echo off

:: Adapted from: https://stackhowto.com/batch-file-to-check-if-multiple-files-exist/
set mypath=%cd%
::@echo %mypath%
if exist "node.exe" if exist "download_kitaboo.js" call node download_kitaboo.js
if not exist "node.exe" echo Cannot find the node.exe file. Operation aborted
if not exist "download_kitaboo.js" echo Cannot find the download_kitaboo.js file. Operation aborted
echo:
echo Press any key to continue...
pause >nul
popd
exit /b

::========================================================================================================================================
:DownloadPDF_booktab
@setlocal DisableDelayedExpansion
@echo off

:: Adapted from: https://stackhowto.com/batch-file-to-check-if-multiple-files-exist/
set mypath=%cd%
::@echo %mypath%
if exist "Console-Launcher.exe" if exist "download_booktab.py" (
   REM The following line does not work with the Python Console
   REM START /wait "" Console-Launcher.exe "python download_booktab.py"
   REM copy some text to the clipboard
   echo Please right click on the Console-Launcher and press Enter to start download process
   echo|set/p="python download_booktab.py"|clip
   START /wait "" Console-Launcher.exe
)
if not exist "Console-Launcher.exe" echo Cannot find the Console-Launcher.exe file. Operation aborted
if not exist "download_booktab.py" echo Cannot find the download_booktab.py file. Operation aborted
echo:
echo Press any key to continue...
pause >nul
popd
exit /b

::========================================================================================================================================
