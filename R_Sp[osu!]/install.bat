@echo off
set workdir=%~dp0

:installedcheck
title R_Sp[osu!] - 安装检查
color 0F

:information
cls
mode 120,13
if exist information.rsp ( set "file=%workdir%information.rsp" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               安装信息               /                                        
echo.
echo 已安装：R_Sp[osu!]
echo 类型：%PackName%
echo 皮肤语言：%PackLanguage%
echo 版本：%Version%
echo 发布状态：%Status%
echo.
choice /c ns /m "---------------------------------------------------------------------------------------------- 下一项(N) 跳过(S)"
if errorlevel 2 goto installation
if errorlevel 1 goto sfx
pause

:sfx
cls
mode 120,9
if exist sfx.rsp ( set "file=%workdir%sfx.rsp" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               已安装的音效               /                                      
echo.
echo 音效主题：%SFXStyle%
echo.
choice /c pns /m "---------------------------------------------------------------------------------- 上一项(P) 下一项(N) 跳过(S)"
if errorlevel 3 goto installation
if errorlevel 2 goto animation
if errorlevel 1 goto information
pause

:animation
cls
mode 120,10
if exist animation.rsp ( set "file=%workdir%animation.rsp" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               已安装的动画               /                                      
echo.
echo 动画帧率：%AnimantionFrame% Fps
echo 动画语言：%AnimantionLanguage%
echo.
choice /c pnb /m "---------------------------------------------------------------------------------- 上一项(P) 下一项(N) 跳过(S)"
if errorlevel 3 goto installation
if errorlevel 2 goto cursor
if errorlevel 1 goto sfx
pause

:cursor
cls
mode 120,10
if exist cursor.rsp ( set "file=%workdir%cursor.rsp" ) else ( goto filesmissing )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                       /               已安装的光标               /                                      
echo.
echo 光标类型：%CursorStyle%
echo 光标颜色：%CursorColor%
echo.
choice /c pn /m "---------------------------------------------------------------------------------------------- 上一项(P) 继续(N)"
if errorlevel 2 goto installation
if errorlevel 1 goto animation
pause

:installation
mode 120,9
title R_Sp[osu!] - 初始化
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               是否删除已安装的皮肤（推荐删除，注意备份）               /                       
echo.
echo                                           [Y] - 是                    否 - [N]                                          
echo.
choice /c ynb /m "------------------------------------------------------------------------------------------------------ 返回(B)"
if errorlevel 3 goto installedcheck
if errorlevel 2 goto basiclanguageselection
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               是否删除已安装的皮肤（推荐删除，注意备份）               /                       
echo.
echo                                                         正在删除                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
cd %workdir% & erase %workdir%*.png + *.jpg + *.rsp + *.ini + *.wav + *.mp3
) & goto createrspfiles

:createrspfiles
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               正在初始化               /                                       
echo.
echo                                                       创建描述文件                                                      
echo.
echo ------------------------------------------------------------------------------------------------------------------------
(
echo PackName: none
echo PackLanguage: none
echo Version: 20190124
echo Status: testing
) >> information.rsp
(
echo AnimantionLanguage: none
echo AnimantionFrame: -
) >> animation.rsp
(
echo SFXStyle: none
echo SFX: none
) >> sfx.rsp
(
echo CursorStyle: none
echo CursorColor: none
) >> cursor.rsp
goto basiclanguageselection

:basiclanguageselection
mode 120,9
title R_Sp[osu!] - 语言选择
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               请选择语言               /                                       
echo.
echo                                         [C] - 汉语                    英语 - [E]                                        
echo.
choice /c ceb /m "------------------------------------------------------------------------------------------------------ 返回(B)"
if errorlevel 3 goto installation
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在复制               /                                        
echo.
echo                                                     已完成   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & title R_Sp[osu!] - 正在复制 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_en]\* %workdir% && set language=en && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               正在复制               /                                        
echo                                                     已完成   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title R_Sp[osu!] - 复制完成 & timeout /t 5
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在复制               /                                        
echo.
echo                                                     已完成   - 0/1 -                                                    
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & title R_Sp[osu!] - 正在复制 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_cn]\* %workdir% && set language=cn && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               正在复制               /                                        
echo                                                     已完成   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title R_Sp[osu!] - 复制完成 & timeout /t 5
goto sfxselection

