---
redirect_from:
 - /ru/SettingsKeyboard.html

title: "ConEmu | Settings › Keyboard"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Keyboard

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_KEYBOARD {% endcomment %}

![ConEmu Settings: Keyboard](/img/Settings-Keyboard.png)



## Hotkeys processing  {#id3017}

#### Support special hotkeys  {#id1649}
Allows interception of Win+Number, Win+Arrows, Alt+Esc, Alt+Tab, etc.

#### Win+Tab - switch consoles (Tabs)  {#id1764}
Disable Windows 7 Aero switch (Win+Tab) when ConEmu in foreground

#### Win+Numbers - activate console  {#id1648}
Enables switching of tabs (30 consoles) by their numbers (1,2,...,9,10,11,...). ‘Host-key’ is ‘Win’ key, by default.

#### Win+Arrows - resize window  {#id1768}
Resize ConEmu window with arrow keys

#### Alt+NumpadAdd - unicode hex codebase  {#id3061}
Use Alt+NumpadAdd+HexNumbers to enter unicode symbol by its hex codebase Ignored in Far Manager Has no effect on explicit shortcut



## Seize keys / Send to console  {#id3018}

#### Alt+Tab  {#id1777}
When checked, You can use "Alt+Tab" in Far internally. Warning! This blocks ability of switching to another window

#### Alt+Esc  {#id1778}
When checked, You can use "Alt+Esc" in Far internally

#### Ctrl+Esc  {#id1781}
When checked, You can use "Ctrl+Esc" in Far internally

#### PrntScrn  {#id1780}
When checked, You can use "PrintScrn" in Far internally

#### Alt+PrScrn  {#id1779}
When checked, You can use "Alt+PrintScrn" in Far internally



## Miscellaneous  {#id3019}

#### Fix Alt on AltTab/AltF9 (to avoid execution of Far Manager macro, linked to Alt-release)  {#id1562}
When You set a macro on Alt (RAlt) it can unexpectedly activates on AltTab or AltF9. This issue can be fixed by sending to console Control depress before Alt release.



## Read line enhancements (command prompt, ReadConsoleW)  {#id3020}

#### Ctrl+BackSpace - delete word leftward to the text cursor  {#id2526}
Delete word leftward to the cursor (ignored in Far), 3rd-state means ‘try to detect if console is in ReadConsole’, if you want to use this with bash - turn checkbox to ‘On’ (don't use third state)



