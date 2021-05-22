@echo off
:init
    title 初始化
    echo "     ___    _                           ____  ____      "
    echo "    /   |  (_)___  ______________ _____/ /  |/  (_)  __ "
    echo "   / /| | / / __ \/ ___/ ___/ __ `/ __  / /|_/ / / |/_/ "
    echo "  / ___ |/ / / / / /__/ /  / /_/ / /_/ / /  / / />  <   "
    echo " /_/  |_/_/_/ /_/\___/_/   \__,_/\__,_/_/  /_/_/_/|_|   "
    echo.
        if exist tmp rd /s /q tmp
    set /p r=设置版本: 
        if not exist release\%r% md release\%r%
    echo 目前已有音效 style_lazer_old(1) , style_lazer(2)
        choice /c 12 /m 设置默认音效: /n
            if errorlevel 2 set sfx=style_lazer && goto run
            if errorlevel 1 set sfx=style_lazer_old && goto run
:run
    set ap=8
    echo ------------------------------------
    set part=core
        cd %~dp0\%part%
        title 打包%part%中...（1/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip *.png *.jpg *.ini
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=animation
        cd %~dp0\%part%
        title 打包%part%中...（2/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip *.png *.jpg
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=sfx
        cd %~dp0\%part%
        title 打包%part%中...（3/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip *
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=patch
        cd %~dp0\%part%
        title 打包%part%中...（4/%ap%）
            copy /y patch_play\osu!gameplay.dll .
            copy /y patch_ui\osu!ui.dll .
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip osu!gameplay.dll osu!ui.dll
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
            del *.dll
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=extra
        cd %~dp0\%part%
        title 打包%part%中...（5/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip *
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=optimize
        cd %~dp0\%part%
        title 打包%part%中...（6/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%part%-%r%.zip *
        title 移动至发行文件夹...
            move AincradMix-* ..\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=皮肤安装包
        title 打包%part%中...（7/%ap%）
            mkdir %~dp0\tmp
        cd %~dp0\core
            copy * %~dp0\tmp
        cd %~dp0\animation
            copy /y * %~dp0\tmp
        cd %~dp0\sfx\%sfx%
            copy * %~dp0\tmp
        cd %~dp0\tmp
            %~dp0\bin\sed -i "2s/AincradMix/AincradMix-%r%/" skin.ini
                del sed??????
            %~dp0\bin\7za.exe a -tzip -y AincradMix-%r%.osk *
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 删除临时文件
            cd %~dp0
            rd /s /q tmp
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
    set part=源文件
        cd project
        title 打包%part%中...（8/%ap%）
            %~dp0\bin\7za.exe a -tzip -y AincradMix-source-%r%.zip *
        title 移动至发行文件夹...
            move AincradMix-* %~dp0\release\%r%
        title 成功
            echo ------------------
            echo %part%已打包完成
            echo ------------------
            echo.
            echo ------------------------------------
            echo.
:end
    pause
    cd %~dp0
        explorer release\%r%
