---
title: ConEmu | FAQ - Part 9

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-9.html
   ru: /ru/FAQ-9.html
---

# Abnormal termination  {#q-9-crash}

{% include faq_disclaimer_en.md %}

* [Q. Upon exiting from a console program, an error such as the following appears: Access violation at address 6F78DE5B in module ' ConEmuHk .dll'. Read of address 0071004E](#q-9-1)
* [Q. ConEmu or console application hangs on exit](#q-9-2)
* [Q. How to create a minidump](#q-9-3)
* [Q. Where can I find Process ID (PID)](#q-9-4)
* [Q. How to run Task Manager](#q-9-5)
* [Q. ConEmuC: CreateFile (CONOUT$) failed, ErrCode =0x00000005](#q-9-6)




#### Q. Upon exiting from a console program, an error such as the following appears: Access violation at address 6F78DE5B in module 'ConEmuHk.dll'. Read of address 0071004E   {#q-9-1}

**A.** One possible cause is when the program destroys its own import
table. The proper solution would be to contact the application
developer. For a precise verdict, send me a [minidump](MemoryDump.html).



#### Q. ConEmu or console application hangs on exit   {#q-9-2}

**A.** No issues for this problem have been filed so far. Nevertheless,
if hang occures on exit, create [minidumps](MemoryDump.html) for the
processes ConEmu`*`.exe, ConEmuC`*`.exe and all console processes
(far.exe, cmd.exe...) See below for instructions. Pack up and submit
the [minidumps](MemoryDump.html) to the developer. To correctly
create a [minidump](MemoryDump.html) of a 32-bit application in a
64-bit OS, you must use ConEmu.



#### Q. How to create a minidump   {#q-9-3}

**A.** **Windows XP and above.**

Press `Win+R` and run the following command, it will create a full process memory dump (it may be large enough).

~~~
C:\Program Files\ConEmu\ConEmu\ConEmuC.exe /DEBUGPID=Your_PID /FULL
~~~
Or, create a small process memory dump. Yes, it will be small, but may contains not enough information for detecting a problem. 
~~~
C:\Program Files\ConEmu\ConEmu\ConEmuC.exe /DEBUGPID=Your_PID /MINI
~~~

Substitute *Your_PID* with the process ID, [read below](MemoryDump.html#How_to_find_Process_ID_(PID)).
You will be offered to choose filename for a minidump.

**Warning!** Before creating dumps of Far Manager please ensure that "far.exe" was started with "/x" switch.

**A.** **Windows 7 and up.**

*Warning! This method only works for processes with the same bitness as the operating system.
Therefore, you won't be able to create a working minidump for 32-bit processes when using a 64-bit Windows version.*

Open Windows' Task Manager, switch to the "Processes" tab, right-click the process, and select "Create dump file".


**A.** **Process Explorer.**

‘Process Explorer’ can also create minidumps,
however *it will also fail to create a correct minidump for a 32-bit process on a 64-bit system*.



#### Q. Where can I find Process ID (PID)   {#q-9-4}

**A.** You can find the Process ID near to Process Name (ConEmu.exe, cmd.exe, etc.)

* in Windows' Task Manager, PID column on Processes page;
* in the ConEmu status line;
* in the Info page of ConEmu [Settings](Settings.html#Info) dialog.

**Note!** Sometimes PID column in the Task Manager window may be hidden, enable it in Task manager settings.

* Windows 7 and below: Task Manager -> Processes tab -> Menu -> View -> Select Columns -> Check «PID».
* Windows 8: Task Manager -> Show «More details» -> Processes tab -> Right click on column title -> Check «PID».



#### Q. How to run Task Manager   {#q-9-5}

**A.** Press **Ctrl+Shift+Esc** or right click on taskbar and choose menu item «Task Manager».



#### Q. ConEmuC: CreateFile(CONOUT$) failed, ErrCode=0x00000005   {#q-9-6}

**A.** The launched program created and set up its own console buffer created using `CreateConsoleScreenBuffer(..., 0/*No sharing*/, ...)`. Ask the program author to create the buffer with the correct access flags:

~~~
(GENERIC_READ|GENERIC_WRITE, FILE_SHARE_READ|FILE_SHARE_WRITE,...)
~~~
