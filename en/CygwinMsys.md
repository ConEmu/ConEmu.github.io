---
redirect_from:
 - /ru/CygwinMsys.html

title: "ConEmu | Cygwin and Msys"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: CygwinAnsi.html
   title: Cygwin and Ansi
---

{% comment %}
cygwin, msys, msysgit and ConEmu
{% endcomment %}

<h1 id="Abstract"> Troubleshooting Cygwin and Msys problems </h1>

Please, don't report third-party bugs on the ConEmu issue tracker,
report cygwin and msys bugs to their [authors](http://dir.gmane.org/gmane.os.cygwin)!

ConEmu is terminal! It just the display for output of console applications.
Bugs in applications will lead wrong behaviour and display output in ConEmu.
Undoubtedly.

Still thinking the problem is inside ConEmu? Read the rest of this wiki.

* [Some techinfo first](#Some_techinfo_first)
  * [stdin/stdout redirection style](#stdin-stdout_redirection_style)
    * [Pros](#Pros)
    * [Cons](#Cons)
  * [Windows console API style](#Windows_console_API_style)
* [Complains](#Complains)
* [Windows power](#Windows_power)
* [Problems with cygwin](#Problems_with_cygwin)
* [Report examples](#Report_examples)
  * [Broken screen output](#Broken_screen_output)
  * [Mouse do not working](#Mouse_do_not_working)
  * [ANSI support](#ANSI_support)
  * [Startup directory](#Startup_directory)
* [Bottom line](#Resume)



<h2 id="Some_techinfo_first"> Some techinfo first </h2>

There are two types of Windows console (terminal) emulators:

* Based on [stdin/stdout redirection](stdin-stdout_redirection_style) (in very simple terms).
  Most known are
  [mintty](https://github.com/mintty/mintty/)>,
  [puttycyg](https://code.google.com/p/puttycyg/),
  [Poderosa's cygterm](https://sourceforge.net/projects/poderosa/).
* Based on [Windows console API](Windows_console_API_style).
  Most known are ConEmu,
  [Console](https://sourceforge.net/projects/console/),
  [ConsoleZ](https://github.com/cbucher/console/),
  [Take Command](http://jpsoft.com/).


<h3 id="stdin-stdout_redirection_style"> stdin/stdout redirection style </h3>

Most of this type emulators are based on ‘POSIX layer’ -
<a href="http://cygwin.com/" rel="nofollow">cygwin</a>,
<a href="http://www.mingw.org/wiki/MSYS" rel="nofollow">msys</a>
or <a href="http://msysgit.github.io/" rel="nofollow">msysgit</a>.
AFAIK, msys was forked long ago from cygwin, that is why they are alike in many cases.
In turn, there is another fork - msysgit was forked from msys...

<h4 id="Pros"> Pros </h4>

Very fast output. Really. No need to use ‘slow’ Windows console subsystem,
that's why the speed is limited mainly with pipe throughput.

‘Easy’ implementation of ANSI support. All ANSI codes are processed inside the emulator.
No need to translate them to and from Windows console subsystem.

Almost unlimited backscroll buffer.


<h4 id="Cons"> Cons </h4>

User can't run here large amount of programs designed for Windows console.
For example, Powershell and Far Manager can't be started at all.
**Official** Vim is not working. cmd.exe can do something here,
but command history (Up arrow) is not working. And so on...


<h3 id="Windows_console_API_style"> Windows console API style </h3>

These emulators always have hidden standard Windows console window.
Say, they are wrappers around Windows API. That means all programs
designed for Windows console sybsystem must be working perfectly.
Of course, using these emulators, users will get bonuses like
easy resizing and handy copy/pasting.

On the other hand, programs designed for ‘POSIX layer’ may fails here or there...


<h2 id="Complains"> Complains </h2>

I regularly get emails and issues about cygwin/msys compatibility with ConEmu.
Most of them does not have anything to fix inside ConEmu sources,
but users complain me instead of cygwin/msys developers.

Let me draw an analogue. There is a great tool RPP, but it is an MacOS application.
How can you run it on Windows? Set up VMWare with MacOS inside :-D

The same with POSIX console applications in Windows.
If you want to run them properly - run them in mintty.
That is weird for my taste...
If you develop Windows console application, it must be able
to run in Windows standard console window.
Well, it may show some lack of features
(like 256 colors processing) but it must be working properly
in all other cases.


<h2 id="Windows_power"> Windows power </h2>

Windows standard console supports 16 color palette,
32K lines of backscroll buffer, alternative screens,
Unicode, mouse input and dozens of other features.
The main complains of Linux users  - unfriendly
clipboard support (copy/paste) and window resizing.
Really, ‘unfriendly’ but not an ‘absent’.
So, if you are using ConEmu or similar emulator -
copy/paste/resize is not a problem at all...

What I want to say. Windows console is powerful subsystem.
Just run there proper shell. If you like bash - just run it!


<h2 id="Problems_with_cygwin"> Problems with cygwin </h2>

Before reporting cygwin-related problem to me,
please check it first in the **standard Windows console**.

Just run your shell from `Win+R`, for example `C:\cygwin\bin\sh.exe -l -i`,
ensure your console window has the same buffer and window sizes as in ConEmu
(right click on the console caption, choose ‘Properties’ and change sizes),
and try to reproduce your problem.

I believe, your problem will repeats in **standard Windows console**
(many users [erroneously name it ‘cmd.exe’](Delusions.html#delusion-2)).

In fact, there are a few bugs which were
really related to ConEmu (and was fixed long ago):
[Issue 1549: Alternative screen and clearing screen (Ctrl+L)](https://github.com/Maximus5/conemu-old-issues/issues/1549).

But in most of cases, your problem will repeats outside of ConEmu.
That means, you should contact cygwin team,
because ‘console application must work properly in the console’.
But in your case, cygwin acts properly only under certain terminal emulators (mintty),
which are not real consoles in fact.


<h2 id="Report_examples"> Report examples </h2>

<h3 id="Broken_screen_output"> Broken screen output </h3>

Was happen with alternative screens.
There was several bugs related and they was fixed in cygwin.
As I said, nothing to do with ConEmu, just ask cygwin team
to make it work in Windows console. Seems like reported problems
of that class are already fixed within
<a href="http://cygwin.com/snapshots/" rel="nofollow">cygwin</a>.

Some related issues: 
[Issue 1397: Clearing buffer after quiting VIM, LESS, MAN etc. in Cygwin](https://github.com/Maximus5/conemu-old-issues/issues/1397),
[Issue 1537: screen is wiped out after quiting vi](https://github.com/Maximus5/conemu-old-issues/issues/1537).



<h3 id="Mouse_do_not_working"> Mouse do not working </h3>

Mouse do working in mintty but don't in standard Windows console.
For example, mc ignores mouse clicks when it is started from "cmd.exe".
That is because mintty send escape sequences to the terminal input (unix-like),
but Windows standard describes special input event -
[MOUSE_EVENT_RECORD](http://msdn.microsoft.com/en-us/library/windows/desktop/ms684239.aspx).
Take a look at Far Manager or **official** Vim. They perfectly support mouse input.

You may read more about console input in msdn:
<a href="http://msdn.microsoft.com/en-us/library/windows/desktop/ms684961.aspx" rel="nofollow">ReadConsoleInput</a>,
<a href="http://msdn.microsoft.com/en-us/library/windows/desktop/ms683499.aspx" rel="nofollow">INPUT_RECORD</a>,
<a href="http://msdn.microsoft.com/en-us/library/windows/desktop/ms684239.aspx" rel="nofollow">MOUSE_EVENT_RECORD</a>.

Some related issues:
* [Issue 943: Mouse doesn't work in cygwin bash](https://github.com/Maximus5/conemu-old-issues/issues/943);
* [Issue 1492: nix-style mouse processing](https://github.com/Maximus5/conemu-old-issues/issues/1492);
* [Issue 1497: Using mouse with cygwin/msys applications](https://github.com/Maximus5/conemu-old-issues/issues/1497);
* [gmane thread](http://thread.gmane.org/gmane.os.cygwin/146090/focus=146133).



<h3 id="ANSI_support"> ANSI support </h3>

One may notice that colors in the mintty are "nice" but in the ConEmu are "ugly".
That is because cygwin (ncurses actually, thought) does not send escape sequences
to the terminal output but process them internally.

Cygwin does not want to know anything about ConEmu. I can understand this point of view.

Read more in wiki [CygwinAnsi](CygwinAnsi.html).



<h3 id="Startup_directory"> Startup directory </h3>

Cygwin shell always starts in your <code>"${HOME}"</code> instead of specified working folder.

How to change that behaviour - read in wiki [CygwinStartDir](CygwinStartDir.html).



<h2 id="Resume"> Bottom line </h2>

My position is simple: if you are writing console application
for Windows - just make it working in Windows.
Report your problems related to Windows console to cygwin team here:
<a href="http://dir.gmane.org/gmane.os.cygwin" rel="nofollow">dir.gmane.org/gmane.os.cygwin</a>.
