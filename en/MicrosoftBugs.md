---
redirect_from: /ru/MicrosoftBugs.html

title: "ConEmu | Some Windows Bugs and Workarounds"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: ConEmuHk.html
   title: "ConEmuHk - Hooks and Injects"
---

# Some Windows Bugs and Workarounds

* [Broken text is returned from console input](#BrokenText)
* [Broken cursor position and height in Windows 10](#BrokenCursor-10)
* [Broken WM_MOUSEWHEEL's mouse cursor position in Windows 10](#WM_MOUSEWHEEL-10)
* [Broken desktop coordinate system in Windows 10](#SetWindowPos-10)
* [Exception in ReadConsoleOutput](#Exception_in_ReadConsoleOutput)
* [Console screen buffer corrupts from other console application](#Console_screen_buffer_corrupts_from_other_console_application)
* [chcp hung](#chcp_hung)
* [Insert/Overwrite indication](#Insert-Overwrite-Indicator)
* [Conclusion](#Conclusion)





## Broken text is returned from console input  {#BrokenText}

In some cases, broken text is returned from console input buffer.

Full description: <https://github.com/Maximus5/ms-bug-2>.

| Appeared | Fixed |
|:--------|:------|
| Windows 2000 | ? |

### Related issues

* [Issue 760: Unexpected characters when pasting in Terminal](https://github.com/Maximus5/issues/760)
* [Old-Issue 903: Plink tab paste issue](https://github.com/Maximus5/conemu-old-issues/issues/903)




## Broken cursor position and height in Windows 10  {#BrokenCursor-10}

After `SetConsoleScreenBufferSize` call cursor position and height are broken.

Full description: <https://github.com/Maximus5/ms-bug-1>.

| Appeared | Fixed |
|:--------|:------|
| Windows 10 (14361) | Windows 10 (14371) |

### Workaround

Choose ‘Fixed cursor size’ at [Text cursor](SettingsTextCursor.html) settings page.

### Related issues

* [Issue 718: Cursor disappears after window resize](https://github.com/Maximus5/ConEmu/issues/718)




## Broken WM_MOUSEWHEEL's mouse cursor position in Windows 10  {#WM_MOUSEWHEEL-10}

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




## Broken desktop coordinate system in Windows 10  {#SetWindowPos-10}

[insider/forum/insider_wintp-insider_desktop/desktop-coordinate-system-is-broken](http://answers.microsoft.com/en-us/insider/forum/insider_wintp-insider_desktop/desktop-coordinate-system-is-broken/9e6fd9ab-6d27-45e0-bb55-4c868cd6ac45)

More details in this sample project: [ms-bug-3](https://github.com/Maximus5/ms-bug-3#coordinate-system-is-broken-in-windows-10).

| Appeared | Fixed |
|:--------|:------|
| Windows 10 | ? |

### Related issues

* [Issue 284: Conemu does not "snap" properly](https://github.com/Maximus5/ConEmu/issues/284)




## Exception in ReadConsoleOutput  {#Exception_in_ReadConsoleOutput}

[social.msdn.microsoft.com/Forums/en-US/40c8e395-cca9-45c8-b9b8-2fbe6782ac2b](http://social.msdn.microsoft.com/Forums/en-US/40c8e395-cca9-45c8-b9b8-2fbe6782ac2b)


| Appeared | Fixed |
|:--------|:------|
| Windows 7 | Windows 10 |

### Sample project

[http://conemu-maximus5.googlecode.com/svn/files/BugReports/](http://conemu-maximus5.googlecode.com/svn/files/BugReports/)

### Workaround

Turn on ‘Inject ConEmuHk’ option.

### Related issues

* [Issue 1060: git rebase using vim as an editor crashes conemu](https://github.com/Maximus5/conemu-old-issues/issues/1060)
* [Issue 1061: interactive git rebasing causes ConEmu to crash](https://github.com/Maximus5/conemu-old-issues/issues/1061)
* [Issue 1146: Crash when doing "git diff"](https://github.com/Maximus5/conemu-old-issues/issues/1146)
* [Issue 1190: ConEmu crashes](https://github.com/Maximus5/conemu-old-issues/issues/1190)
* [Issue 1203: Occasional crash when vim.exe is started](https://github.com/Maximus5/conemu-old-issues/issues/1203)
* [Issue 1204: Fail after updating Far with UpDateEx](https://github.com/Maximus5/conemu-old-issues/issues/1204)
* and others...




## Console screen buffer corrupts from other console application  {#Console_screen_buffer_corrupts_from_other_console_application}

[social.msdn.microsoft.com/Forums/en-US/ec363615-397c-42a8-84d2-38a70e4f8ae2](http://social.msdn.microsoft.com/Forums/en-US/ec363615-397c-42a8-84d2-38a70e4f8ae2)

| Appeared | Fixed |
|:--------|:------|
| Windows 7 | Windows 8 |

### Related issues

* [Issue 65: Telnet.exe is not working](https://github.com/Maximus5/conemu-old-issues/issues/65)
* [Issue 107: 32-bit console applications](https://github.com/Maximus5/conemu-old-issues/issues/107)
* [Issue 529: Tunnelier stermc.exe hangs under Win7](https://github.com/Maximus5/conemu-old-issues/issues/529)
* [Issue 669: text editor Aurora is working](https://github.com/Maximus5/conemu-old-issues/issues/669)


### Workaround

Turn on ‘Inject ConEmuHk’ option. Workaround was first created in ConEmu build 120509a.




## chcp hung  {#chcp_hung}

Console code page change (`chcp.com`, `SetConsoleCP`, `SetConsoleOutputCP`) hungs.


| Appeared | Fixed |
|:--------|:------|
| Windows XP | ? |

### Related issues

* [Issue 60: hung while running chcp 1251 on win2003](https://github.com/Maximus5/conemu-old-issues/issues/60)

### Workaround

Turn on ‘Inject ConEmuHk’ option.




## Insert/Overwrite indication  {#Insert-Overwrite-Indicator}

It is not possible to determine the state of
[ReadConsole](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684958.aspx)
procedure.
ConEmu do not know if the [RealConsole](RealConsole.html)
is in the ‘Insert’ or ‘Overwrite’ mode.

Wny not? Description is [here](InsertOverwrite.html).

### Workaround

Doesn't exists.




## Conclusion  {#Conclusion}

My (and not only) experience in ‘bug reporting’ suggests that
Microsoft won't fix reported bugs in current versions of Windows.
Even in service packs.

But, may be, bug will be fixed in the next version of Windows
if you manage to report them...

Users and developers, help yourself.
