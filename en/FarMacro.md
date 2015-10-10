---
redirect_from: /ru/FarMacro.html

title: "ConEmu | Far Macro"
---

# ConEmu and Far Manager Macros

You may execute some ConEmu's actions from Far Manager macros.

* [ConEmu plugin macros](#ConEmu-macro)
  * [Far2](#ConEmu-macro-Far2)
  * [Far3 (Plugin.Call is alias for callplugin)](#ConEmu-macro-Far3)
  * [PluginCommand](#ConEmu-macro-PluginCommand)
* [ConEmu Panel Views plugin macros](#PanelViews-macro)
  * [Far2](#PanelViews-macro-Far2)
  * [Far3 (Plugin.Call is alias for callplugin)](#PanelViews-macro-Far3)
  * [PluginCommand](#PanelViews-macro-PluginCommand)



## ConEmu plugin macros  {#ConEmu-macro}

### Far2   {#ConEmu-macro-Far2}

* callplugin(0x43454D55,"[GuiMacro](GuiMacro.html)")
* callplugin(0x43454D55,*PluginCommand*)

### Far3 (Plugin.Call is alias for callplugin)   {#ConEmu-macro-Far3}

* Plugin.Call("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","[GuiMacro](GuiMacro.html)")
* Plugin.Call("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b",*PluginCommand*)

### PluginCommand   {#ConEmu-macro-PluginCommand}

| Code | Action |
|:---|:---|
| 1 | Edit console output |
| 2 | View console output |
| 3 | Switch tab visibility |
| 4 | Switch next tab |
| 5 | Switch previous tab |
| 6 | Switch tab commit |
| 7 | Attach to ConEmu |
| 8 | Start ConEmu debug |




## ConEmu Panel Views plugin macros  {#PanelViews-macro}

### Far2   {#PanelViews-macro-Far2}

* callplugin(0x43455568,*PluginCommand*)

### Far3 (Plugin.Call is alias for callplugin)   {#PanelViews-macro-Far3}

* Plugin.Call("bd454d48-448e-46cc-909d-b6cf789c2d65",*PluginCommand*)

### PluginCommand   {#PanelViews-macro-PluginCommand}

| Code | Action |
|:---|:---|
| 1 | Switch Thumbnail view on active panel |
| 2 | Switch Tiles view on active panel |
