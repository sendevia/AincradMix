@echo off
:Installed Packs Check
set "file=packinformation.ini"
set n=0
set m=0
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do set /a n+=1  
for /f "usebackq tokens=1* delims=: " %%a in ("%file%") do (
set /a m+=1
if  !m! LSS !n! set "%%a=%%b"
)
echo 你当前安装的包是：%PackName%
echo 颜色：%Color%
echo 帧率：%Frame% Fps
echo 语言：%Language%
echo 版本：%Release%
echo 发布状态：%Status%
pause