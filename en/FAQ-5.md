---
title: ConEmu | FAQ - Part 5

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-5.html
   ru: /ru/FAQ-5.html
---

# x64 issues  {#q-5-x64}

{% include faq_disclaimer_en.md %}

* [Q. What is the purpose of the files ConEmuC.exe, ConEmuCD.dll and ConEmuHk .dll in 64-bit OS?](#q-5-1)
* [Q. What is the purpose of the files ConEmuC64 .exe, ConEmuCD64.dll and ConEmuHk64 .dll in the 32-bit version of ConEmu ?](#q-5-2)
* [Q. After running the commands start, echo (and other cmd.exe commands) on 64-bit systems, an error similar to "File not found. Cannot execute. start" appears](#q-5-3)
* [Q. Attempts to launch applications (from Far Manager) causes a system error such as: «Error launching application (0xc0000142). Click "OK" to exit.»](#q-5-4)
* [Q. What is going on with environment variables in 64-bit OS?](#q-5-5)








#### Q. What is the purpose of the files ConEmuC.exe, ConEmuCD.dll and ConEmuHk.dll in 64-bit OS?   {#q-5-1}

**A.** These files are required for launching 32-bit applications, as
well as functioning of the 32-bit version of ConEmu. You will likely
at some point need to run a 32-bit console application from ConEmu -
without these files, it would not be possible. Out of principle, one
can use the 64-bit ConEmu64.exe, which is available in the
`ConEmuSetup.*.exe` package - it launches ConEmuC64.exe as the
root console process.




#### Q. What is the purpose of the files ConEmuC64.exe, ConEmuCD64.dll and ConEmuHk64.dll in the 32-bit version of ConEmu?   {#q-5-2}


**A.** These files are required to run 64-bit applications in 64-bit OS.




#### Q. After running the commands start, echo (and other cmd.exe commands) on 64-bit systems, an error similar to "File not found. Cannot execute. start" appears   {#q-5-3}


**A.** This is most likely caused by the absence of ConEmuC64.exe and accompanying ConEmuHk64.dll, ConEmuCD64.dll.




#### Q. Attempts to launch applications (from Far Manager) causes a system error such as: «Error launching application (0xc0000142). Click "OK" to exit.»   {#q-5-4}


**A.** The cause is as of yet undiscovered - it is suspected to be a problem in Windows. Note that the error also appears without ConEmu. To restore proper function, restart the console (e.g. using Win-~).




#### Q. What is going on with environment variables in 64-bit OS?   {#q-5-5}


**A.** ConEmu does not control environment variables.
