---
redirect_from:
 - /en/Command_Line.html
 - /ru/Command_Line.html
 - /ru/ConEmuArgs.html

title: "ConEmu | ConEmu.exe Command Line Switches"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps
 - url: CommandLine.html
   title: Switches
---

# ConEmu.exe command line switches

**Note** From build 140106 you may use either '/'style or '-'style switches.

| **Argument** | **Description** |
|:---|:---|
| /? | Show help screen |
| -Config *configname* | Tells to use an existing or create a new configuration with the specified name. Each configuration keeps its own individual data in the registry or xml file (ConEmu.xml). |
| -Dir *workdir* | Set working (startup) directory for ConEmu and console processes. This switch override ConEmu startup directory (defined in the ConEmu shortcut for example). |
| -Here | Force using of ‘inherited’ [startup directory](StartupDir.html). This is an alternative to the `-Dir ...` switch. |
| -FS `|` -Max `|` -Min | (Full screen), (Maximized) or (Minimized) mode |
| -TSA | Override (enable) minimize to taskbar status area (TSA) |
| -MinTSA | Start ConEmu in TSA, but minimize to taskbar after restoring. Also ConEmu will **not** be exited after last console close, but hided to TSA. |
| -StartTSA | Start ConEmu in TSA, but minimize to taskbar after restoring. ConEmu will be **exited** after last console close. |
| -Icon *file* | Take icon from file (exe, dll, ico) |
| -Title *title* | Set **fixed** *title* for ConEmu window. You may use environment variables in *title*. |
| -Multi `|` -NoMulti | Enable or disable multiconsole features |
| -Single `|` -Reuse | New console will be started in new tab of existing ConEmu |
| -NoSingle | Force new ConEmu window even if single mode is selected in the Settings |
| -ShowHide `|` -ShowHideTSA | May be used with AutoHotKey or desktop shortcuts. Works like ‘Minimize/Restore’ global hotkey. |
| -NoUpdate | Disable automatic checking for updates on startup |
| -CT`[0|1]` | Anti-aliasing: `-ct0` - off, `-ct1` - standard, `-ct` - clear type |
| -Font *fontname* | Specify the font name |
| -FontSize *fontsize* | Specify the font size |
| -FontFile *fontfilename* | Loads font from file for ConEmu process (multiple pairs allowed) |
| -FontDir *fontfolder* | Loads all fonts from folder (multiple pairs allowed) |
| -BufferHeight *lines* | Set console buffer height. May be used with cmd.exe, PowerShell, etc. |
| -Wnd{X`|`Y`|`W`|`H} *value* | Set window position and size. |
| -Monitor *monitor-id* | Place window on the specified monitor. *Monitor-id* may be specified by: 1-based index; hex descriptor (e.g. "x00010001"); device name (e.g. "\\.\DISPLAY1"). You may check this values in the [About/SysInfo](AboutDialog.html). |
| -Palette *Name* | Choose named color palette. |
| -Log `|` -Log1 `|` -Log2 | Used to create debug log files |
| -Reset | Don't load settings from registry/xml. |
| -UpdateJumpList | Update [Windows 7 taskbar jump list](Windows7Taskbar.html#Customizable_Jump_list). May be used for automated ConEmu set up from batches. |
| -LoadCfgFile *file* | Use specified xml file as configuration storage. |
| -SaveCfgFile *file* | Save configuration to the specified xml file. |
| -Exit | Don't create ConEmu window, exit after actions. |
| -new_console <br/> -cur_console | This **special** switches may be specified **after** `-run` switch. Read more about [-new_console and -cur_console](NewConsole.html) switches |
| -run *commandline* <br/> -run @*taskfile* <br/> -run *{taskname}* | Command line to start. This must be the last used switch (excepting -new_console and -cur_console). You may use ">" and "`*`" modifiers in *taskfile* and -BufferHeight argument. <br/> *taskname* is one of the tasks specified on the "Tasks" page of "Settings" dialog. |
| -runlist *commands* | Run several tabs on startup. This must be the last used switch (excepting -new_console and -cur_console). Use the same syntax and abilities as on the "Tasks" page of "Settings" dialog. Delimit commands (tabs) with "`|``|``|`". Note, that you must escape delimiter "`^|^|^|`" when running from cmd-files. |

**NB** Switches `-run` and `-runlist` are renovated variants of `-cmd` and `-cmdlist` to avoid their confusing with `cmd.exe`.
These switches were introduced in build [160416](/blog/2016/04/16/Build-160416.html). Use `-cmd` and `-cmdlist` for older builds.

**NB** `ConEmuC.exe` command line switches are described [here](ConEmuC.html#ConEmuC_switches).


## Examples  {#Examples}

### Example 1  {#Example1}
ClearType is ON, using font face name ‘Lucida Console’, font height 16. Starts FAR manager in the folder ‘C:\1 2’.

~~~
ConEmu.exe -ct -font "Lucida Console" -size 16 -run far.exe "c:\1 2\"
~~~


### Example 2  {#Example2}
Starts continuous operation minimized in taskbar status area (TSA), use icon from "cmd.exe".

~~~
ConEmu.exe -tsa -min -icon "cmd.exe" -run cmd /c dir c:\ /s
~~~


### Example 3 (-runlist)  {#Example3}
Start four cmd tabs in a grid 2x2 (**Win+R** or **shortcut** syntax).

~~~
ConEmu.exe -runlist cmd -cur_console:fn ||| cmd -cur_console:s1TVn ||| cmd -cur_console:s1THn ||| cmd -cur_console:s2THn
~~~

### Example 4  (four tabs) {#Example4}
Starts with four tabs: Far Manager, CMD, PowerShell and Bash.

* Far.exe will be active console;
* Cmd.exe will be started with 400 lines buffer height in the `%ALLUSERSPROFILE%` directory and special color 4F (white on red);
* PowerShell will be started as Administrator with 1000 lines buffer height in the `%USERPROFILE%` directory;
* Bash (MinGW) will be started in the `C:\Source` directory.

**Win+R** or **shortcut** syntax (following is **one-line** command, splitted for clearness)

~~~
ConEmu.exe -runlist
  >"C:\Program Files\Far\far.exe"
  ||| cmd /k color 4F "-cur_console:h400d:%ALLUSERSPROFILE%"
  ||| *powershell "-cur_console:h1000d:%USERPROFILE%"
  ||| C:\MinGW\msys\1.0\bin\sh.exe --login -i "-cur_console:d:C:\Source"
~~~

batch files (bat, cmd) syntax (following is **one-line** command, splitted for clearness).

~~~
rem Remove line breaks after paste!
start "ConEmu" "C:\Program Files\ConEmu\ConEmu.exe" -runlist
  ^>"C:\Program Files\Far\far.exe"
  ^|^|^| cmd /k color 4F "-cur_console:h400d:%ALLUSERSPROFILE%"
  ^|^|^| *powershell "-cur_console:h1000d:%USERPROFILE%"
  ^|^|^| C:\MinGW\msys\1.0\bin\sh.exe --login -i "-cur_console:d:C:\Source"
~~~
or
~~~
ConEmu.exe -run @startfile.txt
~~~
or
~~~
ConEmu.exe -run {taskname}
~~~

### Sample startfile.txt or contents of {taskname}  {#Sample-file-or-task}

~~~
>"C:\Program Files\Far\far.exe"
cmd /k color 4F "-cur_console:h400d:%ALLUSERSPROFILE%"
*powershell "-cur_console:h1000d:%USERPROFILE%"
C:\MinGW\msys\1.0\bin\sh.exe --login -i "-cur_console:d:C:\Source"
~~~

### Example 5  {#Example5}
Following example is for use within cmd's batch files or from cmd.exe prompt itself.
Starts with three cmd tabs, set different bg/fg color (`color` command after `/k` switch)
and different working directory (`C:\`, `D:\`, `E:\`).

Following is **one-line** command, splitted for clearness.

~~~
start "Three tabs" "C:\Program Files\ConEmu\ConEmu.exe" -runlist
  ^> cmd /k color 4C -cur_console:d:C:\
  ^|^|^| cmd /k color 5D -cur_console:d:D:\
  ^|^|^| cmd /k color 2A -cur_console:d:E:\
~~~


## Rarely used switches  {#Rarely_used_switches}

| **Argument** | **Description** |
|:---|:---|
| -debug | Show message box immediately after ConEmu starts |
| -autosetup 1 | 0 | Install or remove ConEmu autostart with cmd.exe |
| -visible | Starts with visible real console |
| -detached | Starts with no console, ConEmu is ready for attaching from another real console or FAR manager |
| -noautoclose | Don't close ConEmu window automatically with last tab; may be used with ‘-detached’ |
| -nocascade | Disable ‘Cascade’ option may be set in the Settings |
| -nodefterm | Don't start initialization procedure for setting up ConEmu as default terminal |
| -nokeyhooks | Disable SetWindowsHookEx and global hotkeys |
| -nomacro | Disable hotkeys with [GuiMacro](GuiMacro.html) actions |
| -nohotkey | Disable all hotkeys |
| -noregfonts | Disable auto register fonts (font files from ConEmu folder) |
| -nocloseconfirm | Disable confirmation of ConEmu's window closing |
| -inside<br/>-insidepid *PID*<br/>-insidewnd x*HWND* | Starts ConEmu in ‘inside’ mode (act as child window of parent process) |
| -demote | Run command de-elevated, using Task Sheduler. May be useful in Vista and higher with UAC enabled. Example: `ConEmu.exe -demote -run powershell.exe` |
| -resetdefault | Same as -reset **and** don't show [fast configuration](SettingsFast.html) dialog. |
| -basic | Same as -resetdefault **and** disable ‘Save settings’ button in [Settings](Settings.html) dialog. |
