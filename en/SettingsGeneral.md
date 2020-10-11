---
redirect_from:
 - /ru/SettingsGeneral.html

title: "ConEmu | Settings › General page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: Tasks.html
   title: "Tasks: Set up your favourite shells"
 - url: Localization.html
   title: "Contribute to ConEmu localization"
 - url: SettingsColors.html
   title: "Color schemes"
 - url: GlobalHotKeys.html
   title: "Global hotkeys"
 - url: VersionComparison.html
   title: "Version comparison"
---

# Settings: General

{% comment %}
This page was manually edited
{% endcomment %}

{% comment %} IDD_SPG_GENERAL {% endcomment %}

![ConEmu Settings: General](/img/Settings-General.png)



## General settings  {#id3097}

#### Choose your startup task  {#id3095}
Here you may choose which [Task](Tasks.html) ConEmu should run on startup.

#### Interface language  {#id3094}
ConEmu interface supports different translations.
Anyone may [contribute](Localization.html) with fixes and new languages. 

#### Choose color scheme  {#id2844}
Here you may choose one of the predefined or user-defined [color schemes](SettingsColors.html).

#### Minimize/Restore hotkey  {#id2847}
Choose [global hotkey](GlobalHotKeys.html) to show and hide ConEmu window.

#### Single instance mode (use existing window instead of running new instance)  {#id2578}
Use one ConEmu window when starting new console from shortcut or somewhere. This may be disabled by ‘/nosingle’ or forced by ‘/single’ switches

#### Quake-style slide down from the top of the screen  {#id2846}
Let ConEmu acts like consoles in video games, slide down from the top of the screen.

#### Support special hotkeys (Win+Number, Win+Tab, PrntScrn and so on)  {#id2086}
Required for some keyboard combinations. When checked, ConEmu will install keyboard hook when ConEmu is foreground window.
So, You must allow that in antiviral software (AVP for example)

#### Inject ConEmuHk.dll into all processes started in ConEmu tabs  {#id2098}
Required for many features (ANSI X3.64, -new_console argument, GUI apps in ConEmu tabs, ...) and elimination
of several problems (crash in Windows 8, telnet in Windows 7, dialogs and menus behind of ConEmu window, chcp hungs, and so on...)

#### Enable automatic updates  {#id2087}
Choose here your preferred [update channel](VersionComparison.html#release-stages).

**Preview** is recommended for most users.
