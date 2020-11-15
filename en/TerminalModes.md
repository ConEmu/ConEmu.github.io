---
redirect_from:
 - /ru/TerminalModes.html

title: "ConEmu | Terminal input and output modes"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: TerminalVsShell.html
   title: "Terminal vs Shell"
 - url: CygwinMsysConnector.html
   title: "cygwin/msys connector"
 - url: BashOnWindows.html
   title: "Keys and Colors in Bash On Windows (WSL)"
 - url: StatusBar.html
   title: "ConEmu Status Bar"
 - url: Tasks.html
   title: "ConEmu Tasks"
 - url: NewConsole.html
   title: "-new_console switch"
 - url: AnsiEscapeCodes.html
   title: "ANSI sequences"
---

# Terminal input and output modes

Prior to Windows 10 the console supported only Microsoft's proprietary WinAPI with a rich set of functions.
But this console API is not compatible with Unix terminals utilizing [ANSI sequences](AnsiEscapeCodes.html)
to modify [terminal](TerminalVsShell.html) from [console application](ConsoleApplication.html) and passing
keyboard and mouse input from terminal to console.

ConEmu supports both modes almost transparently. The console application could utilize both WinAPI to control
terminal and emit [ANSI sequences](AnsiEscapeCodes.html) to do some extra things.
At the same time are supported [cygwin](CygwinAnsi.html) applications, which don't use WinAPI and were created
to use POSIX console emulation.

{% include in_article.html %}



## Terminal input mode  {#TermInput}

In Windows console applications are able to read inputs from terminal in form of rich
[INPUT_RECORD](https://docs.microsoft.com/en-us/windows/console/input-record-str) structure.
Each keypress is encoded **wVirtualKeyCode** + **dwControlKeyState** fields and could have **UnicodeChar**.

But Unix terminals operate with text streams only and all special keys (functional and navigational keys).
For example when the `F12` key is pressed the console application receives a sequence `ESC [ 2 4 ~`.

ConEmu could be switched between Windows and Unix (XTerm) modes in several ways. XTerm is activated when:

* [cygwin/msys connector](CygwinMsysConnector.html) is started;
* official Vim build is started (official means not from cygwin or msys distro);
* flag [ENABLE_VIRTUAL_TERMINAL_INPUT](https://docs.microsoft.com/en-us/windows/console/setconsolemode) is set for `CONIN$`;
* [ConEmu specific OSC](AnsiEscapeCodes.html#ConEmu_specific_OSC) `ESC ] 9 ; 10 ; 1 ST` is issued;
* the [Task](Tasks.html) was started with [-new_console:p1](#NewConsole) switch;
* user could change the mode via [StatusBar](#StatusBar).

XTerm mode is changed back to Windows when:

* application enabled the XTerm mode is terminated;
* flag [ENABLE_VIRTUAL_TERMINAL_INPUT](https://docs.microsoft.com/en-us/windows/console/setconsolemode) is cleared for `CONIN$`;
* [ConEmu specific OSC](AnsiEscapeCodes.html#ConEmu_specific_OSC) `ESC ] 9 ; 10 ; 0 ST` is issued;
* user could change the mode via [StatusBar](#StatusBar).


### App Keys mode (DECCKM)  {#DECCKM}

One special note for XTerm mode.

Navigational keys could be encoded in two ways. For example when the `Left arrow` key is pressed the console
application receives either `ESC O D` or `ESC [ D` sequences depending of DECCKM mode on/off.
Console application enables/disables [DECCKM emitting ANSI sequences](AnsiEscapeCodes.html#Terminal_modes)
`ESC [ ? 1 h` or `ESC [ ? 1 l`.

Unfortunately in some cases ConEmu does not receive the appropriate sequences and could not change **DECCKM** mode.
In that case user can change ‘App Keys’ mode in the [StatusBar](#StatusBar) or apply some default via
[-new_console switch](#NewConsole).



## Terminal output mode  {#TermOutput}

ConEmu processes [ANSI sequences](AnsiEscapeCodes.html) in both modes
if [requirements](AnsiEscapeCodes.html#ANSI_sequences_processing_requirements) are fulfilled.

But for **XTerm** mode there are some differences in processing output. Most vivid difference is
cursor movement when last cell in a row is written. With default Windows behavior the cursor is moved immediately
to the next row, which in turn scrolls console content upwards if cursor was at the bottom of the working area.
But in XTerm emulation the cursor stays *after* the last character in a row and moved to the next row
only *after* next character is written to output. This trick is used in Unit tools to display status line or
keys bar panel, which is usually at the bottom of the terminal's visible area.

Usually the XTerm output mode is enabled with [XTerm input](#TermInput) automatically.
But in some cases application could rely on the XTerm output rules but read input via WinApi
using [INPUT_RECORD](https://docs.microsoft.com/en-us/windows/console/input-record-str).

The XTerm output mode is enabled when:

* simultaneously with [XTerm input mode](#TermInput) enabled;
* flag [ENABLE_VIRTUAL_TERMINAL_PROCESSING](https://docs.microsoft.com/en-us/windows/console/setconsolemode) is set for `CONOUT$`;
* [ConEmu specific OSC](AnsiEscapeCodes.html#ConEmu_specific_OSC) `ESC ] 9 ; 10 ; 3 ST` is issued;

ConEmu switches back to Windows mode when:

* simultaneously with [XTerm input mode](#TermInput) disabled;
* flag [ENABLE_VIRTUAL_TERMINAL_PROCESSING](https://docs.microsoft.com/en-us/windows/console/setconsolemode) is cleared for `CONOUT$`;
* [ConEmu specific OSC](AnsiEscapeCodes.html#ConEmu_specific_OSC) `ESC ] 9 ; 10 ; 2 ST` is issued;



## Terminal modes in Status Bar  {#StatusBar}

[StatusBar](StatusBar.html) column ‘Terminal modes’ shows current option and Left Mouse Button click shows
popup menu where you may change options if ConEmu could not change them automatically.

![Terminal Modes in Status Bar](/img/TerminalModes.png)


## Terminal modes in the Settings/Info page  {#SettingsInfo}

[Settings/Info](SettingsInfo.html) page also show current terminal options as well as console input/output modes,
coordinates and sizes of the console, running processes and more.


## -new_console switch  {#NewConsole}

You may change Task startup mode with [-new_console](https://conemu.github.io/en/NewConsole.html#syntax) switch.
Just add to your [Task](Tasks.html) command:

* `-new_console:p5` to enable ‘XTerm’ *with* ‘AppKeys’;
* `-new_console:p1` to enable ‘XTerm’ *without* ‘AppKeys’.
