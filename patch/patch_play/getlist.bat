@echo off
setlocal enabledelayedexpansion
echo 请稍候...
echo.
if exist res\achoo (
    for /f %%l in ( ignorelist ) do ( move res\%%l res_ignore )
) else (
    echo 无需进行移动操作
    echo.
    )
if exist res (
    title 生成中
    if exist reslist (
        del /q reslist && goto gen
    ) else (
        goto gen
    )
) else (
    title 失败
    md res && md res_ignore
    echo 资源文件夹不存在
    echo 你需要使用 dnSpy 来获取原版的资源文件
    echo 并将获取到的资源文件放入 res 文件夹内
    echo 然后再运行本脚本
    echo.
    pause && exit
)
:gen
dir res /b /n >> reslist
dir res_ignore /b /n >> ignorelist
title 成功
echo 完成，生成的文件是：reslist 和 ignorelist
echo.
pause
