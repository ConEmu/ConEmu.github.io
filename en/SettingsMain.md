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
{% comment %} IDD_SPG_FONTS {% endcomment %}

![ConEmu Settings: Main](/img/Settings-Main.png)



## Main console font  {#id2678}



RTEXT



RTEXT



#### Bold  {#id2278}
*Cell*  
Main font weight

#### Auto size (fixed console size in cells)  {#id1566}
*Font charset*  
Automatic font resize for the fixed real console width

#### Italic  {#id2280}
Main font italic

#### Treat font height as device units  {#id2692}


Main font height

Main font width 0 - mean default width for specified height

Cell width for "Monospace" mode

## Anti-aliasing  {#id2677}




* **None**
* **Standard**
* **Clear Type**


#### Admit monitor dpi with font size  {#id2691}


#### Monospace  {#id2283}
Check it for non proportional (monospaced) fonts



Face name for main font

## Anti-aliasing







Main font charset

#### Alternative font (pseudographics, CJK, etc.)  {#id1207}
You can specify additional font for drawing pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.

#### Anti-aliasing  {#id2883}
*Width*  


LTEXT

#### Apply  {#id2838}




WIDTH for pseudographics font. It must be wider than main font, otherwise, You may get "dashed" borders.

## Extend fonts  {#id1576}

ConEmu is able to use normal, bold and italic fonts side by side. This feature may be useful for prompt decoration or with Colorer plugin for Far Manager (1.7x, 2.x).

LTEXT



RTEXT



RTEXT



RTEXT



Font face used to draw pseudographics or specified range of symbols. E.g. main - "Fixedsys", additional - "Lucida Console". You may force this font for specified range of symbols, search "Settings-ConEmu.reg" for "FixFarBordersRanges" option.



Choose background color index for which ‘Bold’ font properties will be inverted (default is Red #12)

Choose background color index for which ‘Italic’ font properties will be inverted (default is Magenta #13)

When Bold or Italic font property was inverted, ConEmu may change background to default color (default is Blue #1)

