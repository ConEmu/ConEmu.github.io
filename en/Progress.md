---
redirect_from:
 - /ru/Progress.html

title: "ConEmu | Progress"

description: "ConEmu may detect current operation progress and show it on the Windows task bar button."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features
---

# Progress of operations

ConEmu use simple AI to detect operation progress by title bar or console text.
So, you'll see current operation status of many programs, such as FAR,
wget, nerocmd, 7-zip, chkdsk, and so on...

Operation progress, detected in any console (active console is preferred)
is shown in window title.

~~~
{35%} C:\Arch\7z.exe a ...
~~~

ConEmu prepend percentage value with asterisk,
when operation runs in background (inactive console)
and active console have no operation.

~~~
{*35%} C:\Arch\7z.exe a ...
~~~


## Progress on Windows7 taskbar

![ConEmu progress in Windows7](/img/ConEmuProgress.png)
