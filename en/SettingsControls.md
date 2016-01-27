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

#### Send mouse events to console  {#id2313}
Uncheck this to stop sending mouse events to console, mouse will be processed by ConEmu internally (text selection, for example)

#### Skip click on activation  {#id1542}
Skip mouse button (left/right/middle) click, while activating window

#### Skip mouse events in background  {#id1543}
Skip mouse move events, while ConEmu is not foreground window

#### Activate split/pane on mouse hover  {#id2601}
When several panes (splits) are visible simultaneously activate (put focus in) console with mouse hover, 3rd-state - match ‘Active window tracking’ system settings



## Intercept keys

#### Install keyboard hooks  {#id1649}
Allows interception of Win+Number, Win+Arrows, Alt+Esc, Alt+Tab, etc.

#### Win+Tab - switch consoles (Tabs)  {#id1764}
Disable Windows 7 Aero switch (Win+Tab) when ConEmu in foreground

#### Win+Numbers - activate console  {#id1648}
Enables switching of tabs (30 consoles) by their numbers (1,2,...,9,10,11,...). ‘Host-key’ is ‘Win’ key, by default.

#### Win+Arrows - resize window  {#id1768}
Resize ConEmu window with arrow keys



## Seize keys / Send to console

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



## Miscellaneous

#### Fix Alt on AltTab/AltF9 (to avoid execution of Far Manager macro, linked to Alt-release)  {#id1562}
When You set a macro on Alt (RAlt) it can unexpectedly activates on AltTab or AltF9. This issue can be fixed by sending to console Control depress before Alt release.

#### Skip focus events (don't send to console FOCUS_EVENT, useful with Far Manager)  {#id1538}
Don't send focus events to console to disable autoclosing of fast search dialog in panels



## Read line enhancements (command prompt, ReadConsoleW)

#### Change prompt (cmd, powershell) text cursor position with Left Click  {#id2344}
3rd-state means ‘try to detect if console is in ReadConsole’, if you want to use this with bash - turn checkbox to ‘On’ (don't use third state)



#### Ctrl+BackSpace - delete word leftward to the text cursor  {#id2526}
Delete word leftward to the cursor (ignored in Far), 3rd-state means ‘try to detect if console is in ReadConsole’, if you want to use this with bash - turn checkbox to ‘On’ (don't use third state)



## Mouse button actions




* ****
* **Buffer only (e.g. cmd.exe)**




RTEXT



RTEXT









