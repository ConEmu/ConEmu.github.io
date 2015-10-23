---
redirect_from:
 - /ru/SettingsControls.html

title: "ConEmu | Settings › Controls page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Controls

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_CONTROL {% endcomment %}

![ConEmu Settings: Controls](/img/Settings-Controls.png)



## Mouse options

#### Send mouse events to console  {#2313}
Uncheck this to stop sending mouse events to console, mouse will be processed by ConEmu internally (text selection, for example)

#### Skip click on activation  {#1542}
Skip mouse button (left/right/middle) click, while activating window

#### Skip in background  {#1543}
Skip mouse move events, while ConEmu is not foreground window



## Intercept keys

#### Install keyboard hooks  {#1649}
Allows interception of Win+Number, Win+Arrows, Alt+Esc, Alt+Tab, etc.

#### Win+Tab - switch consoles (Tabs)  {#1764}
Disable Windows 7 Aero switch (Win+Tab) when ConEmu in foreground

#### Win+Numbers - activate console  {#1648}
Enables switching of tabs (30 consoles) by their numbers (1,2,...,9,10,11,...). ‘Host-key’ is ‘Win’ key, by default.

#### Win+Arrows - resize window  {#1768}
Resize ConEmu window with arrow keys



## Seize keys / Send to console

#### Alt+Tab  {#1777}
When checked, You can use "Alt+Tab" in Far internally. Warning! This blocks ability of switching to another window

#### Alt+Esc  {#1778}
When checked, You can use "Alt+Esc" in Far internally

#### Ctrl+Esc  {#1781}
When checked, You can use "Ctrl+Esc" in Far internally

#### PrntScrn  {#1780}
When checked, You can use "PrintScrn" in Far internally

#### Alt+PrScrn  {#1779}
When checked, You can use "Alt+PrintScrn" in Far internally



## Miscellaneous

#### Fix Alt on AltTab/AltF9 (to avoid execution of Far Manager macro, linked to Alt-release)  {#1562}
When You set a macro on Alt (RAlt) it can unexpectedly activates on AltTab or AltF9. This issue can be fixed by sending to console Control depress before Alt release.

#### Skip focus events (don't send to console FOCUS_EVENT, useful with Far Manager)  {#1538}
Don't send focus events to console to disable autoclosing of fast search dialog in panels



## Read line enhancements (command prompt, ReadConsoleW)

#### Change prompt (cmd, powershell) text cursor position with Left Click  {#2344}
3rd-state means ‘try to detect if console is in ReadConsole’, if you want to use this with bash - turn checkbox to ‘On’ (don't use third state)



#### Ctrl+BackSpace - delete word leftward to the text cursor  {#2526}
Delete word leftward to the cursor (ignored in Far), 3rd-state means ‘try to detect if console is in ReadConsole’, if you want to use this with bash - turn checkbox to ‘On’ (don't use third state)



## Mouse button actions




* ****
* **Buffer only (e.g. cmd.exe)**




RTEXT



RTEXT









