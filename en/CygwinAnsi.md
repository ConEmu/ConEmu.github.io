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

Yep, users said: ‘It is working in mintty’.

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


## Some links

* [Fixing prompt coloring with Cygwin, zsh and ohmyzsh](https://plus.google.com/100883784258900633261/posts/GZ7fGAA4m6W)
