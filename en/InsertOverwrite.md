---
redirect_from: /ru/InsertOverwrite.html

title: "ConEmu | Insert/Overwrite"

description: "Using Insert/Overwrite mode in ConEmu's consoles."

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: TccInsertOverwrite.html
   title: Change tcc prompt to insert mode by default
---

# Using Insert/Overwrite mode in ConEmu's consoles

Let's talk about
[console applications](ConsoleApplication.html)
only. ConEmu can't know anything about state of
[ChildGui](ChildGui.html)
applications because they have its own input queue
and graphical interface.

In some cases you may choose initial mode via `ConInMode`
ConEmu settings, or via specific [CLI](TerminalVsShell.html) options,
for example [EditMode in TCC/LE](TccInsertOverwrite.html).

But in general there is no way to determine
Insert or Overwrite mode is used in runtime,
and there will be no INS/OVR indicator in the
[Status Bar](StatusBar.html).

Why not? Read below.


## Some techinfo

Simplitying, there are two ways in [Windows Api](WinApi.html)
allowing to read input from keyboard:

* [ReadConsole](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684958.aspx) or [ReadFile](https://msdn.microsoft.com/en-us/library/windows/desktop/aa365467.aspx)
* [ReadConsoleInput](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684961.aspx)

All others functions like PowerShell's Read-Host, C's getc or gets,
or actually any other [command line interpreter](TerminalVsShell.html) prompts
will call one of the functions above.


### ReadConsoleInput

`ReadConsoleInput` is used in those applications
which needs more deep console control or able
to process mouse events.
Few examples: [Vim](VimXterm.html) or emacs editors,
[Far Manager](FarManager.html), Hiew,
and actually any shell like bash or zsh from
[cygwin or msys](CygwinMsys.html) packages.

Neither ConEmu nor Windows does not know anything
about these applications activities, what they will do
with keypresses posted into their input queue.
For example you are enabling ‘Insert’ mode in Vim
by pressing `i` key. But there is no ‘right’ way
to determine current Vim mode.

Bottom line. ConEmu can't show INS/OVR indication
in that case because only console application
decides what it will do with read keypress.


### ReadConsole and ReadFile

Functions
`ReadConsole` and `ReadFile` are more easy and
are usually used in CLI prompts like cmd.exe, python and others.

During these functions calls the [RealConsole](RealConsole.html)
(but not ConEmu) decides which mode is used, Insert or Overwrite.
You may switch mode by pressing `Insert` key.

However, due to another
[Windows bug](MicrosoftBugs.html#Insert-Overwrite-Indicator)
it is absolutely impossible to determine this mode.
Even cursor size changes aren't reflected by [WinApi](WinApi.html).
