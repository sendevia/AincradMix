![LOGO](https://sendevia.top/assets/images/22/s0_aincradmix.webp)

<div align="center">
  <a href="https://github.com/Sendevia/AincradMix/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Sendevia/AincradMix.svg?color=%23FF005A&style=popout-square" alt="license">
  </a>
</div>

---

![宣传图](https://sendevia.top/assets/images/22/s0_amix_vision.webp)

## 介绍

### 关于

> 1. 通过游戏补丁的方式，做到了几乎全部的 osu! 的界面元素覆盖。
> 2. 结合更现代的设计，扩展了《刀剑神域》第 1、2 季中出现的操作界面的设计。

## 优点

1. 使用了类 sao ui 的设计风格
2. 有较好的打图手感
3. 简而美的视觉体验
4. 覆盖了 osu! 的绝大部分的界面元素[^1]
5. 可进行简单的个性化搭配
6. 兼容 osu!lazer

## 你需要注意的

- 在 std 模式中，本皮肤的 _**正常版本**_ 适用于 **★6.5** 及以下的大多数谱面[^2]
- 在应用全局皮肤时，要注意备份 `osu!ui.dll` 和 `osu!gameplay.dll`
- 本皮肤所提供的 dll 文件仅替换了图像资源，未做其他修改。如果不放心，你可以使用 dnSpy 自行替换文件

[^1]: 通过修改 osu! 的资源 dll。
[^2]: 此为估计得出。

## 皮肤预览

# 皮肤预览

![主界面](https://sendevia.top/assets/images/22/screenshot01.webp)

![选歌界面1](https://sendevia.top/assets/images/22/screenshot02.webp)
![选歌界面2](https://sendevia.top/assets/images/22/screenshot06.webp)
![选歌界面3](https://sendevia.top/assets/images/22/screenshot07.webp)

## std 模式

![std 模式1](https://sendevia.top/assets/images/22/screenshot03.webp)
![std 模式2](https://sendevia.top/assets/images/22/screenshot04.webp)

## mania 模式

![mania 模式1](https://sendevia.top/assets/images/22/screenshot09.webp)
![mania 模式2](https://sendevia.top/assets/images/22/screenshot08.webp)

## taiko 模式

![taiko 模式1](https://sendevia.top/assets/images/22/screenshot10.webp)
![taiko 模式2](https://sendevia.top/assets/images/22/screenshot11.webp)

## catch 模式

![catch 模式1](https://sendevia.top/assets/images/22/screenshot12.webp)
![catch 模式2](https://sendevia.top/assets/images/22/screenshot13.webp)

![成绩结算](https://sendevia.top/assets/images/22/screenshot05.webp)

## 推荐设置

### 详细设置

> 🔴 渐出滑条  
> 🔴 连击提示图  
> ⭕ 击打闪光  
> 🔴 着色器效果  
> ⭕ 柔化滤镜  

### 主菜单

> 🔴 飘雪效果  

### 选歌页面

> 🔴 显示略缩图  

### 常规

> 🔴 进度条位置： 右上角（条状）  

### 音量

> ⭕ 禁用谱面自带音效  

### 皮肤

> 🔴 忽略所有谱面自带的皮肤  
> ⭕ 使用皮肤的音效  
> 🔴 总是使用皮肤中的光标  
> 🔴 光标大小： _0.7x_  
> ⭕ 自动缩放光标  
> ⭕ 拖球的颜色随滑条改变  

### 鼠标

> ⭕ 点击波纹  

## 最新版下载

<div align="center">
  <a href="https://github.com/Sendevia/AincradMix/releases/latest">
    <img src="https://sendevia.top/assets/images/22/s0_button_download_1.webp" width="300" alt="download">
  </a>
  <p align="right">
    Release 1.1 / 2024.6.25
  </p>
</div>

---

## `.aep` 的打开方式

<details>

### **注意：**

1. 推荐使用`Adobe After Effects CC2021 (18.0)`或更高版本。
2. **注意要经常保存文件**
3. 你**必须**拥有以下的插件、脚本和字体：

#### 插件

[Saber]  
Trapcode Suite  
AESweets Halftone

#### 脚本

[Duik]  
[GridGuide]

#### 字体

[SAO-UI]  
[KD-Tramcar]  
[Aller]  
Electrolize  
Century Gothic

</details>

## 图像导出说明

<details>

1. 将图片导出格式设置为 `.PNG`，通道为 `RGB+Alpha`，名称为`合成名称`
2. 将动画导出格式设置为 `.PNG（序列）`，通道为 `RGB+Alpha`，根据情况选择使用合成帧编号，名称为`合成名称`，删去文件名的 **`_[#]`** 后缀 **（噔噔咚~ 是 `_[#]` ！不是 `-[#]` 或 `[#]` ！）**
3. 你也可以导入本项目提供的 `AOM` 和 `ARS` 文件，具体导入方法恕请另行搜索
   - `AOM` After Effects 的输出模块模板
   - `ARS` After Effects 的渲染模块模板

</details>

## 目录说明

| 名称 | 说明 |
| ------------- | ------------- |
| additions | 皮肤扩展 |
| animations | 可选动画 |
| core | 皮肤主体 |
| optimizations | 优化选项 |
| patches | 可选补丁 |
| sounds | 可选音效 |
| sources | 工程文件 |

## 引用素材来源

- `style_lazer/old` 来自 [`ppy/osu-resources`]

_非常感谢这些资源的贡献者_

<!-- 链接索引 -->

[saber]: https://www.videocopilot.net/blog/2016/03/new-plug-in-saber-now-available-100-free/
[duik]: https://rainboxprod.coop/en/tools/duik/duik-download/
[gridguide]: https://aescripts.com/gridguide-for-after-effects/
[sao-ui]: https://fontmeme.com/fonts/sao-ui-font/
[kd-tramcar]: https://fontmeme.com/fonts/kd-tramcar-font/
[aller]: https://fontmeme.com/fonts/aller-font/
[`ppy/osu-resources`]: https://github.com/ppy/osu-resources/

<!--
    ___    _                           ____  ____
   /   |  (_)___  ______________ _____/ /  |/  (_)  __
  / /| | / / __ \/ ___/ ___/ __ `/ __  / /|_/ / / |/_/
 / ___ |/ / / / / /__/ /  / /_/ / /_/ / /  / / />  <
/_/  |_/_/_/ /_/\___/_/   \__,_/\__,_/_/  /_/_/_/|_|
copyright 2024 sendevia
-->
