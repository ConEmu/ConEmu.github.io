---
redirect_from:
 - /ru/Xterm256Colors.html

title: "ConEmu | Xterm-256 Colors"

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features

readalso:
 - url: VimXterm.html
   title: "Configuring Vim"
 - url: AnsiEscapeCodes.html
   title: "X3.64 and Xterm-256 Support"
 - url: CygwinAnsi.html
   title: "Cygwin and Ansi"
 - url: ExtendedConsole.html
   title: "Far Manager ExtendedConsole"
 - url: BashOnWindows.html
   title: "Keys and Colors in Bash On Windows (WSL)"
---

# How to enable xterm 256 colors in ConEmu

* [Vim note](#vim-note)
* [xterm 256 color mode requirements](#xterm_256_color_mode_requirements)
  * [Example 1: Vim](#Ex_1_Vim)
  * [Example 2: 256colors2.pl](#Ex_2_256colors2.pl)
  * [Example 3: scroll console to the bottom](#Ex_3_scroll_console_to_the_bottom)
* [TechInfo](#TechInfo)



## Vim note   {#vim-note}

**NB** If ‘Inject ConEmuHk’ is off, you can still use ANSI in vim (or any other application)
if you run them via ConEmuC.exe but not directly. For example, run vim from bash.

~~~
conemuc -c C:/GIT/share/vim/vim73/vim.exe 1.cpp
~~~

Of course, you may omit full path to vim.exe if it may be found in `%PATH%` environment variable.

**NB** ConEmu will disable scroll buffer automatically, when vim.exe is started.
For any other application - you must do it yourself.



## xterm 256 color mode requirements   {#xterm_256_color_mode_requirements}

* Options must be turned on
  * ‘TrueMod (24bit color) support’ on [Colors](Settings.html#Colors) page
  * ‘ANSI X3.64 / xterm 256 colors’ on [Features](Settings.html#Features) page
  * ‘Inject ConEmuHk’ on [Features](Settings.html#Features) page (required for second level programs)
* Turn off scrolling (extended attributes works only in the ‘work’ area - the bottom of the console)
* Cygwin and Msys applications do not pass ANSI to terminal. At all. [More information here](CygwinAnsi.html).
  * As workaround for cygwin and msys you may use [cygwin/msys terminal connector](CygwinMsysConnector.html).



### Example 1: Vim   {#Ex_1_Vim}

~~~
vim.exe -cur_console:h0 <Vim arguments here>
~~~



### Example 2: 256colors2.pl   {#Ex_2_256colors2.pl}

Script [256colors2.pl](/256colors2.pl) must be executed from `cmd.exe` as following:

~~~
256colors2.pl -cur_console:h0
~~~



### Example 3: scroll console to the bottom   {#Ex_3_scroll_console_to_the_bottom}

When you run **not** ‘fullscreen’ application (not Far/Vim/Hiew/...),
you may scroll console to the bottom (`^[` must be replaced with real ESC symbol, ASCII code `\x1B`):

~~~
echo ^[[9999;1H
~~~



## TechInfo   {#TechInfo}

ANSI escape sequences are processed when console program uses functions:
`WriteConsoleA`, `WriteConsoleW` or `WriteFile`. For example:

~~~
cmd /c type "Colors-256.ans"
~~~

Text output with current extended attributes (xterm 256 color)
is possible with `WriteConsoleOutputCharacterA` and `WriteConsoleOutputCharacterW`
functions.
