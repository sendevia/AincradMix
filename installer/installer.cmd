@echo off
set workdir=%~dp0

:installedcheck
title AincradMix - Checking
color 0F
:: 
:information
cls
mode 120,13
if exist information.send ( set "file=%workdir%information.send" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ??????               /                                        
echo.
echo ??????AincradMix
echo ?????%PackName%
echo ????????%PackLanguage%
echo ?��??%Version%
echo ????????%Status%
echo.
choice /c ns /m "---------------------------------------------------------------------------------------------- ?????(N) ????(S)"
if errorlevel 2 goto installation
if errorlevel 1 goto sfx
pause

:sfx
cls
mode 120,9
if exist sfx.send ( set "file=%workdir%sfx.send" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               ????????��               /                                      
echo.
echo ??��????%SFXStyle%
echo.
choice /c pns /m "---------------------------------------------------------------------------------- ?????(P) ?????(N) ????(S)"
if errorlevel 3 goto installation
if errorlevel 2 goto animation
if errorlevel 1 goto information
pause
:animation
cls
mode 120,10
if exist animation.send ( set "file=%workdir%animation.send" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               ?????????               /                                      
echo.
echo ????????%AnimantionFrame% Fps
echo ?????????%AnimantionLanguage%
echo.
choice /c pnb /m "---------------------------------------------------------------------------------- ?????(P) ?????(N) ????(S)"
if errorlevel 3 goto installation
if errorlevel 2 goto cursor
if errorlevel 1 goto sfx
pause
:cursor
cls
mode 120,10
if exist cursor.send ( set "file=%workdir%cursor.send" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               ????????               /                                      
echo.
echo ????????%CursorStyle%
echo ????????%CursorColor%
echo.
choice /c pn /m "---------------------------------------------------------------------------------------------- ?????(P) ????(N)"
if errorlevel 2 goto installation
if errorlevel 1 goto animation

pause
:installation
mode 120,9
title AincradMix - ?????
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               ???????????????????????????????               /                       
echo.
echo                                           [Y] - ??                    ?? - [N]                                          
echo.
choice /c ynb /m "------------------------------------------------------------------------------------------------------ ????(B)"
if errorlevel 3 goto installedcheck
if errorlevel 2 goto basiclanguageselection
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               ???????????????????????????????               /                       
echo.
echo                                                         ???????                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
cd %workdir% & erase %workdir%*.png + *.jpg + *.send + *.ini + *.wav + *.mp3
) & goto createsendfiles
:createsendfiles
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               ????????               /                                       
echo.
echo                                                       ???????????                                                      
echo.
echo ------------------------------------------------------------------------------------------------------------------------
(
echo PackName: none
echo PackLanguage: none
echo Version: 20190124
echo Status: testing
) >> information.send
(
echo AnimantionLanguage: none
echo AnimantionFrame: -
) >> animation.send
(
echo SFXStyle: none
echo SFX: none
) >> sfx.send
(
echo CursorStyle: none
echo CursorColor: none
) >> cursor.send
goto basiclanguageselection
:basiclanguageselection
mode 120,9
title AincradMix - ???????
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               ?????????               /                                       
echo.
echo                                         [C] - ????                    ??? - [E]                                        
echo.
choice /c ceb /m "------------------------------------------------------------------------------------------------------ ????(B)"
if errorlevel 3 goto installation
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                     ?????   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & title AincradMix - ??????? & xcopy /y /q %workdir%Pack_[base]\Pack_[base_en]\* %workdir% && set language=en && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               ???????               /                                        
echo                                                     ?????   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title AincradMix - ??????? & timeout /t 5
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                     ?????   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & title AincradMix - ??????? & xcopy /y /q %workdir%Pack_[base]\Pack_[base_cn]\* %workdir% && set language=cn && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               ???????               /                                        
echo                                                     ?????   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title AincradMix - ??????? & timeout /t 5
goto sfxselection
:sfxselection
mode 120,9
title AincradMix - ??��???????%language%
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               ???????��????               /                                     
echo.
echo                                      [L] - lazer                   AincradMix - [R]                                     
echo.
choice /c lrsb /m "-------------------------------------------------------------------------------------------- ????(B) ????(S)"
if errorlevel 4 goto basiclanguageselection
if errorlevel 3 goto animationframeselection
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                     ?????   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[AincradMix]\* %workdir% && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               ???????               /                                        
echo                                                     ?????   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title AincradMix - ??????? & timeout /t 5
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                     ?????   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[lazer]\* %workdir% && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               ???????               /                                        
echo                                                     ?????   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title AincradMix - ??????? & timeout /t 5
goto animationframeselection
xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%] %workdir% && xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%]\Pack_[animation_%framerate%_%language%]
:animationframeselection
mode 120,10
title AincradMix - ??????????
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               ?????????               /                                     
echo.
echo                                         [1] - 1 FPS                 15 FPS - [2]                                        
echo                                         [3] - 30 FPS                60 FPS - [4]                                        
echo.
choice /c 1234 /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4	cls & title AincradMix - ??????? & mode 120,9 & set framerate=60 && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------ ) & ( xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%] %workdir% ) && ( xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%]\Pack_[animation_%framerate%_%language%] )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 60" %workdir%skin.ini ) &&
(
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 60" %workdir%skin.ini
) &&
(
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 60" %workdir%animation.send
)
if errorlevel 3	cd %workdir%Pack_[animation]\Frame_[30] && (
cls
title AincradMix - ???????
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
set framerate=30 ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 30" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 30" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 30" %workdir%animation.send )
if errorlevel 2 cd %workdir%Pack_[animation]\Frame_[15] && (
cls
title AincradMix - ???????
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
set framerate=15 ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 15" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 15" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               ???????               /                                        
echo.
echo                                                        ????? 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 15" %workdir%animation.send )
if errorlevel 1 set framerate=1 && goto optimizedchoice
goto optimizedchoice
:successfulinstallation
mode 120,9
title AincradMix - ??????
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                /               ?????????????AincradMix               /                               
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause
:settoyourself
mode 120,9
title AincradMix - ??????
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               ?????????????AincradMix               /                               
echo.
echo                                          ??? AincradMix ????????osu!???                                           
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto exit
if errorlevel 1 cd %workdir% && cd .. && cd .. && ( %workdir%sed -i "112c Skin = AincradMix" osu!.*.cfg ) && (
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               ?????????????AincradMix               /                               
echo.
echo                                                        ???????                                                         
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo. )
pause & exit

:optimizedchoice
mode 120,9
title AincradMix - ???????
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                    /               ?????��??????               /                                   
echo.
echo                                                   ??(Y)    --    ??(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto successfulinstallation
if errorlevel 1 echo yes
pause

:customsettingschoice
mode 120,9
title AincradMix - ???????
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                    /               ???????????????               /                                   
echo.
echo                                                   ??(Y)    --    ??(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto successfulinstallation
if errorlevel 1 echo yes
pause

:filesmissing
mode 120,11
title AincradMix - ????
color 8F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                       /               ?????????               /                                      
echo.
echo                                                  ????????????????                                                 
echo. 
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause & exit

:exit
mode 120,9
title AincradMix - ???
color 0C
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                         /               ??????               /                                        
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause & exit

:skinconfiguration
echo [General]
echo Name: AincradMix
echo Author: Sendevia
echo Version: latest
echo AnimationFramerate: %framerate%
echo AllowSliderBallTint: %allowsliderballtint%
::??default=0
echo ComboBurstRandom: %comboburstrandom%
::??default=0
echo CursorExpand: %cursorexpand%
::??default=1
echo CursorCentre: %cursorcentre%
::??default=1
echo CursorRotate: %cursorrotate%
::??default=0
echo CursorTrailRotate: %cursortrailrotate%
::??default=0
echo CustomComboBurstSounds: 100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000
echo HitCircleOverlayAboveNumber: %hitcircleoverlayabovenumber%
::??default=0
echo LayeredHitSounds: 1
echo SliderBallFlip: %sliderballflip%
::??default=1
echo SliderBallFrames: %framerate%
echo SliderStyle: %sliderstyle%
::??default=2
echo SpinnerFadePlayfield: %spinnerfadeplayfield%
::??default=0
echo SpinnerFrequencyModulate: %spinnerfrequencymodulate%
::??default=1
echo SpinnerNoBlink: %spinnernoblink%
::??default=1
echo.
echo [Colours]
echo Combo1: 9,173,220
echo InputOverlayText: 238,238,238
echo MenuGlow: 89,195,226
echo SliderBall: 238,238,238
echo SliderBorder: 3,80,102
echo SliderTrackOverride: 0,0,0
echo SongSelectActiveText: 238,238,238
echo SongSelectInactiveText: 238,238,238
echo SpinnerBackground: 113,113,113
echo StarBreakAdditive: 19,19,19
echo.
echo [Fonts]
echo HitCirclePrefix: circlenums
echo HitCircleOverlap: 0
echo ScorePrefix: defaultItalic
echo ScoreOverlap: 2
echo ComboPrefix: combo
echo ComboOverlap: 2
echo.
echo [CatchTheBeat]
echo HyperDashFruit: 255,198,0
echo.
pause