---
redirect_from:
 - /ru/GlobalHotKeys.html

title: "ConEmu | Global Hot Keys"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls
---

# Global Hot Keys in ConEmu

ConEmu ‘Keys & Macro’ page contains few hotkeys marked as ‘Global’.
Thought, most using are ‘Minimize/Restore’
and ‘Activate ConEmu and 'CD' to last Explorer window path’.

* [Limitations](#limitations)
* [Active keyboard layout dependency (Quake hotkey)](#active-layout)
* [Using F12 as global hotkey](#Using_F12_as_global_hotkey)



## Limitations  {#limitations}

These hotkeys are registered globally in system via
[RegisterHotKey](http://msdn.microsoft.com/en-us/library/windows/desktop/ms646309.aspx)
and are available even ConEmu has no focus.

That is because these hotkeys are processed by Windows.
However, some **limitations** applied:

* Hotkeys depend on active keyboard layout. The solution is [below](#active-layout).
* You can't use [Apps](AppsKey.html) as modifier.
* Left and Right modifiers are indifferent.
* You can't register hotkey already registered by any other application.
  Actually, a lot of hotkeys are seized by Windows itself.
* The F12 key is [reserved for use by the debugger](http://msdn.microsoft.com/en-us/library/windows/desktop/ms646309.aspx)
  at all times, so it should not be registered as a hot key. Even when you are not debugging an application,
  F12 is reserved in case a kernel-mode debugger or a just-in-time debugger is resident.
  The solution is [below](#Using_F12_as_global_hotkey).



## Active keyboard layout dependency (Quake hotkey)  {#active-layout}

Perpaps, this is most frustrating limitations. Global hotkeys are processed by Windows kernel,
and application receives only [WM_HOTKEY](http://msdn.microsoft.com/en-us/library/windows/desktop/ms646279.aspx)
message. But the function [RegisterHotKey](http://msdn.microsoft.com/en-us/library/windows/desktop/ms646309.aspx)
gets as parameter [Virtual Key Code](http://msdn.microsoft.com/en-us/library/windows/desktop/dd375731.aspx),
which depends on user's active keyboard layout.

So, there is no way to register global hotkey by ‘hardware scan code’ which is layout independent.
Well, unless hooking absolutely all running applications, which is not a good option...

There are two solutions.

1. If the ‘Minimize/Restore’ (also known as ‘Quake style slide down/up’) hotkey
   is not working on your secondary keyboard layout (language), you may set up
   additional hotkey for that layout: ‘Minimize/Restore (alternative)’.
   So, you will get two global hotkeys, one per keyboard layout.
2. [AutoHotKey](AutoHotKey.html) allows to set up almost unlimited
   amount of global hotkeys and actions. Refer to their documentation and
   ConEmu's automation language [GuiMacro](GuiMacro.html).



## Using F12 as global hotkey  {#Using_F12_as_global_hotkey}

[MSDN](http://msdn.microsoft.com/en-us/library/windows/desktop/ms646309(v=vs.85).aspx) claims,
that F12 is reserved for use by the debugger.

~~~
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug]
"UserDebuggerHotKey"=dword:00000000 ; The default, steal F12 global hotkey
~~~

However, [technet](http://technet.microsoft.com/en-us/library/cc786263.aspx)
describes a way how to choose another key via registry.
For example, change the value to `0x13` to use `Pause` key for debugger.

**NB** That disallows using `Pause` as **global** hotkey,
but you still may use it (and combinations) as local hotkeys.

~~~
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug]
"UserDebuggerHotKey"=dword:00000013 ; Change it to Pause global hotkey
~~~

| Code | Name | Code | Name | Code | Name |
|:-----|:-----|:-----|:-----|:-----|:-----|
| 0x00 | F12 | 0x15 | VK_KANA, ... | 0x25 | VK_LEFT |
| 0x01 | VK_LBUTTON | 0x17 | VK_JUNJA | 0x26 | VK_UP |
| 0x02 | VK_RBUTTON | 0x18 | VK_FINAL | 0x27 | VK_RIGHT |
| 0x03 | VK_CANCEL | 0x19 | VK_HANJA, ... | 0x28 | VK_DOWN |
| 0x04 | VK_MBUTTON | 0x1B | VK_ESCAPE | 0x29 | VK_SELECT |
| 0x08 | VK_BACK | 0x1C | VK_CONVERT | 0x2A | VK_PRINT |
| 0x09 | VK_TAB | 0x1D | VK_NONCONVERT | 0x2B | VK_EXECUTE |
| 0x0C | VK_CLEAR | 0x1E | VK_ACCEPT | 0x2C | VK_SNAPSHOT |
| 0x0D | VK_RETURN | 0x1F | VK_MODECHANGE | 0x2D | VK_INSERT |
| 0x10 | VK_SHIFT | 0x20 | VK_SPACE | 0x2E | VK_DELETE |
| 0x11 | VK_CONTROL | 0x21 | VK_PRIOR | 0x2F | VK_HELP |
| 0x12 | VK_MENU | 0x22 | VK_NEXT | 0x30–0x39 | (ASCII 0–9) |
| 0x13 | VK_PAUSE | 0x23 | VK_END | 0x41–0x5A | (ASCII A–Z) |
| 0x14 | VK_CAPITAL | 0x24 | VK_HOME |  | |
