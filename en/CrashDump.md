---
redirect_from: /ru/CrashDump.html

title: "ConEmu | Crash Dump"

readalso:
 - url: MemoryDump.html
   title: "Creating memory dumps"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback
---

# Reporting ConEmu crashes

ConEmu is stable enough.
But, unfortunately, any product may have yet unfixed problems.
Please read the following if you find one.

* [Third-party bugs](#third-party-bugs)
* [ConEmu and ConEmuC processes](#conemu-processes)
* [Console applications](#console-applications)
  * [How to create required dump](#How_to_create_required_dump)
* [Manual dump creation](#manual-dumps)


## Third-party bugs  {#third-party-bugs}

**Please, note!** I often receive reports related to several
[MicrosoftBugs](MicrosoftBugs.html).
If you see the crash, please read [wiki](MicrosoftBugs.html)
and make sure [Inject ConEmuHk](ConEmuHk.html) feature is enabled!


## ConEmu and ConEmuC processes  {#conemu-processes}

Well, if any unknown crash was occured in `ConEmu` or `ConEmuC` processes,
[MemoryDump](MemoryDump.html) may greatly help to locate and fix the problem.

Crashes in `ConEmu[64].exe` and `ConEmuC[64].exe` are handled automatically
and application suggests to user (message box) to create
[MemoryDump](MemoryDump.html) (full or mini).
Due to limitation of issues attachments, please upload **Zipped** dumps to
[DropBox](DropBox.html) or any other hosting and post the link
to issues or via email.


## Console applications  {#console-applications}

ConEmu does not handle crashes (exceptions actually) in the running console applications.
That is because to minimize intrusion to running application.
So, if some application crashes in ConEmu and **do not crashes** when you run it
in the standard Windows' console started by `Win+R` for example, please read
[the following](#How_to_create_required_dump).


### How to create required dump   {#How_to_create_required_dump}

For example, you observe a crash in `ls.exe` process.
You have to set [environment variable](ConEmuEnvironment.html#Debug_purposed_variables)
`ConEmuReportExe` to that process name: `ls.exe`.

This may be done via:

* [Settings / Environment page](SettingsEnvironment.html)

~~~
set ConEmuReportExe=ls.exe
~~~

* [New console dialog](NewConsole.html). Example below sets `ConEmuReportExe` variable and starts `cmd.exe` as shell.

~~~
set ConEmuReportExe=ls.exe & cmd.exe
~~~

* In **some** shells (`cmd`, `tcc`, `far`) you may call `set` directly from prompt.

~~~
set ConEmuReportExe=ls.exe
~~~

Than, you may run you command from started [console](VirtualConsole.html):

~~~
ls
~~~

Message box must appears `ls.exe loaded`.

At this time, call ConEmu's
[System menu  > Debug > Active process memory dump](SystemMenu.html).

After pressing OK in "loaded" message box your error message expected.
Save the dump.
Upload **Zipped** dump to [DropBox](DropBox.html) or any other hosting.


## Manual dump creation  {#manual-dumps}

If you need to create dump manually (of any ConEmu's processes or console application)
please read that [wiki](MemoryDump.html).
