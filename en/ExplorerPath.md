---
redirect_from: /ru/ExplorerPath.html

title: "ConEmu | Grab Explorer Path"

description: "ConEmu may extract current path from the top
  Explorer window and do ‘CD’ in the active ConEmu's console."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features
---

# Grab Explorer Path

ConEmu-Maximus5 may extract current path from the last (top in Z-order)
Explorer window and do ‘CD’ in the active ConEmu's console.

Just choose desired [global hotkey](GlobalHotKeys.html)
on the [Keys & Macro](SettingsHotkeys.html) Settings page.

The hotkey is global so it will bring ConEmu to the top
if it don't have focus.

‘CD’ works in most shells: cmd, powershell, Far Manager,
bash (path will be converted automatically to unix-style).


## GuiMacro

There is also a [GuiMacro](GuiMacro.html) if one needs to automate
this action.

~~~
PasteExplorerPath (<DoCd>,<SetFocus>)
  DoCd: 1 - ‘CD’, 0 - paste path only
  SetFocus: 1 - bring ConEmu to the top, 0 - don't change active window
~~~
