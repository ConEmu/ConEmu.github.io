---
redirect_from: /ru/MicrosoftBugs.html

title: "ConEmu | Some Windows Bugs and Workarounds"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback
---

# Some Windows Bugs and Workarounds

* [Broken WM_MOUSEWHEEL's mouse cursor position in Windows 10](#WM_MOUSEWHEEL-10)
* [Broken desktop coordinate system in Windows 10](#SetWindowPos-10)
* [Exception in ReadConsoleOutput](#Exception_in_ReadConsoleOutput)
* [Console screen buffer corrupts from other console application](#Console_screen_buffer_corrupts_from_other_console_application)
* [chcp hung](#chcp_hung)
* [Insert/Overwrite indication](#Insert-Overwrite-Indicator)
* [Conclusion](#Conclusion)




<h2 id="WM_MOUSEWHEEL-10"> Broken WM_MOUSEWHEEL's mouse cursor position in Windows 10 </h2>

[MSDN says](https://msdn.microsoft.com/en-us/library/windows/desktop/ms645617.aspx)
that WM_MOUSEWHEEL/lParam contains X and Y coordinates of the mouse pointer,
relative to the upper-left corner of the screen.

But that is not true in Windows 10 anymore.
Seems like the bug relates to several monitors, larger than 100% scale,
and focused child window.
Than, your window will receive larger coordinates than they would be.

| Appeared | Fixed |
|:--------|:------|
| Windows 10 | ? |

### Workaround

There is no proper workaround, because mouse pointer may be moved,
after WM_MOUSEWHEEL was posted.

However, in most cases, retrieving mouse coordinates using
[GetCursorPos](https://msdn.microsoft.com/en-us/library/windows/desktop/ms648390.aspx),
instead of relying on message's lParam, will be suitable.

### Related issues

* [Issue 216: Mouse wheel only works on first console in split window](https://github.com/Maximus5/ConEmu/issues/216)




<h2 id="SetWindowPos-10"> Broken desktop coordinate system in Windows 10 </h2>

[insider/forum/insider_wintp-insider_desktop/desktop-coordinate-system-is-broken](http://answers.microsoft.com/en-us/insider/forum/insider_wintp-insider_desktop/desktop-coordinate-system-is-broken/9e6fd9ab-6d27-45e0-bb55-4c868cd6ac45)

| Appears | Fixed |
|:--------|:------|
| Windows 10 | ? |


<h2 id="Exception_in_ReadConsoleOutput"> Exception in ReadConsoleOutput </h2>

[social.msdn.microsoft.com/Forums/en-US/40c8e395-cca9-45c8-b9b8-2fbe6782ac2b](http://social.msdn.microsoft.com/Forums/en-US/40c8e395-cca9-45c8-b9b8-2fbe6782ac2b)


| Appears | Fixed |
|:--------|:------|
| Windows 7 | Windows 10 |

### Sample project

[http://conemu-maximus5.googlecode.com/svn/files/BugReports/](http://conemu-maximus5.googlecode.com/svn/files/BugReports/)

### Workaround

Turn on ‘Inject ConEmuHk’ option.

### Related issues

* [Issue 1060: git rebase using vim as an editor crashes conemu](http://code.google.com/p/conemu-maximus5/issues/detail?id=1060)
* [Issue 1061: interactive git rebasing causes ConEmu to crash](http://code.google.com/p/conemu-maximus5/issues/detail?id=1061)
* [Issue 1146: Crash when doing "git diff"](http://code.google.com/p/conemu-maximus5/issues/detail?id=1146)
* [Issue 1190: ConEmu crashes](http://code.google.com/p/conemu-maximus5/issues/detail?id=1190)
* [Issue 1203: Occasional crash when vim.exe is started](http://code.google.com/p/conemu-maximus5/issues/detail?id=1203)
* [Issue 1204: Fail after updating Far with UpDateEx](http://code.google.com/p/conemu-maximus5/issues/detail?id=1204)
* and others...



<h2 id="Console_screen_buffer_corrupts_from_other_console_application"> Console screen buffer corrupts from other console application </h2>

[social.msdn.microsoft.com/Forums/en-US/ec363615-397c-42a8-84d2-38a70e4f8ae2](http://social.msdn.microsoft.com/Forums/en-US/ec363615-397c-42a8-84d2-38a70e4f8ae2)

| Appears | Fixed |
|:--------|:------|
| Windows 7 | Windows 8 |

### Related issues

* [Issue 65: Telnet.exe is not working](http://code.google.com/p/conemu-maximus5/issues/detail?id=65)
* [Issue 107: 32-bit console applications](http://code.google.com/p/conemu-maximus5/issues/detail?id=107)
* [Issue 529: Tunnelier stermc.exe hangs under Win7](http://code.google.com/p/conemu-maximus5/issues/detail?id=529)
* [Issue 669: text editor Aurora is working](http://code.google.com/p/conemu-maximus5/issues/detail?id=669)


### Workaround

Turn on ‘Inject ConEmuHk’ option. Workaround was first created in ConEmu build 120509a.



<h2 id="chcp_hung"> chcp hung </h2>

Console code page change (`chcp.com`, `SetConsoleCP`, `SetConsoleOutputCP`) hungs.


| Appears | Fixed |
|:--------|:------|
| Windows XP | ? |

### Related issues

* [Issue 60: hung while running chcp 1251 on win2003](http://code.google.com/p/conemu-maximus5/issues/detail?id=60)

### Workaround

Turn on ‘Inject ConEmuHk’ option.



<h2 id="Insert-Overwrite-Indicator"> Insert/Overwrite indication </h2>

It is not possible to determine the state of
[ReadConsole](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684958.aspx)
procedure.
ConEmu do not know if the [RealConsole](RealConsole.html)
is in the ‘Insert’ or ‘Overwrite’ mode.

Wny not? Description is [here](InsertOverwrite.html).

### Workaround

Doesn't exists.



<h2 id="Conclusion"> Conclusion </h2>

My (and not only) experience in ‘bug reporting’ suggests that
Microsoft won't fix reported bugs in current versions of Windows.
Even in service packs.

But, may be, bug will be fixed in the next version of Windows
if you manage to report them...

Users and developers, help yourself.
