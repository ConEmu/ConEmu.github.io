---
redirect_from: /ru/csudo.html

title: "ConEmu | csudo - Unix like sudo command on Windows"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps

readalso:
 - url: SettingsEnvironment.html
   title: Environment settings page
 - url: NewConsole.html
   title: ‘-new_console’ and ‘-cur_console’ switches
 - url: CmdPrompt.html
   title: Configuring Cmd prompt
 - url: AnsiEscapeCodes.html
   title: ANSI X3.64 and Xterm-256 Support
 - url: SplitScreen.html
   title: Split Screen or Panes
---

# Unix like sudo command on Windows

Common question: ‘Is there any 'sudo' command for Windows?’

An answer is here.

* [csudo in ConEmu](#csudo)
* [Usage example](#example)
* [Screenshots](#screenshots)
* [Script and options](#options)
* [Alias for cmd.exe](#alias)
* [csudo.cmd script](#script)


## csudo in ConEmu  {#csudo}

ConEmu package contains (started from build 121028) batch file
[`%ConEmuBaseDir%`](ConEmuEnvironment.html)\\[`csudo.cmd`](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/csudo.cmd).
When checkbox ‘Add %ConEmuBaseDir% to %PATH%’ is checked (‘[ComSpec](SettingsComspec.html)’ settings page),
you may just type `csudo` in non-elevated prompt in your shell.

**Note** You may also define an alias `sudo` for `csudo.cmd` if you prefer simple `sudo` notation.
Just go to the [Environment](SettingsEnvironment.html) settings page.

**Note** Don't change file contents to avoid your changes loss when new update of ConEmu arrives,
set up options as [described below](#options) instead.

**Note** Elevated command will starts in new elevated ConEmu [tab](TabBar.html) or [pane](SplitScreen.html).


## Usage example  {#example}

```
csudo dism /online /enable-feature /featurename:NetFX3 /All /Source:D:\sources\sxs /LimitAccess
```


## Screenshots  {#screenshots}

Let type in command prompt ‘csudo diskpart’

![Running csudo command](/img/ConEmuSuDo1.png)

Get UAC confirmation on Vista or later

![csudo UAC confirmation](/img/ConEmuSuDo2.png)

Or choose another credentials on Windows 2000 or Windows XP

![csudo UAC confirmation](/img/ConEmuSuDo4.png)

Here we are, diskpart started elevated in a split

![Running csudo command](/img/ConEmuSuDo3.png)



## Script and options  {#options}

As you can see, batch contains two parameters, which you may redefine: `ConEmuSudoSplit` and `ConEmuSudoConfirm`.

You may adjust them on the [Environment](SettingsEnvironment.html) settings page.

| Variable | Value | Description |
|:---|:---|:---|
| `ConEmuSudoSplit`   | VERT | Create new console in the split below current one |
|                     | HORZ | Create new console in the split rightward |
|                     | NO   | Create new console in the new tab |
| `ConEmuSudoConfirm` | YES  | When started command terminates ConEmu will show ‘Press Enter or Esc to close console...’ confirmation in started console |
|                     | NO   | When started command terminates started console is closed automatically |

For example, if you want to start elevated command in new tab rather than in split
just add the following line to your [Environment](SettingsEnvironment.html):

```
set ConEmuSudoSplit=NO
```



## Alias for cmd.exe  {#alias}

You may also [setup an alias](SettingsEnvironment.html) for `cmd.exe`
and [Far Manager](FarManager.html) prompt.
Please read [-new_console](NewConsole.html) options for details.

~~~
alias sudo=ConEmuC.exe -c $* -new_console:ac
~~~


## csudo.cmd script  {#script}

[`%ConEmuBaseDir%`](ConEmuEnvironment.html)\\[`csudo.cmd`](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/csudo.cmd)
