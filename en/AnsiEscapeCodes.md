---
title: ConEmu | ANSI X3.64 and Xterm-256 Support

description: "List of ANSI sequences supported by ConEmu. Xterm 256 and 24bit colors extension. Usage examples."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features

otherlang:
   eng: /en/AnsiEscapeCodes.html
   rus: /ru/AnsiEscapeCodes.html

readalso:
 - url: CygwinAnsi.html
   title: "ANSI processing in Cygwin and Msys"
---

# ANSI X3.64 and Xterm 256 colors

ConEmu (from build 120520d) can process
[ANSI X3.64](http://en.wikipedia.org/wiki/ANSI_X3.64)
and its extension
[xterm 256 color mode](http://www.frexx.de/xterm-256-notes/).

* [Description](#Description)
  * [ANSI sequences processing requirements](#ANSI_sequences_processing_requirements)
  * [xterm 256 color processing requirements](#xterm_256_color_processing_requirements)
    * [Example 1: Vim](#Example_1_Vim)
    * [Example 2: 256colors2.pl](#Example_2_256colors2_pl)
    * [Example 3: scroll console to bottom](#Example_3_scroll_console_to_bottom)
  * [TechInfo](#TechInfo)
    * [Compatibility check](#compat-check)
  * [Environment variable](#Environment_variable)
* [List of supported codes](#List_of_supported_codes)
  * [C1 Control Characters](#C1_Control_Chars)
  * [CSI (Control Sequence Initiator) codes](#CSI_Control_Sequence_Initiator_codes)
    * [Terminal modes](#Terminal_modes)
    * [SGR (Select Graphic Rendition) parameters](#SGR_Select_Graphic_Rendition_parameters)
  * [OSC (Operating system commands)](#OSC_Operating_system_commands)
    * [ConEmu specific OSC](#ConEmu_specific_OSC)
* [Examples](#Examples)
  * [ANSI and xterm color maps](#ANSI_and_xterm_color_maps)
    * [Xterm 256 color map](#Xterm_256_color_map)
    * [Standard ANSI color map](#Standard_ANSI_color_map)
  * [sixteencolors.net](#sixteencolors.net)
  * [Compiler error highlighting](#Compiler_error_highlighting)
  * [Text Progressbar in cmd-files](#Text_Progressbar_in_cmd-files)


## Description  {#Description}

New option ‘ANSI X3.64 / xterm 256 colors’ on the ‘Features’ page, turned On by default.
It works with full console (including scrolling area - BufferHeight) but xterm 256 color
affects only on ‘working’ area (this is bottom part of console, if scrolling exists).
Outside (upper area) 256 colors will be approximated to console stanard 16-colors.


### ANSI sequences processing requirements   {#ANSI_sequences_processing_requirements}

* These checkboxes must be **On**
  * ‘ANSI X3.64 / xterm 256 colors’ on the [Features](Settings.html#Features) page
  * ‘Inject ConEmuHk’ on the [Features](Settings.html#Features) page (required for 2-nd level programs, aka started from your shell)


### xterm 256 color processing requirements   {#xterm_256_color_processing_requirements}

* These checkboxes must be **On**
  * ‘TrueMod (24bit color) support’ on the [Colors](Settings.html#Colors) page
  * ‘ANSI X3.64 / xterm 256 colors’ on the [Features](Settings.html#Features) page
  * ‘Inject ConEmuHk’ on the [Features](Settings.html#Features) page (required for 2-nd level programs, aka started from your shell)
* You need to ensure that buffer/scrolling is Off


#### Example 1: Vim  {#Example_1_Vim}

~~~
vim.exe -cur_console:h0 <Vim arguments here>
~~~



#### Example 2: 256colors2.pl  {#Example_2_256colors2_pl}

Perl script
[256colors2.pl](http://www.frexx.de/xterm-256-notes/data/256colors2.pl)
have to be runned as following:

~~~
256colors2.pl -cur_console:h0
~~~


#### Example 3: scroll console to bottom  {#Example_3_scroll_console_to_bottom}

If your console application **is not** ‘fullscreen’ (alike Far/Vim/Hiew/...),
you may scroll console to the bottom (by 9999 lines in the example)
to activate ‘working area’:

~~~
echo ^[[9999;1H
~~~

**Warning** You need to change `^[` to ESC code before using this script in `cmd.exe` prompt
(char with code ASCII \x1B). Because you can't insert the character with this ASCII code into
prompt using environment variable is recommended. Script `SetEscChar.cmd` is located in the
`%ConEmuBaseDir%` folder and it defines the variable `ESC.

~~~
call SetEscChar.cmd
echo %ESC%[9999;1H
~~~


### TechInfo   {#TechInfo}

ANSI escape sequences will be processed when console application
output text using Windows API functions
`WriteConsoleA`, `WriteConsoleW` or `WriteFile`.
For example:

~~~
cmd /c type "Colors-256.ans"
~~~

Also, output with extended attributes (xterm 256 color) is available with functions
`WriteConsoleOutputCharacterA` and `WriteConsoleOutputCharacterW`.



#### Compatibility check  {#compat-check}

**NB** ConEmu is enable to ‘process’ ANSI sequences,
if [console application](ConsoleApplication.html)
processes and strips them before WinApi functions calls,
listed [above](#TechInfo).
Obviously, that is because there are
NO ANSI sequences in the output at all.

This behavior is observed in certain cygwin and msys version.
The problem is described thoroughly
[here](CygwinAnsi.html) and [here](VimXterm.html#required-release).

Anyone may easily check, if the application
able to post real ANSI sequences by unchecking
option ‘ANSI X3.64 / xterm 256 colors’ on the
[Settings / Features](SettingsFeatures.html) page.
Look at screenshot below to realize how RAW ANSI looks like
(`ESC` character with ASCII code `\x1B` is displayed as `←` symbol).
Used switch [-cur_console:i](NewConsole.html) works
in certain [shells](TerminalVsShell.html) only.

![Processed and bare ANSI sequences ConEmu](/img/ConEmuAnsi2.png)



### Environment variable   {#Environment_variable}

How can I check in cmd-file if ANSI x3.64 is supported and enabled?
You have to check `ConEmuANSI` environment variable:

~~~
if "%ConEmuANSI%"=="ON"  echo Enabled
if "%ConEmuANSI%"=="OFF" echo Disabled
~~~

Also, to be compatible with ANSICON, ConEmu defines environment variables
`ANSICON`, `ANSICON_DEF` и `ANSICON_VER`. Last one is not visible
int the output of the `set` command (same behavior as ANSICON's).

~~~
> set ansi
ANSICON=204x9999 (204x36)
ANSICON_DEF=7

> echo %ANSICON_VER%
170
~~~


## List of supported codes  {#List_of_supported_codes}

### C1 Control Characters  {#C1_Control_Chars}

| Sequence | Description |
|:---|:---|
| ESC 7 | Save cursor position (same as `ESC [ s`) |
| ESC 8 | Restore cursor position (same as `ESC [ u`) |
| ESC E | Same as `\r\n` |
| ESC D | Same as `\n` but preserves X coord |
| ESC M | Reverse `\n` |
| ESC c | Full reset (clear screen, backscroll, move cursor to the upper-left corner) |


### CSI (Control Sequence Initiator) codes   {#CSI_Control_Sequence_Initiator_codes}

**NB** ANSI sequences address terminal working space only.
So, all ‘absolute’ coordinates addresses visible terminal area,
backscroll buffer (upper invisible parts) may not be accessed in that way.

| Sequence | Description |
|:---|:---|
| ESC \[ *n* @ | Insert *n* (default 1) blank characters. |
| ESC \[ *lines* A | Moves cursor up by *lines* lines (1 by default) |
| ESC \[ *lines* B | Moves cursor down by *lines* lines (1 by default) |
| ESC \[ *cols* C | Moves cursor rightward by *cols* columns (1 by default) |
| ESC \[ *cols* D | Moves cursor leftward by *cols* columns (1 by default) |
| ESC \[ *lines* E | Moves cursor to beginning of the line, *lines* (default 1) lines down. |
| ESC \[ *lines* F | Moves cursor to beginning of the line, *lines* (default 1) lines up. |
| ESC \[ *col* G | Moves the cursor to column *col* (absolute, 1-based). |
| ESC \[ *row* ; *col* H | Set cursor position. The values *row* and *col* are 1-based. |
| ESC \[ *n* J | Erase display. When *n* is 0 or missing: from cursor to end of display). When *n* is 1: erase from start to cursor. When *n* is 2: erase whole display **and** moves cursor to upper-left corner. When *n* is 3: dispose all backscroll lines. |
| ESC \[ *n* K | Erase line. When *n* is 0 or missing: from cursor to end of line. When *n* is 1: erase from start of line to cursor. When *n* is 2: erase whole line **and** moves cursor to first column. |
| ESC \[ *n* L | Insert *n* (default 1) lines before current, scroll part of screen from current line to bottom. |
| ESC \[ *n* M | Delete *n* (default 1) lines including current. |
| ESC \[ *n* P | Delete *n* (default 1) characters. |
| ESC \[ *lines* S | Scroll screen (whole buffer) up by *lines*. New lines are added at the bottom. |
| ESC \[ *lines* T | Scroll screen (whole buffer) down by *lines*. New lines are added at the top. |
| ESC \[ *n* X | Erase *n* (default 1) characters from cursor (fill with spaces and default attributes). |
| ESC \[ *>* c | Reports `ESC > 0 ; 136 ; 0 c` |
| ESC \[ c | Reports `ESC [ ? 1 ; 2 c` |
| ESC \[ *row* d | Moves the cursor to line *row* (absolute, 1-based). |
| ESC \[ *row* ; *col* f | Set cursor position (same as H). The values *row* and *col* are 1-based. |
| ESC \[ *a* ; *b* h | Set mode ([see below](#Terminal_modes)). |
| ESC \[ *a* ; *b* l | Reset mode ([see below](#Terminal_modes)). |
| ESC \[ *a* ; *b* ; *c* m | Set SGR attributes ([see below](#SGR_Select_Graphic_Rendition_parameters)). |
| ESC \[ 5 n | Report status as `CSI 0 n` (OK) |
| ESC \[ 6 n | Report Cursor Position as `"ESC \[ row ; col R"` |
| ESC \[ *a* ; *b* r | Set scrolling region from top=*a* to bottom=*b*. The values *a* and *b* are 1-based. Omit values to reset region. |
| ESC \[ s | Save cursor position (can not be nested). |
| ESC \[ 1 8 t | Report the size of the text area in characters as `ESC [ 8 ; height ; width t` |
| ESC \[ 1 9 t | Report the size of the screen in characters as `ESC [ 9 ; height ; width t` |
| ESC \[ 2 1 t | Report window’s title as `ESC ] l title ESC \` |
| ESC \[ u | Restore cursor position. |


#### Terminal modes  {#Terminal_modes}

| Sequence | Description |
|:---|:---|
| ESC \[ 7 ; *col* h | Enables line wrapping at column position. If *col* (1-based) is absent, wrap at column 80. |
| ESC \[ 7 l | Disables line wrapping. Lines wraps at the end of screen buffer. |
| ESC \[ 25 h | Show text cursor. |
| ESC \[ 25 l | Hide text cursor. |
| ESC \[ ? 47 h | Same as ‘ESC \[ ? 1047 h’ |
| ESC \[ ? 47 l | Same as ‘ESC \[ ? 1047 l’ |
| ESC \[ ? 1047 h | Activate xterm alternative buffer (no backscroll) |
| ESC \[ ? 1047 l | Restore xterm working buffer (with backscroll) |
| ESC \[ ? 1048 h | Save cursor position |
| ESC \[ ? 1048 l | Restore cursor position |
| ESC \[ ? 1049 h | Save cursor position and activate xterm alternative buffer (no backscroll) |
| ESC \[ ? 1049 l | Restore cursor position and restore xterm working buffer (with backscroll) |
| ESC \[ ? 2004 h | Enable xterm bracketed paste mode: ConEmu sends pasted text to console input buffer framed into `\s[200~` ... `\e[201~` |
| ESC \[ ? 2004 l | Disable xterm bracketed paste mode |



#### SGR (Select Graphic Rendition) parameters  {#SGR_Select_Graphic_Rendition_parameters}

| Sequence | Description |
|:---|:---|
| ESC \[ 0 m | Reset current attributes |
| ESC \[ 1 m | Set BrightOrBold |
| ESC \[ 2 m | Unset BrightOrBold |
| ESC \[ 3 m | Set ItalicOrInverse |
| ESC \[ 4 m | Set BackOrUnderline |
| ESC \[ 5 m | Set BackOrUnderline |
| ESC \[ 7 m | Use inverse colors |
| ESC \[ 22 m | Unset BrightOrBold |
| ESC \[ 23 m | Unset ItalicOrInverse |
| ESC \[ 24 m | Unset BackOrUnderline |
| ESC \[ 27 m | Use normal colors |
| ESC \[ 30...37 m | Set ANSI text color |
| ESC \[ 38 ; 5 ; *n* m | Set xterm text color, *n* is color index from 0 to 255 |
| ESC \[ 38 ; 2 ; *r* ; *g* ; *b* m | Set xterm 24-bit text color, *r*, *g*, *b* are from 0 to 255 |
| ESC \[ 39 m | Reset text color to defauls |
| ESC \[ 40...47 m | Set ANSI background color |
| ESC \[ 48 ; 5 ; *n* m | Set xterm background color, *n* is color index from 0 to 255 |
| ESC \[ 48 ; 2 ; *r* ; *g* ; *b* m | Set xterm 24-bit background color, *r*, *g*, *b* are from 0 to 255 |
| ESC \[ 49 m | Reset background color to defauls |
| ESC \[ 90...97 m | Set bright ANSI text color |
| ESC \[ 100...107 m | Set bright ANSI background color |


### OSC (Operating system commands)   {#OSC_Operating_system_commands}

**Note**. These codes may ends with ‘ESC\’ (two symbols - ESC and BackSlash)
or ‘BELL’ (symbol with code \x07, same as ‘^a’ in `*`nix).
For simplifying, endings in the following table marked as ‘ST’.

| Sequence | Description |
|:---|:---|
| ESC ] 2 ; "*txt*" ST | Set console window title to *txt*. |


#### ConEmu specific OSC  {#ConEmu_specific_OSC}

| Sequence | Description |
|:---|:---|
| ESC ] 9 ; 1 ; *ms* ST | Sleep. *ms* - number, milliseconds. |
| ESC ] 9 ; 2 ; "*txt*" ST | Show GUI MessageBox ( *txt* ) for any purposes. |
| ESC ] 9 ; 3 ; "*txt*" ST | Change ConEmu Tab to *txt*. Set empty string to return original Tab text. |
| ESC ] 9 ; 4 ; *st* ; *pr* ST | Set progress state on Windows 7 taskbar and ConEmu title. When *st* is 0: remove progress. When *st* is 1: set progress value to *pr* (number, 0-100). When *st* is 2: set error state in progress on Windows 7 taskbar |
| ESC ] 9 ; 5 ST | Wait for Enter/Space/Esc. Set environment variable "ConEmuWaitKey" to "ENTER"/"SPACE"/"ESC" on exit. |
| ESC ] 9 ; 6 ; "*txt*" ST | Execute [GuiMacro](GuiMacro.html) ( *txt* ). Set EnvVar "ConEmuMacroResult" on exit. |
| ESC ] 9 ; 7 ; "*cmd*" ST | Run some process with arguments. |
| ESC ] 9 ; 8 ; "*env*" ST | Output value of environment variable. |
| ESC ] 9 ; 9 ; "*cwd*" ST | Inform ConEmu about shell current working directory. |
| ESC ] 9 ; 10 ST | Request xterm keyboard emulation. |




## Examples  {#Examples}


### ANSI and xterm color maps   {#ANSI_and_xterm_color_maps}

![ANSI X3.64 and Xterm 256 colors in ConEmu](/img/ConEmuAnsi.png)


#### Xterm 256 color map  {#Xterm_256_color_map}

Example from file: `ConEmu\Addons\AnsiColors256.ans`.

~~~
^[[9999S^[[9999;1HSystem colors (0..15 from xterm palette):
^[[48;5;0m  ^[[48;5;1m  ^[[48;5;2m  ^[[48;5;3m  ^[[48;5;4m  ^[[48;5;5m  ^[[48;5;6m  ^[[48;5;7m  ^[[0m
^[[48;5;8m  ^[[48;5;9m  ^[[48;5;10m  ^[[48;5;11m  ^[[48;5;12m  ^[[48;5;13m  ^[[48;5;14m  ^[[48;5;15m  ^[[0m

Color cube, 6x6x6 (16..231 from xterm palette):
^[[48;5;16m  ^[[48;5;17m  ^[[48;5;18m  ^[[48;5;19m  ^[[48;5;20m  ^[[48;5;21m  ^[[0m ^[[48;5;52m  ^[[48;5;53m  ^[[48;5;54m  ^[[48;5;55m  ^[[48;5;56m  ^[[48;5;57m  ^[[0m ^[[48;5;88m  ^[[48;5;89m  ^[[48;5;90m  ^[[48;5;91m  ^[[48;5;92m  ^[[48;5;93m  ^[[0m ^[[48;5;124m  ^[[48;5;125m  ^[[48;5;126m  ^[[48;5;127m  ^[[48;5;128m  ^[[48;5;129m  ^[[0m ^[[48;5;160m  ^[[48;5;161m  ^[[48;5;162m  ^[[48;5;163m  ^[[48;5;164m  ^[[48;5;165m  ^[[0m ^[[48;5;196m  ^[[48;5;197m  ^[[48;5;198m  ^[[48;5;199m  ^[[48;5;200m  ^[[48;5;201m  ^[[0m 
^[[48;5;22m  ^[[48;5;23m  ^[[48;5;24m  ^[[48;5;25m  ^[[48;5;26m  ^[[48;5;27m  ^[[0m ^[[48;5;58m  ^[[48;5;59m  ^[[48;5;60m  ^[[48;5;61m  ^[[48;5;62m  ^[[48;5;63m  ^[[0m ^[[48;5;94m  ^[[48;5;95m  ^[[48;5;96m  ^[[48;5;97m  ^[[48;5;98m  ^[[48;5;99m  ^[[0m ^[[48;5;130m  ^[[48;5;131m  ^[[48;5;132m  ^[[48;5;133m  ^[[48;5;134m  ^[[48;5;135m  ^[[0m ^[[48;5;166m  ^[[48;5;167m  ^[[48;5;168m  ^[[48;5;169m  ^[[48;5;170m  ^[[48;5;171m  ^[[0m ^[[48;5;202m  ^[[48;5;203m  ^[[48;5;204m  ^[[48;5;205m  ^[[48;5;206m  ^[[48;5;207m  ^[[0m 
^[[48;5;28m  ^[[48;5;29m  ^[[48;5;30m  ^[[48;5;31m  ^[[48;5;32m  ^[[48;5;33m  ^[[0m ^[[48;5;64m  ^[[48;5;65m  ^[[48;5;66m  ^[[48;5;67m  ^[[48;5;68m  ^[[48;5;69m  ^[[0m ^[[48;5;100m  ^[[48;5;101m  ^[[48;5;102m  ^[[48;5;103m  ^[[48;5;104m  ^[[48;5;105m  ^[[0m ^[[48;5;136m  ^[[48;5;137m  ^[[48;5;138m  ^[[48;5;139m  ^[[48;5;140m  ^[[48;5;141m  ^[[0m ^[[48;5;172m  ^[[48;5;173m  ^[[48;5;174m  ^[[48;5;175m  ^[[48;5;176m  ^[[48;5;177m  ^[[0m ^[[48;5;208m  ^[[48;5;209m  ^[[48;5;210m  ^[[48;5;211m  ^[[48;5;212m  ^[[48;5;213m  ^[[0m 
^[[48;5;34m  ^[[48;5;35m  ^[[48;5;36m  ^[[48;5;37m  ^[[48;5;38m  ^[[48;5;39m  ^[[0m ^[[48;5;70m  ^[[48;5;71m  ^[[48;5;72m  ^[[48;5;73m  ^[[48;5;74m  ^[[48;5;75m  ^[[0m ^[[48;5;106m  ^[[48;5;107m  ^[[48;5;108m  ^[[48;5;109m  ^[[48;5;110m  ^[[48;5;111m  ^[[0m ^[[48;5;142m  ^[[48;5;143m  ^[[48;5;144m  ^[[48;5;145m  ^[[48;5;146m  ^[[48;5;147m  ^[[0m ^[[48;5;178m  ^[[48;5;179m  ^[[48;5;180m  ^[[48;5;181m  ^[[48;5;182m  ^[[48;5;183m  ^[[0m ^[[48;5;214m  ^[[48;5;215m  ^[[48;5;216m  ^[[48;5;217m  ^[[48;5;218m  ^[[48;5;219m  ^[[0m 
^[[48;5;40m  ^[[48;5;41m  ^[[48;5;42m  ^[[48;5;43m  ^[[48;5;44m  ^[[48;5;45m  ^[[0m ^[[48;5;76m  ^[[48;5;77m  ^[[48;5;78m  ^[[48;5;79m  ^[[48;5;80m  ^[[48;5;81m  ^[[0m ^[[48;5;112m  ^[[48;5;113m  ^[[48;5;114m  ^[[48;5;115m  ^[[48;5;116m  ^[[48;5;117m  ^[[0m ^[[48;5;148m  ^[[48;5;149m  ^[[48;5;150m  ^[[48;5;151m  ^[[48;5;152m  ^[[48;5;153m  ^[[0m ^[[48;5;184m  ^[[48;5;185m  ^[[48;5;186m  ^[[48;5;187m  ^[[48;5;188m  ^[[48;5;189m  ^[[0m ^[[48;5;220m  ^[[48;5;221m  ^[[48;5;222m  ^[[48;5;223m  ^[[48;5;224m  ^[[48;5;225m  ^[[0m 
^[[48;5;46m  ^[[48;5;47m  ^[[48;5;48m  ^[[48;5;49m  ^[[48;5;50m  ^[[48;5;51m  ^[[0m ^[[48;5;82m  ^[[48;5;83m  ^[[48;5;84m  ^[[48;5;85m  ^[[48;5;86m  ^[[48;5;87m  ^[[0m ^[[48;5;118m  ^[[48;5;119m  ^[[48;5;120m  ^[[48;5;121m  ^[[48;5;122m  ^[[48;5;123m  ^[[0m ^[[48;5;154m  ^[[48;5;155m  ^[[48;5;156m  ^[[48;5;157m  ^[[48;5;158m  ^[[48;5;159m  ^[[0m ^[[48;5;190m  ^[[48;5;191m  ^[[48;5;192m  ^[[48;5;193m  ^[[48;5;194m  ^[[48;5;195m  ^[[0m ^[[48;5;226m  ^[[48;5;227m  ^[[48;5;228m  ^[[48;5;229m  ^[[48;5;230m  ^[[48;5;231m  ^[[0m 
Grayscale ramp (232..255 from xterm palette):
^[[48;5;232m  ^[[48;5;233m  ^[[48;5;234m  ^[[48;5;235m  ^[[48;5;236m  ^[[48;5;237m  ^[[48;5;238m  ^[[48;5;239m  ^[[48;5;240m  ^[[48;5;241m  ^[[48;5;242m  ^[[48;5;243m  ^[[48;5;244m  ^[[48;5;245m  ^[[48;5;246m  ^[[48;5;247m  ^[[48;5;248m  ^[[48;5;249m  ^[[48;5;250m  ^[[48;5;251m  ^[[48;5;252m  ^[[48;5;253m  ^[[48;5;254m  ^[[48;5;255m  ^[[0m
~~~

**Warning** You need to change `^[` to ESC code before using this script (char with code ASCII \x1B).


#### Standard ANSI color map  {#Standard_ANSI_color_map}

This example is from file: `ConEmu\Addons\AnsiColors16.ans`.

~~~
System colors (Standard console 16 colors):
^[[0;30;40m  ^[[0;30;41m  ^[[0;30;42m  ^[[0;30;43m  ^[[0;30;44m  ^[[0;30;45m  ^[[0;30;46m  ^[[0;30;47m  ^[[0m
^[[0;30;4;40m  ^[[0;30;4;41m  ^[[0;30;4;42m  ^[[0;30;4;43m  ^[[0;30;4;44m  ^[[0;30;4;45m  ^[[0;30;4;46m  ^[[0;30;4;47m  ^[[0m
~~~

**Warning** You need to change `^[` to ESC code before using this script (char with ASCII code \x1B).


### sixteencolors.net   {#sixteencolors.net}

Large [ANSI art](http://en.wikipedia.org/wiki/ANSI_art) archive: [sixteencolors.net](http://sixteencolors.net/).

Download ‘ans’ file and execute it in ConEmu console, e.g. `type TK-FREES.ANS`.
You can view and scroll last output switching into alternative mode - `Win+A`.

**Note** Many arts was written for 80-chars console width.


<h3 id="Compiler_error_highlighting">
Compiler error highlighting
</h3>

#### To highlight Microsoft NMAKE errors and warnings

~~~
nmake | sed -e "s/.* : \bERR.*/\x1B[1;31;40m&\x1B[0m/i" -e "s/.* : \bWARN.*/\x1B[1;36;40m&\x1B[0m/i"

type "Errors.log" | sed -e "s/.* : \bERR.*/\x1B[1;31;40m&\x1B[0m/i" -e "s/.* : \bWARN.*/\x1B[1;36;40m&\x1B[0m/i"
~~~

#### To highlight MinGW MAKE errors, warnings and notes

The example below from scripts used to build ConEmu with GCC.
Take note of `2> Errors.log` while calling make, this is because
all errors and warnings are printed to `STDERR` but `STDOUT`.

~~~
mingw32-make.exe -f makefile_gcc DIRBIT=64 2> Errors.log
type "Errors.log" | sed -e "s/.*: \berror\b:.*/\x1B[1;31;40m&\x1B[0m/i" -e "s/.*: \bwarning\b: .*/\x1B[1;36;40m&\x1B[0m/i" -e "s/.*: \bnote\b: .*/\x1B[1;32;40m&\x1B[0m/i"
~~~

#### Some installations require ‘real’ ESC character

On some installations you have to replace `\x1B` with real ESC character
(symbol with ASCII code of \x1B).
You may use `SetEscChar.cmd` in bat-files as in following example.

~~~
call SetEscChar.cmd
mingw32-make.exe -f makefile_gcc DIRBIT=64 2> Errors.log
type "Errors.log" | sed -e "s/.*: \berror\b:.*/%ESC%[1;31;40m&%ESC%[0m/i" -e "s/.*: \bwarning\b: .*/%ESC%[1;36;40m&%ESC%[0m/i" -e "s/.*: \bnote\b: .*/%ESC%[1;32;40m&%ESC%[0m/i"
~~~

Or from bash-scripts.

~~~
esc=$(printf '\033')
cat "Errors.log" | sed -e "s/.*: \berror\b:.*/${esc}[1;31;40m&${esc}[0m/i" -e "s/.*: \bwarning\b: .*/${esc}[1;36;40m&${esc}[0m/i" -e "s/.*: \bnote\b: .*/${esc}[1;32;40m&${esc}[0m/i"
~~~


<h3 id="Text_Progressbar_in_cmd-files">
Text Progressbar in cmd-files
</h3>

From googlecode Issue#554
[test_bar.cmd](/misc/test_bar.cmd]
by @Artyom.Vorobets
