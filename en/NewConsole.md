---
redirect_from: /ru/NewConsole.html

title: "ConEmu | Switches -new_console and -cur_console"

description: "With -new_console and -cur_console switches one may
   start new tab or split, even elevated, change its working directory,
   palette, background image and so on..."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: Tasks.html
   title: Using Tasks
 - url: TerminalVsShell.html
   title: Terminal vs Shell
 - url: CommandLine.html
   title: "GUI, Console and Shells switches"
---

# Switches -new_console and -cur_console

  * [Purpose](#purpose)
  * [Exclusions](#exclusions)
  * [The difference](#the-difference)
  * [Syntax](#syntax)
  * [Important notes](#important-notes)
  * [Examples](#examples)
  * [Example 1](#example-1)
  * [Example 2](#example-2)
  * [Example 3](#example-3)
  * [Example 4 (Far Manager related)](#example-4)
  * [Example 5](#example-5)
  * [Example 6 (Split Screen)](#example-6)
  * [Example 7 (grid 2x2)](#example-7)


## Purpose  {#purpose}

Switches `-new_console` and `-cur_console` are used to modify the behavior
of the ConEmu tabs and splits (new or existing). Few examples below.


Within ConEmu Tasks you may explicitly set color palette for creating tab:

~~~
sh.exe --login -i -new_console:P:"Palette"
~~~

Or, from your shell prompt (e.g. cmd.exe started in ConEmu) you can start PuTTY (or any other simple GUI applications) in the new ConEmu tab (or split):

~~~
PuTTY.exe -new_console -load "yourserver"
~~~

Or, if you need to run some script with disabled ‘[Inject ConEmuHk](ConEmuHk.html)’ from your shell prompt running in the ConEmu tab, you may use ‘-cur_console:i’ switch.

~~~
cmd /c -cur_console:i MyBatch.cmd BatchArg1 ... BatchArgN
~~~

Switches may be used in the:

  *  ConEmu command line: `/cmd` or `/cmdlist` from [ConEmu.exe arguments](ConEmuArgs.html)
     or ‘Command line’ from the [Settings](SettingsStartup.html);
  *  ConEmu [Tasks](Settings.html#Tasks): Commands area;
  *  Your shell prompt started in ConEmu: ‘[Inject ConEmuHk](ConEmuHk.html)’
     must be enabled in the [Settings](SettingsFeatures.html);
  *  And at last within switches of console application running with Default terminal feature.

You must **not** specify them as `ConEmu(64).exe` or `ConEmuC(64).exe` arguments.
Specify them **after** `/cmd` or `/cmdlist` (ConEmu.exe)
and `/c` or `/k` (ConEmuC.exe) if you need to use them
with ConEmu's executables command line.

~~~
ConEmu.exe /cmdlist cmd ||| powershell -new_console:sV
~~~

## Exclusions  {#exclusions}

Sometimes, you may need to disable processing of `-new_console` and `-cur_console` switches at all.
For example, you need to create git commit with `-new_console` in the commit message,
or create string value in the registry, using `reg.exe` tool.

There are several ways to disable or skip processing of these switches.

  * Option ‘Process -new_console and -cur_console switches’ on the [Features](SettingsFeatures.html) Settings page.
    When you disable that option swithes will not be processed when you run something from your shell prompt or
    scripts (inside ConEmu tabs).
  * Using single quotes or backslashes, examples below.
<pre>
git commit -m "Fix behavior of the '-new_console' switches"
reg.exe add "HKCU\command" /ve /t REG_EXPAND_SZ /d "\"C:\ConEmu\ConEmuPortable.exe\" /Dir \"%V\" /cmd \"cmd.exe\" \"-new_console:nC:cmd.exe\" \"-cur_console:d:%V\"' /f
</pre>
  * Switches will not be processed **after** the one of the ConEmu's executables:
    `ConEmu(64).exe`, `ConEmuC(64).exe` or `ConEmuPortable.exe`.
    For example, when you run `ConEmu.exe` from your shell prompt, switch `-new_console`
    will be applied to the tab started in the **new** ConEmu window, and will not create
    new tab with one ConEmu window **inside** another ConEmu window.
    **Note** This behavior first introduced in the build 140220.
<pre>
ConEmu /cmd PowerShell.exe -new_console:h9999
</pre>
  * Using [environment](ConEmuEnvironment.html) shell variable `ConEmuHooks` within your scripts
    (`rungit.cmd` for example).
<pre>
rem Call "setlocal" to restrict environment change to that batch only
setlocal
rem Disable processing of the -new_console switch
set ConEmuHooks=NOARG
rem And now you are safe to run your command
git -am "Commit message with -new_console argument"
</pre>


## The difference  {#the-difference}

What is the difference between `-new_console` and `-cur_console`?

Switch `-new_console` always creates new tab in ConEmu, while `-cur_console` does not.

So, some of switches used with `-cur_console` does not have any effect.

On the other hand, using them in ConEmu's tasks or command line,
both `-new_console` and `-cur_console` has the same effect.


## Syntax  {#syntax}

When you run application from existing ConEmu tab, or starting new tab from ConEmu interface,
you may use `-new_console` or `-cur_console` switches.

**Warning** `-new_console`, `-cur_console` and all subswitches are **case sensitive**.

~~~
-new_console[:switches]
   or
-cur_console[:switches]
   a - RunAs shell verb (as Admin on Vista+, user/pwd in Win2k and WinXP)
   b - create background tab
   c[0] - force enable [silent] ‘Press Enter or Esc to close console’
   C:"<iconfile>" - specify icon used in tab
   d:"<dir>" - specify working directory
   f - force starting console active, useful when starting several consoles simultaneously
   h<height> - i.e., h0 - turn buffer off, h9999 - switch to 9999 lines
   i - don't inject ConEmuHk into starting process
   I - (GuiMacro only) forces inheriting of root process contents, like ‘Duplicate root’ feature
   n - disable ‘Press Enter or Esc to close console’
   o - don't enable ‘Long console output’ when starting command from Far Manager
   p[N] - pty modes, N - bitmask: 1 - XTermKeys, 2 - BrPaste, 4 - AppCursorKeys; default is 5 (1+4)
   P:"<palettename>" - set fixed palette for tab
   r - run as restricted user
   R - force start hooks server in the parent process
   s[<SplitTab>T][<Percents>](H|V) - run new console in a split
   t:"<tabname>" - rename new created tab
   u - ConEmu choose user dialog
   u:"<user>:<pwd>" - specify user/pwd in args
   w - Enable ‘Overwrite’ mode in command prompt by default
   W:"<tabwallpaper>" - use specified wallpaper for the tab
   z - Don't use ‘Default terminal‘ feature for this command
~~~


## Important notes  {#important-notes}

  * Option [Inject ConEmuHk](ConEmuHk.html) **must be enabled** in ConEmu settings
    if you want to use these switches in your shell prompt (CLI).
  * These switches are shown in ConEmu ‘About’ dialog (Win+Alt+A).
  * The `s` sub-switch is complicated and [deserves separate article](SplitScreen.html#From-your-shell-prompt), look at examples below.
  * The `-new_console` is one of the ways to start **[GUI](ChildGui.html)** application from existing tab in the new ConEmu tab.
  * Several switches in one command may be used:
    `-new_console:b -new_console:h9999` and `-new_console:bh9999` are equal.
  * While you create new tab from ConEmu GUI interface, `-new_console` and `-cur_console` have the same effect.
  * These are NOT ConEmuC switches, specify them as application (far, vim, putty, etc.) switches.
  * You may put multiple simple or quoted string switches delimited with colon, example:

~~~
cmd -new_console:a:bc:d:"c:\users\Pete":u:"Pete:password"
~~~

  * You may need to escape special symbols `<>()&|^"` with `^` symbol, example:

~~~
cmd -new_console:P:"^<PowerShell^>"
~~~



## Examples  {#examples}

**Note**. In some cases `-new_console` can not be intercepted (e.g. starting batches
or internal commands from command processor itself).
In this cases you owe to use the ‘prefix’ before actual command!


### Example 1   {#example-1}

Starts `dir c:\ /s` in new background ConEmu tab,
set buffer height to 9999 lines,
do not close tab after `dir` completion.

~~~
"%ConEmuBaseDir%\ConEmuC.exe" /c dir "-new_console:bh9999c" c:\ /s
~~~


### Example 2   {#example-2}

Starts `vim.exe c:\sources\1.cpp` in new ConEmu tab,
disable buffer scrolling (buffer height will be equal to window height),
do not show ‘Press Enter or Esc to close console’ after exiting vim.

~~~
vim.exe -new_console:nh0 c:\sources\1.cpp
~~~


### Example 3   {#example-3}

Starts `cmd.exe` in specified directory with specified login/username (Nick) and password (pwd).

~~~
cmd.exe -new_console:d:"C:\Users\Nick" "-new_console:u:Nick:pwd"
~~~


### Example 4 (Far Manager related)   {#example-4}

Starts `hiew.exe c:\tools\app.exe` in **current** ConEmu tab,
do not enabling buffer scrolling (buffer height will be equal to window height).

~~~
hiew.exe -cur_console:h0 c:\tools\app.exe
~~~


### Example 5   {#example-5}

Starts PuTTY in new ConEmu tab.

~~~
putty -new_console
~~~


### Example 6 (Split Screen)   {#example-6}

Split current tab, new tab will be created to the right, both tabs becomes 50% width of active tab.

~~~
cmd -new_console:s
~~~

or

~~~
cmd -new_console:s50H
~~~

Split current tab, create new tab to the bottom.

~~~
cmd -new_console:sV
~~~

Split 3-d tab, create new tab to the right with 30% width.

~~~
cmd -new_console:s3T30H
~~~

### Example 7 (grid 2x2)   {#example-7}

You may also create named task with several shells. Next example creates four consoles in a grid 2x2.

~~~
> cmd -cur_console:n
powershell -cur_console:s1TVn
bash -l -i -cur_console:s1THn
ssh.exe user@127.0.0.1 -cur_console:s2THn
~~~
