---
redirect_from:
 - /ru/SettingsHotkeys.html

title: "ConEmu | Settings › Keys & Macro page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: KeyboardShortcuts.html
   title: Keyboard Shortcuts
 - url: SettingsKeyboard.html
   title: Settings › Keyboard
 - url: GlobalHotKeys.html
   title: Global Hot Keys
---

# Settings: Keys & Macro

{% comment %}
This page was manually edited
{% endcomment %}

{% comment %} IDD_SPG_KEYS {% endcomment %}

![ConEmu Settings: Keys & Macro](/img/Settings-Hotkeys.png)

![ConEmu Settings: Keys & Macro](/img/Settings-Hotkeys2.png)

## Hotkeys, modifiers, macros

The easiest way to open this page is the system hotkey `Win+Alt+K`.
But there are [other methods](Settings.html#Settings_dialog) too.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}

### Hotkey list filtering

By default ConEmu shows full hotkeys list, radio **All hotkeys** is checked.
But you may filter it:

* **System** will show hotkeys which are hardcoded in the sources, limited set;
* **User defined** will hide **System** hotkeys;
* **Macros** will show hotkeys which use [GuiMacro](GuiMacro.html).

And you may **Hide unassigned** hotkeys.

### Hotkey list sorting

Just click on the list heading to sort it by column value.
Sort it by clicking on the ‘Description’ heading.


### Choose hotkey

There are stardard hotkeys, where you may choose
a hotkey itself (`F1` for example)
and up to three modifiers (`Win`, `Apps`, `Ctrl`, `Alt`, `Shift` and their left/right variants).

Limited set of hotkeys are modifiers only.


### GuiMacro

You may define up to 32 [GuiMacro](GuiMacro.html).
Select hotkey `Macro 01` .. `Macro 32` and type desired macro
in the ‘GUI Macro’ field.

You may press `?` button to see available [GuiMacro functions](GuiMacro.html#List_of_functions).
