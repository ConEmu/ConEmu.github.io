---
title: ConEmu | FAQ - Part 1

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-1.html
   ru: /ru/FAQ-1.html
---

# General  {#q-1-general}

{% include faq_disclaimer_en.md %}

* [Q. I found a bug, what should I do?](#q-1-1)
* [Q. What about ConMan , alternative console, etc.?](#q-1-2)
* [Q. What is an Apps key?](#q-1-5)
* [Q. What is a Host key?](#q-1-6)
* [Q. Not all characters (hieroglyphs, ellipses, copyright symbols etc.) are displayed](#q-1-7)
* [Q. Is it possible to run a GUI application in a ConEmu tab?](#q-1-8)
* [Q. How to launch an application in a new ConEmu tab?](#q-1-9)
* [Q. How to use the '-new_console' parameter?](#q-1-10)
* [Q. Which environment variables does ConEmu set?](#q-1-11)
* [Q. Launched console program outputs nothing.](#q-1-12)
* [Q. A program does not work in «Long console output» mode.](#q-1-13)






#### Q. I found a bug, what should I do?   {#q-1-1}


**A.** First, make sure that the bug doesn't occur without ConEmu (e.g. running FAR directly, not via ConEmu). Next, make sure that the bug wasn't fixed [in the latest ConEmu version](http://www.fosshub.com/ConEmu.html). If the bug persists, [file a thoroughly detailed issue](https://github.com/Maximus5/ConEmu/issues/new).




#### Q. What about ConMan, alternative console, etc.?   {#q-1-2}

**A.** Everything is seamlessly built into ConEmu, but in better way ;)
The flag ‘[Multiple consoles](SettingsAppearance.html#id1506)’ should be enabled.
Furthermore, using ConMan with ConEmu is NOT RECOMMENDED.
A new console [may be created in many ways](LaunchNewTab.html):
using a keyboard shortcut (`Win+W` by default), by adding [`-new_console`](NewConsole.html)
to the executed command in prompt, and so on.
The current console can be closed or restarted: `Win+~`.
The long output of a console command or program can be opened in Far's editor/viewer
via [plugin](ConEmuFarPlugin.html) or `Ctrl+O` Far's Macro.
Switching between consoles can be done with `Ctrl+Tab` or `Win+Shift+Q`.



{% comment %}
#### Q. What is the purpose of ConEmu.cer (digital certificate)?   {#q-1-3}
**A.** For validation of the integrity of ConEmu's executable files.
**A.** Windows SmartScreen blocks execution of files (Installer) from "unverified publishers".
**A.** If the certificate is imported into the list of trusted root certificates (for the user, machine or domain), launching ConEmu "As Administrator" (Vista & Win7) will display a less scary warning (program name + "verified publisher: ConEmu-Maximus5" instead of the scary "unverified publisher" window).
**A.** If the certificate is imported into the list of trusted root certificates, certain antivirus software (e.g. KIS) will consider the program as "trusted".

#### Q. How to import the certificate to the list of trusted root certificates?   {#q-1-4}
**A.** In Vista+ one can simply open the certificate file, and click the "Install certificate" button.
**A.** Via MMC -> Certificates snap-in.
**A.** Using the utility CertMgr from the Windows SDK:
~~~
   "C:\Program Files\Microsoft SDKs\Windows\v7.0\Bin\CertMgr" -add -c ConEmu.cer -s root
~~~
**A.** For details, see here: [Certificate installation](Certificate.html)
{% endcomment %}



#### Q. What is an Apps key?   {#q-1-5}


**A.** [AppsKey](AppsKey.html).




#### Q. What is a Host key?   {#q-1-6}


**A.** This is sort of «substitution» for key chosed by user. For example you may choose common modifier (from one or more Ctrl/Alt/Shift/Apps) for group of actions. Browse «Keys & Macro» page in the Settings dialog.




#### Q. Not all characters (hieroglyphs, ellipses, copyright symbols etc.) are displayed   {#q-1-7}


**A.** For some reason, ConEmu failed to change the font of the real console. Select 'Debug' > 'Properties' from ConEmu's system menu, and on the 'Font' tab choose a TrueType font.


**A.** A missing or non-Unicode font was specified in ConEmu's settings (Settings-ConEmu.reg, 'ConsoleFontName' parameter).




#### Q. Is it possible to run a GUI application in a ConEmu tab?   {#q-1-8}

**A.** Yes, with **certain** GUI applications. Example: Putty, Notepad, and others.
Please note, that ConEmu can't modify [ChildGui](ChildGui.html) behavior,
and you may notice visual or controlling problems with applications,
which were not designed for embedding.
This is not a ConEmu's problem, please contact your application author.




#### Q. How to launch an application in a new ConEmu tab?   {#q-1-9}


**A.** Indicate the application in the 'Create new console' field of the new console creation dialog. This dialog can be opened by using the 'New console...' item from ConEmu's system menu, or by using the corresponding keyboard shortcut (Win-W or Win-Shift-W by default).


**A.** A new tab can be opened from an existing tab (e.g. from Far) by adding a '-new_console' parameter to the application's command line. Example: `putty.exe -new_console`.




#### Q. How to use the '-new_console' parameter?   {#q-1-10}


**A.** The setting 'Inject ConEmuHk' must be enabled in ConEmu's configuration. Afterwards, if ConEmu sees the '-new_console' parameter in a launched application's command line, it is removed from the command line, and the application/command is ran in a new ConEmu tab.


**A.** Additional launch options are available: `-new_console[:bh[N]caru[:user:pwd]]`

* `b` - Create background tab
* `h<height>` - Set buffer height: e.g., h0 - disable buffer, h9999 - enable buffer with 9999 lines
* `n` - Disable 'Press Enter or Esc to close console' message
* `c` - Explicitly enable 'Press Enter or Esc to close console' (default)
* `a` - RunAs shell verb (as Admin on Vista+, login/password in Win2k and WinXP)
* `r` - Run as restricted user
* `u` - Open ConEmu choose user dialog
* `u:<user>:<pwd>` - specify user/pwd in args. MUST BE THE LAST OPTION.

**Example:** `"%ConEmuBaseDir%\ConEmuC.exe" /c dir "-new_console:bh9999c" c:\ /s`. Note that when launching from Far Manager, `"%ConEmuBaseDir%\ConEmuC.exe" /c ` may be omitted.


**A.** For comfort, when using Far, one can configure a macro bound to ShiftEnter (see example in the distribution package).


**A.** Pay attention to the parameter `-cur_console:h[N]`, which allows controlling long output of commands or applications when running them from [Far Manager](ConEmuFAQ.html#Far_Manager).




#### Q. Which environment variables does ConEmu set?   {#q-1-11}


**A.** Read wiki page [ConEmu Environment](ConEmuEnvironment.html).




#### Q. Launched console program outputs nothing.   {#q-1-12}

**This question covers only [console applications](ConsoleApplication.html)!**

**A.** Certain programs work with the console's alternative buffer - e.g. telnet.exe, launched without parameters. A history of this issue can be read here: [Issue 65](http://github.com/Maximus5/conemu-old-issues/issues/65). The problem is fixed in version 120504 (the «Inject [ConEmuHk](ConEmuHk.html)» flag must be set). In previous versions, the workaround was to show the real console (CtrlWinAltSpace), and temporarily work with it.


**A.** As a result of a ShellExecuteEx bug, on certain operating systems the console process was launched with an incorrect output buffer handle. To fix the problem, the «Inject ConEmuHk» flag must be set. If the problem persists - create a new [Issue](http://code.google.com/p/conemu-maximus5/issues/entry) with a detailed description of the problem, and attach the debug log of the launched program: «Settings -> Debug -> Shell and processes».




#### Q. A program does not work in «Long console output» mode.   {#q-1-13}


**A.** Certain programs don't work correctly with a long console buffer. Some examples are bview, Aurora, and others. There are multiple solutions:

* Open the program in a new ConEmu tab with scrolling disabled. Example: "bview.exe -new_console:h"
* Indicate that scrolling should not be enabled. Example: "ac.exe -cur_console:h"
* Alternatively, entirely disable 'Long console output' in the 'Tabs' page of the 'Settings' dialog, if long console output is not required.
