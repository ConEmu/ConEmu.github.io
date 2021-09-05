---
redirect_from:
 - /en/MiniDump.html
 - /ru/MiniDump.html
 - /ru/MemoryDump.html

title: "ConEmu | MemoryDump"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: CrashDump.html
   title: "Automatic crash dumps"
---

# MemoryDump

‘Memory dump’ (or ‘Mini dump’, or ‘Crash dump’) is a binary file,
containing full or brief information about program state
at specified moment. Usually, files has `.dmp` or `.mdmp` extension.

Following information is a copy of answers from [ConEmu FAQ](ConEmuFAQ.html).

* [How to create a minidump](#How_to_create_a_minidump)
  * [Process Explorer](#Process_Explorer)
  * [ConEmu System menu](#ConEmu_System_menu)
  * [Using ConEmuC command line](#Using_ConEmuC_command_line)
  * [Using Windows Task manager](#Using_Windows_Task_manager)
  * [Using postmortem debugger](#Using_Postmortem_Debugger)
* [How to find Process ID (PID)](#How_to_find_Process_ID)

{% include in_article.html %}



## How to create a minidump  {#How_to_create_a_minidump}

There are several ways to create memory dumps.



### Process Explorer   {#Process_Explorer}

[Process Explorer](ProcessExplorer.html) can create proper ‘Memory dumps’.
But be sure, you are using latest ‘Process Explorer’ version (15.40 is OK now).

Just locate process in the list, right click on it and choose ‘Create dump’ -> Mini or Full.



### ConEmu System menu   {#ConEmu_System_menu}

ConEmu GUI offers easy creation of ‘[ActiveProcess](ActiveProcess.html) memory dump’.
Just choose menu item from [SystemMenu](SystemMenu.html) -> Debug.

**Note** ‘Active Process’ is **console** process or [ChildGui](ChildGui.html) application,
but not a `ConEmu[64].exe` or `ConEmuC[64].exe`.



### Using ConEmuC command line   {#Using_ConEmuC_command_line}

**Windows XP and above**

Press **Win+R** and run the following command, it will create a
full process memory dump (it may be large enough).

~~~
"C:\Program Files\ConEmu\ConEmu\ConEmuC.exe" /DEBUGPID=Your_PID /FULL
~~~

Or, create a small process memory dump.
Yes, it will be small, but may contains not enough information for detecting a problem.

~~~
"C:\Program Files\ConEmu\ConEmu\ConEmuC.exe" /DEBUGPID=Your_PID /MINI
~~~

Substitute *Your_PID* with the process ID,
[read below](MemoryDump.html#How_to_find_Process_ID_(PID)).
You will be offered to choose filename for a minidump.

***Warning!*** Before creating dumps of Far Manager please ensure that "far.exe" was started with "/x" switch.



### Using Windows Task manager   {#Using_Windows_Task_manager}

**Windows 7 and up**

*Warning! This method only works for processes with the same bitness as the operating system.
Therefore, you won't be able to create a working minidump for 32-bit processes when using a 64-bit Windows version.*

Open Windows' Task Manager, switch to the "Processes" tab, right-click the process, and select "Create dump file".





### Using postmortem debugger  {#Using_Postmortem_Debugger}

The [ProcDump](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump) tool from SysInternals can install
itself as postmortem debugger and it will create for you crash dumps automatically when any process in your system
is terminated unexpectedly.

Example command to install procdump as postmortem debugger (the command should be executed in the elevated console):

~~~
procdump.exe -i C:\CrashDumps -ma
~~~

To remove postmortem debugger:

~~~
procdump.exe -u
~~~




## How to find Process ID (PID)  {#How_to_find_Process_ID}

A. You can find the Process ID near to Process Name (ConEmu.exe, cmd.exe, etc.)

* in Windows' Task Manager;
* in the ConEmu status line;
* in the Info page of ConEmu [Settings](Settings.html#Info) dialog.

**Note!** Sometimes PID column in the Task Manager window may be hidden, enable it in Task manager settings.

* Windows 7 and below: Task Manager -> Processes tab -> Menu -> View -> Select Columns -> Check ‘PID’.
* Windows 8: Task Manager -> Show ‘More details’ -> Processes tab -> Right click on column title -> Check ‘PID’.
