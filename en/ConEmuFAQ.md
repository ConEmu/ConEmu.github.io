---
title: ConEmu | FAQ - Frequently Asked Questions

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/ConEmuFAQ.html
   ru: /ru/ConEmuFAQ.html
---

# Contents

Frequenly asked user questions about ConEmu usage.

Please note, that this document has been written for a long period,
and some answers may be obsolete.
If you find any Q/A, which differs from other parts of
[documentation](TableOfContents.html),
please let us know via ‘Suggest better edit’ link at the bottom of the page.

  * [General](#q-1-general)
    * [Q. I found a bug, what should I do?](#q-1-1)
    * [Q. What about ConMan , alternative console, etc.?](#q-1-2)
    * [Q. What is the purpose of ConEmu .cer (digital certificate)?](#q-1-3)
    * [Q. How to import the certificate to the list of trusted root certificates?](#q-1-4)
    * [Q. What is an Apps key?](#q-1-5)
    * [Q. What is a Host key?](#q-1-6)
    * [Q. Not all characters (hieroglyphs, ellipses, copyright symbols etc.) are displayed](#q-1-7)
    * [Q. Is it possible to run a GUI application in a ConEmu tab?](#q-1-8)
    * [Q. How to launch an application in a new ConEmu tab?](#q-1-9)
    * [Q. How to use the '-new_console' parameter?](#q-1-10)
    * [Q. Which environment variables does ConEmu set?](#q-1-11)
    * [Q. Launched console program outputs nothing.](#q-1-12)
    * [Q. A program does not work in «Long console output» mode.](#q-1-13)
  * [Distribution package](#Distribution_package)
    * [Q. What is the purpose of `ConEmuSetup.*.exe`?](#q-2-1)
    * [Q. What is the purpose of ConEmuC.exe ( ConEmuC64 .exe)?](#q-2-2)
    * [Q. What is the purpose of the Far plugin ConEmu .dll ( ConEmu .x64.dll)?](#q-2-3)
    * [Q. What is the purpose of ConEmuHk .dll ( ConEmuHk64 .dll)?](#q-2-4)
    * [Q. What is the purpose of ExtendedConsole .dll ( ExtendedConsole64 .dll)?](#q-2-5)
  * [Portable version](#Portable_version)
    * [Q. Can ConEmu be portable?](#q-3-1)
    * [Q. When attempting to use « ConEmu .xml», the error message «XML setting file can not be used!» appears](#q-3-2)
    * [Q. Can ConEmu make launched applications portable?](#q-3-3)
  * [Updates](#Updates)
    * [Q. Can ConEmu update automatically?](#q-4-1)
    * [Q. What are the capabilities of the automatic updater?](#q-4-2)
  * [x64 issues](#x64_issues)
    * [Q. What is the purpose of the files ConEmuC.exe, ConEmuCD.dll and ConEmuHk .dll in 64-bit OS?](#q-5-1)
    * [Q. What is the purpose of the files ConEmuC64 .exe, ConEmuCD64.dll and ConEmuHk64 .dll in the 32-bit version of ConEmu ?](#q-5-2)
    * [Q. After running the commands start, echo (and other cmd.exe commands) on 64-bit systems, an error similar to "File not found. Cannot execute. start" appears](#q-5-3)
    * [Q. Attempts to launch applications (from Far Manager) causes a system error such as: «Error launching application (0xc0000142). Click "OK" to exit.»](#q-5-4)
    * [Q. What is going on with environment variables in 64-bit OS?](#q-5-5)
  * [Configuration](#Configuration)
    * [Q. Is it possible to set up ConEmu to open multiple tabs on startup (e.g. Far, CMD, PowerShell )?](#q-6-1)
    * [Q. Duplicate Far Manager windows](#q-6-2)
    * [Q. How to configure a bitmap font?](#q-6-3)
    * [Q. Why are horizontal lines (drawn using box drawing characters) discontinuous?](#q-6-4)
    * [Q. How to start several consoles in 2x2 grid](#q-6-5)
    * [Q. How do you configure ConEmu to run cmd.exe as an Administrator from an Explorer integration?](#q-6-6)
    * [Q. How do I give each tab opened by a {Task} a custom name?](#q-6-7)
    * [Q. How to set up Git Bash Here in ConEmu ?](#q-6-8)
    * [Q. How to export ConEmu settings?](#q-6-9)
    * [Q. How to attach a running console application to a new ConEmu instance?](#q-6-10)
    * [Q. How to delete items from the «Create new console» dropdown?](#q-6-11)
  * [Far Manager](#Far_Manager)
    * [Q. Why don't tabs work?](#q-7-1)
    * [Q. Why doesn't Drag-n-Drop (plugin) work?](#q-7-2)
    * [Q. How to close a tab (viewer/editor/Far) with the mouse?](#q-7-3)
    * [Q. Mouse events (clicks, wheel) are not sent to Far](#q-7-4)
    * [Q. Why doesn't the FarHints plugin work?](#q-7-5)
    * [Q. At some point, tabs / Drag-n-Drop / etc. stopped working](#q-7-6)
    * [Q. Right mouse clicks do not invoke the file/folder context menu.](#q-7-7)
    * [Q. Right mouse clicks invoke a graphical context menu, whereas a text one is desired.](#q-7-8)
  * [Windows Vista](#Windows_Vista)
    * [Q. The key combination Ctrl-Win-Alt-Space does not show the RealConsole .](#q-8-1)
    * [Q. Other console processes hang in Windows Vista.](#q-8-2)
  * [Abnormal termination](#Abnormal_termination)
    * [Q. Upon exiting from a console program, an error such as the following appears: Access violation at address 6F78DE5B in module ' ConEmuHk .dll'. Read of address 0071004E](#q-9-1)
    * [Q. ConEmu or console application hangs on exit](#q-9-2)
    * [Q. How to create a minidump](#q-9-3)
    * [Q. Where can I find Process ID (PID)](#q-9-4)
    * [Q. How to run Task Manager](#q-9-5)
    * [Q. ConEmuC: CreateFile (CONOUT$) failed, ErrCode =0x00000005](#q-9-6)
  * [Unsorted](#Unsorted)
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



## General  {#q-1-general}




#### Q. I found a bug, what should I do?   {#q-1-1}


A. First, make sure that the bug doesn't occur without ConEmu (e.g. running FAR directly, not via ConEmu). Next, make sure that the bug wasn't fixed [in the latest ConEmu version](http://www.fosshub.com/ConEmu.html). If the bug persists, [file a thoroughly detailed issue](http://code.google.com/p/conemu-maximus5/issues/list).




#### Q. What about ConMan, alternative console, etc.?   {#q-1-2}


A. Everything is built into ConEmu, except better ;) The flag 'MultiCon' should be enabled. Furthermore, using ConMan with ConEmu is NOT RECOMMENDED. A new console can be created using a keyboard shortcut (Win-W by default), as well as adding -new_console to the executed command. The current console can be closed or restarted (Win-~). The long output of a console command or program can be opened in Far's editor/viewer (Ctrl-O). Switching between consoles can be done with Win-Q. Switching between consoles and tabs can be done with Ctrl-Tab.




#### Q. What is the purpose of ConEmu.cer (digital certificate)?   {#q-1-3}


A. For validation of the integrity of ConEmu's executable files.


A. Windows SmartScreen blocks execution of files (Installer) from "unverified publishers".


A. If the certificate is imported into the list of trusted root certificates (for the user, machine or domain), launching ConEmu "As Administrator" (Vista & Win7) will display a less scary warning (program name + "verified publisher: ConEmu-Maximus5" instead of the scary "unverified publisher" window).


A. If the certificate is imported into the list of trusted root certificates, certain antivirus software (e.g. KIS) will consider the program as "trusted".




#### Q. How to import the certificate to the list of trusted root certificates?   {#q-1-4}


A. In Vista+ one can simply open the certificate file, and click the "Install certificate" button.


A. Via MMC -> Certificates snap-in.


A. Using the utility CertMgr from the Windows SDK:

~~~
   "C:\Program Files\Microsoft SDKs\Windows\v7.0\Bin\CertMgr" -add -c ConEmu.cer -s root
~~~

A. For details, see here: [Certificate installation](Certificate.html)




#### Q. What is an Apps key?   {#q-1-5}


A. [AppsKey](AppsKey.html).




#### Q. What is a Host key?   {#q-1-6}


A. This is sort of «substitution» for key chosed by user. For example you may choose common modifier (from one or more Ctrl/Alt/Shift/Apps) for group of actions. Browse «Keys & Macro» page in the Settings dialog.




#### Q. Not all characters (hieroglyphs, ellipses, copyright symbols etc.) are displayed   {#q-1-7}


A. For some reason, ConEmu failed to change the font of the real console. Select 'Debug' > 'Properties' from ConEmu's system menu, and on the 'Font' tab choose a TrueType font.


A. A missing or non-Unicode font was specified in ConEmu's settings (Settings-ConEmu.reg, 'ConsoleFontName' parameter).




#### Q. Is it possible to run a GUI application in a ConEmu tab?   {#q-1-8}

A. Yes, with **certain** GUI applications. Example: Putty, Notepad, and others.
Please note, that ConEmu can't modify [ChildGui](ChildGui.html) behavior,
and you may notice visual or controlling problems with applications,
which were not designed for embedding.
This is not a ConEmu's problem, please contact your application author.




#### Q. How to launch an application in a new ConEmu tab?   {#q-1-9}


A. Indicate the application in the 'Create new console' field of the new console creation dialog. This dialog can be opened by using the 'New console...' item from ConEmu's system menu, or by using the corresponding keyboard shortcut (Win-W or Win-Shift-W by default).


A. A new tab can be opened from an existing tab (e.g. from Far) by adding a '-new_console' parameter to the application's command line. Example: `putty.exe -new_console`.




#### Q. How to use the '-new_console' parameter?   {#q-1-10}


A. The setting 'Inject ConEmuHk' must be enabled in ConEmu's configuration. Afterwards, if ConEmu sees the '-new_console' parameter in a launched application's command line, it is removed from the command line, and the application/command is ran in a new ConEmu tab.


A. Additional launch options are available: `-new_console[:bh[N]caru[:user:pwd]]`

* `b` - Create background tab
* `h<height>` - Set buffer height: e.g., h0 - disable buffer, h9999 - enable buffer with 9999 lines
* `n` - Disable 'Press Enter or Esc to close console' message
* `c` - Explicitly enable 'Press Enter or Esc to close console' (default)
* `a` - RunAs shell verb (as Admin on Vista+, login/password in Win2k and WinXP)
* `r` - Run as restricted user
* `u` - Open ConEmu choose user dialog
* `u:<user>:<pwd>` - specify user/pwd in args. MUST BE THE LAST OPTION.

**Example:** «`"%ConEmuBaseDir%\ConEmuC.exe" /c dir "-new_console:bh9999c" c:\ /s`». Note that when launching from Far Manager, «`"%ConEmuBaseDir%\ConEmuC.exe" /c `» can be omitted.


A. For comfort, when using Far, one can configure a macro bound to ShiftEnter (see example in the distribution package).


A. Pay attention to the parameter `-cur_console:h[N]`, which allows controlling long output of commands or applications when running them from [Far Manager](ConEmuFAQ.html#Far_Manager).




#### Q. Which environment variables does ConEmu set?   {#q-1-11}


A. Read wiki page [ConEmu Environment](ConEmuEnvironment.html).




#### Q. Launched console program outputs nothing.   {#q-1-12}

**This question covers only [console applications](ConsoleApplication.html)!**

A. Certain programs work with the console's alternative buffer - e.g. telnet.exe, launched without parameters. A history of this issue can be read here: [Issue 65](http://github.com/Maximus5/conemu-old-issues/issues/65). The problem is fixed in version 120504 (the «Inject [ConEmuHk](ConEmuHk.html)» flag must be set). In previous versions, the workaround was to show the real console (CtrlWinAltSpace), and temporarily work with it.


A. As a result of a ShellExecuteEx bug, on certain operating systems the console process was launched with an incorrect output buffer handle. To fix the problem, the «Inject ConEmuHk» flag must be set. If the problem persists - create a new [Issue](http://code.google.com/p/conemu-maximus5/issues/entry) with a detailed description of the problem, and attach the debug log of the launched program: «Settings -> Debug -> Shell and processes».




#### Q. A program does not work in «Long console output» mode.   {#q-1-13}


A. Certain programs don't work correctly with a long console buffer. Some examples are bview, Aurora, and others. There are multiple solutions:

* Open the program in a new ConEmu tab with scrolling disabled. Example: "bview.exe -new_console:h"
* Indicate that scrolling should not be enabled. Example: "ac.exe -cur_console:h"
* Alternatively, entirely disable 'Long console output' in the 'Tabs' page of the 'Settings' dialog, if long console output is not required.



## Distribution package  {#Distribution_package}




#### Q. What is the purpose of `ConEmuSetup.*.exe`?   {#q-2-1}


A. Using the installer is recommended on computers with UAC enabled (Vista and higher), if you intend to install ConEmu to "Program Files".


A. The installer also contains some additional files, e.g. KeyEvents.exe.




#### Q. What is the purpose of ConEmuC.exe (ConEmuC64.exe)?   {#q-2-2}


A. This is the "console" component of ConEmu. It communicates information from the real console to the graphical shell (ConEmu.exe). This process also controls automatic buffer resizing when running commands/applications, and attaching "new" consoles (Shift-Enter in FAR) to ConEmu.




#### Q. What is the purpose of the Far plugin ConEmu.dll (ConEmu.x64.dll)?   {#q-2-3}


A. This module provides communication between Far Manager and ConEmu.

* It is required for certain extended features (tabs, Drag-and-Drop, progress).
* It is required for TrueColor in Far 3.x.
* It is required for certain other plugins (e.g. FarHints).
* It displays the hidden real console (with FAR), should ConEmu crash.
* After a console detach (Ctrl-Alt-Tab), it spawns a new ConEmu for the new console.
* It is required to retrieve the long output buffer for console applications.
* It is required for proper mouse function when using «far /w» (System\WindowMode=1).



#### Q. What is the purpose of ConEmuHk.dll (ConEmuHk64.dll)?   {#q-2-4}


A. This module is injected into applications ran in ConEmu. It is required to implement certain options, as well as work around multiple problems manifesting both with and without ConEmu.

* Z-order of GUI dialogues (without it, dialogues will appear behind ConEmu's window);
* Proper function of Far Manager GUI-EMenu (without ConEmuHk`*`.dll it refuses to close by mouse click);
* Implements the flags "No zone check", "Ascii sort...", "Hourglass if not responding";
* Implements the "-new_console" parameter;
* Works around ShellExecute problems (when batch file output does not appear in the console);
* Works around chcp hangs;
* Implements "Shell and processes" monitoring;
* Implements hosting of GUI applications in a ConEmu tab, etc.
* Implements ANSI X3.64 with xterm 256 color extension.
* Implements "Change prompt text cursor position with Left Click".
* And any other existing or future «inprocess» features.



#### Q. What is the purpose of ExtendedConsole.dll (ExtendedConsole64.dll)?   {#q-2-5}


A. This file implements support for the extended console feature in Far 3.x, and must be placed in the same directory as ConEmuHk.dll. In its presence and enabled «TrueMod support» option, it is possible to configure and use arbitrary (24-bit) colors and styles (bold/italic/underline) in Far Manager.




## Portable version  {#Portable_version}




#### Q. Can ConEmu be portable?   {#q-3-1}


A. Yes. To enable portable configuration, it is enough to create an *empty* file «ConEmu.xml» in the same directory as ConEmuC.exe or ConEmu.exe. The file may be created after ConEmu is loaded, which allows copying settings loaded from the registry to the XML file.




#### Q. When attempting to use «ConEmu.xml», the error message «XML setting file can not be used!» appears   {#q-3-2}


A. The error message explains itself: the interface IID_IXMLDOMDocument is not registered in the system registry. To avoid registering it, you can copy the files «msxml3.dll» and «msxml3r.dll» in the same directory as ConEmuC.exe or ConEmu.exe. The versions from Windows XP are preferred - they have the least dependencies, which allows them to work in Windows 2000.




#### Q. Can ConEmu make launched applications portable?   {#q-3-3}


A. This feature is under development - complete registry interception for launched applications is planned.




## Updates  {#Updates}




#### Q. Can ConEmu update automatically?   {#q-4-1}


A. Yes. ConEmu can check for new versions on launch, every hour, or by user request (System menu -> Help -> Check for updates).




#### Q. What are the capabilities of the automatic updater?   {#q-4-2}


A. You can configure updates however you like it.

* Proxy support.
* Selection between «stable» or «alpha» builds.
* In the presence of a new version, ConEmu can ask for confirmation before downloading the package (archive or installer).
* If ConEmu was installed using the installer, and the install path for ConEmu.exe (or ConEmu64.exe) coincides with the current process, updating is done using the installer («`ConEmuSetup.*.exe`»).
* Otherwise, updating is done using the 7-zip archive.
* Updating from the archive requires that file compression software ([7-Zip](http://www.7-zip.org/) or [WinRAR](http://www.rarlab.com/)) is installed.
* By default, packages are downloaded to %TEMP% and deleted after installation is complete.
* However, you can indicate any directory, and choose not to delete installed packages.
* The installation command is ran from a temporary .cmd-file, launched in the directory containing ConEmu.exe. The .cmd-file is created in %TEMP%.
  * The default installer command is: `"%1" /p:%3 /qr`. It launches the corresponding (x86/x64) MSI package with the `/qr` parameter (silent update).
  * The default archiver command is: `<archiver> x -y "%1"`. `<archiver>` is substituted with the full path to any file compression software, capable of unpacking 7-Zip archives: [7zg.exe, 7z.exe](http://www.7-zip.org/), [Unrar.exe, WinRar.exe](http://www.rarlab.com/), etc.
* Launching the update script (.cmd-file) is done after ConEmu closes (all tabs are closed), if the user consents.
* Before launching the update script, ConEmu checks that no other ConEmu windows are open.
* After a successful update, you can run any command or script (via cmd.exe). For example, you can copy the new files to other directories, if you have multiple ConEmu installations on your computer. By default, the file ConEmuUpdate.info is created in the same directory as ConEmu.exe, containing a timestamp of the last update.
* New versions are polled from [this URL](http://conemu-maximus5.googlecode.com/svn/trunk/ConEmu/version.ini). This address can be configured in the registry or XML using the "Update.VerLocation", should the need arise (e.g. centralized updating in a networked environment?).



## x64 issues  {#x64_issues}




#### Q. What is the purpose of the files ConEmuC.exe, ConEmuCD.dll and ConEmuHk.dll in 64-bit OS?   {#q-5-1}


A. These files are required for launching 32-bit applications, as well as functioning of the 32-bit version of ConEmu. You will likely at some point need to run a 32-bit console application from ConEmu - without these files, it would not be possible. Out of principle, one can use the 64-bit ConEmu64.exe, which is available in the «`ConEmuSetup.*.exe`» package - it launches ConEmuC64.exe as the root console process.




#### Q. What is the purpose of the files ConEmuC64.exe, ConEmuCD64.dll and ConEmuHk64.dll in the 32-bit version of ConEmu?   {#q-5-2}


A. These files are required to run 64-bit applications in 64-bit OS.




#### Q. After running the commands start, echo (and other cmd.exe commands) on 64-bit systems, an error similar to "File not found. Cannot execute. start" appears   {#q-5-3}


A. This is most likely caused by the absence of ConEmuC64.exe and accompanying ConEmuHk64.dll, ConEmuCD64.dll.




#### Q. Attempts to launch applications (from Far Manager) causes a system error such as: «Error launching application (0xc0000142). Click "OK" to exit.»   {#q-5-4}


A. The cause is as of yet undiscovered - it is suspected to be a problem in Windows. Note that the error also appears without ConEmu. To restore proper function, restart the console (e.g. using Win-~).




#### Q. What is going on with environment variables in 64-bit OS?   {#q-5-5}


A. ConEmu does not control environment variables.




## Configuration  {#Configuration}




#### Q. Is it possible to set up ConEmu to open multiple tabs on startup (e.g. Far, CMD, PowerShell)?   {#q-6-1}


A. Yes. Use a startup command file. Example - create **startup.txt** with the contents:

~~~
>E:\Source\FARUnicode\trunk\unicode_far\Debug.32.vc\far.exe
*/BufferHeight 400 cmd
/BufferHeight 1000 powershell
~~~

and run ConEmu like this:

~~~
conemu.exe /cmd @startfile.txt
~~~

Each line in the file corresponds to a launched command. You may specify the console buffer height using the /BufferHeight parameter. If the line starts with "`>`", this tab will be active on startup. If the line starts with "`*`", this command will be ran with administrator privileges.




#### Q. Duplicate Far Manager windows   {#q-6-2}


A. The real console was not hidden. Check the 'Visible' flag on the 'Features' tab in the 'Settings' dialog, or this registry value:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
"ConVisible"=hex:00
~~~



#### Q. How to configure a bitmap font?   {#q-6-3}


A. The bitmap fonts selectable in the standard console's properties are actually the Terminal font. For example, the bitmap '8 x 12' font is 'Terminal 12 x 8' in ConEmu, '12 x 16' -> 'Terminal 16 x 12', etc.

> Take note: The 'Charset' field must be set to 'OEM'. 
> Personally, I prefer 'Fixedsys 16 x 8', which is absent in the standard console.


A. In the font list you may directly select e.g. `[Raster Fonts 8x12]`.




#### Q. Why are horizontal lines (drawn using box drawing characters) discontinuous?   {#q-6-4}


A. In some fonts, the width of the corresponding box drawing characters is shorter than the font's declared average character width, which ConEmu uses to determine the size of box drawing characters. To get rid of the artifacts, enable the checkbox «Fix Far borders» and increase the width of the "frames" font. The corresponding settings are on the 'Main' tab in the 'Settings' dialog.




#### Q. How to start several consoles in 2x2 grid   {#q-6-5}


A. The question from [superuser.com](http://superuser.com/q/473807/139371). ConEmu (build 120909 or higher recommended) provides [SplitScreen](SplitScreen.html) feature. You may set up named task to open several consoles on startup in the grid. Here the example for 2x2 grid.

~~~
>cmd -cur_console:n
cmd -cur_console:s1TVn
cmd -cur_console:s1THn
cmd -cur_console:s2THn
~~~



#### Q. How do you configure ConEmu to run cmd.exe as an Administrator from an Explorer integration?   {#q-6-6}


A. Read the answer on [superuser.com](http://superuser.com/q/470408/139371).




#### Q. How do I give each tab opened by a {Task} a custom name?   {#q-6-7}


A. Read the answer on [superuser.com](http://superuser.com/q/459154/139371).




#### Q. How to set up Git Bash Here in ConEmu?   {#q-6-8}


A. Read the answer on [superuser.com](http://superuser.com/q/454380/139371).




#### Q. How to export ConEmu settings?   {#q-6-9}


A. Read the answer on [superuser.com](http://superuser.com/q/450144/139371).




#### Q. How to attach a running console application to a new ConEmu instance?   {#q-6-10}


A. Read the answer on [superuser.com](http://superuser.com/q/445394/139371).




#### Q. How to delete items from the «Create new console» dropdown?   {#q-6-11}


A. Read the answer on [superuser.com](http://superuser.com/a/436273/139371).




## Far Manager  {#Far_Manager}




#### Q. Why don't tabs work?   {#q-7-1}


A. In the plugin ConEmu.dll (ConEmu.x64.dll) installed?


A. When using the installer, the ConEmu.dll plugin might have been installed to an incorrect directory (it must be installed in a subdirectory of the Plugins directory for Far.exe). The installer might have failed to locate Far.exe's location, if Far Manager wasn't installed using the MSI package. The easiest solution is to uninstall and reinstall ConEmu, but make sure that the 'Far Manager plugins' field points to the correct directory.


A. Is the flag 'Enable Tabs' enabled in settings? If the checkbox is in the indeterminate (3rd) state, tabs will only appear when a viewer/editor is opened.




#### Q. Why doesn't Drag-n-Drop (plugin) work?   {#q-7-2}


A. «Shell style Drag and Drop» is built-in ConEmu and is configured on the 'Far Manager' tab of the 'Settings' window. ConEmu supports dragging files out of Far and onto other applications (Explorer, GIMP, etc.) and dropping files into Far (onto the panel or command-line) from other applications. For proper support of «Shell style Drag and Drop», the Far plugin ConEmu.dll (ConEmu.x64.dll) must be installed. ConEmu can drag files with both the left (LDrag flag) as well as right (RDrag) mouse buttons. Optionally, a modifier key can be configured (e.g. drag files only with the left mouse button and when LCtrl is held down).


A. Screenshots and some explanations can be seen/read here:
[Issue 527](http://github.com/Maximus5/conemu-old-issues/issues/527).


A. 3rd-party Drag-n-Drop plugins were never supported, are not supported and will not be supported, as this functionality is built into ConEmu.




#### Q. How to close a tab (viewer/editor/Far) with the mouse?   {#q-7-3}


A. A Ctrl + Right-click will activate the tab and send a close request to Far Manager. You can redefine the macro on the 'Far Manager' tab of the 'Settings' dialog ('Close tab' field).


A. A simple right-click will activate the tab and display the context menu, from which you may select 'Close'.




#### Q. Mouse events (clicks, wheel) are not sent to Far   {#q-7-4}


A. In Far, check the setting Options -> Interface settings -> `[x]` Mouse.


A. If Far is launched with «far /w» (System\WindowMode=1), the presence of the ConEmu.dll (ConEmu.x64.dll) plugin is required, otherwise ConEmu will consider Far as a simple console application (like cmd.exe) which does not need mouse events.




#### Q. Why doesn't the FarHints plugin work?   {#q-7-5}


A. It must be updated (version 1.0.15 or newer) and it requires the presence of the ConEmu.dll (ConEmu.x64.dll) plugin.




#### Q. At some point, tabs / Drag-n-Drop / etc. stopped working   {#q-7-6}


A. Check the 'Info' tab of the 'Settings' dialog. Most likely, the 'Far' / 'Panels' state is not set. Take note - D&D requires the ConEmu.dll (ConEmu.x64.dll) plugin.




#### Q. Right mouse clicks do not invoke the file/folder context menu.   {#q-7-7}


A. Is the flag 'RightClick 4 context menu' set? If the checkbox is in the indeterminate state, the menu will appear after a 'long click' - wait for the circle around the mouse cursor to close.


A. For some reason, ConEmu did not detect the 'panels' state in Far. The ConEmu.dll (ConEmu.x64.dll) plugin may not be installed. If it is installed, please send screenshots of ConEmu ('Info' tab from 'Settings' dialog) and a screen dump file (ConEmu system menu -> Debug -> Dump screen...).




#### Q. Right mouse clicks invoke a graphical context menu, whereas a text one is desired.   {#q-7-8}


A. Configure the corresponding macro in the 'Far Manager' tab of the 'Settings' window. Example: `F11 e Enter 2` (assumes that the 'e' hotkey is assigned to the EMenu plugin).




## Windows Vista  {#Windows_Vista}




#### Q. The key combination Ctrl-Win-Alt-Space does not show the RealConsole.   {#q-8-1}


A. For some reason, the first Space press is sometimes ignored by Vista. Without releasing Ctrl-Win-Alt, hit Space once more.




#### Q. Other console processes hang in Windows Vista.   {#q-8-2}


A. The fault lies with the ConIme.exe process. It seems to be required for input of hieroglyphs (Chinese etc.) in console windows. Why is it needed, if input is done in a graphical window? Forbid its startup, or simply rename the file, e.g. to 'ConIme.ex1' (Safe Mode only). To forbid its startup, apply the following to your registry and reboot:

~~~
[HKEY_CURRENT_USER\Console]
"LoadConIme"=dword:00000000
~~~



## Abnormal termination  {#Abnormal_termination}




#### Q. Upon exiting from a console program, an error such as the following appears: Access violation at address 6F78DE5B in module 'ConEmuHk.dll'. Read of address 0071004E   {#q-9-1}


A. One possible cause is when the program destroys its own import table. The proper solution would be to contact the application developer. For a precise verdict, send me a [minidump](MemoryDump.html).




#### Q. ConEmu or console application hangs on exit   {#q-9-2}


A. No issues for this problem have been filed so far. Nevertheless, if hang occures on exit, create [minidumps](MemoryDump.html) for the processes ConEmu`*`.exe, ConEmuC`*`.exe and all console processes (far.exe, cmd.exe...) See below for instructions. Pack up and submit the [minidumps](MemoryDump.html) to the developer. To correctly create a [minidump](MemoryDump.html) of a 32-bit application in a 64-bit OS, you must use ConEmu.




#### Q. How to create a minidump   {#q-9-3}


A. **Windows XP and above.**

Press `Win+R` and run the following command, it will create a full process memory dump (it may be large enough).

~~~
C:\Program Files\ConEmu\ConEmu\ConEmuC.exe /DEBUGPID=Your_PID /FULL
~~~
Or, create a small process memory dump. Yes, it will be small, but may contains not enough information for detecting a problem. 
~~~
C:\Program Files\ConEmu\ConEmu\ConEmuC.exe /DEBUGPID=Your_PID /MINI
~~~

Substitute *Your_PID* with the process ID, [read below](MemoryDump.html#How_to_find_Process_ID_(PID)).
You will be offered to choose filename for a minidump.

**Warning!** Before creating dumps of Far Manager please ensure that "far.exe" was started with "/x" switch.

A. **Windows 7 and up.**

*Warning! This method only works for processes with the same bitness as the operating system.
Therefore, you won't be able to create a working minidump for 32-bit processes when using a 64-bit Windows version.*

Open Windows' Task Manager, switch to the "Processes" tab, right-click the process, and select "Create dump file".


A. **Process Explorer.**

‘Process Explorer’ can also create minidumps,
however *it will also fail to create a correct minidump for a 32-bit process on a 64-bit system*.



#### Q. Where can I find Process ID (PID)   {#q-9-4}


A. You can find the Process ID near to Process Name (ConEmu.exe, cmd.exe, etc.)

* in Windows' Task Manager, PID column on Processes page;
* in the ConEmu status line;
* in the Info page of ConEmu [Settings](Settings.html#Info) dialog.

**Note!** Sometimes PID column in the Task Manager window may be hidden, enable it in Task manager settings.

* Windows 7 and below: Task Manager -> Processes tab -> Menu -> View -> Select Columns -> Check «PID».
* Windows 8: Task Manager -> Show «More details» -> Processes tab -> Right click on column title -> Check «PID».



#### Q. How to run Task Manager   {#q-9-5}


A. Press **Ctrl+Shift+Esc** or right click on taskbar and choose menu item «Task Manager».




#### Q. ConEmuC: CreateFile(CONOUT$) failed, ErrCode=0x00000005   {#q-9-6}


A. The launched program created and set up its own console buffer created using `CreateConsoleScreenBuffer(..., 0/*No sharing*/, ...)`. Ask the program author to create the buffer with the correct access flags:

~~~
(GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ|FILE_SHARE_WRITE,...)
~~~



## Unsorted  {#Unsorted}




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
