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


<h2 id="show-real-console">
Reveal RealConsole window
</h2>

If you need to take a look at ‘Real console’ just press (simultaneously)
in the ConEmu window `Ctrl+Win+Alt+Space`.
Alternatively - [SystemMenu](SystemMenu.html) -> Debug -> Real console.

Sometimes you may see flickering ‘Real console’ during ConEmu tab startup.
That is intended behavior for ‘Run as administrator’ and debugging using
[Default terminal](DefaultTerminal.html) feature.
