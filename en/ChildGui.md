---
redirect_from: /ru/ChildGui.html

title: "ConEmu | ChildGui"

description: "Running simple windowed applications like PuTTY, mintty, notepad
   and others in ConEmu tabs or splits."

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms

readalso:
 - url: LaunchNewTab.html
   title: Launch New Tab
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and MSys issues
 - url: KeyboardShortcuts.html
   title: Keyboard Shortcuts
 - url: Delusions.html
   title: Console-related delusions
 - url: TableOfContents.html#terms
   title: ConEmu terms
 - url: ConEmuFAQ.html
   title: Frequently Asked Questions
---

# PuTTY, mintty and others ChildGui inside ConEmu

* [Definitions](#definition)
* [Limitations](#limitations)
  * [Single process, single window](#process)
  * [Child window must be resizeable](#resizeable)
  * [Can't be controlled by ConEmu](#not-controlled)
  * [Hotkeys limitations](#hotkeys)
    * [Hotkey workaround](#hotkey-workaround)
* [How to run ChildGui in ConEmu](#run-childgui)
* [ChildGui title bar, window and system menu](#child-system-menu)



## Definitions   {#definition}

‘Child Graphical User Interface’ or ‘ChildGui’ or ‘windowed applications’ are
[GUI applications](https://en.wikipedia.org/wiki/Graphical_user_interface)
which may be started in ConEmu [Tabs](TabBar.html) or [Splits](SplitScreen.html).
They are drawing their contents themselves using [WinApi](WinApi.html).

Few examples: PuTTY, mintty, notepad, GViM and so on.

One may run simple ChildGui in ConEmu tabs/splits/panes.
This is a ‘side-feature’, ConEmu will acts only as tabbed ‘container’
for these type of applications.

ConEmu can't control or customize the look of those apps.
In most cases console versions are preferred
because they are running in the ConEmu ‘native’ mode.

![PuTTY and Notepad in ConEmu](/img/ConEmuChildGui.png "ConEmu with two ChildGui started in splits")



## There are several limitations   {#limitations}

Don't confuse ChildGui with [ConsoleApplication](ConsoleApplication.html)s
which are specially developed and compiled.
ChildGui applications, even they have their own console-like interfaces,
are not [ConsoleApplication](ConsoleApplication.html)s.
This is one of the most common [console-related delusions](Delusions.html).
ConEmu acts as simple holder for these ChildGui-s.


### Single process, single window   {#process}

ChildGui support was developed for simple applications.
It will not be working with those ones which runs several
windows from single process ([PID](https://en.wikipedia.org/wiki/Process_identifier)),
runs bunch of child processes or reuses single process for new windows.



### Child window must be resizeable   {#resizeable}

**Note** To be able to ‘integrate’ ChildGui into ConEmu, your application window must be **resizeable**!
For example, if your PuTTY settings locks its window size to certain ‘rows x cols’ values,
its window is non-resizeable, and ConEmu will not integrate it into ConEmu's tabs.
Because it is not ‘possible’ to resize that ChildGui when ConEmu window has to be resized!
For example, you maximize ConEmu window but child application remains its small size.
That will look weird, small framed child window with caption inside ConEmu workspace.



### Can't be controlled by ConEmu   {#not-controlled}

These application process all mouse and keyboard events, draw the contents
including selection areas internally. ConEmu can't control or customize them.

From time to time somebody asks why PuTTY colors do not match ConEmu palette.
That is because PuTTY colors must be configured in PuTTY itself.



### Hotkeys limitations   {#hotkeys}

One more note about **hotkeys**. When you are running ChildGui, all keypressed must be passed to that application.
That's why most of ConEmu hotkeys will be inaccessible.
With exception of hotkeys types ‘Global’, ‘Local’ and hotkeys with ‘Win’ modifier,
if option ‘Install keyboard hooks’ is **enabled**. 



#### Hotkey workaround  {#hotkey-workaround}

One of most asked question is ‘Why Ctrl-Tab is not working with PuTTY?’

It isn't because of <a href="#limitations">hotkeys limitations</a>.
Keyboard focus is located in that ChildGui application but not in ConEmu.

But there are few workarounds.

1. There are special [Hotkeys](SettingsHotkeys.html) for switching consoles and
   ‘Install keyboard hooks’ must be checked on the [Settings › Controls page](SettingsControls.html).
  * `Win+Q` - ‘Switch next console’;
  * `Win+Shift+Q` - ‘Switch previous console’;
  * `Win+<Number>`, but ‘Win+Numbers - activate console’ must be checked on the [Settings › Controls page](SettingsControls.html).
2. Same there are hotkeys to force focus to be set in ConEmu, after that you may use `Ctrl+Tab` to switch consoles.
  * `Win+Z` - Switch focus between ConEmu and child GUI application;
  * Set focus to ConEmu;
  * Set focus to child GUI application.
3. You may still use mouse to switch tabs.



## How to run ChildGui in ConEmu   {#run-childgui}

Absolutely the same way you do that for simple [ConsoleApplication](ConsoleApplication.html)'s.
For example, from ‘[Create new console dialog](LaunchNewTab.html)’.

![Start ChildGui in Tab](/img/ConEmuChildGui2.png "Running ChildGui in ConEmu")

Or with [-new_console](NewConsole.html) switch from your shell prompt.

~~~
C:> putty -new_console
~~~



## ChildGui title bar, window and system menu   {#child-system-menu}

To make ChildGui applications looks prettier in ConEmu tabs
there is an option ‘Hide caption of child GUI windows started in ConEmu’
on then [Appearance](SettingsAppearance.html) settings page.
It is checked by default, so you will see only child application client area.

Child window menu (for `notepad.exe` that is ‘File’, ‘Edit’, ‘Format’ and so on)
is visible regardless of mentioned option - menu relates to client area.

However child system menu will be invisible and you will not see for example
PuTTY's menu items like ‘Change settings’, ‘Reset terminal’ and so on...

But ConEmu may popup child system menu for you.
Call the item ‘Child system menu’ from ConEmu [TabMenu](TabMenu.html)
and voila.

You may also [choose desired hotkey](SettingsHotkeys.html) for the action
‘Child GUI window system menu (PuTTY, Notepad, etc.)’.
