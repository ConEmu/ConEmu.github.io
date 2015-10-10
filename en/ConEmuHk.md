---
redirect_from: /ru/ConEmuHk.html

title: "ConEmu | ConEmuHk - Hooks and Injects"

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms
---

# Option ‘Inject ConEmuHk’

Injects? ConEmuHk.dll? All spawned processes in ConEmu consoles? Yes!

There are a lot of information exists in docs already,
but let it be here, in one place.

* [minhook alpha build note](#minhook)
* [Description](#descr)
* [Tech info](#Tech_info)
* [Slowdown](#Slowdown)
* [Third party problems](#Third_party_problems)
* [Conclusion](#Conclusion)


## minhook alpha build note  {#minhook}

Since [build 150814](http://conemu.github.io/blog/2015/08/14/Build-150814.html)
ConEmu is changing hooking technique from ‘changing IAT pointers’ to ‘detouring’.
Open source library [minhook](https://github.com/RaMMicHaeL/minhook) is used.

**However, some users with some special NVIDIA drivers may experience crashes
while running console applications.**

The problem is not fixed yet, but it is related to mysterious folder
[C:\Program Files\NVIDIA Corporation\CoProcManager](https://github.com/Maximus5/ConEmu/issues/272).
Removing/renaming this folder fixes the problem.

The quest is in progress.



## Description  {#descr}

ConEmu need to intercept large amount of Windows API functions,
otherwise it would be possible
neither to avoid certain [MicrosoftBugs](MicrosoftBugs.html)
nor implement much of juicy features.

One may said, ‘other terminals works without injects perfectly...’
But that is not true.

For example, mintty is small, fast and works without injects,
but you can't run there many programs (PowerShell, Far Manager and
many others using Windows console API).

Another well known terminal Console and its fork ConsoleZ, which are using injects,
will have same problems as ConEmu. Few examples:

* [Issue 643: assertion dialogs launched from hidden console window are inaccessible](https://github.com/Maximus5/conemu-old-issues/issues/643);
* [Issue 65: telnet.exe is not working](https://github.com/Maximus5/conemu-old-issues/issues/65).



## Tech info  {#Tech_info}

What are injects?

ConEmu provides two dlls `ConEmuHk.dll` and `ConEmuHk64.dll` which
will be loaded in each process of console processes started in ConEmu window.
Injections may be possible with SetThreadContext after CreateProcess.
When dll is loaded into target process it may hook Windows API (in that process only)
changing IAT pointers.



## Slowdown  {#Slowdown}

Current method of injections and hooking will cause small lag
when new process is created in the ConEmu console.
The lag is relatively small, and user may notice slowdown
in the only case of running hundreds and thousands of processes.

If you need maximum speed to run certain script you may use
switch [-cur_console:i](NewConsole.html).
But use it carefully, because console subsystem may
[crash](MicrosoftBugs.html#Exception_in_ReadConsoleOutput)
in some cases by reason of
[Microsoft bug](MicrosoftBugs.html#Exception_in_ReadConsoleOutput).
Usually, it may happens when you run Vim without ‘Inject ConEmuHk’ enabled.

The example below shows switch usage from `cmd.exe` prompt.
**NB** Leading `cmd.exe /c ` is required, otherwise `cmd` will not spawn
new process and the switch `-cur_console:i` will not have any effect.

```
> cmd.exe /c -cur_console:i your_batch_file.cmd
```



## Third party problems  {#Third_party_problems}

I had bunches of issues about ‘crashes in ConEmu’. Really? And what are the causes?

* [MicrosoftBugs](MicrosoftBugs.html). Windows kernel has several bugs leading to crashes,
  hungs and black screens. Microsoft fix bugs in next windows versions only.
  Great, user needs to buy new Windows... Workaround? Injects only.
* Third party tools run injects too. Several injection systems will conflict each other.
  The result? Crash! One system tries to execute LoadLibrary in the external process,
  but it think that LoadLibrary is located in the other module than kernel32.dll. Sadly.
  * MacType and sort of. There is workaround - add ConEmuC.exe and ConEmuC64.exe to MacType exclusion list.
    You may still use it with ConEmu.exe and ConEmu64.exe.
  * AnsiCon. Another ANSI sequences processor. ConEmu already implements that feature internally.
  * Intel pin. You may use it with wrapper batch file, disabling ConEmuHk temporarily.
    Read about [ConEmuHooks environment variable](ConEmuEnvironment.html).
* ConEmu bugs. Hmm, show me completely bugless software? Report the problem and it will be fixed, I hope.



## Conclusion  {#Conclusion}

Do you think still you have no need in ConEmuHk?
Well, you may **completely** disable them,
but **don't complain** of arisen problems,
which are absent when injects are enabled.

* Uncheck ‘Inject ConEmuHk’
* Physically delete files ConEmuHk.dll and ConEmuHk64.dll.

At last, I have some plans about rewritting hooks code using different technique.
But it will take time and I can't predict what speed improvement can be achieved.
