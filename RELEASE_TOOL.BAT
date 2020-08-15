@echo off
rem 菜鸡脚本
set release_version=
set /p release_version=版本: 
if not exist release\%release_version% md release\%release_version%
set part=core
    cd %part%
    title 生成%part%中（1/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *.png *.jpg *.ini
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 完成%part%
        cd ..
        echo --------------------
set part=animation
    cd %part%
    title 生成%part%中（2/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *.png *.jpg
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 完成%part%
        cd ..
        echo --------------------
set part=sfx
    cd %part%
    title 生成%part%中（3/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 完成%part%
        cd ..
        echo --------------------
set part=patch
    cd %part%
    title 生成%part%中（4/7）
        copy /y patch_play\osu!gameplay.dll .
        copy /y patch_ui\osu!ui.dll .
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip osu!gameplay.dll osu!ui.dll
    title 操作中
        move AincradMix_* ..\release\%release_version%
        del *.dll
    title 完成%part%
        cd ..
        echo --------------------
set part=cursor
    cd %part%
    title 生成%part%中（5/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 完成%part%
        cd ..
        echo --------------------
set part=optimize
    cd %part%
    title 生成%part%中（6/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 完成%part%
        cd ..
        echo --------------------
set part=source
    cd project
    title 整理源文件中（7/7）
        ..\bin\7za.exe a -y AincradMix_%part%_%release_version%.zip *
    title 操作中
        move AincradMix_* ..\release\%release_version%
    title 全部完成
        cd ..
        echo --------------------
pause