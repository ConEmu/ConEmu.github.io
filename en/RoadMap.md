---
redirect_from: /ru/RoadMap.html

title: "ConEmu | RoadMap"

description: "There are a lot of interesting suggestions waiting to be implemented.
  Here are a short list. Any help will be very much appreciated!"

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras

readalso:
 - url: /donate.html
   title: Support ConEmu development
 - url: Issues.html
   title: Contacts, Feedbacks, Suggestions
---

# ConEmu road map

There are a lot of interesting suggestions waiting to be implemented.
Here are a short list.

Any help will be very much appreciated!

* [Documentation](#documentation)
* [Existing issues](#issues)
* [Horizontal scrolling](#horizontal-scrolling)
* [TabBar theming](#tab-theming)
* [DirectWrite suport](#direct-write)
* [Better Cygwin/MSys support](#cygwin-terminal)
* [Optimization](#optimization)
* [Advertising](#advertising)
* [Virtual console buffer](#virtual-buffer)
* [Far Manager related](#far-manager)
  * [Icons in standard Far panels](#icons-in-far-panels)
* [Configurable panels and toolbars](#configurable-toolbars)
* [RTL languages](#rtl-support)
* [History and tab-autocompletion in cmd and powershell](#cmd-powershell-tab-history)


## Documentation  {#documentation}

Unfortunately, there is not enough time for maintaining documentation and screenshots. Also, the english may be not very well :)


## Existing issues  {#issues}

There are a lot of different [issues](Issues.html) - feature-requests or bug-reports.
Many of them were already implemented and solved.
But of course there is a lot of to do yet.


## Horizontal scrolling  {#horizontal-scrolling}

Some programs use not only vertical, but horizontal console buffer.

Current ConEmu version allows neither horizontal scrolling nor setting horizontal buffer size.

Your console application can change horizontal buffer size itself (run `wmic` for example) however scrolling is not possible. You can only reveal [RealConsole](RealConsole.html) window by pressing `Ctrl-Win-Alt-Space`.


## TabBar theming  {#tab-theming}

One of most asked questions is a TabBar theming.
[Issue 294](http://github.com/Maximus5/conemu-old-issues/issues/294) shows some details.

However it's not possible yet. ConEmu uses standard Windows TabBar control which do not allow theming.


## DirectWrite suport  {#direct-write}

There were some
[requests](https://github.com/Maximus5/ConEmu/issues/74)
about DirectWrite font rendering. This also relates to opaque fonts on transparent background.


## Better Cygwin/MSys support  {#cygwin-terminal}

ConEmu can run [Cygwin and MSys](CygwinMsys.html) applications without problems
if they were properly written. However their developers, perhaps due to required
Unix compatibility, are limited in some cases to [Windows API](WinApi.html).
These are not ConEmu limitations, for example official Vim can use
[xterm-256](VimXterm.html) color schemes, but cygwin or msys Vim builds can't.


## Optimization  {#optimization}

Some portions of code must be optimized or totally rewritten :(


{% comment %}
## Portable registry  {#Portable_registry}

ConEmu can store itself settings in xml file already. However, it is possible to hook registry functions, so any (console or GUI) application, started in ConEmu tab become portable.

This portion of code exists but not perfect. So, it is disabled in release versions.
{% endcomment %}


## Advertising  {#advertising}

We hope, ConEmu is stable enough and competitive with other console emulators.


## Virtual console buffer  {#virtual-buffer}

In the current version, maximum buffer height (backscroll output history) is limited to 32766 lines (Windows console limit).

It will be nice to eliminate this limitation.

Also, restricting real console buffer to visible rect only may greatly increase speed of command execution (e.g. `dir /s c:\windows`).


## Far Manager related  {#far-manager}

### Icons in standard Far panels   {#icons-in-far-panels}

Thumbnails and Tiles already work, but they are ConEmu windows which overlaps standard panels.


## Configurable panels and toolbars  {#configurable-toolbars}

Something like what TCMD or TC has.

At the moment there is only one optional panel where
[TabBar](TabBar.html), optional [SearchBar](SearchBar.html) and optional [ToolBar](ToolBar.html)
are contained. This panel may be shown at the top or the bottom of the window.

Also there is optional [StatusBar](StatusBar.html) at the bottom of the window.


## RTL languages  {#rtl-support}

RTL is beyond my comprehension :) If RTL users think ConEmu may be better - [let me know](Issues.html).


## History and tab-autocompletion in cmd and powershell  {#cmd-powershell-tab-history}

Some users asks about any way to get it to remember history from previous sessions
or get unix style tab-completion in the prompt.

That is rather complicated and must depends on the shell you are using.
ConEmu is a terminal, where user may run dozens of different [shells](TerminalVsShell.html).
Ant it is almost impossible to hardcode all possibilities.

Moreover, there are existing [console](ConsoleApplication.html) solutions for these requests.

* Far Manager as framework for cmd.exe: <a href="http://stackoverflow.com/a/10921470/1405560" rel="nofollow">Answer on StackOverflow.com</a>
* [Clink](ConEmuClink.html) for bash-style completion and history for cmd.exe
* [PSReadLine](http://github.com/lzybkr/PSReadLine) or [PowerTab](http://powertab.codeplex.com/) for powershell.exe
