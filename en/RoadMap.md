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


<h2 id="documentation"> Documentation </h2>

Unfortunately, there is not enough time for maintaining documentation and screenshots. Also, the english may be not very well :)


<h2 id="issues"> Existing issues </h2>

There are a lot of different [issues](Issues.html) - feature-requests or bug-reports.
Many of them were already implemented and solved.
But of course there is a lot of to do yet.


<h2 id="horizontal-scrolling"> Horizontal scrolling </h2>

Some programs use not only vertical, but horizontal console buffer.


<h2 id="tab-theming"> TabBar theming</h2>

One of most asked questions is a TabBar theming.
[Issue 294](http://code.google.com/p/conemu-maximus5/issues/detail?id=294) shows some details.


<h2 id="direct-write"> DirectWrite suport </h2>

There were some
[requests](https://github.com/Maximus5/ConEmu/issues/74)
about DirectWrite font rendering.


<h2 id="cygwin-terminal"> Better Cygwin/MSys support </h2>

ConEmu can run [Cygwin and MSys](CygwinMsys.html) applications without problems
if they were properly written. However their developers, perhaps due to required
Unix compatibility, are limited in some cases to [Windows API](WinApi.html).
These are not ConEmu limitations, for example official Vim can use
[VimXterm.html](xterm-256) color schemes, but cygwin or msys Vim builds can't.


<h2 id="optimization"> Optimization </h2>

Some portions of code must be optimized or totally rewritten :(


{% comment %}
<h2 id="Portable_registry">Portable registry</h2>

ConEmu can store itself settings in xml file already. However, it is possible to hook registry functions, so any (console or GUI) application, started in ConEmu tab become portable.

This portion of code exists but not perfect. So, it is disabled in release versions.
{% endcomment %}


<h2 id="advertising"> Advertising </h2>

We hope, ConEmu is stable enough and competitive with other console emulators.


<h2 id="virtual-buffer"> Virtual console buffer </h2>

In the current version, maximum buffer height (backscroll output history) is limited to 32766 lines (Windows console limit).

It will be nice to eliminate this limitation.

Also, restricting real console buffer to visible rect only may greatly increase speed of command execution (e.g. `dir /s c:\windows`).


<h2 id="far-manager"> Far Manager related </h2>

<h3 id="icons-in-far-panels"> Icons in standard Far panels </h3>

Thumbnails and Tiles already work, but they are ConEmu windows which overlaps standard panels.


<h2 id="configurable-toolbars"> Configurable panels and toolbars </h2>

Something like what TCMD or TC has.

At the moment there is only one optional panel where
[TabBar](TabBar.html), optional [SearchBar](SearchBar.html) and optional [ToolBar](ToolBar.html)
are contained. This panel may be shown at the top or the bottom of the window.

Also there is optional [StatusBar](StatusBar.html) at the bottom of the window.


<h2 id="rtl-support"> RTL languages </h2>

RTL is beyond my comprehension :) If RTL users think ConEmu may be better - [let me know](Issues.html).


<h2 id="cmd-powershell-tab-history"> History and tab-autocompletion in cmd and powershell </h2>

Some users asks about any way to get it to remember history from previous sessions
or get unix style tab-completion in the prompt.

That is rather complicated and must depends on the shell you are using.
ConEmu is a terminal, where user may run dozens of different [shells](TerminalVsShell.html).
Ant it is almost impossible to hardcode all possibilities.

Moreover, there are existing [console](ConsoleApplication.html) solutions for these requests.

* Far Manager as framework for cmd.exe: <a href="http://stackoverflow.com/a/10921470/1405560" rel="nofollow">Answer on StackOverflow.com</a>
* [Clink](ConEmuClink.html) for bash-style completion and history for cmd.exe
* [PSReadLine](http://github.com/lzybkr/PSReadLine) or [PowerTab](http://powertab.codeplex.com/) for powershell.exe
