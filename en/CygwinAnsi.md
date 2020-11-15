---
redirect_from:
 - /ru/CygwinAnsi.html

title: "ConEmu | Cygwin and ANSI"

description: "When cygwin detects real win32 console, it process all ANSI sequences
   internally, so ConEmu does not receive ANSI at all."

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: CygwinMsysConnector.html
   title: "cygwin/msys connector"
 - url: RoadMap.html#cygwin-terminal
   title: "RoadMap: Better Cygwin/MSys support"
 - url: CygwinMsys.html
   title: "Cygwin and Msys"
 - url: AnsiEscapeCodes.html
   title: "ANSI sequences supported by ConEmu"
 - url: BashOnWindows.html
   title: "Bash On Ubuntu On Windows (WSL)"
---

# Cygwin and pty related issues

I have many false reports about cygwin behavior in ConEmu.

The problem is that when cygwin's applications detect [real win32 console](RealConsole.html),
**cygwin's core process** all ANSI sequences **internally** instead of bypassing them to terminal.
In other words, ConEmu **does not receive** any ANSI sequences at all.

Sample issues:
[gh-608](https://github.com/Maximus5/ConEmu/issues/608),
[gh-590](https://github.com/Maximus5/ConEmu/issues/590),
[old-issues#879](https://github.com/Maximus5/conemu-old-issues/issues/879),
etc.

Yep, users say: ‘It is working in mintty’.

Answer is simple: mintty is not a ‘real’ console, all its magic is done with pipes.

On the one hand - cygwin detects POSIX compatible ‘pipe’ mode
(that mode may be named ‘pty’ or ‘cygwin terminal’)
and do not process ANSI internally, but just bypass them to terminal.

On the other hand - many console applications fails in mintty
(most known to me - PowerShell and Far Manager).

ConEmu is **hybrid terminal**. It support all functionality
[Windows offers to console applications](https://msdn.microsoft.com/en-us/library/windows/desktop/ms681913.aspx)
**and** is able to process [ANSI sequences](AnsiEscapeCodes.html).
All magic is done by [hooking Windows API](ConEmuHk.html).

But cygwin do not know about [ConEmu abilities](AnsiEscapeCodes.html) and
I do not know any way to force cygwin to do ‘right’ things (send ANSI to ConEmu consoles).

May be in future I'll find a way to combine pty and real console features,
but at the moment, may be, better and faster way is request the ‘feature’
from cygwin developers.

{% include in_article.html %}



### cygwin/msys terminal connector  {#cygwin-connector}

Experimental approach to implement POSIX-compatible terminal (pty)
emulation is [on the go](CygwinMsysConnector.html).

Well, in fact, [cygwin/msys connector](CygwinMsysConnector.html)
is a simple tool which forces cygwin/msys core to disable ANSI processing
and let it just pass ANSI sequences to terminal unmodified.

Why the terminal application must create special hacks to disable ANSI processing?
I have not idea... Just a simple switch would be enough, but it does not exist.

Anyway, anyone may go to [cygwin/msys connector](CygwinMsysConnector.html),
download fresh test release, update ConEmu to
<strong><a href="{{ site.fosshub }}" rel="nofollow">the latest ALPHA version</a></strong>,
change your cygwin/msys task startup command and use console tools in ConEmu's native way.



## Some links

* [Fixing prompt coloring with Cygwin, zsh and ohmyzsh](https://plus.google.com/100883784258900633261/posts/GZ7fGAA4m6W)
