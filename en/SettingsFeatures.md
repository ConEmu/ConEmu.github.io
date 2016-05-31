---
redirect_from:
 - /ru/SettingsFeatures.html

title: "ConEmu | Settings › Features page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Features

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_FEATURES {% endcomment %}

![ConEmu Settings: Features](/img/Settings-Features.png)



## Miscellaneous options  {#id2163}

#### Auto register fonts in ConEmu folder  {#id1550}
Use in ConEmu fonts, located in ConEmu folder. `*`.ttf, `*`.otf and `*`.bdf files are supported.

#### Monitor console lang  {#id1537}
Monitor input language change in real console (e.g. Far Manager XLat switching support)



## CPU consuming  {#id2748}

#### Sleep in background  {#id1721}
Reduce FPS when ConEmu loses focus

#### Retard inactive panes  {#id2665}
Retard inactive but visible split-panes in the active ConEmu window



## In-console options  {#id2746}

#### Inject ConEmuHk  {#id1752}
Allow injecting ConEmuHk.dll in every process of ConEmu console window. Required for many features (ANSI X3.64, -new_console argument, GUI apps in ConEmu tabs, ...) and elimination of several problems (telnet in Windows 7, dialogs and menus behind of ConEmu window, chcp hungs, and so on...)

#### DosBox (DOS apps)  {#id1753}
Enables DosBox integration

#### Use Clink in prompt  {#id2418}
Use clink to extend command prompt (cmd.exe) https://mridgers.github.io/clink/

#### ANSI X3.64 / xterm 256 colors  {#id2253}
Enable processing of ANSI escape sequences, ‘Inject ConEmuHk’ must be checked if you want to work with second level processes (e.g. cmd.exe -> app.exe)

#### Disable all flashing  {#id1719}
Disable all flashing (from consoles) on Windows taskbar. 3rd-state - allow short flashing.

#### Suppress bells  {#id2598}
Suppress annoying bells produced by echoing char(7), Beep and MessageBeep functions. Inject ConEmuHk is required.

#### Process '-new_console' and '-cur_console' switches  {#id2640}
Enable processing of '-new_console' and '-cur_console' switches in your shell prompt, scripts etc. started in ConEmu tabs

#### Process 'start'  {#id2740}
Hook 'start' command in your cmd's prompt and batches started in ConEmu tabs to run console applications in new ConEmu tabs

#### Process Ctrl-Z in ReadConsole  {#id2878}
Treat Ctrl-Z as ‘EndOfStream’. On new line press Ctrl-Z and Enter. Refer to the gh#465 for details (Go input streams).

#### Skip focus events (don't send to console FOCUS_EVENT, useful with Far Manager)  {#id1538}
Don't send focus events to console to disable autoclosing of fast search dialog in panels

#### Log console output (`*`)  {#id2679}
Log console output to text files ConEmu-YYYY-MM-DD-pNNNN.log (affect new consoles only)

You may choose folder for in-console log files (affect new consoles only)



## Debugging options  {#id2747}

#### Exception handler (debug)  {#id2622}
By default ConEmu doesn't do SetUnhandledExceptionFilter in alternative servers (Far, Telnet, etc.) But it may be enabled for debugging purposes

#### Debug steps in caption  {#id1551}
Show some debug information in ConEmu title E.g. plugin communication steps.

#### Show real console  {#id1545}
Show real console on startup

#### Internal LogFiles location  {#id3031}






