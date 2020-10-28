---
redirect_from: /ru/ConEmuTerms.html

title: "ConEmu | Terms"
---

# ConEmu terms and definitions

* [RealConsole](#RealConsole)
* [VirtualConsole](#VirtualConsole)
* [SystemMenu](#SystemMenu)
* [TabMenu](#TabMenu)
* [TSA](#TSA)
* [Host key](#Host_key)
* [Apps key](#Apps_key)
* [BufferHeight](#BufferHeight)
* [Tab or TabBar](#Tab)
* [Split or Pane](#Pane)
* [Tab completion](#TabCompletion)
* [Windows API](WinApi.html)
* [Root Process](RootProcess.html)

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}


<h3 id="RealConsole"><a href="RealConsole.html">RealConsole</a></h3>

As is, it is a real console window. It always exists, but ConEmu hide it.
You may reveal the RealConsole window by depressing Ctrl-Win-Alt-Space,
or selecting item 'Real console' from the [SystemMenu](SystemMenu.html).



<h3 id="VirtualConsole"><a href="VirtualConsole.html">VirtualConsole</a></h3>

It is a part of the ConEmu window, where ConEmu draws
contents of the [RealConsole](ConEmuTerms.html#RealConsole).



<h3 id="SystemMenu"><a href="SystemMenu.html">SystemMenu</a></h3>

Pop up it by depressing Win-Alt-Space or right mouse clicking on the ConEmu window caption.



<h3 id="TabMenu"><a href="TabMenu.html">TabMenu</a></h3>

When Tabs are shown in the ConEmu window, you may pop up menu
for exact tab by right mouse clicking on this tab.
This menu looks like [SystemMenu](SystemMenu.html),
but does not have some window-related items.



### TSA   {#TSA}

Taskbar status area. It's a part of Windows taskbar next to the clock.


### Host key   {#Host_key}

**Obsolete**

It's a key or combination, which is a part of [some hotkeys](KeyboardShortcuts.html#Configurable_hotkeys).

You may select yours convinent combination (up to 3 keys) from Win, Ctrl, Alt, Shift and Apps.

Host keys examples: Win, CtrlAltShift, CtrlApps, and so on...


### Apps key   {#Apps_key}

A key between `RightWin` and `RightShift` on the most of keyboards.
[More...](AppsKey.html)



### BufferHeight   {#BufferHeight}

Buffer height of the [RealConsole](ConEmuTerms.html#RealConsole) window may be much longer,
than height of the visible area. ConEmu shows scrollbar (automatic or persistent)
when BufferHeight is enabled. With only exception of Windows 7 you may switch BufferHeight mode
by [Win-S](KeyboardShortcuts.html#Configurable_hotkeys) hotkey.



<h3 id="Tab"><a href="TabBar.html">Tab or TabBar</a></h3>

When [tabs are visible](Settings.html#Tabs), each tab represents one ‘window’.
Each window may be [RealConsole](ConEmuTerms.html#RealConsole) (running any console application),
or Far Manager editor/viewer.

When several editors/viewers are opened in Far Manager - first tab represents panels,
and rightwards tabs represents editor/viewer windows.



<h3 id="Pane"><a href="SplitScreen.html">Split or Pane</a></h3>

ConEmu's working surfaces may be splitted into several panes.



<h3 id="TabCompletion"><a href="TabCompletion.html">Tab Completion</a></h3>

When you type anything in your [Shell](TerminalVsShell.html) prompt
and press key `Tab` your shell use some heuristics to do auto-completion.

ConEmu do not handle ‘Tab completion’ because it completely depends
on the shell you are using. But ConEmu is universal terminal where anyone
may run any shell of their choice.

But you may read some recommendations about
[shell completion configuration](TabCompletion.html).
