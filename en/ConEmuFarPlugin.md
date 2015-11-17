---
redirect_from: /ru/ConEmuFarPlugin.html

title: "ConEmu | Far Plugins"

readalso:
 - url: "FarManager.html"
   title: "Far Manager Introduction"
---

# Far Manager plugins used in ConEmu

Several Far Manager plugins works in the ConEmu only, others provides advanced features in the ConEmu:

* [ConEmu](#ConEmu) (main connection between Far and ConEmu)
* [ConEmu Panel Views](#ConEmu_Panel_Views)
* [ConEmu Underlines](#ConEmu_Underlines)
* [ConEmu Background](#ConEmu_Background)
* [PanelColorer](#PanelColorer)
* [FarColorer](#FarColorer)



## ConEmu  {#ConEmu}

`ConEmu.dll` (or `ConEmu.x64.dll`) provides next functionality:

* Shell style Drag-and-Drop;
* Tabs and window switching;
* Some plugins depends on it:
  * [FarHints](http://code.google.com/p/far-plugins/wiki/FarHints)
  * [PictuewView](http://code.google.com/p/conemu-maximus5/wiki/PicView)
  * [Multimedia Viewer](http://code.google.com/p/conemu-maximus5/wiki/MMView)
* It shows real console, on abnormal ConEmu.exe termination;
* It attach new real console, which appears after detach (Ctrl-Alt-Tab);
* Shows long console output;
* and so on.

ConEmu plugin itself have no configuration dialog.
All its features are available via Far Manager plugin menu `F11`,
You'll see it as ‘ConEmu’.


### ConEmu plugin menu   {#ConEmu-plugin-menu}

![ConEmu FAR plugin](/img/ConEmuFarPlugin.png)

Item ‘Attach to ConEmu’ is available only in ‘clear’ console,
when you starts Far Manager without ConEmu.



## ConEmu Panel Views  {#ConEmu_Panel_Views}

Enables thumbnails and tiles in Far Manager panels.

![ConEmu Thumbnails and Tiles](/img/ConEmuPanelViews.png)

Recommended way for Panel Views activation is Far Manager macro,
look at `Thumbnails.reg` in ConEmu folder.

Another way (direct) is Far Manager plugin menu `F11` (‘ConEmu Panel Views’ item).

![ConEmu Panel Views plugin](/img/ConEmuFarTh.png)

You may polish Panel Views appearence via ConEmu [Settings](Settings.html#Views).



## ConEmu Underlines  {#ConEmu_Underlines}

Simple background plugin.

![ConEmu Underlines](/img/ConEmuFarLn.png)

![ConEmu Underlines in Far Editor](/img/ConEmuFarLn2.png)




## ConEmu Background  {#ConEmu_Background}

This plugin colorize Far panels, display mnemonic picture (drive, network, and so on),
and progress bar of used drive space at status line area.

ConEmu Background can be customized via `Background.xml` configuration file.
This is ‘native’ analog of [PanelColorer](#PanelColorer) plugin.

![ConEmu Background](/img/PanelColorer.png)




## PanelColorer  {#PanelColorer}

This obsolete ‘third-party’ background plugin is originally from
[here](http://forum.farmanager.com/viewtopic.php?f=11&t=5702).




## FarColorer  {#FarColorer}

This [plugin](http://colorer.sourceforge.net/farplugin.html) works in plain Far Manager too,
but when you choose [Far 3.x](http://www.farmanager.com/download.php)
or [Far TrueMod 2.x](http://forum.farmanager.com/viewtopic.php?p=1041#p1041)
and run it under ConEmu - you got full true colors in the console
(Far editor only in Far TrueMod 2.x) instead of standard 16
(or 32 with [Extend foreground colors](Settings.html#Colors) option) console colors.

**NB** You must enable [Colorer TrueMod support](Settings.html#Colors) option.

![ConEmu & FarColorer TrueMod](/img/ConEmuTrueMod.png)
