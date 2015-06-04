---
redirect_from: /ru/CygwinHeap.html

title: "ConEmu | Problems with Cygwin Heap"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: AppHelp.html
   title: AppHelp problem
---

# Problems with Cygwin Heap

When you run any application compiled with cygwin or msys
(that is statically linked with cygwin1.dll or msys???.dll)
you may, sometimes, notice weird error in application console output,
and it will immediately exits after that.

Few examples.

~~~
0 [main] us 0 init_cheap: VirtualAlloc pointer is null, Win32 error 487 AllocationBase 0x68520000, BaseAddress 0x68570000, RegionSize 0x218000, State 0x1000 C:\Program Files (x86)\Git\bin\ls.exe: *** Couldn't reserve space for cygwin's heap, Win32 error 487

C:\Program Files (x86)\Git\bin\sh.exe: *** Couldn't reserve space for cygwin heap (0x68570000 <0x2730000>) in child, Win32 error 0
~~~

That is known cygwin problem mentioned in their [FAQ (BLODA)](https://cygwin.com/faq/faq.html#faq.using.bloda).


### And what does that error means?

Cygwin (or msys) initialization routine tries to allocate memory (relatively large amount)
at the **fixed** address. And, yep, it is already used/allocated by some dll!


### Is that a ConEmu problem?

No!

1. ConEmu is aware about cygwin and msys requirements and [ConEmuHk](ConEmuHk.html)
compiled with link options ask Windows kernel to load [ConEmuHk](ConEmuHk.html).dll
(or ConEmuHk64.dll) in the memory address which must not has conflicts with cygwin or msys.
2. There is no valid bug reports confirming the conflict between ConEmu and cygwin/msys.


<h2 id="How_to_fix_that"> How to fix that? </h2>

I really can't help you because it is not a ConEmu bug... But you may fix it yourself in your PC.

1. If you are on 64-bit Windows try 64-bit distro of cygwin/msys/git.
Have noticed that some versions of 32-bit Git-For-Windows were failed on 64-bit Windows,
but 64-bit Git-For-Windows was succeeded. 
2. Try to logoff/logon. If same here - try to restart your PC.
3. Same here? That means you must find problematic dll. Use ConEmuReportExe environment
variable to stop execution of your application (sh.exe, ls.exe, and so on).
And when message box arrears "sh.exe loaded" use [ProcessMonitor](ProcessMonitor.html)
to find dll which was loaded immediately after cygwin1.dll or msys???.dll.
Press OK in the waiting message box and confirm that "failed" allocation memory
address overlaps with dll your found. From my experience, that can be [apphelp.dll](AppHelp.html).
4. When you find bad gay:
    * You may to PATCH this dll. Use rebase tool from Windows sdk for example. What new base address to choose? I can't tell you. Ideally, that address must not overlaps with any other libraries... but there are thousands... Good thing - must of them can be linked with dynamic base, bad thing - off you choose bad address, your system will be unstable (error code 0xC???).
    * And, if it possible, you may install the program which had installed that dll
    * Also, may be that program allows to set up exclusions. If you are working in the ConEmu consoles only, you may add to exclusions list only ConEmu's executables (ConEmuC.exe, ConEmuC64.exe, ConEmu.exe, ConEmu64.exe). Otherwise, you need to add to exclusions list all of your cygwin/msys applications (sh, ls, and on).



<h2 id="Still_not_sure"> Still not sure? </h2>

Well, submit your report with [MiniDump](MemoryDump.html) attached. All reports will be checked.


<h3 id="How_to_create_required_dump"> How to create required dump </h3>

Run in your cmd prompt started in ConEmu tab (example shows `ls.exe` hooking):

~~~
set ConEmuReportExe=ls.exe
ls
~~~

Message box must appears "ls.exe loaded". At this time, call
ConEmu [System menu](SystemMenu.html) > Debug > Active process memory dump. Save the dump.

Upload [MiniDump](MemoryDump.html) (full dump is not required) to [DropBox](DropBox.html)
or send **Zipped** dump to developer.

After pressing OK in "loaded" message box your error message expected.
