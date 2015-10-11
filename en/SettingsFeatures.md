---
redirect_from:
 - /ru/SettingsFeatures.html

title: "ConEmu | Settings › Features page"
---

# Settings: Features

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_FEATURE {% endcomment %}

![ConEmu Settings: Features](/img/Settings-Features.png)



## Miscellaneous options

**Auto register fonts** Search, register for process, and use first `*`.ttf file in conemu folder

**Monitor console lang** Monitor input language change in real console (e.g. Far Manager XLat switching support)

**Focus in child windows** Set focus in xshell/putty/notepad/etc. when ConEmu is activated or tab switched.



## CPU consuming

**Sleep in background** Reduce FPS when ConEmu loses focus

**Retard inactive panes** Retard inactive but visible split-panes in the active ConEmu window



## In-console options

**Inject ConEmuHk** Allow injecting ConEmuHk.dll in every process of ConEmu console window. Required for many features (ANSI X3.64, -new_console argument, GUI apps in ConEmu tabs, ...) and elimination of several problems (telnet in Windows 7, dialogs and menus behind of ConEmu window, chcp hungs, and so on...)

**DosBox (DOS apps)** Enables DosBox integration

**Use Clink in prompt** Use clink to extend command prompt (cmd.exe) http://mridgers.github.io/clink/

**ANSI X3.64 / xterm 256 colors** Enable processing of ANSI escape sequences, ‘Inject ConEmuHk’ must be checked if you want to work with second level processes (e.g. cmd.exe -> app.exe)

**Disable all flashing** Disable all flashing (from consoles) on Windows taskbar. 3rd-state - allow short flashing.

**Portable registry** Enable portable mode for Far manager

**Log console output (`*`)** Log console output to text files ConEmu-YYYY-MM-DD-pNNNN.log (affect new consoles only)

You may choose folder for in-console log files (affect new consoles only)

**Process '-new_console' and '-cur_console' switches** Enable processing of '-new_console' and '-cur_console' switches in your shell prompt, scripts etc. started in ConEmu tabs

**Process 'start'** Hook 'start' command in your cmd's prompt and batches started in ConEmu tabs to run console applications in new ConEmu tabs



## Debugging options

**Exception handler (debug)** By default ConEmu doesn't do SetUnhandledExceptionFilter in alternative servers (Far, Telnet, etc.) But it may be enabled for debugging purposes

**Debug steps in caption** Show some debug information in ConEmu title E.g. plugin communication steps.

**Show real console** Show real console on startup



**Suppress bells** Stop annoying bells produced by echoing char(7) to console, Inject ConEmuHk is required

