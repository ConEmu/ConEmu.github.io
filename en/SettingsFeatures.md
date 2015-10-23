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
{% comment %} IDD_SPG_FEATURE {% endcomment %}

![ConEmu Settings: Features](/img/Settings-Features.png)



## Miscellaneous options  {#2163}

#### Auto register fonts  {#1550}
Search, register for process, and use first `*`.ttf file in conemu folder

#### Monitor console lang  {#1537}
Monitor input language change in real console (e.g. Far Manager XLat switching support)

#### Focus in child windows  {#2568}
Set focus in xshell/putty/notepad/etc. when ConEmu is activated or tab switched.



## CPU consuming  {#2748}

#### Sleep in background  {#1721}
Reduce FPS when ConEmu loses focus

#### Retard inactive panes  {#2665}
Retard inactive but visible split-panes in the active ConEmu window



## In-console options  {#2746}

#### Inject ConEmuHk  {#1752}
Allow injecting ConEmuHk.dll in every process of ConEmu console window. Required for many features (ANSI X3.64, -new_console argument, GUI apps in ConEmu tabs, ...) and elimination of several problems (telnet in Windows 7, dialogs and menus behind of ConEmu window, chcp hungs, and so on...)

#### DosBox (DOS apps)  {#1753}
Enables DosBox integration

#### Use Clink in prompt  {#2418}
Use clink to extend command prompt (cmd.exe) http://mridgers.github.io/clink/

#### ANSI X3.64 / xterm 256 colors  {#2253}
Enable processing of ANSI escape sequences, ‘Inject ConEmuHk’ must be checked if you want to work with second level processes (e.g. cmd.exe -> app.exe)

#### Disable all flashing  {#1719}
Disable all flashing (from consoles) on Windows taskbar. 3rd-state - allow short flashing.

#### Log console output (`*`)  {#2679}
Log console output to text files ConEmu-YYYY-MM-DD-pNNNN.log (affect new consoles only)

You may choose folder for in-console log files (affect new consoles only)

#### Process '-new_console' and '-cur_console' switches  {#2640}
Enable processing of '-new_console' and '-cur_console' switches in your shell prompt, scripts etc. started in ConEmu tabs

#### Process 'start'  {#2740}
Hook 'start' command in your cmd's prompt and batches started in ConEmu tabs to run console applications in new ConEmu tabs



## Debugging options  {#2747}

#### Exception handler (debug)  {#2622}
By default ConEmu doesn't do SetUnhandledExceptionFilter in alternative servers (Far, Telnet, etc.) But it may be enabled for debugging purposes

#### Debug steps in caption  {#1551}
Show some debug information in ConEmu title E.g. plugin communication steps.

#### Show real console  {#1545}
Show real console on startup



#### Suppress bells  {#2598}
Stop annoying bells produced by echoing char(7) to console, Inject ConEmuHk is required

