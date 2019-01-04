@echo off
echo 正在检查已安装的皮肤类型...
echo.
set "file=information.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo 已安装的皮肤：R_Sp[osu!] (%PackName%)
echo 皮肤语言：%PackLanguage%
echo 版本：%Version%
echo 发布状态：%Status%
echo.
echo ----------------------------------------
echo.
echo 正在检查已安装的皮肤音效...
echo.
set "file=sfx.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo 音效主题：%SFXStyle%
echo.
echo ----------------------------------------
echo.
echo 正在检查已安装的皮肤动画...
echo.
set "file=animation.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo 动画帧率：%AnimantionFrame% Fps
echo 动画语言：%AnimantionLanguage%
echo.
echo ----------------------------------------
echo.
echo 正在检查已安装的皮肤光标...
echo.
set "file=cursor.rsp"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo 光标类型：%CursorStyle%
echo 光标颜色：%CursorColor%
echo.
echo.
echo.
pause