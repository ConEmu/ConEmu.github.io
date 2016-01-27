---
redirect_from:
 - /ru/SettingsMain.html

title: "ConEmu | Settings › Main page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Main

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_MAIN {% endcomment %}

![ConEmu Settings: Main](/img/Settings-Main.png)



## Main console font  {#id2678}



RTEXT



RTEXT



#### Bold  {#id2278}
*Cell*  
Main font weight

#### Italic  {#id2280}
Main font italic

#### Monospace  {#id2283}
Check it for non proportional (monospaced) fonts

#### Auto size (fixed console size in cells)  {#id1566}
Automatic font resize for the fixed real console width

#### Admit monitor dpi with font size  {#id2691}


Face name for main font

Main font height

#### Treat font height as device units  {#id2692}


Main font width 0 - mean default width for specified height

Cell width for "Monospace" mode

## Anti-aliasing  {#id2677}




* **None**
* **Standard**
* **Clear Type**




RTEXT



## Anti-aliasing





## Alternative font (pseudographics, CJK, etc.)  {#id1207}

You can specify additional font for drawing pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.

Main font charset

#### Anti-aliasing  {#id2883}
*Width*  


LTEXT

#### Apply  {#id2838}




Font face used to draw pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.

WIDTH for pseudographics font. It must be wider than main font, otherwise, You may get "dashed" borders.

## Extend fonts  {#id1576}

ConEmu is able to use normal, bold and italic fonts side by side. This feature may be useful for prompt decoration or with Colorer plugin for Far Manager (1.7x, 2.x).

LTEXT



RTEXT



RTEXT



RTEXT





Choose background color index for which ‘Bold’ font properties whill be inverted (default is Red #12)

Choose background color index for which ‘Italic’ font properties whill be inverted (default is Magenta #13)

When Bold or Italic font property was inverted, ConEmu may change background to default color (default is Blue #1)

