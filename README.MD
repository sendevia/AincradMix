<div align="center">
  <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s0_logo_only.png" width="200" alt="project_logo">
  <h1>AincradMix</h1>
</div>

<div align="center">
  <img src="https://img.shields.io/badge/%E8%BF%9B%E5%BA%A6-60%25-orange?style=flat-square" alt="progress">
  <a href="https://github.com/Sendevia/AincradMix/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Sendevia/AincradMix.svg?color=%23FF005A&style=popout-square" alt="license">
  </a>
  <a href="https://github.com/Sendevia/AincradMix/blob/master/README_EN.MD">
    <img src="https://img.shields.io/badge/Switch to-English-%23131313.svg?style=flat-square" alt="language switch">
  </a>
</div>

---

## 介绍

### 关于

- `这是一个 osu! 皮肤，它以游戏补丁的方式实现了对 osu! 全部界面元素的覆盖。`
- `它的设计风格扩展了《刀剑神域》第1、2季中操作界面的设计，结合更现代的设计风格，再将两者和谐相融。`

### 优点

1. 扩展了刀剑神域系列番剧中 UI 的设计
1. 拥有良好的打图手感
1. 丰富而不干扰打图的动画效果
1. 简洁而美观的视觉体验
1. 覆盖了 osu! 的所有界面元素（WIP）
1. 定制化选项较为丰富（WIP）

## 你需要注意的

- 在 std 模式中，本皮肤的 _正常版本_ 适用于 **★6.5** 及以下的大多数谱面（此为估计得出）
- 建议使用 **16:9** 的屏幕比例游玩 osu! 以获得最佳效果
- 在应用全局皮肤时，要注意备份 `osu!ui.dll` 和 `osu!gameplay.dll`

<!--
## 皮肤预览

<details>
  <summary>宣传图</summary>

    <div align="center">
      <img src="">
    </div>

</details>

<details>
  <summary>主界面</summary>

    <div align="center">
      <img src="">
    </div>

</details>

<details>
  <summary>std模式</summary>

    <div align="center">
      <img src="">
    </div>
</details>

<details>
  <summary>mania模式</summary>

    <div align="center">
      <img src="">
    </div>
</details>

<details>
  <summary>taiko模式</summary>

    <div align="center">
      <img src="">
    </div>
</details>

<details>
  <summary>catch模式</summary>

    <div align="center">
      <img src="">
    </div>
</details>

<details>
  <summary>细节动画</summary>

    <div align="center">
      <img src="">
    </div>
</details>

-->

## 推荐设置

### 详细设置

- [x] 渐出滑条
- [x] 连击提示图
- [ ] 击打闪光
- [x] 着色器效果
- [ ] 柔化滤镜

### 主菜单

- [x] 飘雪效果

### 选歌页面

- [x] 显示略缩图

### 常规

- [x] 进度条位置： 右上角（条状）

### 音量

- [ ] 禁用谱面自带音效

### 皮肤

- [x] 忽略所有谱面自带的皮肤
- [ ] 使用皮肤的音效
- [x] 总是使用皮肤中的光标
- [x] 光标大小： _0.7x_
- [ ] 自动缩放光标
- [ ] 拖球的颜色随滑条改变

### 鼠标

- [ ] 点击波纹

## 最新版下载

<div align="center">
  <a href="https://github.com/Sendevia/AincradMix/releases/latest">
    <img src="https://raw.githubusercontent.com/Sendevia/sendevia.github.io/master/assets/images/s0_button_download_1.png" width="300" alt="download">
  </a>
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
Halftone

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
2. 将动画导出格式设置为 `.PNG（序列）`，通道为 `RGB+Alpha`，根据情况选择使用合成帧编号，名称为`合成名称`，删去文件名的 **`_[#]`** 后缀 **（噔噔咚~是 `_[#]` ！不是 `-[#]` 或 `[#]` ！）**

</details>

## 目录说明

```
┌─addition────────────── 皮肤扩展
│
├─animation───────────── 可选动画
│
├─core────────────────── 皮肤主体
│
├─optimization────────── 优化选项
│
├─patch───────────────── 可选补丁
│
├─sound───────────────── 可选音效
│
└─source──────────────── 工程文件
```

## 引用素材来源

- `style_lazer/old` 来自 `ppy/osu`
- 部分颜色取自 SwordArtOnline 的[官方网站]
- 7zip 来自 [7-zip.org]

_非常感谢这些资源的制作者_

## Gitee 镜像

<div align="center">
  <a href="https://gitee.com/sendevia/AincradMix">
    <img src="https://gitee.com/sendevia/AincradMix/widgets/widget_6.svg?color=ff711e" width="200" alt="Fork me on Gitee">
  </a>
</div>

<!-- 链接索引 -->

[saber]: https://www.videocopilot.net/blog/2016/03/new-plug-in-saber-now-available-100-free/
[duik]: https://rainboxprod.coop/en/tools/duik/duik-download/
[gridguide]: https://aescripts.com/gridguide-for-after-effects/
[sao-ui]: https://fontmeme.com/fonts/sao-ui-font/
[kd-tramcar]: https://fontmeme.com/fonts/kd-tramcar-font/
[aller]: https://fontmeme.com/fonts/aller-font/
[官方网站]: https://www.swordart-online.net/
[7-zip.org]: https://www.7-zip.org/

<!--
    ___    _                           ____  ____
   /   |  (_)___  ______________ _____/ /  |/  (_)  __
  / /| | / / __ \/ ___/ ___/ __ `/ __  / /|_/ / / |/_/
 / ___ |/ / / / / /__/ /  / /_/ / /_/ / /  / / />  <
/_/  |_/_/_/ /_/\___/_/   \__,_/\__,_/_/  /_/_/_/|_|
-->
