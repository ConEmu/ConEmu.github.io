---
title: ConEmu | FAQ - Part 7

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-7.html
   ru: /ru/FAQ-7.html
---

# Far Manager  {#q-7-far}

{% include faq_disclaimer_en.md %}

* [Q. Ctrl+Number doesn't switch panel modes.](FAQ-7.html#q-7-9)
* [Q. Why don't tabs work?](#q-7-1)
* [Q. Why doesn't Drag-n-Drop (plugin) work?](#q-7-2)
* [Q. How to close a tab (viewer/editor/Far) with the mouse?](#q-7-3)
* [Q. Mouse events (clicks, wheel) are not sent to Far](#q-7-4)
* [Q. Why doesn't the FarHints plugin work?](#q-7-5)
* [Q. At some point, tabs / Drag-n-Drop / etc. stopped working](#q-7-6)
* [Q. Right mouse clicks do not invoke the file/folder context menu.](#q-7-7)
* [Q. Right mouse clicks invoke a graphical context menu, whereas a text one is desired.](#q-7-8)





#### Q. Ctrl+Number doesn't switch panel modes.  {#q-7-9}

Due to dozens of complains ConEmu doesn't intercept `Win+Numbers`
to switch consoles since [build 170622](/blog/2017/06/22/Build-170622.html).
It's intuitive to use `Ctrl` modifier and ConEmu uses `LCtrl+Numbers`
to switch tabs by default nowadays.

To continue switch panel modes in Far Manager you may:

**A.** Far Manager macro [ConEmu.CtrlNumber.lua](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/Far3_lua/ConEmu.CtrlNumber.lua)
let you switch panel modes by `Ctrl+Shift+Numbers`.
Macro is located in ‘[ConEmuBaseDir](ConEmuEnvironment.html)/Far3_lua’.

**A.** Choose another hotkey on the [Keys & Macro](SettingsHotkeys.html)
settings page. Just type `Ctrl+1` in the ‘Filter hotkeys’ field,
select hotkey row and choose desired modifier.




#### Q. Why don't tabs work?   {#q-7-1}

**A.** In the plugin ConEmu.dll (ConEmu.x64.dll) installed?

**A.** When using the installer, the ConEmu.dll plugin might have been installed to an incorrect directory (it must be installed in a subdirectory of the Plugins directory for Far.exe). The installer might have failed to locate Far.exe's location, if Far Manager wasn't installed using the MSI package. The easiest solution is to uninstall and reinstall ConEmu, but make sure that the 'Far Manager plugins' field points to the correct directory.

**A.** Is the flag 'Enable Tabs' enabled in settings? If the checkbox is in the indeterminate (3rd) state, tabs will only appear when a viewer/editor is opened.



#### Q. Why doesn't Drag-n-Drop (plugin) work?   {#q-7-2}

**A.** «Shell style Drag and Drop» is built-in ConEmu and is configured on the 'Far Manager' tab of the 'Settings' window. ConEmu supports dragging files out of Far and onto other applications (Explorer, GIMP, etc.) and dropping files into Far (onto the panel or command-line) from other applications. For proper support of «Shell style Drag and Drop», the Far plugin ConEmu.dll (ConEmu.x64.dll) must be installed. ConEmu can drag files with both the left (LDrag flag) as well as right (RDrag) mouse buttons. Optionally, a modifier key can be configured (e.g. drag files only with the left mouse button and when LCtrl is held down).

**A.** Screenshots and some explanations can be seen/read here:
[Issue 527](http://github.com/Maximus5/conemu-old-issues/issues/527).

**A.** 3rd-party Drag-n-Drop plugins were never supported, are not supported and will not be supported, as this functionality is built into ConEmu.



#### Q. How to close a tab (viewer/editor/Far) with the mouse?   {#q-7-3}

**A.** A Ctrl + Right-click will activate the tab and send a close request to Far Manager. You can redefine the macro on the 'Far Manager' tab of the 'Settings' dialog ('Close tab' field).

**A.** A simple right-click will activate the tab and display the context menu, from which you may select 'Close'.



#### Q. Mouse events (clicks, wheel) are not sent to Far   {#q-7-4}

**A.** In Far, check the setting Options -> Interface settings -> `[x]` Mouse.

**A.** If Far is launched with «far /w» (System\WindowMode=1), the presence of the ConEmu.dll (ConEmu.x64.dll) plugin is required, otherwise ConEmu will consider Far as a simple console application (like cmd.exe) which does not need mouse events.



#### Q. Why doesn't the FarHints plugin work?   {#q-7-5}

**A.** It must be updated (version 1.0.15 or newer) and it requires the presence of the ConEmu.dll (ConEmu.x64.dll) plugin.



#### Q. At some point, tabs / Drag-n-Drop / etc. stopped working   {#q-7-6}

**A.** Check the 'Info' tab of the 'Settings' dialog. Most likely, the 'Far' / 'Panels' state is not set. Take note - D&D requires the ConEmu.dll (ConEmu.x64.dll) plugin.



#### Q. Right mouse clicks do not invoke the file/folder context menu.   {#q-7-7}

**A.** Is the flag 'RightClick 4 context menu' set? If the checkbox is in the indeterminate state, the menu will appear after a 'long click' - wait for the circle around the mouse cursor to close.

**A.** For some reason, ConEmu did not detect the 'panels' state in Far. The ConEmu.dll (ConEmu.x64.dll) plugin may not be installed. If it is installed, please send screenshots of ConEmu ('Info' tab from 'Settings' dialog) and a screen dump file (ConEmu system menu -> Debug -> Dump screen...).



#### Q. Right mouse clicks invoke a graphical context menu, whereas a text one is desired.   {#q-7-8}

**A.** Configure the corresponding macro in the 'Far Manager' tab of the 'Settings' window. Example: `F11 e Enter 2` (assumes that the 'e' hotkey is assigned to the EMenu plugin).
