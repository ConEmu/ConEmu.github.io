---
title: ConEmu | Console-related delusions

description: "There are several delusions frequently said by users.
   This article explains few of them."

bc1_url: TableOfContents.html#conemu
bc1_title: ConEmu

sa1_url: TableOfContents.html#terms
sa1_title: ConEmu terms

sa2_url: ConEmuFAQ.html
sa2_title: Frequently Asked Questions
---

# Console-related delusions

## To treat PuTTY, mintty and others as ‘console applications’.

Simplifying, the ‘console application’ is an executable which
interacts with user via data input/output (mainly text). ‘Console
application’ is not able to ‘draw’ anything, it has not graphical
interface at all. It works with input/output streams only
(redirection, pipes, magic symbols `<`, `>`, `|`).

    cmd /? > cmd.log & type cmd.log | find "HKEY"

When ‘console application’ starts in Windows the special console
window is created and that very window do all text drawing, which
‘console application’ was printed, and that window redirects user
keypresses into ‘console application’ input buffer. This console
window is often called (local) terminal.

PuTTY, KiTTY, mintty and other terminals ARE NOT ‘console
applications’. They are graphical applications (have their own
graphical interfaces) able to connect to remote servers to run
‘console applications’ remotely, or they are working as local
terminals allowing input/output ability to ‘console applications’ on
your local PC.

You can't redirect terminal "output" into any local file because
terminal is working with display and keyabord but not any
input/output streams. The only exception is logging specially
configured in that exact terminal.

## To name standard Windows console - ‘cmd.exe’.

Windows has its own terminal (or ‘console window’) which is often
erroneously called ‘cmd.exe’. Just press Win+R and run, for example,
"powershell.exe". You will not see "cmd.exe" in the started process
tree. In different Windows versions different executables create
console window, just now it is "conhost.exe".

Not ‘cmd.exe’, just a ‘console’!
