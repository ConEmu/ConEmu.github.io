---
redirect_from: /ru/ConsoleApplication.html

title: "ConEmu | Console Applications"

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms
 - url: https://msdn.microsoft.com/en-us/library/windows/desktop/ms681913.aspx
   title: Windows console API
---

# Console Applications

Console application is a specially compiled windows executable which
is working with in/out streams and (usually) do not have any
graphical interface.

Few examples: cmd.exe, powershell.exe, sh.exe, dism.exe, java.exe
(but not javaw.exe), python.exe, telnet.exe and so on.

These applications may be runned in the terminals only ([TerminalVsShell](TerminalVsShell.html)).
Terminal accepts user input, sends it to application input stream,
reads application output and displays it in its own window as text.

Few terminal examples:
[conhost.exe](http://www.howtogeek.com/howto/4996/what-is-conhost.exe-and-why-is-it-running/)
(but not a cmd.exe like [many users think](Delusions.html)),
ConEmu, ConsoleZ, mintty, PuTTY, KiTTY, Xshell and many others.

One more note. Terminals may be ‘local’ and ‘remote’.
Remote terminals connect to remote hosts to run applications remotely.
ConEmu is a **local** terminal (also known as console window).
