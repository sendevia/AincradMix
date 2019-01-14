@echo off
mode 120,35
set workdir=%~dp0

:installedcheck
title R_Sp[osu!] - 安装检查
color 0F

:information
cls
mode 120,13
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               已安装的皮肤               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist information.rsp ( set "file=%workdir%information.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 已安装：R_Sp[osu!]
echo 类型：%PackName%
echo 皮肤语言：%PackLanguage%
echo 版本：%Version%
echo 发布状态：%Status%
echo.
echo.
choice /c nb /m "下一项(n) 返回测试(b)"
if errorlevel 2 goto test
if errorlevel 1 goto sfx
pause

:sfx
cls
mode 120,9
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               已安装的音效               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist sfx.rsp ( set "file=%workdir%sfx.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 音效主题：%SFXStyle%
echo.
echo.
choice /c pnb /m "上一项(p) 下一项(n) 返回测试(b)"
if errorlevel 3 goto test
if errorlevel 2 goto animation
if errorlevel 1 goto information
pause

:animation
cls
mode 120,10
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               已安装的动画               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist animation.rsp ( set "file=%workdir%animation.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 动画帧率：%AnimantionFrame% Fps
echo 动画语言：%AnimantionLanguage%
echo.
echo.
choice /c pnb /m "上一项(p) 下一项(n) 返回测试(b)"
if errorlevel 3 goto test
if errorlevel 2 goto cursor
if errorlevel 1 goto sfx
pause

:cursor
cls
mode 120,10
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo                                       /               已安装的光标               /                                      
echo ------------------------------------------------------------------------------------------------------------------------
echo.
if exist cursor.rsp ( set "file=%workdir%cursor.rsp" ) else ( goto error1 )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 光标类型：%CursorStyle%
echo 光标颜色：%CursorColor%
echo.
echo.
choice /c pnb /m "上一项(p) 继续(n) 返回测试(b)"
if errorlevel 3 goto test
if errorlevel 2 goto workdir
if errorlevel 1 goto animation
pause

:workdir
mode 120,13
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
echo 接下来的一切操作都将在这个文件夹内进行，请确认
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
echo Version: 20190111
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
pause & goto basiclanguageselection

:basiclanguageselection
mode 120,10
title R_Sp[osu!] - 基础语言选择
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择基础语言               /                                     
echo.
echo                                         (c) - 汉语                    英语 - (e)                                        
echo                                         (j) - 日语                    俄语 - (r)                                        
echo.
choice /c cejr /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4 mode 120,2 & echo 正在复制文件 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_ru]\* %workdir%
if errorlevel 3	mode 120,2 & echo 正在复制文件 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_jp]\* %workdir%
if errorlevel 2 mode 120,2 & echo 正在复制文件 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_en]\* %workdir%
if errorlevel 1 mode 120,2 & echo 正在复制文件 & xcopy /y /q %workdir%Pack_[base]\Pack_[base_cn]\* %workdir%
echo.
echo.
goto animationframeselection

:animationframeselection
mode 120,10
title R_Sp[osu!] - 动画帧率选择
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                        /               请选择帧率               /                                       
echo.
echo                                         (1) - 1 FPS                 15 FPS - (2)                                        
echo                                         (3) - 30 FPS                60 FPS - (4)                                        
echo.
choice /c 1234 /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4	cd %workdir%Pack_[animation]\Frame_[60]
if errorlevel 3	cd %workdir%Pack_[animation]\Frame_[30]
if errorlevel 2 cd %workdir%Pack_[animation]\Frame_[15]
if errorlevel 1 cd %workdir%Pack_[animation]\Frame_[15]
echo.
echo.
goto animationlanguageselection

:animationlanguageselection
mode 120,10
title R_Sp[osu!] - 动画语言选择
color 0E
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                      /               请选择动画语言               /                                     
echo.
echo                                         (c) - 汉语                    英语 - (e)                                        
echo                                         (j) - 日语                    俄语 - (r)                                        
echo.
choice /c cejr /m "------------------------------------------------------------------------------------------------------------"
if errorlevel 4 cd Pack_[animation_*_ru] & mode 120,2 & echo 正在复制文件 & xcopy /y /q .\* %workdir%
if errorlevel 3	cd Pack_[animation_*_jp] & mode 120,2 & echo 正在复制文件 & xcopy /y /q .\* %workdir%
if errorlevel 2 cd Pack_[animation_*_en] & mode 120,2 & echo 正在复制文件 & xcopy /y /q .\* %workdir%
if errorlevel 1 cd Pack_[animation_*_cn] & mode 120,2 & echo 正在复制文件 & xcopy /y /q .\* %workdir%
echo.
echo.
pause & goto successfulinstallation

:successfulinstallation
mode 120,10
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
echo.
pause
cls
echo.
echo ------------------------------------------------------------------------------------------------------------------------
echo.
echo                                /               你已经成功安装了R_Sp[osu!]               /                               
echo.
echo                                          是否将 R_Sp[osu!] 设置为你的osu!皮肤                                           
echo.
choice /c yn /m "----------------------------------------------------------------------------------------------------------------"
if errorlevel 2 exit
if errorlevel 1 cd %workdir% && cd .. && cd .. && %workdir%sed -i "112c Skin = R_Sp[osu!]" osu!.*.cfg
pause & exit

:choice1
mode 120,10
title R_Sp[osu!] - 选择进入
color 0E
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
if errorlevel 2 echo yes
if errorlevel 1 echo no
echo.
echo.
pause

:error1
mode 120,12
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
echo.
pause & exit

:exit
mode 120,10
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
echo.
pause & exit
