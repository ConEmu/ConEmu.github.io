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
---

# How to enable xterm 256 colors in ConEmu

* [Vim note](#vim-note)
* [xterm 256 color mode requirements](#xterm_256_color_mode_requirements)
  * [Example 1: Vim](#Example_1:_Vim)
  * [Example 2: 256colors2.pl](#Example_2:_256colors2.pl)
  * [Example 3: scroll console to the bottom](#Example_3:_scroll_console_to_the_bottom)
* [TechInfo](#TechInfo)



## Vim note <a id="vim-note"/>

**NB** If ‘Inject ConEmuHk’ is off, you can still use ANSI in vim (or any other application)
if you run them via ConEmuC.exe but not directly. For example, run vim from bash.

~~~
conemuc -c C:/GIT/share/vim/vim73/vim.exe 1.cpp
~~~

Of course, you may omit full path to vim.exe if it may be found in `%PATH%` environment variable.

**NB** ConEmu will disable scroll buffer automatically, when vim.exe is started.
For any other application - you must do it yourself.



## xterm 256 color mode requirements <a id="xterm_256_color_mode_requirements"/>

* Options must be turned on
  * ‘TrueMod (24bit color) support’ on [Colors](Settings.html#Colors) page
  * ‘ANSI X3.64 / xterm 256 colors’ on [Features](Settings.html#Features) page
  * ‘Inject ConEmuHk’ on [Features](Settings.html#Features) page (required for second level programs)
* Turn off scrolling (extended attributes works only in the ‘work’ area - the bottom of the console)



### Example 1: Vim <a id="Example_1:_Vim"/>

~~~
vim.exe -cur_console:h0 <Vim arguments here>
~~~



### Example 2: 256colors2.pl <a id="Example_2:_256colors2.pl"/>

Script (the copy is [here](/256colors2.pl))
[256colors2.pl](http://www.frexx.de/xterm-256-notes/data/256colors2.pl),
must be executed from `cmd.exe` as following:

~~~
256colors2.pl -cur_console:h0
~~~



### Example 3: scroll console to the bottom <a id="Example_3:_scroll_console_to_the_bottom"/>

When you run **not** ‘fullscreen’ application (not Far/Vim/Hiew/...),
you may scroll console to the bottom (`^[` must be replaced with real ESC symbol, ASCII code `\x1B`):

~~~
echo ^[[9999;1H
~~~



## TechInfo <a id="TechInfo"/>

ANSI escape sequences are processed when console program uses functions:
`WriteConsoleA`, `WriteConsoleW` or `WriteFile`. For example:

~~~
cmd /c type "Colors-256.ans"
~~~

Text output with current extended attributes (xterm 256 color)
is possible with `WriteConsoleOutputCharacterA` and `WriteConsoleOutputCharacterW`
functions.
