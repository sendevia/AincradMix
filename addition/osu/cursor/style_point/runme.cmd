@echo off
if not exist color_blue md color_blue
    move /y cursor_0.png color_blue\cursor.png
    move /y cursor@2x_0.png color_blue\cursor@2x.png
if not exist color_green md color_green
    move /y cursor_1.png color_green\cursor.png
    move /y cursor@2x_1.png color_green\cursor@2x.png
if not exist color_orange md color_orange
    move /y cursor_2.png color_orange\cursor.png
    move /y cursor@2x_2.png color_orange\cursor@2x.png
if not exist color_pink md color_pink
    move /y cursor_3.png color_pink\cursor.png
    move /y cursor@2x_3.png color_pink\cursor@2x.png
if not exist color_red md color_red
    move /y cursor_4.png color_red\cursor.png
    move /y cursor@2x_4.png color_red\cursor@2x.png
    cls
echo Íê³É
echo. 
pause
