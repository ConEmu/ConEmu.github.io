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
* [How to enable Vim scrolling using mouse Wheel in ConEmu](#Vim-scrolling-using-mouse-Wheel)
* [vim-airline plugin](#Vim-airline)
* [StackOverflow and SuperUser answers](#stack-exchange)

![256-colors vim in ConEmu](/img/ConEmuVimXterm.png)



<h2 id="requirements"> Requirements </h2>

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



<h2 id="required-release"> Only certain releases are supported </h2>

**NB** ‘Original’ Win32 console executable Vim from
[gvim##.exe and vim##w32.zip](http://www.vim.org/download.php#pc)
passed tests (versions 7.3 and 7.4 were tested).
There is no guarantee that other versions would be working, for example
MinGW's and Cygwin's Vim [do not pass ANSI to ConEmu](CygwinAnsi.html).



<h2 id="vim-color-scheme"> Notes about vim color schemes </h2>

Selected Vim color scheme must be prepared specially for Xterm color.
Some color schemes are working properly in Gvim, showing 256 colors and more,
but if they aren't aware about xterm sequences, they will fail in the console vim.

If you have problems with certain color scheme, please contact it's author.

Color scheme mentioned above (zenburn) is working fine.



<h2 id="Vim-scrolling-using-mouse-Wheel"> How to enable Vim scrolling using mouse Wheel in ConEmu </h2>

When ConEmu emulates xterm it translates mouse wheel to the following sequences:

| **Event** | **Sequence** | **Description** |
|:---|:---|:---|
| `<WheelDown>` | `\e[62~` | toward the user |
| `<WheelUp>` | `\e[63~` | away from the user |
| `<Shift><WheelDown>` | `\e[64~` | toward the user |
| `<Shift><WheelUp>` | `\e[65~` | away from the user |


So all you need to add following lines to your `vimrc` file:

~~~
""""""""""""""""""""""""""""""""""""""
" let mouse wheel scroll file contents
""""""""""""""""""""""""""""""""""""""
if !has("gui_running")
    set term=xterm
    set mouse=a
    set nocompatible
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
    nnoremap <Esc>[62~ <C-E>
    nnoremap <Esc>[63~ <C-Y>
endif
~~~



<h2 id="Vim-airline"> vim-airline plugin </h2>

* [Vim-airline configuration for ConEmu](https://github.com/bling/vim-airline/issues/513)
* [Vim-airline changed colors on page scroll](https://github.com/bling/vim-airline/issues/857)


<h2 id="stack-exchange"> StackOverflow and SuperUser answers </h2>

* [ConEmu: Vim Syntax Highlight](http://stackoverflow.com/a/14434531/1405560)
* [Vim: Encoding (Unicode) in Terminal under Windows](http://stackoverflow.com/a/25073399/1405560)
