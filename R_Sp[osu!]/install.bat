@echo off
title R_Sp[osu!]安装脚本 - 安装检测
color 0F
set workdir=%~dp0
:information
echo ----------------------------------------
echo           正在检查已安装的皮肤          
echo ----------------------------------------
echo.
if exist information.rsp ( set "file=information.rsp" ) else ( echo 未找到描述文件 & goto checkerror )
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

:sfx
echo ----------------------------------------
echo         正在检查已安装的皮肤音效        
echo ----------------------------------------
echo.
if exist sfx.rsp ( set "file=sfx.rsp" ) else ( echo 未找到描述文件 & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 音效主题：%SFXStyle%
echo.
echo.

:animation
echo ----------------------------------------
echo         正在检查已安装的皮肤动画        
echo ----------------------------------------
echo.
if exist animation.rsp ( set "file=animation.rsp" ) else ( echo 未找到描述文件 & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 动画帧率：%AnimantionFrame% Fps
echo 动画语言：%AnimantionLanguage%
echo.
echo.

:cursor
echo ----------------------------------------
echo         正在检查已安装的皮肤光标        
echo ----------------------------------------
echo.
if exist cursor.rsp ( set "file=cursor.rsp" ) else ( echo 未找到描述文件 & goto checkerror )
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do ( set /a m+=1 & if %%m LSS %%n set "%%a=%%b" )
echo 光标类型：%CursorStyle%
echo 光标颜色：%CursorColor%
echo.
echo.
pause & goto choice

:choice
title R_Sp[osu!]安装脚本 - 选择进入
color 0E
cls
echo ----------------------------------------
echo.
echo.
echo               是否进入测试              
echo.
echo.
echo ----------------------------------------
choice /c yn
if errorlevel 2 goto exit
if errorlevel 1 goto test

:test
title R_Sp[osu!]安装脚本 - 测试
color 0F
cls
echo ----------------------------------------
echo.
echo.
echo 当前的工作目录：
echo %workdir%
echo.
echo.
echo ----------------------------------------
pause

:dirchoice
title R_Sp[osu!]安装脚本 - 目录选择
color 0E
cls
echo ----------------------------------------
echo.
echo.
echo 目录：
echo base(1) animation(2) cursors(3) sfx(4)
echo.
echo.
echo 命令：
echo 返回(5) 退出(6)
echo.
echo.
echo ----------------------------------------
choice /c 123456
if errorlevel 6 goto exit
if errorlevel 5 goto test
if errorlevel 4 cd Pack_[sfx] &cls & dir & cd %workdir% & color 0F
if errorlevel 3 cd Pack_[cursors] &cls & dir & cd %workdir% & color 0F
if errorlevel 2 cd Pack_[animation] &cls & dir & cd %workdir% & color 0F
if errorlevel 1 cd Pack_[base] &cls & dir & cd %workdir% & color 0F
echo.
echo.
pause & goto dirchoice

:checkerror
title R_Sp[osu!]安装脚本 - 错误
color 0C
cls
echo ----------------------------------------
echo.
echo.
echo               描述文件缺失              
echo                    --                   
echo          请检查文件目录是否完整         
echo               errorcode: 1              
echo. 
echo.
echo ----------------------------------------
pause & exit

:exit
title R_Sp[osu!]安装脚本 - 退出
color 0C
cls
echo ----------------------------------------
echo.
echo.
echo                 结束会话                
echo.
echo.
echo ----------------------------------------
pause & exit
