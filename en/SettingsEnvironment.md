---
redirect_from:
 - /ru/SettingsEnvironment.html

title: "ConEmu | Settings › Environment page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: ConEmuEnvironment.html
   title: "ConEmu Environment Variables"
 - url: WindowsEnvironment.html
   title: "Windows Environment Variables"
 - url: SettingsComspec.html
   title: "Settings › Comspec page"
---

# Settings: Environment

{% comment %} IDD_SPG_ENVIRONMENT {% endcomment %}

![ConEmu Settings: Environment](/img/Settings-Environment.png)


## Add to %PATH% environment variable

Here you may add to the `PATH` environment variables
for processes running inside ConEmu
([tabs](Tabs.html) and [splits](SplitScreen.html)).

**Add %ConEmuDir% to %PATH%**. If checked you may run `ConEmu.exe` and `ConEmu64.exe`
from your [command-line interpreter](TerminalVsShell.html).
Example below.

~~~
ConEmu -basic -noquake -nosingle -startTSA -cmd <build your project command line>
~~~

**Add %ConEmuBaseDir% to %PATH%**. If checked you may run `ConEmuC.exe` and `ConEmuC64.exe`
from your [command-line interpreter](TerminalVsShell.html).
`ConEmuC` is used generally to do some checks (`-IsConEmu` switch)
and execute [GuiMacro](GuiMacro.html). Example below.

~~~
ConEmuC -GuiMacro Progress 3
~~~



## Set up environment variables, cmd.exe aliases, codepage

Here you may do the fine tuning of your environment
for processes running inside ConEmu
([tabs](Tabs.html) and [splits](SplitScreen.html)).

Limited set of commands are supported.


### set

You may define your environment variables here. Few examples below.

~~~
set HOME=C:\DropBox\Home
set "PATH=%ConEmuBaseDir%\Scripts;%PATH%"
~~~


### chcp

Same as `chcp.exe` standard command, but supports few aliases, for example:

~~~
chcp utf-8
~~~

**Don't use this command** if you are not aware of its meaning.
Changing console code page to anything different from your default OEM page
may harm output of some unaware console applications.


### alias

These aliases will work within `cmd.exe` and [Far Manager](FarManager.html) only.
Actually this command will do the same thing as `DosKey.exe` is doing.
Few examples below.

#### "sudo" alias

There is the [csudo](csudo.html) command file, but it is not user-configurable
(will be overwritten with next update).
You may create an alias with desired behavior.

~~~
alias sudo=ConEmuC -c $* -new_console:a
~~~

And you may just run in your non-elevated cmd.exe prompt (inside ConEmu of course):

~~~
sudo dispart
~~~

New elevated tab with `diskpart.exe` will be started (after UAC confirmation).

#### "st" alias

Use "start" to start new console application inside ConEmu
with disabled `Press Enter or Esc to close console` confirmation.

~~~
alias st=start $* -cur_console:n
~~~

We use `-cur_console:n` here instead of `-new_console:n` because
with `-new_console` new [tab](LaunchNewTab.html) will be created
with `start` command, `-new_console` will be stripped from arguments
and ‘true’ tab with your console application will start without
this switch.
