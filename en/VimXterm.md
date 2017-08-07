---
redirect_from:
 - /ru/VimXterm.html

title: "ConEmu | Configuring Vim"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: Xterm256Colors.html
   title: "Xterm-256 Colors"
 - url: CygwinAnsi.html
   title: "Cygwin and Ansi"
 - url: AnsiEscapeCodes.html
   title: "X3.64 and Xterm-256 Support"
 - url: ExtendedConsole.html
   title: "Far Manager ExtendedConsole"
---

# How to enable 256-color console Vim syntax highlight in ConEmu

* [Requirements](#requirements)
* [Only certain releases are supported](#required-release)
* [Notes about vim color schemes](#vim-color-scheme)
* [Fix BS issue](#vim-bs-issue)
* [How to enable Vim scrolling using mouse Wheel in ConEmu](#Vim-scrolling-using-mouse-Wheel)
* [vim-airline plugin](#Vim-airline)
* [StackOverflow and SuperUser answers](#stack-exchange)
* [Install Vim8 in Bash on Ubuntu on Windows](#vim8-wsl)

![256-colors vim in ConEmu](/img/ConEmuVimXterm.png)



## Requirements   {#requirements}

* Only [certain releases](#required-release) are supported;
* Vim's executable must be named ‘vim.exe’;
* Check options ‘Inject [ConEmuHk](ConEmuHk.html)’ and ‘ANSI X3.64 / xterm 256 colors’
  on [Features](SettingsFeatures.html) page;
* Check option ‘TrueMod (24bit color) support’ on [Colors](SettingsColors.html) page;
* Edit your ‘vimrc’ file, sample lines are here. Of course, you need some 256-color vim scheme,
  it is ‘zenburn’ in the last line of this example.

~~~
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme zenburn
endif
~~~

You may also check environment variable [ConEmuANSI](ConEmuEnvironment.html)
but I'm not sure how to do that properly.



## Only certain releases are supported   {#required-release}

**NB** ‘Original’ Win32 console executable Vim from
[gvim##.exe and vim##w32.zip](http://www.vim.org/download.php#pc)
passed tests (versions 7.3 and 7.4 were tested).

If you would like to use cygwin, msys, or [WSL](BashOnWindows.html) Vim versions
you shall use [connector](CygwinMsysConnector.html) to let ConEmu emulate POSIX terminal.
Otherwise WSL, MinGW's and Cygwin's Vim [do not pass ANSI to ConEmu](CygwinAnsi.html).



## Notes about vim color schemes   {#vim-color-scheme}

Selected Vim color scheme must be prepared specially for Xterm color.
Some color schemes are working properly in Gvim, showing 256 colors and more,
but if they aren't aware about xterm sequences, they will fail in the console vim.

If you have problems with certain color scheme, please contact it's author.

Color scheme mentioned above (zenburn) is working fine.



## Fix Vim's BS issue  {#vim-bs-issue}

If you have problems with `BS` in Vim (`BS` acts like `Delete` key)
under ConEmu when `term=xterm`, you may try to **remap** `BS` key:

~~~
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
~~~

If `BS` still acts like `Delete` the problem may be with plugins.
Find problem plugins and disable them.

~~~
:verbose map <bs>
:verbose map <c-h>
~~~

Check for details in the [issue 641](https://github.com/Maximus5/ConEmu/issues/641).



## How to enable Vim scrolling using mouse Wheel in ConEmu   {#Vim-scrolling-using-mouse-Wheel}

Since ConEmu build [170730](/blog/2017/07/30/Build-170730.html) all mouse events
are posted as XTerm sequences when XTerm mouse mode was requested by console application.

So all you need to add following lines to your `vimrc` file:

~~~
""""""""""""""""""""""""""""""""""""""
" let mouse wheel scroll file contents
""""""""""""""""""""""""""""""""""""""
if !has("gui_running")
    set term=xterm
    set mouse=a
    " perhaps `nocompatible` is not required
    set nocompatible
endif
~~~

If you have problems with Vim configuration, you may refer to the
[Issue 1007](https://github.com/Maximus5/ConEmu/issues/1007#issuecomment-271166152).


## vim-airline plugin   {#Vim-airline}

* [Vim-airline configuration for ConEmu](https://github.com/bling/vim-airline/issues/513)
* [Vim-airline changed colors on page scroll](https://github.com/bling/vim-airline/issues/857)


## StackOverflow and SuperUser answers   {#stack-exchange}

* [ConEmu: Vim Syntax Highlight](http://stackoverflow.com/a/14434531/1405560)
* [Vim: Encoding (Unicode) in Terminal under Windows](http://stackoverflow.com/a/25073399/1405560)


## Install Vim8 in Bash on Ubuntu on Windows  {#vim8-wsl}

* [Ubuntu 16.10 repository providing vim 8](https://askubuntu.com/a/875006)
