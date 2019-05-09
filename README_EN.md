# 项目整体完成度：`≈5%`

![title_big]

----

![GitHub release](https://img.shields.io/github/release-pre/Sendevia/AincradMix.svg?color=%23FF721E&style=popout-square)  ![GitHub](https://img.shields.io/github/license/Sendevia/AincradMix.svg?color=%23FF005A&style=popout-square)

## Introduction

- 设计理念  

> 基于在整个《刀剑神域》系列番剧中出现的所有UI的基础上，将更为现代的设计风格与osu!游戏风格相混合。  

- AincradMix的好处都有啥？  

> 1. ~~可定制化程度极高~~
> 2. ~~拥有可视化的安装程序 **(Working now＞﹏＜...)**~~
> 3. 良好的打图手感
> 4. 简洁而不失美观的视觉体验
> 5. 细腻平滑的动画效果
> 6. 延续了刀剑神域系列番剧中UI的风格 **(Important!!)**
> 7. 支持中、英两种语言
> 8. 真正的全局化

## 你需要注意的

 1. 这个皮肤现在还处于早期设计阶段，细节和手感都还没有完全的添加和优化；
 2. 目前这个皮肤对16:9的屏幕比例支持最佳，并且只支持高清分辨率（`@2x`）；
 3. 在应用全局皮肤时，要注意备份`osu!ui.dll`和`osu!gameplay.dll`；
 4. 在从别的皮肤与AincradMix之间切换时，你需要重启一下osu!，这样可以使游戏运行得更稳定。

## Screenshots

![AincradMix]
![menu_1]
![menu_2]
![menu_3]
![menu_4]
![menu_5]
![score]
![editor_1]
![editor_2]
![std_1]
![std_2]
![mania_1]
![mania_2]
![taiko_1]
![taiko_2]
![ctb_2]
![ctb_1]

## Make the skin to be completely covered（alpha ver）

 1. 将`AincradMix.osk`和`AincradMixGamePatch.zip`一并下载下来；
 2. 解压`AincradMixGamePatch.zip`把里面的两个`.dll`文件覆盖到游戏根目录；
 3. 双击安装`AincradMix.osk`；
 4. 在游戏内的Skins选项内选择`AincradMix`。
 5. 如果不想要应用全局皮肤，只需下载`AincradMix.osk`并安装即可。

## Recommended settings

- 详细设置

> - [x] 渐出滑条
> - [ ] 连击提示图
> - [ ] 击打闪光
> - [x] 着色器效果
> - [x] 柔化滤镜

- 主菜单

> - [x] 飘雪效果

- 选歌页面

> - [x] 显示略缩图

- 常规

> - [x] 背景暗化 _95%_

- 皮肤

> - [x] 忽略所有谱面自带的皮肤
> - [x] 光标大小 _0.75x_
> - [x] 自动缩放光标
> - [ ] 拖球的颜色随滑条改变

- 鼠标

> - [x] 点击波纹

## File & directories

- /AincradMix/ `---- 完整皮肤文件（高清）`

> /-/Pack_[base]/ `---- 皮肤基础部分`  
>> /-/-/Pack_[base_cn] `---- 中文基础资源文件`  
>> /-/-/Pack_[base_en] `---- 英文基础资源文件`  
>
> /-/Pack_[animation]/ `---- 皮肤扩展部分（动画）`  
>> /-/-/Frame_[15]/  `---- 15帧动画`  
>>> /-/-/-/Pack_[animation_15_cn] `---- 中文15帧动画文件`  
>>> /-/-/-/Pack_[animation_15_cn] `---- 英文15帧动画文件`  
>>
>> /-/-/Frame_[30]/  `---- 30帧动画`  
>>> /-/-/-/Pack_[animation_30_cn] `---- 中文30帧动画文件`  
>>> /-/-/-/Pack_[animation_30_cn] `---- 英文30帧动画文件`  
>>
>> /-/-/Frame_[60]/  `---- 60帧动画`  
>>> /-/-/-/Pack_[animation_60_cn] `---- 中文60帧动画文件`  
>>> /-/-/-/Pack_[animation_60_cn] `---- 英文60帧动画文件`  
>
> /-/Pack_[cursor]/ `---- 皮肤扩展部分（光标）`  
>> /-/-/Style_[round]/ `---- 圆形光标风格`  
>>> /-/-/-/Color_[blue] `---- 蓝色`  
>>> /-/-/-/Color_[green] `---- 绿色`  
>>> /-/-/-/Color_[orange] `---- 橙色`  
>>> /-/-/-/Color_[pink] `---- 粉色`  
>>> /-/-/-/Color_[purple] `---- 紫色`  
>>> /-/-/-/Color_[red] `---- 红色`  
>
> /-/Pack_[sfx]/ `---- 皮肤扩展部分（音效，部分来自osu!lazer）`  
>> /-/-/Style_[lazer] `---- osu!lazer主题音效`  
>
> /-/Pack_[optimized]/ `---- 皮肤扩展部分（单模式优化）`  
>> /-/-/Optimized_[ctb] `---- catch模式优化文件`  
>> /-/-/Optimized_[mania] `---- mania模式优化文件`  
>> /-/-/Optimized_[taiko] `---- taiko模式优化文件`  
>> /-/-/Optimized_[std] `---- osu!模式优化文件`  

- /osu!ui_patch `---- ui资源补丁`  

- /osu!gameplay_patch `---- gameplay资源补丁`  

- /Resource `---- 项目素材文件`  

- AincradMix.aep `---- 皮肤工程文件`

## Open `AincradMix.aep`

- **说明：**

> 1. 推荐使用`Adobe After Effects CC2019 (16.0)`打开。
> 2. 同时，你**必须**拥有以下的插件、脚本和字体：

- 插件

> [Saber]  

- 脚本

> [Duik]  
> [GridGuide]  

- 字体

> [SAO-UI]  
> [DS-Digital]  
> [Aller]  

## Color Themes

- **说明：** 轻微地调整颜色的纯度和亮度是可以的。比如白色 `#EEEEEE` 可以变为 `#FFFFFF`，黑色 `#131313` 可以变为 `#000000`。

> 标题文本 #777777  
> 通用文本 #D4D4D4  
> 提示文本 #E5E5E5  
> 通用背景 #969696  
> 红 #EC3434  
> 桃红 #FF005A  
> 黄 #FFC600  
> 蓝 #0054FF  
> 橙 #FF721E  
> 紫 #9000FF  
> 绿 #07B703  
> 绿幕 #009129  
> 紫 #7200FF  
> 粉 #FF25E8  
> 灰 #717171 #4D4D4D  
> 黑 #131313 #2F2F2F  
> 白 #EEEEEE  
> 阴影填充 #323232 #1C1C1C

## Image export

 1. 图片导出格式`.PNG`，通道`RGB+Alpha`，名称设置为`合成名称`。
 2. 动画导出格式`.PNG（序列）`，通道`RGB+Alpha`，使用合成帧编号，名称设置为`合成名称`，去掉文件名的 **`_[#]`** 后缀 **。（注意一下哦，是`_[#]`而不是`-[#]`或`[#]`）**
 3. 具体该使用何种导出方式，请注意特殊合成后面的注释。

<!-- links -->
[AincradMix]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/AincradMix.png
[menu_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/menu_1.jpg
[menu_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/menu_2.jpg
[menu_3]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/menu_3.jpg
[menu_4]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/menu_4.jpg
[menu_5]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/menu_5.jpg
[score]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/score.jpg
[editor_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/editor_1.jpg
[editor_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/editor_2.jpg
[std_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/std_1.jpg
[std_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/std_2.jpg
[mania_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/mania_1.jpg
[mania_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/mania_2.jpg
[taiko_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/taiko_1.jpg
[taiko_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/taiko_2.jpg
[ctb_1]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/ctb_1.jpg
[ctb_2]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/screenshots/ctb_2.jpg
[title_big]:https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/title_big.png
[切换到中文]:https://github.com/Sendevia/AincradMix/blob/master/README.md
[Downloads]:https://github.com/Sendevia/AincradMix/releases
[Saber]:https://www.videocopilot.net/blog/2016/03/new-plug-in-saber-now-available-100-free/
[Duik]:https://rainboxprod.coop/en/tools/duik/duik-download/
[GridGuide]:https://aescripts.com/gridguide-for-after-effects/
[SAO-UI]:https://fontmeme.com/fonts/sao-ui-font/
[DS-Digital]:https://fontmeme.com/fonts/ds-digital-font/
[Aller]:https://fontmeme.com/fonts/aller-font/
