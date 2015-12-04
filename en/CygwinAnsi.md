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
 - url: RoadMap.html#cygwin-terminal
   title: "RoadMap: Better Cygwin/MSys support"
 - url: CygwinMsys.html
   title: "Cygwin and Msys"
 - url: AnsiEscapeCodes.html
   title: "ANSI sequences supported by ConEmu"
---

# Cygwin and pty related issues

I have many reports about cygwin.
And most of them are related to one cygwin behavior: when it detects real win32 console,
it process all ANSI sequences internally, so ConEmu does not receive ANSI at all.

Yep, users say: ‘It is working in mintty’.

Answer is simple: mintty is not a ‘real’ console, all its magic is done with pipes.

On the one hand - cygwin detects ‘pipe’ mode (that mode may be named ‘pty’ or ‘cygwin terminal’)
and do not process ANSI internally, but just bypass them to terminal.

On the other hand - many console applications fails in mintty (most known to me - PowerShell and Far Manager).

ConEmu is hybrid terminal.
It support all functionality Windows offers to console applications
AND is able to process [ANSI sequences](AnsiEscapeCodes.html),
all magic is done by [hooking Windows API](ConEmuHk.html).

But cygwin do not know about [ConEmu abilities](AnsiEscapeCodes.html) and
I do not know any way to force cygwin to do ‘right’ things (send ANSI to ConEmu consoles).

May be in future I'll find a way to combine pty and real console features,
but at the moment, may be, better and faster way is request the ‘feature’
from cygwin developers.



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
<strong><a href="http://www.fosshub.com/ConEmu.html" rel="nofollow">the latest ALPHA version</a></strong>,
change your cygwin/msys task startup command and use console tools in ConEmu's native way.



## Some links

* [Fixing prompt coloring with Cygwin, zsh and ohmyzsh](https://plus.google.com/100883784258900633261/posts/GZ7fGAA4m6W)
