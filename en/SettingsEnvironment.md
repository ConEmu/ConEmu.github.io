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

* [Set up environment variables, cmd.exe aliases, codepage](#id2850)
  * [echo](#echo)
  * [set](#set)
  * [chcp](#chcp)
  * [alias](#alias)
    * ["sudo" alias example](#sudo-alias)
    * ["st" alias example](#st-example)
    * [More alias examples](#aliases)
* [Add to %PATH% environment variable](#id2974)
  * [Add %ConEmuDir% to %PATH%](#id2423)
  * [Add %ConEmuBaseDir% to %PATH%](#id2584)


## Set up environment variables, cmd.exe aliases, codepage  {#id2850}

Here you may do the fine tuning of your environment
for processes running inside ConEmu
([tabs](Tabs.html) and [splits](SplitScreen.html)).

Limited set of commands are supported.


### echo  {#echo}

You may issue one or more [echo](ConEmuC.html#EchoAndType) commands,
these text will appear on the top of every started [console](ConsoleApplication.html).

**Note** [ChildGui](ChildGui.html) (PuTTY, mintty, etc.) are not consoles.

~~~
echo -x "Welcome to the ConEmu %ConEmuBuild%" "terminal" "^nPress Win-Alt-P for Settings"
echo "-------------------------"
~~~


### set  {#set}

You may define your environment variables here. Few examples below.

~~~
set HOME=C:\DropBox\Home
set "PATH=%ConEmuBaseDir%\Scripts;%PATH%"
~~~


### chcp  {#chcp}

Same as `chcp.exe` standard command, but supports few aliases, for example:

~~~
chcp utf-8
~~~

**Don't use this command** if you are not aware of its meaning.
Changing console code page to anything different from your default OEM page
may harm output of some unaware console applications.


### alias  {#alias}

These aliases will work within `cmd.exe` and [Far Manager](FarManager.html) **only**.
Actually this command will do the same thing as `DosKey.exe` is doing.
Few examples below.


#### "sudo" alias example  {#sudo-alias}

There is the [csudo](csudo.html) command file.
You may create an alias with desired behavior and name.

~~~
alias sudo=ConEmuC -c $* -new_console:ac
~~~

And you may just run in your non-elevated cmd.exe prompt (inside ConEmu of course):

~~~
sudo diskpart
~~~

New elevated tab with `diskpart.exe` will be started (after UAC confirmation).


#### "st" alias example  {#st-example}

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


#### More alias examples  {#aliases}

Use `DOSKEY.exe` to add alias or print current aliases.

~~~
alias alias=DOSKEY $*
alias aliases=DOSKEY /MACROS
~~~

Implement `cat` command in cmd.exe prompt via [ConEmuC -type](ConEmuC.html#EchoAndType) switch.

~~~
alias cat=ConEmuC -type $*
~~~

And `ce` to call [ConEmuC -echo](ConEmuC.html#EchoAndType).

~~~
alias ce=ConEmuC -echo $*
~~~

Fast way to go to the `%ConEmuDir%`.

~~~
alias ...=cd /d "%ConEmuDir%"
~~~

Chain commands together using $t as a command separator

~~~
alias openNotes=cd /user/notes/ $t noteapad notes.txt
~~~


## Add to %PATH% environment variable  {#id2974}

**Note** This option group is superfluous and is maintained for compatibility
and some simplification. You may modify your `%PATH%` in the edit area above.

Here you may add to the `PATH` environment variables
for processes running inside ConEmu
([tabs](Tabs.html) and [splits](SplitScreen.html)).


#### Add %ConEmuDir% to %PATH%  {#id2423}

If checked you may run `ConEmu.exe` and `ConEmu64.exe`
from your [command-line interpreter](TerminalVsShell.html).
Example below.

~~~
ConEmu -basic -noquake -nosingle -startTSA -run <build your project command line>
~~~


#### Add %ConEmuBaseDir% to %PATH%  {#id2584}

If checked you may run `ConEmuC.exe` and `ConEmuC64.exe`
from your [command-line interpreter](TerminalVsShell.html).
`ConEmuC` is used generally to do some checks (`-IsConEmu` switch)
and execute [GuiMacro](GuiMacro.html). Example below.

~~~
ConEmuC -GuiMacro Progress 3
~~~
