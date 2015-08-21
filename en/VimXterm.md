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
---

# How to enable 256-color console Vim syntax highlight in ConEmu

* [Requirements](#requirements)
* [Only certain releases are supported](#required-release)
* [How to enable Vim scrolling using mouse Wheel in ConEmu](#Vim-scrolling-using-mouse-Wheel)
* [StackOverflow answer](http://stackoverflow.com/a/14434531/1405560)

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

**NB** GIT's Vim and ‘Original’ Vim (from gvim73_46.exe) are passed tests.
MinGW's or Cygwin's Vim fails to switch to using Ansi sequences.



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
