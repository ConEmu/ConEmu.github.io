---
title: ConEmu | FAQ - Part 10

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-10.html
   ru: /ru/FAQ-10.html
---

# Unsorted  {#q-10-unsorted}

{% include faq_disclaimer_en.md %}

* [Q. How to minimize ConEmu to the system tray (as an icon near the Windows clock on the taskbar)?](#q-10-1)
* [Q. Why does ConEmu change the font of the real console?](#q-10-2)
* [Q. The console appears in part, shifted, or not at all](#q-10-3)
* [Q. Why does the quick search window disappear when the input language is changed?](#q-10-4)
* [Q. Why are there no multiconsole buttons on the toolbar?](#q-10-5)
* [Q. ConEmu hangs (title bar contains '...Waiting for result (10 sec)') and after some time, the plugin menu appears (or some other plugin is called)](#q-10-6)
* [Q. Why does the 'Background image' not show up?](#q-10-7)
* [Q. What is the purpose of the 'Press Enter to close console...' confirmation displayed after all commands finished executing?](#q-10-8)
* [Q. How to disable 'Press Enter to close console...'?](#q-10-9)
* [Q. FAR is the root process, the plugin is installed, yet 'Press Enter to close console...' still appears](#q-10-10)
* [Q. Why does Shift-Enter in panels launch console programs in new standard console windows, as opposed to new ConEmu tabs?](#q-10-11)
* [Q. Why is the cursor displayed as a rectangle instead of the usual?](#q-10-12)
* [Q. Text in tab captions is displayed with squares (instead of hieroglyphs).](#q-10-13)
* [Q. GoldenDict translation pop-ups do not work in ConEmu](#q-10-14)



#### Q. How to minimize ConEmu to the system tray (as an icon near the Windows clock on the taskbar)?   {#q-10-1}

A. Right-click the X button in the title bar. You may also enable the flag 'Auto minimize to TSA' in settings, which causes ConEmu to always minimize to the system tray.




#### Q. Why does ConEmu change the font of the real console?   {#q-10-2}

A. The real console must have a TrueType font selected, otherwise Unicode symbols (hieroglyphs, ellipses, copyright symbols) will show up as question marks ('?') in ConEmu. This is a design limitation of the Windows console.

A. The font size in the real console must be smaller than ConEmu's, otherwise it would be impossible to increase ConEmu's window size (in characters) more than the Windows limit for the current console font.




#### Q. The console appears in part, shifted, or not at all   {#q-10-3}

A. The configured (Settings-ConEmu.reg) console font size is too high.

A. Possibly, the window width (in characters) is too high.

A. Possibly, for some reason ConEmu failed to change the real console's font. Select 'Properties" from ConEmu's system menu, and on the 'Font' tab choose the TrueType font and the smallest available size.




#### Q. Why does the quick search window disappear when the input language is changed?   {#q-10-4}

A. An unfortunate side effect. FAR hides the quick search window when it receives or loses focus. Enable the flag 'Skip focus events' on the 'Features' tab of the 'Settings' window as a workaround.




#### Q. Why are there no multiconsole buttons on the toolbar?   {#q-10-5}

A. Enable the 'MultiCon' flag in settings, or use the /Multi command-line parameter.




#### Q. ConEmu hangs (title bar contains '...Waiting for result (10 sec)') and after some time, the plugin menu appears (or some other plugin is called)   {#q-10-6}

A. For some reason, ConEmu failed to detect that Far is not responding to user input (a command is executing, waiting, etc.)




#### Q. Why does the 'Background image' not show up?   {#q-10-7}

A. By default, only background colors #0 and #1 (usually black and dark-blue) are replaced with the background image. Your configuration may have other colors. To explicitly indicate replaced colors, use the parameter "bgImageColors".

A. If the flag 'Background image (bmp)' is in the third state - the image is only displayed in file panels.

A. If the flag 'Background image (bmp)' is set and the image file is selected, make sure the 'Darkening' setting is not set to 0.




#### Q. What is the purpose of the 'Press Enter to close console...' confirmation displayed after all commands finished executing?   {#q-10-8}

A. If the console would close automatically, you would not see neither the results of the executed command, nor any error messages.




#### Q. How to disable 'Press Enter to close console...'?   {#q-10-9}

A. The confirmation is disabled automatically, if:

* the root console command runs for more than 10 seconds, or
* Far Manager is the root process, and the ConEmu plugin is loaded.

A. Add the parameter `-new_console:n` to the launched command.




#### Q. FAR is the root process, the plugin is installed, yet 'Press Enter to close console...' still appears   {#q-10-10}

A. Make sure that the root process is indeed Far, and not cmd.exe. Check the process list in the 'Info' tab of the 'Settings' window. The cause is an incorrect command-line (/cmd argument in ConEmu), possibly incorrect quoting.




#### Q. Why does Shift-Enter in panels launch console programs in new standard console windows, as opposed to new ConEmu tabs?   {#q-10-11}

A. The Shift-Enter macro is absent or macros are forbidden.

A. Shift-Enter is launched during 'quick search' (which requires an extended macro for the 'Dialog' macro-context).




#### Q. Why is the cursor displayed as a rectangle instead of the usual?   {#q-10-12}

A. The 'Block inactive cursor' option. The alternative view indicates that the console does not have focus.




#### Q. Text in tab captions is displayed with squares (instead of hieroglyphs).   {#q-10-13}

A. "Tahoma" is the default font used for tab captions. Choose another font which contains your required characters (e.g. "Arial Unicode MS") on the 'Tabs' tab of the 'Settings' window.




#### Q. GoldenDict translation pop-ups do not work in ConEmu   {#q-10-14}

A. Update GoldenDict to version [1.0.1-271](http://goldendict.org/forum/viewtopic.php?p=7835#p7835) or higher.
