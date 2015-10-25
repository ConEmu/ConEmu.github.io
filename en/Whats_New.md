---
title: "ConEmu | Whats_New 150111..Current"

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: WhatsNew.html
   title: WhatsNew

otherlang:
   eng: /en/Whats_New.html
   rus: /ru/Whats_New.html
---

# ConEmu changes log

New ConEmu builds arrives often, at least weekly.
It's recommended to enable [Automatic Update](SettingsUpdate.html)
to get [Preview or Alpha](VersionComparison.html#release-stages)
builds as soon as they are released.




## Any contributions are appreciated

ConEmu-Maximus5 was brought to life and is supported by almost single developer efforts.
The most valuable resource is time actually, hundreds of hours.
You can show your appreciation and support further development and maintaining by contributing with
[bugreporting](Issues.html),
[funding](/donate.html#funding),
[helping with documentation](https://github.com/ConEmu/ConEmu.github.io),
[coding](https://github.com/Maximus5/ConEmu),
[voting](Awards.html#Voting)
or anything else, spreading the word for example.



{% for post in site.posts %}{%if post.build %}
<article>
<h2 id="Build_{{ post.build }}"><a href="{{ post.url }}">Build {{ post.build }}</a></h2>
{{ post.content }}
</article>
{% endif %}{% endfor %}



{% raw %}

<!-- Content starts -->



## Build 150707  {#Build_150707}

* This build changes the download procedure used within automatic updates.
    ConEmu.exe (GUI) do not call WinInet functions anymore, instead it calls
    the downloader tool (ConEmuC.exe is an only option at the moment).
    This will eliminate accidental crashes of GUI after resume from sleep.
* The downloader itself has new options.
  * If user omit dst file name - try to get it from Url.
  * If "-" was specified as dst file name or output is redirected - just write contents to stdout.
  * New switch `-agent <name>` was implemented.



## Build 150705  {#Build_150705}

* Script `ConEmu/GitShowBranch.cmd` was improved.
* Highlight & goto was broken at least for powershell scripts (c8c386a regression).
    Only file name (path) was highlighted without following line number.
* Highlight & goto detector was failed if mouse was before first backslash of the path.
* gh#205: TabBar was not shown on startup in some monitor configurations (bacc66d regression).



## Build 150701  {#Build_150701}

* Add optional '/Silent' switch to suppress environment exporting messages.

		  ConEmuC [/SILENT] /EXPORT[=CON|GUI|ALL] [Var1 [Var2 [...]]]

* gh#193: Fix wrong condition: ‘Warn if MacType hookers are loaded’.
* Omit ConEmuC export variables message in GitShowBranch.cmd.
* gh#174: Let paste to all ‘grouped input’ consoles at once.
* Show actual hotkey instead of default Ctrl+BackSpace in Settings.
* Vert/Horz text cursor was displayed in wrong position especially on DBCS systems.
* Ctrl+BackSpace feature was not working on DBCS systems.
* Redirect chocolatey downloads to github.
* gh#204: ConEmu hung on startup in some cases while initializing default tasks.



## Build 150629  {#Build_150629}

* Attach (Win+G) was not succeeded if ConEmu has different bitness.
* Grab palette from Win+G attached consoles (Vista+) and create new
    if matching one was not found. These palettes ‘#Attached:XX’ are not
    saved automatically, but will be when user presses ‘Save settings’ button
    in the settings dialog.
* gh#193: Show hookers warning once per day.
* Show real names for ‘Win+Number’ and ‘Win+Arrows’ on the Controls page.
* Search for static text control in the Settings dialog was failed.
* Issue 1977: Don't change RealConsole height on tabs auto-show/hide,
    resize ConEmu window height instead.
* Add some urls to ConEmu.nuspec (chocolatey).
* When tabs are auto shown icon was not loaded for the first tab.
* Environment variables export was improved (some internal fixes).


## Build 150621  {#Build_150621}

* Use recommended launcher for Git-For-Windows bash (default tasks).
* Try to create default task for GitSDK bash.
* Let Settings\Environment page use one line for one command.
    This will make concrete set commands with quotation marks.
    Following two commands are equal.

        set "PATH=C:\Program Files\ConEmu;%PATH%"
        set PATH=C:\Program Files\ConEmu;%PATH%

    But you still have to use quotations to keep trailing spaces

        set "VarName=This is my value   "

* Support empty lines and comments on the Settings\Environment page.
  You may comment lines with `#`, `//`, `--` or `REM `.
* gh187: Highlight and goto did not work when filename not finished by :[space] or :[number].
* Improve default task names unification and sorting.
* The arrow char was inserted into Far Manager prompt after selecting text with Alt+Mouse.
* Fix xml search path for Git-For-Windows package.
  Correct one is `/opt/share/conemu/ConEmu.xml` while `ConEmu.exe` is placed
  in `/opt/bin` folder.
* Error code was not shown properly if DefTerm inject fails.



## Build 150610  {#Build_150610}

* Simplify `set` usage in Settings\Environment.
* gh#179: Fix broken environment inheritance (ca9e31a regression).
* Ensure that `set` commands in the task/command line will override ConEmu's default environment (settings page).
* GuiMacro: Make Task and Shell functions synchronous to be able to use Context function after it.
* GuiMacro: Return more information about wrong macro.
* GuiMacro: Easify calling functions with int arguments. "Sleep 500;" was not working.
* GuiMacro: Sleep function have not returned "OK" on success.
* Allow using `-new_console` and `-cur_console` switches to set DosKey aliases.
* Support aliases set up on the ConEmu Settings/Environment page. <br/>
    **Note!** These console aliases are processed by `cmd.exe` and `far.exe` only.
    If you need to set up aliases for other shells (PowerShell, bash, etc.)
    please refer to their manuals.  
    Defining aliases are similar to `doskey.exe`.
    Actually, you may define:

        alias alias=doskey $*

    After that you can use `alias` in the `cmd.exe` prompt started in ConEmu:

        alias sudo=ConEmuC -c $* -new_console:an

    That is just an example. It's more handy to add `sudo` definition into
    ConEmu Settings/Environment page.
    And when `sudo` is defined you may run from `cmd.exe` prompt, for example:

        sudo diskpart

* gh#176: Avoid creating two tabs while starting:

        git-bash.exe --command=usr/bin/bash.exe -l -i

    However, preferred way to start Git-For-Windows in ConEmu tab is:

        git-cmd.exe --command=usr/bin/bash.exe -l -i

* Update ConEmuPortable.ini with Environment information.



## Build 150608  {#Build_150608}

* Quake mode enabled by `-quake` command line switch was not shown in Fast Configuration dialog.
* Suggest the task user specified by `ConEmu.exe -cmd {cmd}` in Fast Configuration dialog.
* Don't set default task in Fast Configuration dialog, use exact `-cmd ...` command specified by user.
* gh#151: Do (quake) animation after starting RealConsole creation.
* Add `-here` switch description in the About dialog.
* Ensure all default bash tasks names will be unique.
* Always reset FARHOME env.var when creating default Far tasks.
* Move checkboxes ‘Add ConEmu??? to PATH’ to separate page ‘Environment’.
* gh#171, Issue 1655: Add option to skip ‘... brought ConEmu OnTop. Revert?’ confirmation.
* gh#173: Attach of detached console ignored new ConEmu instance.
* gh#173: Implement Unfasten of console tabs (ChildGui not yet). Tab menu item, hotkey and GuiMacro.
* Implement ‘Settings\Environment’ page.
		User may define here multiple "set varname=varvalue" commands
		or set default console code page with "chcp utf-8", "chcp 866" and so on.
		Environment %variables% in 'varvalue' are allowed and would be expanded before do set.
		One line - one command (set or chcp).
* Create folder "ConEmu\Scripts" by installer.
		May be useful for storing user scripts (bat-files and so on).
		It would/may be added to PATH in the Settings\Environment page.
* Git-For-Windows: Search for xml in /share/conemu while ConEmu.exe is intended to be in /opt/bin.
* Log and warn (debug assertion) long alternative buffer loading.
* Many MINGW-build related fixes from @Alexpux.



## Build 150513  {#Build_150513}

* Don't show [reg] or [xml] in Fast Configuration dialog because there is the storage location field.
* gh#142: Win+Left/Right didn't snap window if it was maximized.
* gh#139: If Quake was hidden when user presses Win key (Start menu), ConEmu was unexpectedly slided down after second Win press (after menu was hidden).
* Garbage was shown sometimes while searching in Settings dialog.
* gh#143: Add CygWin bash default tasks by checking registry (for new config).
* RealConsole pause refactoring.
* Execute RedrawWindow in the server process to avoid access violation.



## Build 150504  {#Build_150504}

* Jump list command was built erroneously if there was ‘-FontDir ...’ or some other switch.
* The field ‘Startup task’ was not filled in the ConEmu Fast Configuration dialog.
* Fix ChocolateyAbout.cmd script, correct PATH suggestion and powershell command.
* Check if Chocolatey is already installed and show the path (ChocolateyAbout.cmd).
* gh#127: ConEmu did not stay minimized if a new console tab was opened in background.
* gh#106: ChildGui turned black after ConEmu was restored.



## Build 150428  {#Build_150428}

* Reset `FARHOME` env.var when creating default {Far} task without full path to `far.exe`.
* Default/startup task may be not initialized properly if saved config was partial.
* Show proper error code in StatusBar if restart console was failed.
* gh#121: Selecting 'No' when restarting console as admin produced error state.



## Build 150427  {#Build_150427}

* gh#112: Python with Tk: rightclick menu window not showing.
* Set `FARHOME` env.var in default created Far tasks.
    That is because otherwise FARHOME may hold wrong value
    and plugins may be loaded from wrong place.
    So, the example task `{Far Manager::Far 3.0 x64}` will be:

        set "FARHOME=C:\Program Files\Far Manager" & "%FARHOME%\far.exe" /w /p"%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins"

* Show link to ConEmuArgs.html on bad switch using.
* If tab is renamed manually or via `-new_console:t:???` new name will be shown in ConEmu window title.
    Now it's possible to create some AHK scripts checking ConEmu title.
* xterm keys: `Ctrl+Home`, `Ctrl+End`, `Ctrl+Ins`, `Ctrl+Del`, `Ctrl+PgUp`, `Ctrl+PgDn`.



## Build 150420  {#Build_150420}

* Warn if MacType hookers are loaded in ConEmuC/ConEmuC64. User have to exclude these processes in the MacType configuration.
* Allow to quit ConEmu by cross-clicking in the ‘Fast configuration’ dialog.
* Startup task field was not filled properly in the Fast configuration dialog sometimes.
* User had to press `Enter` to start find text from SearchBox if the match was above visible area.
* Clean up ConEmu_Tilde.xml from default settings.



## Build 150419  {#Build_150419}

* DefTerm. First VisualStudio debugging session was not processed by DefTerm.
* Default settings were not applied on first start (suggested startup task).
* gh#104: Add default task for Git-for-Windows-v2.
* gh#107: Quoted Task names were not working after ConEmu.exe `-cmd` argument.
* Warning 'Maximum real console size was reached' was appeared sometimes during several splits tab closing.



## Build 150416  {#Build_150416}

* gh#96: DefTerm was failed to hook VS Debugging console applications. Avoid deadlocks.
* Issue 1965: Correct 3rd state condition for ‘Change prompt text cursor position with LClick’.
* gh#99: Make Update confirmation dialog a child of main ConEmu window.
* Show in the update confirmation dialog the type of action: x86/x64 for installer or (7-Zip).
* Allow using tasks in ‘Recreate’ dialog.
* Let's create default tasks {Bash::Msys2-64} and {Bash::Msys2-32} in new configs.
* Add tab icon to default tasks: {Bash::MinGW bash}, {Bash::CygWin bash}, {SDK::WinSDK x.x}.
* Use "CmdInit.cmd" instead of direct "set PROMPT=..." in default cmd's tasks.



## Build 150409  {#Build_150409}

* gh#63: Option ‘Auto save/restore tabs’ was conflicted with unchecked ‘Quit on close’.
* Some of GuiMacro functions must be executed in the main thread only.



## Build 150408  {#Build_150408}

* Far plugins folder can't be configured in MSI-installer anymore.
    They are installed in `%ConEmuDir%\Plugins`.
    If you need separate Far installations - use `Far.exe /p...` switch.
* Issue 1590: Speed up cygwin commands execution.
* Show process information in the ‘Injecting remove failed’ message.
* Don't add spare default Far tasks, UnExpand paths if possible.



## Build 150405  {#Build_150405}

* Redesign ‘Fast configuration’ dialog. Add ‘Start command’, ‘Palette’, ‘Quake style with HotKey’.
* Choose preferred startup Task for new configs (Far -> TCC -> NYAOS -> cmd).
* Fix wrong position of duplicate hotkey warning balloon.
* Detect console buffer corruption and log it.Sometimes during kmk build script execution something very bad happens
		with console buffer and lines like following were written to log

        RefrThread CurSize={-18544x31} :ReadConsoleInfo (skipped=1)

    After that an assertion appears like

        nNewWidth>0 && nNewHeight>0 at RealBuffer.cpp:1784



## Build 150331  {#Build_150331}

* gh#88: Allow ‘Apps’ key to use as single hotkey.
* [GuiMacro](GuiMacro.html). Bugfixes and new function.
  * Function delimiter ‘;’ was ignored without brackets.
  * Support escapes in C-strings with "ConEmu -GuiMacro ...".
  * ‘Shell’ function without args must create new console.
  * Some functions will be postponed when RCon initialization finishes. To force postponing add ‘@’ prefix.
  * Add ‘Recreate’ function (‘Create’ is an alias).
			It can open ‘New console’ dialog, create default shell without confirmation,
			restart current tab (pane), optionally as Administrator.
			Following example shows ‘New console’ dialog, and inserts into started
			command prompt: ‘echo "Hello world"’.

        ConEmu.exe -Detached -GuiMacro "Create(0,1); Context; print(\"echo \\\"Hello world\\\"\");"



## Build 150327  {#Build_150327}

* All links were updated to ‘http://conemu.github.io’.
* Default StatusBar columns were changed.
* In some cases font size (StatusBar, TabBar) was smaller than expected in new configs.
* Allow to stop buzzing when started with '-basic' switch.
* [Сhocolatey packets](AutoInstall.html#cinst) are released officially now.



## Build 150319  {#Build_150319}

* Some required switches were not used while creating jump lists (`/FontDir`, `/FontFile`, etc.)
* `PostPromptCmd` was not working with Far 3.
* Added hotkey to activate ConEmu window and do ‘CD’ to the last (top in Z-order) Explorer window path. [GuiMacro](GuiMacro.html) is available:

        PasteExplorerPath (<DoCd>,<SetFocus>)
        DoCd: 1 - ‘CD’, 0 - paste path only
        SetFocus: 1 - bring ConEmu to the top, 0 - don't change active window



## Build 150316  {#Build_150316}

* [Issue 1931](http://github.com/Maximus5/conemu-old-issues/issues/1931):
    Fix crash and broken Far frames after resize (regression).
* Inform user about some project events using TaskBar status area notification. Click on the icon or information balloon will show extended information dialog where user may stop showing this notification.
* Translate mouse wheel into escape sequences when ConEmu emulates xterm (vim especially). If you want to use mouse wheel in Vim (official version was tested), just add to vimrc:

        """"""""""""""""""""""""""""""""""""""
        " let mouse wheel scroll file contents
        """"""""""""""""""""""""""""""""""""""
        if !has("gui_running")
            set term=xterm
            set mouse=a
            set nocompatible
            inoremap <Esc>[62~ <C-X><C-E>
            inoremap <Esc>[63~ <C-X><C-Y>
            nnoremap <Esc>[62~ <C-E>
            nnoremap <Esc>[63~ <C-Y>
        endif

* Let user set up hotkey for ‘Detach’ action. Add [GuiMacro](GuiMacro.html) ‘Detach’.
* All HotKeys are stored now in the "`HotKeys`" settings subkey.
* If anyone like to hide cursor in the inactive consoles just have to set inactive ‘Fixed cursor size’ to ‘0%’.



## Build 150311  {#Build_150311}

* Try to fix full-width hieroglyphs drawing.
* Hangul syllables were not defined in CJK range.
* We need real width of CJK hieroglyphs, they might not be double as large.
* Don't try to use invalid fonts from registry (TrueTypeFont) on DBCS systems.
* Current unicode range was doubled in drop-down.
* Apply changes in unicode ranges immediately if was selected from drop-down.
* Do not uncheck ‘Monospace’ on DBCS systems by default.



## Build 150310  {#Build_150310}

* Mouse events were sometimes unexpectedly sent to the console during selection.
* 150309 regression. "`ConEmu.ico`" was looked in wrong folder.
* Overlay icon on Win7 TaskBar was not shown in some cases.
* Name checkbox ‘Alternative font ...’ instead of ‘... pseudographics font’.
* TaskBar aero thumbnail of active console was not live-updated if ConEmu was minimized.
* Don't use ‘Enhance progressbars and scrollbars’ for cells with `bg==gf` unless it is `100%` filled block.
* Search panel was too small in some cases.
* [Issue 1939](http://github.com/Maximus5/conemu-old-issues/issues/1939):
    Tab bar height too big since version 150307.


    
## Build 150309  {#Build_150309}

* [Issue 1937](http://github.com/Maximus5/conemu-old-issues/issues/1937):
    ‘Admin shield’ in TabBar was broken.
* Only use "`ConEmu.ico`" name as possible external icon.
* Logging. Log ConEmu icon loading, created startup consoles, overlay icon actions.



## Build 150307a  {#Build_150307a}

* [Issue 1931](http://github.com/Maximus5/conemu-old-issues/issues/1931),
    gh#67: ConEmu's output was blocked after maximizing window.



## Build 150307  {#Build_150307}

* gh#65: Min size for active cursor changes were not saved.
* Create toolbar buttons as large as the size of the tabbar.
* Take current dpi into account while creating tab icons.
* [Issue 1929](http://github.com/Maximus5/conemu-old-issues/issues/1929):
    Quake position was changed unexpectedly after Win+D / restore.
* [Issue 1792](http://github.com/Maximus5/conemu-old-issues/issues/1792):
    Unexpected console resize happens after Win+D Win+D.
* gh#66: New tab template ‘%f’ shows shell's current folder name. Check wiki [ShellWorkDir](ShellWorkDir.html).



## Build 150305  {#Build_150305}

* Wrong tab was activated sometimes by mouse click if there was a scroll buttons on the TabBar.
* Do not do tab flickering while switching them by mouse clicks.
* White background flickering was occured sometimes during ConEmu startup.
* Default tasks were created sometimes not properly quoted.
* Add ‘Ranges’ drop-down list to pseudographics font settings with some predefines.
* [Issue 1927](http://github.com/Maximus5/conemu-old-issues/issues/1927):
    Key-Up event for ‘Space’ and ‘Enter’ in ReadConsoleInputA.
* gh#63: Switch `-cur_console:d:...` was not stripped from Task while running shell sometimes.
* While creating 'Auto save/restore' task add all `-cur_console` switches before the shell itself.



## Build 150303  {#Build_150303}

* [Issue 1925](http://github.com/Maximus5/conemu-old-issues/issues/1925):
    Single character between two gray blocks was obscured (ex. OEM ‘B1 C1 B1’).



## Build 150302b  {#Build_150302b}

* Far Tasks. Show bitness x86/x64 in the task name.
* Far Tasks. If only one Far installation found - just use {Far} as task name.
* Far Tasks. Sort default Far tasks by version.
* When dropping files in the Far Manager prompt, show ‘+ Enter’ menu items first.
* TCC tasks were not created by default.
* [Issue 1923](http://github.com/Maximus5/conemu-old-issues/issues/1923): ‘ConEmu here’ was forced to "`%USERPROFILE%`" from certain folders. If user starts ‘ConEmu here’ from "`%ConEmuDir%`", "`%windir%`" or "`%windir%\system32`" ConEmu was switched to "`%USERPROFILE%`". That's because these folders may be used if user starts ConEmu (or just cmd as [DefTerm](DefTerm.html)) from bare Win+R. So, the switch "`/here`" was implemented, it's not shown in the Settings dialog. User needs to re-register ‘ConEmu here’ existing commands.
* Process ‘`ConEmu[64].exe`’ returns exit code of last terminated shell.
* Switch "`/QuitOnClose`" forces ConEmu window closing with last tab.



## Build 150302a  {#Build_150302a}

* [Issue 1921&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1921): Regression: Fix a crash on last tab close (WinXP).



## Build 150302  {#Build_150302}

* Show current tab icon as Windows 7 taskbar overlay icon.
* Visible region lock (scrolling) was unexpectedly dropped sometimes.
* Add all installed (and found) Far Manager installations while creating default tasks.
* [Issue 1920&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1920): Fix visual defect in window padding area during Quake style slide down animation.
* Allow Quake window resizing and moving.
* Fixed resize issues after Quake slide up/down.
* Add to the [TabMenu](TabMenu.html) items ‘Split to right’ and ‘Split to bottom’.
* Untick ‘Auto minimize to TSA’ when turning Quake mode off.
* ToolBar buttons min/max/close were not properly shown/hidden on some options changing.
* gh#57: Cannot restore prevoisly opened tabs if there was a task marked as ‘Default for new console’.
* Consoles were not resized sometimes after Win+Left/Right (snap window to left/right monitor edge).
* After restoring snapped window the snapped state was dropped (window was put to ‘Normal’ position).



## Build 150224  {#Build_150224}

* One more correction of keyboard input processing.
* Option ‘Treat font height as device units’ was not saved in new config.
* Pseudographics font was incorrectly sized on some dpi-s.
* HotKeys. Implemented ‘Kill all but shell’ function. Default hotkey Win+Shift+Delete for new configs. Also it is accessible from [TabMenu](TabMenu.html) or [SystemMenu](SystemMenu.html) and [GuiMacro](GuiMacro.html): terminate all but shell process `Close(10)`, no confirm `Close(10,1)`. **Note**. If there is a shell only - confirm user to kill the shell.
* Don't do "ConEmuCpCvt" conversion if some chars were failed.
* Ability to change ‘processor affinity’ and ‘process priority’ for all running processes. The function affects all running processes in the current console (tab/pane). Available from [TabMenu](TabMenu.html) and [SystemMenu](SystemMenu.html) item ‘Affinity/priority...’, HotKey and [GuiMacro](GuiMacro.html) `AffinityPriority([Affinity,Priority])`. Unless you specify ‘Affinity’ or ‘Priority’ in [GuiMacro](GuiMacro.html) function ConEmu will show dialog with affinity/priority options.
* [Issue 1911&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1911): Do not scroll out of found position after clicking in the console to allow select text there.
* Option ‘Skip click on activation’ was not working sometimes.
* Allow physical scroll down of the console until the cursor remains visible.
* Internal. Fix wrong logging message for WA_ACTIVE
* During excessing keyboard activity console contents was updated slowly.
* Switch "/bypass" creates processes with normal priority.
* gh#59: Message ‘Failed to start task in user mode, timeout’ was appeared after updating.
* gh#56: Do not use RVAL_REF with GCC
* [LogFiles](LogFiles.html) were not created for far.exe sometimes.
* Do not flush logs after each line to avoid lags.



## Build 150224a  {#Build_150224a}

* [Issue 1917&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1917): Avoid ‘Win+Shift+Delete is not unique’ error.



## Build 150218  {#Build_150218}

* [Issue 1817&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1817): Fix dropped or garbled keypresses sent from AHK.
* Don't suggest by default xml storage on Windows 2000.



## Build 150216  {#Build_150216}

* [GuiMacro](GuiMacro.html). [Issue 1411&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1411), gh#58. `WindowPosSize("<X>","<Y>","<W>","<H>")`. It changes window pos and size, same as ‘Apply’ button in the ‘Size & Pos’ page of the Settings dialog.
* [GuiMacro](GuiMacro.html). Simplify passing string arguments. For example, the following commands will be equal now:

        ConEmuC -GuiMacro WindowPosSize "0" "0" "800px" "600px"
        ConEmuC -GuiMacro WindowPosSize 0 0 800px 600px



## Build 150215  {#Build_150215}

* Add menu item ‘Online &Help’ to the [SystemMenu](SystemMenu.html).
* After AppDistinct settings change console was not redrawn properly sometimes.
* Sometimes true colors were not used while executing smth like "`edit:<git log`".
* Outscreen regions were not cleared by "cls" executed in "`Far /w`" prompt.
* [Issue 1881&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1881): Newly catched admin consoles were unexpectedly scrolled to the bottom ([DefTerm](DefTerm.html)).
* Catched [RealConsole](RealConsole.html) ([DefTerm](DefTerm.html)) was hidden even if ‘Show real console’ was ticked.
* Use bitmap resource for ‘Search’ icon.



## Build 150209  {#Build_150209}

* [Issue 1897](http://github.com/Maximus5/conemu-old-issues/issues/1897): Tear off started "ConEmu.exe" from "taskeng.exe" (switch /demote). Let process created from task sheduler runs indefinitely.
* Auto save window size & pos is turned on by default.
* Add test batch "utf-8-test.cmd" (check console unicode capabilities).
* Suggest [ConEmuXml](ConEmuXml.html) storage for new configurations by default.
* [Issue 1870&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1870): Rename dialog was shown out of screen if tabs were on bottom.



## Build 150206  {#Build_150206}

* CP hack: Use ConEmuCpCvt to force output CP conversion. If some command uses wrong CP while converting ANSI to Unicode (the example may be perl.exe from "git add -p") set variable to correct its output. Use asterisk for all apps. This hack affects ONLY WriteConsoleW function calls.

        Format:
          <exename>:<badcp>:<goodcp>[;<exename>:<badcp>:<goodcp>[...]]
        Example:
          set ConEmuCpCvt=perl.exe:1252:1251;*:850:866;

* CP hack: Use ConEmuDefaultCp to change output CP if you don't want to use chcp. If you can't use "`chcp <codepage>`" to change whole console CP output, you may change it using environment variable ConEmuDefaultCp. It will affect only WriteFile and WriteConsoleA functions. So, if you need to run several apps in one console simultaneously...

        set ConEmuDefaultCp=1251
        ConEmuC -fork -c App1.exe
        set ConEmuDefaultCp=866
        ConEmuC -fork -c App2.exe
        set ConEmuDefaultCp=

* Add information about "-Async", "-Fork", "-Download" switches.
* Switch "-noquake" implies "-nosingle".
* TaskBar jump list was created without directly specified xml configuration file.
* Button ‘Save’ instead of ‘Start’ was shown if bad startup Task was detected.
* The menu item ‘Clear history...’ was not working (the one in the <code class="plus">[+]</code> drop-down menu).
* Sometimes ‘Console script are not supported here’ error appeared after running a task from [NewConsole](NewConsole.html) dialog.
* Tasks may be organized with folders. Delimit task name from folder name with "`::`". For example, type "`Shells::PowerShell`" instead of "`PowerShell`", and so on. Only one level of folders is allowed. No need to reorder tasks of one folder continuously, folders are filled by name. Generally this was implemented for drop-down <code class="plus">[+]</code> menu.
* Create default tasks with folders (Shells, Bash, SDK, and so on).
* Find task by name with or without folder part (Startup page).
* Button 'Add default tasks' will not create task duplicates (checking by task name).
* Use self-implemented UnExpandEnvStrings while creating default tasks.
* Allow switch '/reuse' in task parameters (alias for '/single' yet).



## Build 150203  {#Build_150203}

* [Issue 1886&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1886): Change text cursor position with ‘LeftClick’ was not working when PSReadLine was loaded in your `$profile`. Look at `RevokeMouseInput.ps1`.
* github#20: ‘Ctrl-Left’ and ‘Ctrl-Right’ was not working in Vim/xterm.
* Create new console confirmation now if disabled by default. So ‘Win+W’ or ‘LClick’ on the <code class="plus">[+]</code> button creates new default task. The default task may be choosed in the ‘Tasks’ settings page. New console dialog (command, directory, as admin, and so on) may be shown with:
  * ‘Win+Shift+W’;
  * ‘Shift+LClick’, ‘RClick’ or ‘LongTap’ on the <code class="plus">[+]</code>;
  * ‘New console dialog...’ menu item (down arrow about <code class="plus">[+]</code>).
* Window and tab closing confirmations now are disabled by default. But if there are more than a two user processes running in the console - close confirmation may be shown. So, there are thee checkboxes now:
  * Confirm window closing (unchecked);
  * Confirm tab closing (unchecked);
  * When running process was detected (checked).



## Build 150128  {#Build_150128}

* Add missed [GuiMacro](GuiMacro.html) GetOption description.
* Debug. Show ConEmu build number in the `_ASSERT` dialog
* [Issue 1878&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1878): [GuiMacro](GuiMacro.html). Add ability to get some environment from ConEmu.

        GetInfo("PID"[,"HWND"[,...]])
        - Returns values of some ConEmu environment variables
          GetInfo("PID") returns %ConEmuPID% and so on
          It's processed in GUI so the result may differs from RealConsole

* Search field sometimes disappeared after playing with toolbar visibility.
* Add small gap between search field and right window frame edge if toolbar is hidden.
* HighlightAndGoto: Add examples with 'cmd.exe /c ...'.

        cmd.exe /c "echo Executing "%3" & "%3""
        
        After Ctrl+Click on highlighted (underlined) file
        ConEmu will start cmd.exe in new tab and highlighted file will be executed.
        Documents will be opened using associated application.
        Add "-new_console:n" suffix to suppress "Press Enter or Esc to close console".

* [Issue 1883&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1883): Search field activation hotkey was not working if toolbar buttons were hidden.
* [AnsiEscapeCodes](AnsiEscapeCodes.html): Change behavior on wrong ST terminator of OSC detected (allowed 'ESC \' or 'BEL').
* [Issue 1865](http://github.com/Maximus5/conemu-old-issues/issues/1865): Deadlocks were happened sometimes, PipeServer termination sequence was changed.



## Build 150119a  {#Build_150119a}

* [Issue 1876&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1876): Revert msvcrt.dll linkage.



## Build 150119  {#Build_150119}

* [Issue 1864&nbsp;](http://github.com/Maximus5/conemu-old-issues/issues/1864): [ExportEnvVar](ExportEnvVar.html). Drop variable instead of setting it to empty string.
* Don't show both small and large icons in the confirmation/about dialogs.
* Internal. [GuiMacro](GuiMacro.html) "Context" was not returned result as expected. Esage example:

        print("abc"); Split(2); Context(); print("def")

* Minor change in 16x16 icon, add 256x256 icon, update icons in setupper.
* Allow ‘Debug active process’ while [ChildGui](ChildGui.html) is stopped by ConEmuReportExe on loading.
* Remove GetVersionEx warnings (internal).
* Debug purposes switch: ConEmuC -OsVerInfo. Sets errorlevel to OsVer. Ex.: Win7 -> 1537 (0x601)
* Link [ConEmuHk](ConEmuHk.html)64.dll and ConEmuCD64.dll statically with msvcrt.dll.
* [Issue 1865](http://github.com/Maximus5/conemu-old-issues/issues/1865): Fix weird hungs in LdrpAcquireLoaderLock (cmd.exe).
* Emulate AnsiCon environment variables.

        "ANSICON" = "WxH (wxh)", where W,H size of the buffer, w,h - window.
        "ANSICON_DEF" = "BF", (B)ackground and (F)oreground color indexes (hex).
        "ANSICON_VER" = "170", does not exist in the environment block.

* Support some more ANSI SGR codes (22, 23, 24).

        "ESC [ 22 m" - Unset BrightOrBold
        "ESC [ 23 m" - Unset ItalicOrInverse
        "ESC [ 24 m" - Unset BackOrUnderline

* [Issue 1865](http://github.com/Maximus5/conemu-old-issues/issues/1865): Allow ANSI escape sequences when redirecting to device CON.



## Build 150111  {#Build_150111}

* New ConEmu icon.
* HighDpi fixes (if primary mon is 192dpi and secondary is 96dpi).
  * Search icon size on secondary monitor was huge.
  * Settings dialog controls were sized too large.
* [DefTerm](DefTerm.html). Aggressive mode was not be able to disabled actually.
* [GuiMacro](GuiMacro.html). Allow to execute some [GuiMacro](GuiMacro.html) after ConEmu window creation. Example:

        ConEmu -Detached -GuiMacro "Task(""{cmd}""); Settings"

* [Issue 1861](http://github.com/Maximus5/conemu-old-issues/issues/1861): [GuiMacro](GuiMacro.html). `Context([<Tab>[,<Split>]])`.
* Don't try to start clink if cmd is started just for single command execution.
* Fix incorrect buffer address passed when getting AutoRun reg key value.
* Small improvements for build settings in VS12 project.



## Older entries  {#Older_entries}

* [Builds 140104..141221](Whats_New_3.html)
* [Builds 120101..131225](Whats_New_2.html)
* [Builds 090707..111220](Whats_New_1.html)
* [Full changelog on GitHub](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/WhatsNew-ConEmu.txt)

{% endraw %}
