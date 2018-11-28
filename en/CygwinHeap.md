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
and it will immediately exit after that.

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


## How to fix that?  {#How_to_fix_that}

I really can't help you because it is not a ConEmu bug... But you may fix it yourself in your PC.

1. If you are on 64-bit Windows try 64-bit distro of cygwin/msys/git.
I have noticed that some versions of 32-bit Git-For-Windows were failing on 64-bit Windows,
but 64-bit Git-For-Windows were not. 
2. Try to logout and log in again. If it still happens - try to restart your PC.
3. Same here? That means you must find the problematic dll file. Use ConEmuReportExe environment
variable to stop execution of your application (sh.exe, ls.exe, and so on).
And when message box appears "sh.exe loaded" use [ProcessMonitor](ProcessMonitor.html)
to find dll which was loaded immediately after cygwin1.dll or msys???.dll.
Press OK in the waiting message box and confirm that "failed" allocation memory
address overlaps with dll your found. From my experience, that can be [apphelp.dll](AppHelp.html).
4. When you find bad guy:
    * As a first step, you may want to try to either update/reinstall or remove the program which had installed that dll
    * Also, may be that program allows to set up exclusions. If you are working in the ConEmu consoles only, you may add to exclusions list only ConEmu's executables (ConEmuC.exe, ConEmuC64.exe, ConEmu.exe, ConEmu64.exe). Otherwise, you need to add to exclusions list all of your cygwin/msys applications (sh, ls, and on).
    * You may try to PATCH this dll. Use rebase tool from Windows sdk for example. What new base address to choose? I can't tell you. Ideally, that address must not overlaps with any other libraries... but there are thousands... Good thing - must of them can be linked with dynamic base, bad thing - off you choose bad address, your system will be unstable (error code 0xC???).


## Still not sure?  {#Still_not_sure}

Well, submit your report with [MiniDump](MemoryDump.html) attached. All reports will be checked.


### How to create required dump   {#How_to_create_required_dump}

Description with examples:
[CrashDump.html#How_to_create_required_dump](CrashDump.html#How_to_create_required_dump).
