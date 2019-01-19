@echo off
mode 120,35
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

:workdir
mode 120,12
title R_Sp[osu!] - 工作目录
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                      /               当前的工作目录               /                                     
echo.
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo %workdir%
echo.
echo.
pause & goto installation

:installation
mode 120,9
title R_Sp[osu!] - 正在初始化
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                        /               是否删除已安装的皮肤（推荐删除，注意备份）               /                       
echo.
echo                                                   是(Y)    --    否(N)                                                  
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
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
echo PackName: base
echo PackLanguage: unknown
echo Version: 20190119
echo Status: testing
) >> information.rsp
(
echo AnimantionLanguage: unknown
echo AnimantionFrame: 0
) >> animation.rsp
(
echo SFXStyle: unknown
echo SFX: unknown
) >> sfx.rsp
(
echo CursorStyle: unknown
echo CursorColor: unknown
) >> cursor.rsp
goto basiclanguageselection

:basiclanguageselection
mode 120,9
title R_Sp[osu!] - 基础语言选择
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择基础语言               /                                     
echo.
echo                                         (C) - 汉语                    英语 - (E)                                        
echo.
choice /c ce /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择基础语言               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[base]\Pack_[base_en]\* %workdir%
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择基础语言               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[base]\Pack_[base_cn]\* %workdir%
goto sfxselection

:sfxselection
mode 120,9
title R_Sp[osu!] - 音效主题选择
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择音效主题               /                                     
echo.
echo                                       (L) - lazer                   r_sp_osu - (R)                                      
echo.
choice /c lrs /m "------------------------------------------------------------------------------------------------------ 跳过(S)"
if errorlevel 3 goto animationframeselection
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择音效主题               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[rsposu]\* %workdir%
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择音效主题               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & xcopy /y /q %workdir%Pack_[sfx]\Style_[lazer]\* %workdir%
goto animationframeselection

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
echo                                         (1) - 1 FPS                 15 FPS - (2)                                        
echo                                         (3) - 30 FPS                60 FPS - (4)                                        
echo.
choice /c 1234 /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4	cd %workdir%Pack_[animation]\Frame_[60] && set framerate=60
if errorlevel 3	cd %workdir%Pack_[animation]\Frame_[30] && set framerate=30
if errorlevel 2 cd %workdir%Pack_[animation]\Frame_[15] && set framerate=15
if errorlevel 1 set framerate=1 && goto optimizedchoice
goto animationlanguageselection

:animationlanguageselection
mode 120,9
title R_Sp[osu!] - 动画语言选择
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择动画语言               /                                     
echo.
echo                                         (C) - 汉语                    英语 - (E)                                        
echo.
choice /c ce /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择动画语言               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & cd Pack_[animation_*_en] & xcopy /y /q .\* %workdir%
if errorlevel 1 (
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择动画语言               /                                     
echo.
echo                                                         正在复制                                                        
echo.
echo ------------------------------------------------------------------------------------------------------------------------
) & cd Pack_[animation_*_en] & xcopy /y /q .\* %workdir%
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
if errorlevel 2 goto skinconfiguration
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
mode 120,10
title R_Sp[osu!] - 单模式优化
color 0F
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo                                    /               是否进行单模式优化               /                                   
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
echo AllowSliderBallTint: 0
echo ComboBurstRandom: 0
echo CursorExpand: 1
echo CursorCentre: 1
echo CursorRotate: 0
echo CursorTrailRotate: 0
echo CustomComboBurstSounds: 100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000
echo HitCircleOverlayAboveNumber: 0
echo LayeredHitSounds: 1
echo SliderBallFlip: 1
echo SliderBallFrames: %framerate%
echo SliderStyle: 2
echo SpinnerFadePlayfield: 0
echo SpinnerFrequencyModulate: 1
echo SpinnerNoBlink: 1
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