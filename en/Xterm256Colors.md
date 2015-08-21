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
---

# How to enable xterm 256 colors in ConEmu

* [Vim note](#vim-note)
* [xterm 256 color mode requirements](#xterm_256_color_mode_requirements)
  * [Example 1: Vim](#Example_1:_Vim)
  * [Example 2: 256colors2.pl](#Example_2:_256colors2.pl)
  * [Example 3: scroll console to the bottom](#Example_3:_scroll_console_to_the_bottom)
* [TechInfo](#TechInfo)



<h2 id="vim-note"> Vim note </h2>

**NB** If ‘Inject ConEmuHk’ is off, you can still use ANSI in vim (or any other application)
if you run them via ConEmuC.exe but not directly. For example, run vim from bash.

~~~
conemuc -c C:/GIT/share/vim/vim73/vim.exe 1.cpp
~~~

Of course, you may omit full path to vim.exe if it may be found in `%PATH%` environment variable.

**NB** ConEmu will disable scroll buffer automatically, when vim.exe is started.
For any other application - you must do it yourself.



<h2 id="xterm_256_color_mode_requirements"> xterm 256 color mode requirements </h2>

* Options must be turned on
  * ‘TrueMod (24bit color) support’ on [Colors](Settings.html#Colors) page
  * ‘ANSI X3.64 / xterm 256 colors’ on [Features](Settings.html#Features) page
  * ‘Inject ConEmuHk’ on [Features](Settings.html#Features) page (required for second level programs)
* Turn off scrolling (extended attributes works only in the ‘work’ area - the bottom of the console)



<h3 id="Example_1:_Vim"> Example 1: Vim </h3>

~~~
vim.exe -cur_console:h0 <Vim arguments here>
~~~



<h3 id="Example_2:_256colors2.pl"> Example 2: 256colors2.pl </h3>

Script [256colors2.pl](http://www.frexx.de/xterm-256-notes/data/256colors2.pl) must be executed as:

~~~
256colors2.pl -cur_console:h0
~~~



<h3 id="Example_3:_scroll_console_to_the_bottom"> Example 3: scroll console to the bottom </h3>

When you run **not** ‘fullscreen’ application (not Far/Vim/Hiew/...),
you may scroll console to the bottom (`^[` must be replaced with real ESC symbol, ASCII code `\x1B`):

~~~
echo ^[[9999;1H
~~~



<h2 id="TechInfo"> TechInfo </h2>

ANSI escape sequences are processed when console program uses functions:
`WriteConsoleA`, `WriteConsoleW` or `WriteFile`. For example:

~~~
cmd /c type "Colors-256.ans"
~~~

Text output with current extended attributes (xterm 256 color)
is possible with `WriteConsoleOutputCharacterA` and `WriteConsoleOutputCharacterW`
functions.
