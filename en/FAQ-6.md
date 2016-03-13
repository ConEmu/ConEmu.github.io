---
title: ConEmu | FAQ - Part 6

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-6.html
   ru: /ru/FAQ-6.html
---

# Configuration  {#q-6-settings}

{% include faq_disclaimer_en.md %}

* [Q. Is it possible to set up ConEmu to open multiple tabs on startup (e.g. Far, CMD, PowerShell)?](#q-6-1)
* [Q. Duplicate Far Manager windows](#q-6-2)
* [Q. How to configure a bitmap font?](#q-6-3)
* [Q. Why are horizontal lines (drawn using box drawing characters) discontinuous?](#q-6-4)
* [Q. How to start several consoles in 2x2 grid](#q-6-5)
* [Q. How do you configure ConEmu to run cmd.exe as an Administrator from an Explorer integration?](#q-6-6)
* [Q. How do I give each tab opened by a {Task} a custom name?](#q-6-7)
* [Q. How to set up Git Bash Here in ConEmu ?](#q-6-8)
* [Q. How to export ConEmu settings?](#q-6-9)
* [Q. How to attach a running console application to a new ConEmu instance?](#q-6-10)
* [Q. How to delete items from the «Create new console» dropdown?](#q-6-11)







#### Q. Is it possible to set up ConEmu to open multiple tabs on startup (e.g. Far, CMD, PowerShell)?   {#q-6-1}


A. Yes. Use a startup command file. Example - create **startup.txt** with the contents:

~~~
>E:\Source\FARUnicode\trunk\unicode_far\Debug.32.vc\far.exe
*/BufferHeight 400 cmd
/BufferHeight 1000 powershell
~~~

and run ConEmu like this:

~~~
conemu.exe /cmd @startfile.txt
~~~

Each line in the file corresponds to a launched command. You may specify the console buffer height using the /BufferHeight parameter. If the line starts with "`>`", this tab will be active on startup. If the line starts with "`*`", this command will be ran with administrator privileges.




#### Q. Duplicate Far Manager windows   {#q-6-2}


A. The real console was not hidden. Check the 'Visible' flag on the 'Features' tab in the 'Settings' dialog, or this registry value:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
"ConVisible"=hex:00
~~~



#### Q. How to configure a bitmap font?   {#q-6-3}


A. The bitmap fonts selectable in the standard console's properties are actually the Terminal font. For example, the bitmap '8 x 12' font is 'Terminal 12 x 8' in ConEmu, '12 x 16' -> 'Terminal 16 x 12', etc.

> Take note: The 'Charset' field must be set to 'OEM'. 
> Personally, I prefer 'Fixedsys 16 x 8', which is absent in the standard console.


A. In the font list you may directly select e.g. `[Raster Fonts 8x12]`.




#### Q. Why are horizontal lines (drawn using box drawing characters) discontinuous?   {#q-6-4}


A. In some fonts, the width of the corresponding box drawing characters is shorter than the font's declared average character width, which ConEmu uses to determine the size of box drawing characters. To get rid of the artifacts, enable the checkbox «Fix Far borders» and increase the width of the "frames" font. The corresponding settings are on the 'Main' tab in the 'Settings' dialog.




#### Q. How to start several consoles in 2x2 grid   {#q-6-5}


A. The question from [superuser.com](http://superuser.com/q/473807/139371). ConEmu (build 120909 or higher recommended) provides [SplitScreen](SplitScreen.html) feature. You may set up named task to open several consoles on startup in the grid. Here the example for 2x2 grid.

~~~
>cmd -cur_console:n
cmd -cur_console:s1TVn
cmd -cur_console:s1THn
cmd -cur_console:s2THn
~~~



#### Q. How do you configure ConEmu to run cmd.exe as an Administrator from an Explorer integration?   {#q-6-6}


A. Read the answer on [superuser.com](http://superuser.com/q/470408/139371).




#### Q. How do I give each tab opened by a {Task} a custom name?   {#q-6-7}


A. Read the answer on [superuser.com](http://superuser.com/q/459154/139371).




#### Q. How to set up Git Bash Here in ConEmu?   {#q-6-8}


A. Read the answer on [superuser.com](http://superuser.com/q/454380/139371).




#### Q. How to export ConEmu settings?   {#q-6-9}


A. Read the answer on [superuser.com](http://superuser.com/q/450144/139371).




#### Q. How to attach a running console application to a new ConEmu instance?   {#q-6-10}


A. Read the answer on [superuser.com](http://superuser.com/q/445394/139371).




#### Q. How to delete items from the «Create new console» dropdown?   {#q-6-11}


A. Read the answer on [superuser.com](http://superuser.com/a/436273/139371).
