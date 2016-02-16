---
redirect_from: /ru/RealConsole.html

title: "ConEmu | RealConsole"

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms

readalso:
 - url: VirtualConsole.html
   title: VirtualConsole
---

# RealConsole

ConEmu always run standard Windows console - ‘Real console’,
but it is hidden most of time.

Many users [erroneously name it](Delusions.html#delusion-2) as `cmd.exe`,
but it is not true. Windows console window is a part of Windows ‘kernel’
(`csrss.exe` up to Vista and `conhost.exe` in Windows 7 and higher).
And you may run there console applications:
`cmd.exe`, `powershell.exe` and many others are shells and tools.



## Reveal RealConsole window  {#show-real-console}

If you need to take a look at ‘Real console’ just press (simultaneously)
in the ConEmu window `Ctrl+Win+Alt+Space`.
Alternatively - [SystemMenu](SystemMenu.html) -> Debug -> Real console.

Sometimes you may see flickering ‘Real console’ during ConEmu tab startup.
That is intended behavior for ‘Run as administrator’ and debugging using
[Default terminal](DefaultTerminal.html) feature.



## Win+R: Check your application  {#win-r}

Before creating an issue for ConEmu, especially with phrases like
‘[it works properly in mintty](CygwinMsys.html)’,
you have to check your application in the **same circumstances** in RealConsole.

1. Disable ‘[Default Terminal](DefaultTerminal.html)’ feature if you use it.
2. Press `Win+R` and run your console application.
3. Ensure that your RealConsole has the same dimensions as in ConEmu.
   * Right-click on the RealConsole title and choose ‘Properties’.
   * Ensure that *Font* is either ‘Consolas’ or ‘Lucida Console’.
   * Ensure that console window buffer and window width and height
     are the same as in ConEmu (you may check them in [StatusBar](StatusBar.html)).
4. Try to reproduce your problem. In most cases it repeats, that definitely means
   that the problem is inside console application, but not in ConEmu.

#### Note for cygwin/msys applications  {#cygwin}

The argument ‘it works in mintty’ is not forcible. The reason is simple.
All [cygwin application](CygwinMsys.html) has ‘two branches’ in their code,
they behaves absolutely differently when they are started in mintty,
and when they are started in the RealConsole.

ConEmu can't change their behavior.
However, you may start [cygwin/msys connector](CygwinMsysConnector.html)
written specially for ConEmu, to emulate cygwin/msys terminal.