:sfxselection
mode 120,9
title R_Sp[osu!] - 音效主题选择%language%
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择音效主题               /                                     
echo.
echo                                       (L) - lazer                   SwordMIX - (R)                                      
echo.
choice /c lrsb /m "-------------------------------------------------------------------------------------------- 返回(B) 跳过(S)"
if errorlevel 4 goto basiclanguageselection
if errorlevel 3 goto animationframeselection
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在复制               /                                        
echo.
echo                                                        已完成 0/1                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[SwordMIX]\* %workdir% && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               正在复制               /                                        
echo                                                     已完成   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title R_Sp[osu!] - 复制完成 & timeout /t 5
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在复制               /                                        
echo.
echo                                                        已完成 0/1                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[lazer]\* %workdir% && color 0B & mode 120,11 & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                         /               正在复制               /                                        
echo                                                     已完成   - 1/1 -                                                    
echo ------------------------------------------------------------------------------------------------------------------------ ) & title R_Sp[osu!] - 复制完成 & timeout /t 5
goto animationframeselection
xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%] %workdir% && xcopy /y /q %workdir%Pack_[animation]\Frame_[%framerate%]\Pack_[animation_%framerate%_%language%]
:animationframeselection
mode 120,10
title R_Sp[osu!] - 动画帧率选择
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择动画帧率               /                                     
echo.
echo                                         [1] - 1 FPS                 15 FPS - [2]                                        
echo                                         [3] - 30 FPS                60 FPS - [4]                                        
echo.
choice /c 1234 /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4	cls & title R_Sp[osu!] - 正在操作 & mode 120,9 & set framerate=60 && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------ ) & (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 60" %workdir%skin.ini ) &&
(
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 60" %workdir%skin.ini
) &&
(
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 60" %workdir%animation.rsp
)
if errorlevel 3	cd %workdir%Pack_[animation]\Frame_[30] && (
cls
title R_Sp[osu!] - 正在操作
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
set framerate=30 ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 30" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 30" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 30" %workdir%animation.rsp )
if errorlevel 2 cd %workdir%Pack_[animation]\Frame_[15] && (
cls
title R_Sp[osu!] - 正在操作
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 1/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
set framerate=15 ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 2/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "5c AnimationFramerate: 15" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 3/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "16c SliderBallFrames: 15" %workdir%skin.ini ) && (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                         /               正在操作               /                                        
echo.
echo                                                        已完成 4/4                                                       
echo.
echo ------------------------------------------------------------------------------------------------------------------------
%workdir%sed -i "2c AnimantionFrame: 15" %workdir%animation.rsp )
if errorlevel 1 set framerate=1 && goto optimizedchoice
goto optimizedchoice

:successfulinstallation
mode 120,9
title R_Sp[osu!] - 安装完成
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                /               你已经成功安装了R_Sp[osu!]               /                               
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause

:settoyourself
mode 120,9
title R_Sp[osu!] - 安装完成
color 0B
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               你已经成功安装了R_Sp[osu!]               /                               
echo.
echo                                          是否将 R_Sp[osu!] 设置为你的osu!皮肤                                           
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto exit
if errorlevel 1 cd %workdir% && cd .. && cd .. && ( %workdir%sed -i "112c Skin = R_Sp[osu!]" osu!.*.cfg ) && (
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               你已经成功安装了R_Sp[osu!]               /                               
echo.
echo                                                        设置完成                                                         
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo. )
pause & exit

:optimizedchoice
mode 120,9
title R_Sp[osu!] - 单模式优化
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                    /               是否进行单模式优化               /                                   
echo.
echo                                                   是(Y)    --    否(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto successfulinstallation
if errorlevel 1 echo yes
pause

:customsettingschoice
mode 120,9
title R_Sp[osu!] - 单模式优化
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                    /               是否进行自定义设置               /                                   
echo.
echo                                                   是(Y)    --    否(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 goto successfulinstallation
if errorlevel 1 echo yes
pause

:filesmissing
mode 120,11
title R_Sp[osu!] - 错误
color 0C
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                       /               描述文件缺失               /                                      
echo.
echo                                                  请检查文件目录是否完整                                                 
echo. 
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause & exit

:exit
mode 120,9
title R_Sp[osu!] - 退出
color 0C
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                         /               结束会话               /                                        
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
pause & exit

:skinconfiguration
echo [General]
echo Name: R_Sp[osu!]
echo Author: Sendevia
echo Version: latest
echo AnimationFramerate: %framerate%
echo AllowSliderBallTint: %allowsliderballtint%
::↑default=0
echo ComboBurstRandom: %comboburstrandom%
::↑default=0
echo CursorExpand: %cursorexpand%
::↑default=1
echo CursorCentre: %cursorcentre%
::↑default=1
echo CursorRotate: %cursorrotate%
::↑default=0
echo CursorTrailRotate: %cursortrailrotate%
::↑default=0
echo CustomComboBurstSounds: 100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000
echo HitCircleOverlayAboveNumber: %hitcircleoverlayabovenumber%
::↑default=0
echo LayeredHitSounds: 1
echo SliderBallFlip: %sliderballflip%
::↑default=1
echo SliderBallFrames: %framerate%
echo SliderStyle: %sliderstyle%
::↑default=2
echo SpinnerFadePlayfield: %spinnerfadeplayfield%
::↑default=0
echo SpinnerFrequencyModulate: %spinnerfrequencymodulate%
::↑default=1
echo SpinnerNoBlink: %spinnernoblink%
::↑default=1
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