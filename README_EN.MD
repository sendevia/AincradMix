<div align="center">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s0_logo.png" width="200" alt="project_logo">
</div>

<div align="center">
  <img src="https://img.shields.io/badge/Progress-20%25-orange?style=flat-square" alt="progress">
  <a href="https://github.com/Sendevia/AincradMix/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Sendevia/AincradMix.svg?color=%23FF005A&style=popout-square" alt="license">
  </a>
  <a href="https://github.com/Sendevia/AincradMix/blob/master/README.MD">
    <img src="https://img.shields.io/badge/切换为-中文-%23131313.svg?style=flat-square" alt="language switch">
  </a>
</div>

---

## Introduction

### About

- `This is an osu! skin, which covers all interface elements of osu! in the form of game patches.`
- `The design style extends the design of the operation interface in the 1 and 2 seasons of "Sword Art Online", combined with more modern design concepts, and harmoniously blends the two.`

### Advantage

1. Extends the UI design style in the Sword Art Online
2. Have a good playing feel
3. Rich animation effects that do not interfere with play
4. Simple and beautiful visual experience
5. Cover all interface elements of osu!
6. More customization options

## Read It

- This skin is still in the **early stages** of design, and the details and feels have not been fully added and optimized.
- Currently this skin supports the **16:9** aspect ratio best.
- When applying the fully skin, please backup `osu!ui.dll` and `osu!gameplay.dll`.

## Skin Preview

<details>
  <summary>Animation</summary>
<!--
<div align="center">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s1_hit_circle_0.gif" width="220">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s1_hit_circle_100_k.gif" width="220">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s1_hit_circle_300.gif" width="220">
</div>
<div align="center">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s1_hit_circle_300_g.gif" width="220">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s1_hit_circle_300_k.gif" width="220">
</div>
-->
</details>

## Settings Recommended

### DETAIL SETTINGS

- [x] Snaking sliders
- [ ] Combo bursts
- [ ] Hit lightning
- [x] Shaders
- [ ] Softening filter

### MAIN MENU

- [x] Snow

### SONG SELECT

- [x] Show thumbnails

### GENERAL

- [x] Background dim: _95%_
- [x] Progress display: Top-Right (Bar)
- [x] Score meter size: _0.75x_

### VOLUME

- [ ] Ignore beatmap hitsounds

### SKIN

- [x] Ignore all beatmap skins
- [ ] Use skin's sound samples
- [x] Always use skin cursor
- [x] Cursor size: _0.7x_
- [ ] Automatic cursor size
- [ ] Use combo color as tint for slider ball

### MOUSE

- [ ] Cursor ripples

## Download

<div align="center">
  <a href="https://github.com/Sendevia/AincradMix/releases">
    <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s0_button_download_1_en.png" width="300" alt="download">
  </a>
</div>

---

## How to open `.aep`

<details>
  <summary>Info</summary>
  
### **Notice：**

1. Recommended using `Adobe After Effects CC2019 (16.0)` or newer.
2. You **must** have the following plugins, scripts and fonts:

#### Plugins

[Saber]  
Trapcode Suite

#### Scripts

[Duik]  
[GridGuide]  

#### Fonts

[SAO-UI]  
[KD-Tramcar]  
[Aller]  
Century Gothic  

</details>

## Image Export

<details>
  <summary>Info</summary>

 1. Image export format `PNG`, channel `RGB+Alpha`, name set to composite name.
 2. Animation export format `.PNG（sequence)`, aisle `RGB+Alpha`, use the composite frame number, the name is set to `Synthetic name`, remove the file name **`_[#]`** suffix **.（Be careful, `_[#]`instead of`-[#]`or`[#]`.）**

</details>

## Directory Description

<details>
  <summary>Info</summary>

```
┌─animation───────────── Optional animation
│
├─bin─────────────────── Referenced third-party programs
│
├─core────────────────── Main part
│
├─extra───────────────── Extended part
│  ├─mcosu
│  ├─osu
│  │  ├─animation─────── Replacement options for animation
│  │  ├─core──────────── Replacement options for main part
│  │  └─cursor────────── Replacement options for cursor
│  │      ├─style_hollow
│  │      │  ├─color_blue
│  │      │  ├─color_green
│  │      │  ├─color_orange
│  │      │  ├─color_pink
│  │      │  ├─color_red
│  │      │  └─color_white
│  │      ├─style_point
│  │      │  ├─color_blue
│  │      │  ├─color_green
│  │      │  ├─color_orange
│  │      │  ├─color_pink
│  │      │  └─color_red
│  │      └─style_round
│  │          ├─color_blue
│  │          ├─color_green
│  │          ├─color_orange
│  │          ├─color_pink
│  │          └─color_red
│  └─osulazer
│
├─optimize────────────── Optimization options for main part
│  ├─catch
│  ├─mania
│  ├─std
│  └─taiko
│
├─patch───────────────── Optional resource patch
│  ├─patch_play
│  └─patch_ui
│
├─project─────────────── Skin source files
│  ├─animation
│  ├─core
│  ├─cursor
│  ├─optimize
│  │  ├─catch
│  │  └─std
│  ├─other
│  ├─patch
│  │  ├─patch_play
│  │  └─patch_ui
│  └─psd
│
└─sfx─────────────────── Optional sound effects
    ├─style_amix
    └─style_lazer
```

</details>

## Some Resources From

- style_lazer FROM osu!lazer  
- Some colors are taken from the [official] website of Sword Art Online
- 7zip FROM [7-zip.org]
- libiconv2 FROM [gnuwin/libiconv]
- libintl3 FROM [gnuwin/libintl]
- regex2 FROM [gnuwin/regex]
- sed FROM [gnuwin/sed]

_Thanks to the creators of these resources_

## Fork Me On Gitee

<div align="center">
  <a href="https://gitee.com/sendevia/AincradMix">
    <img src="https://gitee.com/sendevia/AincradMix/widgets/widget_6.svg?color=ff711e" width="200" alt="Fork me on Gitee">
  </a>
</div>

## Ending

  **`If you like this skin or it is helpful for play, you don't need to donate, it is enough to light up a star.`**   
  **`The star you lit is your greatest encouragement! Give me motivation to make this skin better! `**

<!-- links -->
[Saber]:https://www.videocopilot.net/blog/2016/03/new-plug-in-saber-now-available-100-free/
[Duik]:https://rainboxprod.coop/en/tools/duik/duik-download/
[GridGuide]:https://aescripts.com/gridguide-for-after-effects/
[SAO-UI]:https://fontmeme.com/fonts/sao-ui-font/
[KD-Tramcar]:https://fontmeme.com/fonts/kd-tramcar-font/
[Aller]:https://fontmeme.com/fonts/aller-font/
[official]:https://www.swordart-online.net/
[7-zip.org]:https://www.7-zip.org/
[gnuwin/libiconv]:http://gnuwin32.sourceforge.net/packages/libiconv.htm
[gnuwin/libintl]:http://gnuwin32.sourceforge.net/packages/libintl.htm
[gnuwin/regex]:http://gnuwin32.sourceforge.net/packages/regex.htm
[gnuwin/sed]:http://gnuwin32.sourceforge.net/packages/sed.htm

<!--
    ___    _                           ____  ____     
   /   |  (_)___  ______________ _____/ /  |/  (_)  __
  / /| | / / __ \/ ___/ ___/ __ `/ __  / /|_/ / / |/_/
 / ___ |/ / / / / /__/ /  / /_/ / /_/ / /  / / />  <  
/_/  |_/_/_/ /_/\___/_/   \__,_/\__,_/_/  /_/_/_/|_|  

-->
