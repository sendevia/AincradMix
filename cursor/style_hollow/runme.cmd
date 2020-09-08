@echo off
if not exist color_blue md color_blue
    move /y cursormiddle_0.png color_blue\cursormiddle.png
    move /y cursormiddle@2x_0.png color_blue\cursormiddle@2x.png
if not exist color_green md color_green
    move /y cursormiddle_1.png color_green\cursormiddle.png
    move /y cursormiddle@2x_1.png color_green\cursormiddle@2x.png
if not exist color_orange md color_orange
    move /y cursormiddle_2.png color_orange\cursormiddle.png
    move /y cursormiddle@2x_2.png color_orange\cursormiddle@2x.png
if not exist color_pink md color_pink
    move /y cursormiddle_3.png color_pink\cursormiddle.png
    move /y cursormiddle@2x_3.png color_pink\cursormiddle@2x.png
if not exist color_red md color_red
    move /y cursormiddle_4.png color_red\cursormiddle.png
    move /y cursormiddle@2x_4.png color_red\cursormiddle@2x.png
if not exist color_white md color_white
    move /y cursormiddle_5.png color_white\cursormiddle.png
    move /y cursormiddle@2x_5.png color_white\cursormiddle@2x.png
cls
echo Íê³É
echo. 
pause
