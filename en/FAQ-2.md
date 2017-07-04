---
title: ConEmu | FAQ - Part 2

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-2.html
   ru: /ru/FAQ-2.html
---

# Distribution package  {#q-2-distr}

{% include faq_disclaimer_en.md %}

* [Q. What is the purpose of ConEmuSetup.exe?](#q-2-1)
* [Q. What is the purpose of ConEmuC.exe (ConEmuC64.exe)?](#q-2-2)
* [Q. What is the purpose of the Far plugin ConEmu.dll (ConEmu.x64.dll)?](#q-2-3)
* [Q. What is the purpose of ConEmuHk.dll (ConEmuHk64.dll)?](#q-2-4)
* [Q. What is the purpose of ExtendedConsole.dll (ExtendedConsole64.dll)?](#q-2-5)



#### Q. What is the purpose of ConEmuSetup.exe?   {#q-2-1}

**A.** Using the installer `ConEmuSetup.*.exe` is recommended on computers
with UAC enabled (Vista and higher), if you intend to install ConEmu
into "Program Files".


**A.** The installer also contains some additional files, e.g. `KeyEvents.exe`.




#### Q. What is the purpose of ConEmuC.exe (ConEmuC64.exe)?   {#q-2-2}

**A.** This is the "console" component of ConEmu. It communicates
information from the real console to the graphical shell
(ConEmu.exe). This process also controls automatic buffer resizing
when running commands/applications, and attaching "new" consoles
(Shift-Enter in FAR) to ConEmu.




#### Q. What is the purpose of the Far plugin ConEmu.dll (ConEmu.x64.dll)?   {#q-2-3}

**A.** This module provides communication between Far Manager and ConEmu.

* It is required for certain extended features (tabs, Drag-and-Drop, progress).
* It is required for TrueColor in Far 3.x.
* It is required for certain other plugins (e.g. FarHints).
* It displays the hidden real console (with FAR), should ConEmu crash.
* After a console detach (Ctrl-Alt-Tab), it spawns a new ConEmu for the new console.
* It is required to retrieve the long output buffer for console applications.
* It is required for proper mouse function when using «far /w» (System\WindowMode=1).



#### Q. What is the purpose of ConEmuHk.dll (ConEmuHk64.dll)?   {#q-2-4}

**A.** This module is injected into applications ran in ConEmu. It is
required to implement certain options, as well as work around
multiple problems manifesting both with and without ConEmu.

* Z-order of GUI dialogues (without it, dialogues will appear behind ConEmu's window);
* Proper function of Far Manager GUI-EMenu (without ConEmuHk`*`.dll it refuses to close by mouse click);
* Implements the flags "No zone check", "Ascii sort...", "Hourglass if not responding";
* Implements the "-new_console" parameter;
* Works around ShellExecute problems (when batch file output does not appear in the console);
* Works around chcp hangs;
* Implements "Shell and processes" monitoring;
* Implements hosting of GUI applications in a ConEmu tab, etc.
* Implements ANSI X3.64 with xterm 256 color extension.
* Implements "Change prompt text cursor position with Left Click".
* And any other existing or future «inprocess» features.



#### Q. What is the purpose of ExtendedConsole.dll (ExtendedConsole64.dll)?   {#q-2-5}

**A.** This file implements support for the extended console feature in
Far 3.x, and must be placed in the same directory as ConEmuHk.dll.
In its presence and enabled «TrueMod support» option, it is possible
to configure and use arbitrary (24-bit) colors and styles
(bold/italic/underline) in Far Manager.
