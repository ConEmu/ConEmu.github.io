---
redirect_from: /ru/SettingsMain.html

title: "ConEmu | Settings › Main page"
---

# Settings: Main

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_MAIN {% endcomment %}

![ConEmu Settings: Main](/img/Settings-Main.png)



## Main console font



RTEXT



RTEXT



**Bold** *(Cell)* Main font weight

**Italic** Main font italic

**Monospace** Check it for non proportional (monospaced) fonts, 3rd-state - center symbols in the cells

**Auto size (fixed console size in cells)** Automatic font resize for the fixed real console width

**Admit monitor dpi with font size** 

Face name for main font

Main font height

**Treat font height as device units** 

Main font width 0 - mean default width for specified height

Cell width for "Monospace" mode

## Anti-aliasing




* **None**
* **Standard**
* **Clear Type**




RTEXT



## Anti-aliasing





## Alternative font (pseudographics, CJK, etc.)

You can specify additional font for drawing pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.

Main font charset

RTEXT



LTEXT

**Apply** 



Font face used to draw pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.

WIDTH for pseudographics font. It must be wider than main font, otherwise, You may get "dashed" borders.

## Extend fonts

ConEmu is able to use normal, bold and italic fonts side by side. This feature may be useful for prompt decoration or with Colorer plugin for Far Manager (1.7x, 2.x).

LTEXT



RTEXT



RTEXT



RTEXT





Choose background color index for which ‘Bold’ font properties whill be inverted (default is Red #12)

Choose background color index for which ‘Italic’ font properties whill be inverted (default is Magenta #13)

When Bold or Italic font property was inverted, ConEmu may change background to default color (default is Blue #1)

