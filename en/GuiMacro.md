---
redirect_from:
 - /ru/GuiMacro.html

title: "ConEmu | GuiMacro - Syntax, Functions, Examples"

description: "GUI macros are the set of functions allowing to control ConEmu window and its consoles.
   GuiMacro may be called from command line or keypress."

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls

readalso:
 - url: "ConEmuC.html#ConEmuC_switches"
   title: "ConEmuC.exe command line switches"
 - url: "AutoHotKey.html#syntax"
   title: "AutoHotKey syntax"
 - url: "SettingsHotkeys.html"
   title: "Settings › Keys & Macro page"
 - url: "AnsiEscapeCodes.html"
   title: "ANSI sequences"
 - url: "ConEmuFarPlugin.html"
   title: "ConEmu plugin for Far Manager"
---

# ConEmu GuiMacro

GUI macros are the set of functions allowing to control
ConEmu window and its consoles.

GuiMacro may be triggered from many places, for example
from command line or [keypress](SettingsHotkeys.html).




## Contents  {#Contents}

* [How GuiMacro may be executed](#HowToCall)
  * [ConEmu hotkeys ‘Macro 01’ … ‘Macro 32’](#call-hotkey)
  * [ConEmuC -GuiMacro switch](#call-conemuc)
  * [From shortcut (ConEmu and ConEmu64)](#Gui_args)
  * [ANSI OSC sequence](#ANSI)
  * When you are in Far Manager
    * [Far Manager plugin](#FarPlugin)
    * [Far Manager 3.0 macros, **Far3-lua**](#Far3Lua)
    * [Far Manager 3.0 macros, **Far3-pre-lua**](#Far3PerLua)
    * [Far Manager 2.0](#Far2)
* [Syntax](#Syntax)
  * [Styles of arguments specification](#Styles_of_arguments_specification)
  * [Specifying more that a one argument](#Specifying_more_that_a_one_argument)
  * [Executing several functions at once](#Executing_several_functions_at_once)
  * [Numerical arguments](#Numerical_arguments)
  * [String arguments](#String_arguments)
* [Command line (ConEmuC and ConEmuC64)](#Command_line)
* [Run from shortcut (ConEmu and ConEmu64)](#Gui_args)
* [Far Manager plugin](#Far_Manager_plugin)
* [List of functions](#List_of_functions)
* [SetOption](#SetOptionExample)
* [Examples](#Examples)
  * [Far3-Lua](#Far3-Lua)
  * [Far3-pre-Lua](#Far3-pre-Lua)
  * [Far2](#Far2)
  * [Far1](#Far1)

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}

## How GuiMacro may be executed  {#HowToCall}

#### 1. ConEmu hotkeys ‘Macro 01’ … ‘Macro 32’  {#call-hotkey}

Just set up ‘Macro 01’ … ‘Macro 32’ on [‘Keys’](SettingsHotkeys.html) page of ‘Settings’ dialog.

#### 2. ConEmuC -GuiMacro switch  {#call-conemuc}

**NB**. This does not work in [WSL](BashOnWindows.html)!

If you may call `ConEmuC.exe` (command line, batch file, etc.)
then you may use [ConEmuC -GuiMacro](#Command_line) switch.
The format is flexible, few examples below.

~~~
"%ConEmuBaseDir%\ConEmuC.exe" /GUIMACRO WindowMinimize
ConEmuC -GuiMacro palette 1 "<Solarized>" -guimacro WindowMaximize
ConEmuC -guimacro status 1 test
ConEmuC -Guimacro Flash(1,3,5) ; MsgBox("Notification text")
ConEmuC -GuiMacro:0 print: C:\Program Files (x86)\Adobe\Reader 10.0\Reader\AcroRd32
~~~

#### 3. [From shortcut (ConEmu and ConEmu64)]  {#Gui_args}

~~~
ConEmu.exe -Detached -GuiMacro "Create(0,1); Context; print(\"echo \\\"Hello world\\\"\");"
~~~
    
#### 4. [ANSI OSC code](AnsiEscapeCodes.html#ConEmu_specific_OSC)  {#ANSI}
The following is only a demo, if you need to check [‘IsConEmu’](ConEmuC.html) it is better to call
`"ConEmuC -IsConEmu"` and check `%errorlevel%`.

~~~
rem We need real ESC code (symbol with ASCII \x1B) in cmd scripts
call SetEscChar.cmd
echo %ESC%]9;6;"IsConEmu"%ESC%\
if "%ConEmuMacroResult%"=="Yes" echo ConEmu found!
~~~

#### 5. Via [Far Manager plugin](#Far_Manager_plugin)  {#FarPlugin}
**NB**. Far Manager 1.7x, 2.0, 3.0 are supported.

~~~
F11 -> ConEmu -> Execute ConEmu macro
~~~

#### 6. Via Far Manager macros, **Far3-lua**  {#Far3Lua}

~~~
Plugin.SyncCall("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","IsConEmu()")
~~~

#### 7. **Far3-pre-lua** (*callplugin is alias of Plugin.Call*)  {#Far3PerLua}

~~~
Plugin.Call("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","IsConEmu()")
~~~

#### 8. **Far2**  {#Far2}

~~~
callplugin(0x43454D55,"IsConEmu()")
~~~



## Syntax  {#Syntax}

ConEmu GuiMacro parser is flexible and support different styles.



### Styles of arguments specification   {#Styles_of_arguments_specification}

* surrounded by brackets:

~~~
Function(Arguments)
~~~

* delimited by space:

~~~
Function Arguments
~~~

* delimited by colon (and space optionally):

~~~
Function: Arguments
~~~

**Note** Using colon-style you may easily pass **one-string-argument**.
Other methods may require quotating, backslash-escaping or verbatim strings.

~~~
print: C:\Program Files (x86)\Adobe\Reader 10.0\Reader\AcroRd32
  or
print("C:\\Program Files (x86)\\Adobe\Reader 10.0\\Reader\\AcroRd32")
  or
print(@"C:\Program Files (x86)\Adobe\Reader 10.0\Reader\AcroRd32")
~~~



### Specifying more that a one argument   {#Specifying_more_that_a_one_argument}

* delimited by commas:

~~~
Function(Arg1,Arg2,Arg3)
~~~

* delimited by spaces:

~~~
Function Arg1 Arg2 Arg3
~~~



### Executing several functions at once   {#Executing_several_functions_at_once}

* delimited by semicolons:

~~~
print("abc"); keys("^_"); print("def")
~~~

* delimited by `-GuiMacro` when called from your shell prompt:

~~~
ConEmuC -GuiMacro print abc -GuiMacro keys "^_" -GuiMacro print def
~~~



### Numerical arguments   {#Numerical_arguments}


* decimal form with leading optional ‘+’ or ‘-’:

~~~
FontSetSize(1,-1)
~~~

* hexadecimal form with ‘0x’ or ‘0X’ prefix:

~~~
MsgBox("Text","Title",0x132)
~~~



### String arguments   {#String_arguments}

It is recommended to put string arguments in doublequotes,
but in fact that is not required for ‘one-word’ arguments.



#### C-style strings  {#C-style_strings}

Backslashes and doublequotes must be escaped with backslashes.

Special symbols can be specified using escaped form:

~~~
\\  --> \
\"  --> "
\r  --> Carriage return (ASCII 13)
\n  --> New line (ASCII 10)
\t  --> Horizontal tab (ASCII 9)
\b  --> Backspace (ASCII 8)
\e  --> Escape (ASCII 27)
\a  --> Alert (ASCII 7)
~~~

And hexadecimal form `\xNNNN` (up to 4 digits) may be used to specify exact unicode character:

~~~
\x1B   --> same as \e (ASCII 27)
\x044F --> russian ‘я’ letter
~~~

Example:

~~~
print("\eCD /d \"C:\\Users\"\n")
~~~



#### Verbatim strings  {#Verbatim_strings}

No ‘escaped’ symbols, with the only exception of doublequote - they must be doubled.

~~~
print(@"CD /d ""C:\Users""")
~~~



#### Far plugin notes  {#Far_plugin_notes}

When you run some GuiMacro's from Far Manager macro and the string
has backslashes (`"C:\\Users\\..."`) you need to use verbatim strings
or double-double them because ConEmu GuiMacro parser always parse
escaped symbols itself.
The GuiMacro may be called from many places (from command line for example)
and parser is the one for all inputs.

~~~
Plugin.SyncCall("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","shell(\"new_console\",@\""..win.GetEnv("FARHOME").."\\far.exe\")")
~~~



## Command line (ConEmuC and ConEmuC64)  {#Command_line}

It doesn't matter `ConEmuC.exe` or `ConEmuC64.exe` you are using.

Syntax:

~~~
ConEmuC [/SILENT] /GuiMacro[:PID|HWND][:T<tab>][:S<split>] <GuiMacro command>
  or
ConEmuC [-Silent] -GuiMacro[:PID|HWND][:T<tab>][:S<split>] <GuiMacro command>
~~~

|:---|:---|
| **SILENT** | Suppress output of GuiMacro result (`OK`, `FAILED`, etc.) |
| **PID** | *‘Process ID’, decimal number* |
| 0 | Special value means ‘Use active tab/split of the first found ConEmu window |
| ConEmu GUI PID | `ConEmu.exe` or `ConEmu64.exe`, macro will be executed in the **active** tab/split |
| Console server PID | `ConEmuC.exe` or `ConEmuC64.exe` started with `/ROOT` argument |
| **HWND** | *Window descriptor, hexadecimal number with `x` prefix* |
| ConEmu GUI HWND | Main ConEmu window, macro will be executed in the **active** tab/split |
| Console server HWND | The hidden real console window |
| **T`<`tab`>`** | Changes affected [RealConsole](RealConsole.html), *‘tab’, decimal 1-based tab index* |
| **S`<`split`>`** | Changes affected [RealConsole](RealConsole.html), *‘split’, decimal 1-based pane index of selected/active group of panes* |


When GUI macro executed, ConEmuC.exe set errorlevel to 0 and write result to ‘StdOut’.

When you execute macro without `PID` or `HWND`,

~~~
ConEmuC -GuiMacro print abc
~~~

your macro will be executed in the **current** console (tab/split),
if it was started in ConEmu.
On the other hand, if you try to call that **outside** of ConEmu,
execution will fails with ‘%errorlevel% == 134’, because your console
(where you are trying to execute macro) is **not** a ConEmu console.

So, if you need to execute macro from any external application
(Visual Studio, Sublime text, even from `Win+R`) you may specify
exact instance with `PID` or `HWND`.

* `PID` must be decimal number.
* `HWND` must be specified as hexadecimal number (window descriptor) with ‘x’ prefix.

Exact values you may see in the ConEmu status bar, in the Windows Task Manager,
or find yourself using Windows API.

Few examples:

~~~
ConEmuC -GuiMacro:0 print: C:\Program Files (x86)\Adobe\Reader 10.0\Reader\AcroRd32
  or
ConEmuC -GuiMacro:8204 print "This is sample text"
  or
ConEmuC -GuiMacro:x140F32 WindowMinimize
~~~



## Run from shortcut (ConEmu and ConEmu64)  {#Gui_args}

If you need to run some GuiMacro(s) after ConEmu starts
user may use `-GuiMacro` switch with `ConEmu.exe` or `ConEmu64.exe`.
Only one `-GuiMacro` switch may be specified, but you may delimit functions with semicolon.
Also, double quotes and backslashes must be properly escaped within string arguments.

The following example will start ConEmu window without tabs,
show [‘Create new console’](LaunchNewTab.html#Create_new_console_dialog) dialog
and prints into the created console `echo "Hello world"`.

~~~
ConEmu.exe -Detached -GuiMacro "Create(0,1); Context; print(\"echo \\\"Hello world\\\"\");"
~~~



## Far Manager plugin  {#Far_Manager_plugin}

You may run GuiMacro from Far Plugin (`ConEmu.dll` / `ConEmu64.dll`) from:

* Using menu command: `F11` -> `ConEmu` -> `Execute ConEmu macro`
* Using Far Manager macro language, **Far v3.x Lua**:

~~~
Plugin.SyncCall("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","IsConEmu()")
~~~

* **Far v3.x pre Lua**:

~~~
Plugin.Call("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","IsConEmu()")
~~~

* **Far v2.x**:

~~~
callplugin(0x43454D55,"IsConEmu()")
~~~

When you call plugin menu, result is show in the dialog field.


When you use Far Manager macro, the **result** is placed to the
["ConEmuMacroResult"](ConEmuEnvironment.html) environment variable,
or returned via string result if you are using Far 3.0 with Lua.




## List of functions  {#List_of_functions}

{% comment %}
!!! when modifying - add same functions to "src\ConEmu\About.h" !!!
{% endcomment %}

Optional parameters are italic.

* [**About** ( "*Page*" )](#About)
* [**Start Alt+Number mode**](#AltNumber)
* [**AffinityPriority** ( *Affinity*, *Priority* )](#AffinityPriority)
* [**Attach** ( *PID*, *Alternative* )](#Attach)
* [**Break** ( Event, *ProcessGroupId* )](#Break)
* [**Close** ( What, *Flags* )](#Close)
* [**Context** ( *Tab*, *Split* )](#Context)
* [**Copy** ( What, *Format*, "*File*" )](#Copy)
* [**Create** ( Action, *Confirm*, *AsAdmin* )](#Recreate)
* [**Debug** ( Action )](#Debug)
* [**Detach**](#Detach)
* [**FindEditor** ( "FullEditFileName" )](#FindEditor)
* [**FindViewer** ( "FullViewerFileName" )](#FindEditor)
* [**FindFarWindow** ( WindowType, "WindowTitle" )](#FindEditor)
* [**Flash** ( Cmd, *Flags*, *Count*)](#Flash)
* [**FontSetName** ( "FontFaceName", *FontHeight*, *FontWidth* )](#FontSetName)
* [**FontSetSize** ( Relative, N )](#FontSetSize)
* [**GetInfo** ( "Parm1", "*Parm2*", ... )](#GetInfo)
* [**GetOption** ( "Name" )](#GetOption)
* [**GroupInput** ( *Cmd* )](#GroupInput)
* [**HighlightMouse** ( What, Act )](#HighlightMouse)
* [**IsConEmu**](#IsConEmu)
* [**IsConsoleActive**](#IsConsoleActive)
* [**IsRealVisible**](#IsRealVisible)
* [**Keys** ( "Combo1", "*Combo2*", ... )](#Keys)
* [**MsgBox** ( "Text", "Title", ButtonType )](#MsgBox)
* [**Palette** ( Cmd, "*NewPalette*"/*NewPaletteIndex* )](#Palette)
* [**Paste** ( Cmd, "*Text*", "*Text2*", ... )](#Paste)
* [**PasteExplorerPath** ( DoCd, SetFocus )](#PasteExplorerPath)
* [**PasteFile** ( Cmd, "*File*", "*CommentMark*" )](#PasteFile)
* [**Pause** ( *Cmd* )](#Pause)
* [**Print** ( "*Text*", "*Text2*", ... )](#Print)
* [**Progress** ( Type, *Value* )](#Progress)
* [**Recreate** ( Action, *Confirm*, *AsAdmin* )](#Recreate)
* [**Rename** ( Type, "*Title*" )](#Rename)
* [**Scroll** ( Type, Direction, *Count* )](#Scroll)
* [**Select** ( Type, DX, DY, HE )](#Select)
* [**SetDpi** ( DPI )](#SetDpi)
* [**SetFocus** ()](#SetFocus)
* [**SetOption** ( "Check", ID, Value )](#SetOptionID)
* [**SetOption** ( "Name", Value, *IsRelative* )](#SetOptionName)
* [**SetParentHWND** ( HWND )](#SetParentHWND)
* [**Settings** ( *PageResourceId* )](#Settings)
* [**Shell** ( "Verb", "File", "*Parms*", "*Dir*", *ShowCmd* )](#Shell)
* [**Sleep** ( Milliseconds )](#Sleep)
* [**Split** ( Cmd, Horz, Vert )](#Split)
* [**Status** ( 0, *Parm* ), Status ( 1, "*Text*" )](#Status)
* [**Tab** ( Cmd, *Parm* )](#Tab)
* [**Task** ( Index, "*Dir*" ), **Task** ( "Name", "*Dir*" )](#Task)
* [**TaskAdd** ( "Name", "Commands", "*GuiArgs*", *Flags* )](#TaskAdd)
* [**TermMode** ( Mode, Action )](#TermMode)
* [**Transparency** ( Cmd, Value )](#Transparency)
* [**Wiki** ( "*PageName*" )](#Wiki)
* [**WindowFullscreen**, **WindowMaximize**, **WindowMinimize**](#WindowMode)
* [**WindowMode** ( "*Mode*" )](#WindowMode)
* [**WindowPosSize** ( "X", "Y", "W", "H" )](#WindowPosSize)
* [**Write** ( "Text" )](#Write)
* [**Zoom** ( N )](#Zoom)



<!-- ***************** List of functions ***************** -->


### Show ‘About’ dialog with selected page activated  {#About}

~~~
About(["<Page>"])
  - Show ‘About’ dialog with page activated, e.g. ‘About("-new_console")’
~~~



### Start [Alt+Number](AltNumpad.html) mode  {#AltNumber}

~~~
AltNumber([Base])
  - Start Alt+Numbers mode: Base = 10 or 16
~~~



### Change affinity and priority of active console  {#AffinityPriority}

~~~
AffinityPriority( *Affinity*, *Priority* )
  - Call without arguments to show affinity/priority dialog
    Affinity: Number - processor mask, same as WinApi's SetProcessAffinityMask
              "" - empty string means ‘don't change’
    Priority: Number - priority class, same as WinApi's SetPriorityClass
              "" - empty string means ‘don't change’
~~~



### Attach external console or [ChildGui](ChildGui.html) by PID  {#Attach}

~~~
Attach([<PID>[,<Alternative>]])
  - Attach console or ChildGui by PID
~~~



### Generate CTRL+C or CTRL+BREAK signals  {#Break}

~~~
Break([<Event>[,<ProcessGroupId>]])
  - Event==0: Generates a CTRL+C signal
    Event==1: Generates a CTRL+BREAK signal
    More info in GenerateConsoleCtrlEvent WinAPI function
~~~



### Close or kill active tab, group or window  {#Close}

~~~
Close(<What>[,<Flags>])
  - Close current console (0), without confirmation (0,1),
    terminate active process (1), without confirmation (1,1)
    close ConEmu window (2)
    close active tab (3)
    close active group (4)
    close all tabs but active (5)
    close active tab or group (6)
    close all active processes of the active group (7)
    close all tabs (8)
~~~



### Change macro execution context  {#Context}

Useful after creating new consoles or switching tabs.

~~~
Context([<Tab>[,<Split>]])
  - Change macro execution context
    Tab: 1-based tab index
    Split: 1-based split index
~~~



### Copy console contents or selection, plain text or HTML  {#Copy}

~~~
Copy(<What>[,<Format>[,"<File>"]])
  - Copy active console contents
    What==0: current selection
    What==1: all buffer contents
    What==2: visible area contents
    Format==0: plain text, not formatting
    Format==1: copy HTML format
    Format==2: copy as HTML
    File: if specified - save to file instead of clipboard
~~~



### Create debugger console or memory dumps  {#Debug}

~~~
Debug(<Action>)
  - Create debugger console or memory dumps
    Action==0: Debug active process
    Action==1: Active process memory dump
    Action==2: Active process tree memory dump
~~~



### Detach active RealConsole from ConEmu  {#Detach}

~~~
Detach
  - Detach active RealConsole from ConEmu
~~~



### Find and activate Far Manager window, used in macro ‘ConEmu.Editor.lua’  {#FindEditor}

~~~
FindEditor("<FullEditFileName>"),
FindViewer("<FullViewerFileName>"),
FindFarWindow(<WindowType>,"<WindowTitle>")
 - Returns "Found:<index of RealConsole>", "Active:<Far window number>", "Blocked", or "NotFound"
   <WindowType> is number from Far Manager enum WINDOWINFO_TYPE
~~~



### Flash taskbar icon or window caption  {#Flash}

~~~
Flash(<Cmd>[,<Flags>[,<Count>]])
  - Allows to flash taskbar icon and/or window caption
    Flash(0) - Stop all flashing
    Flash(0,1) - Simple flashing (see MSDN FlashWindow)
Flash(1,<Flags>,<Count>)
  - Special flashing (see MSDN FlashWindowEx)
    Flags: 0 - stop, 1 - caption, 2 - taskbar, 3 - caption+taskbar, etc.
    Count: the number of times to flash the window
~~~



### Change font face name and (optionally) height/width  {#FontSetName}

~~~
FontSetName("<FontFaceName>"[,FontHeight[,FontWidth]])
 - Change font face name and (optionally) height/width.
~~~



### Change font height in the ConEmu window  {#FontSetSize}

~~~
FontSetSize(Relative,N)
 - Change font height in the ConEmu window
   Relative==0: N - required font height in points
   Relative==1: N (+-1, +-2) - increase/decrease font height
   Relative==2: N (per cents) - alias for Zoom(N)
   returns - "OK", or "InvalidArg"
~~~



### Returns value of some ConEmu environment variables  {#GetInfo}

Macro returned requested information from GUI (`ConEmu.exe` or `ConEmu64.exe`)

~~~
GetInfo("<Opt1>"[,"<Opt2>"[,...]])
  - Returns values of some ConEmu environment variables
    Processed in GUI so the result may differs from RealConsole env.vars
    "PID": %ConEmuPID% and so on
  - Returns additional information about RealConsole
    "Root": XML with RootProcess info
    "ActivePID","CurDir": as is
~~~



### Returns value of some ConEmu options  {#GetOption}

~~~
GetOption("<Name>")
 - Returns value of some ConEmu options (the set is limited)
~~~



### Group keyboard input for visible splits  {#GroupInput}

~~~
GroupInput([<Cmd>])
 - Group keyboard input for visible splits
   Cmd==0: switch mode (default)
   Cmd==1: group
   Cmd==2: un-group
~~~



### Switch highlighting under mouse cursor  {#HighlightMouse}

~~~
HighlightMouse(0)
 - Switch highlight under mouse cursor (off/row/col/row+col/...)
HighlightMouse(<What>,<Act>)
 - What: 1 - row, 2 - col, 3 - row+col
   Act:  0 - off, 1 - on,  2 - switch (default)
~~~



### Check if console is started under ConEmu (check [ConEmuC alternative](ConEmuC.html#UsefulChecks))  {#IsConEmu}

~~~
IsConEmu
 - Returns "Yes" when console was started under ConEmu
   Alternative is "ConEmuC.exe -IsConEmu" and checking errorlevel
~~~




### Check if tab ([RealConsole](RealConsole.html)) is active or not  {#IsConsoleActive}

~~~
IsConsoleActive
 - Check, is RealConsole active or not, "Yes"/"No"
~~~



### Check if [RealConsole](RealConsole.html) is visible or not  {#IsRealVisible}

~~~
IsRealVisible
 - Check, is RealConsole visible or not, "Yes"/"No"
~~~



### Post special keystrokes to the console ([AutoHotKey syntax](AutoHotKey.html#syntax))  {#Keys}

~~~
Keys("<Combo1>"[,"<Combo2>"[,...]])
 - Post special keystrokes to the console (AutoHotKey syntax)
   "[Mod1[Mod2[Mod3]]]Key"
   Mod: ^ - LCtrl, >^ - RCtrl, ! - LAlt, >! - RAlt, + - Shift
   Example: Keys("^_") will post ‘Ctrl+_’
~~~



### Show modal GUI MessageBox, returns clicked button name  {#MsgBox}

~~~
MsgBox("<Text>","<Title>",<ButtonType>)
 - Show modal GUI MessageBox, returns clicked button name
   ("Ok", "Cancel", "Retry", etc.),
   ButtonType (number) is from Windows SDK.
~~~



### Change or acquire current console palette  {#Palette}

~~~
Palette([<Cmd>[,"<NewPalette>"|<NewPaletteIndex>]])
  - Returns current palette name, change if <Cmd> specified
     Cmd==0: return palette from ConEmu settings
     Cmd==1: change palette in ConEmu settings, returns prev palette
     Cmd==2: return palette from current console
     Cmd==3: change palette in current console, returns prev palette
     NewPalette: palette name (string)
     NewPaletteIndex: 0-based index (number)
~~~



### Paste specified text or Windows clipboard contents  {#Paste}

~~~
Paste(<Cmd>[,"<Text>"[,"<Text2>"[...]]])
 - When <Text> is omitted - paste from Windows clipboard,
   otherwise - paste specified text
   Cmd==0: paste all lines
   Cmd==1: paste first line
   Cmd==2: paste all lines, without confirmations
   Cmd==3: paste first line, without confirmations
   Cmd==4: select and parse file pathname, Text - default
   Cmd==5: select and parse folder pathname, Text - default
   Cmd==6: select and parse cygwin file pathname, Text - default
   Cmd==7: select and parse cygwin folder pathname, Text - default
   Cmd==8: paste path from clipboard converted to CygWin style
   Cmd==9: paste all lines space-separated
   Cmd==10: paste all lines space-separated, without confirmations
~~~



### Paste active Explorer window path into ConEmu  {#PasteExplorerPath}

~~~
PasteExplorerPath (<DoCd>,<SetFocus>)
  - Activate ConEmu and ‘CD’ to last (top in Z-order) Explorer window path
     DoCd: 1 - ‘CD’, 0 - paste path only
     SetFocus: 1 - bring ConEmu to the top, 0 - don't change active window
~~~



### Paste specified or selected file contents  {#PasteFile}

~~~
PasteFile(<Cmd>[,"<File>"[,"<CommentMark>"]])
 - Paste <File> contents, omit <File> to show selection dialog
   Cmd==0: paste all lines
   Cmd==1: paste first line
   Cmd==2: paste all lines, without confirmations
   Cmd==3: paste first line, without confirmations
   Cmd==9: paste all lines space-separated
   Cmd==10: paste all lines space-separated, without confirmations
   If "<CommentMark>" specified - skip all lines starting with prefix
~~~



### Pause or un-pause current console  {#Pause}

~~~
Pause([<Cmd>])
  - Pause current console
     Cmd==0: switch mode (default)
     Cmd==1: pause
     Cmd==2: un-pause
~~~



### Print (paste) specified text  {#Print}

~~~
Print(["<Text>"[,"<Text2>"[...]]])
 - Alias for Paste(2,"<Text>")
~~~



### Set progress state on taskbar and ConEmu title  {#Progress}

~~~
Progress(<Type>[,<Value>])
 - Set progress state on taskbar and ConEmu title
   Type=0: remove progress
   Type=1: set progress value to <Value> (0-100)
   Type=2: set error state in progress with <Value>
   Type=3: set indeterminate state in progress
   Type=4: set paused state in progress with <Value>
~~~



### Create new or restart active tab or pane  {#Recreate}

~~~
Recreate(<Action>[,<Confirm>[,<AsAdmin>]]), alias "Create"
 - Create new tab or restart existing one
    Action: 0 - create tab, 1 - restart tab, 2 - create window
    Confirm: 1 - show ‘Create new console’ dialog, 0 - don't show
    AsAdmin: 1 - start elevated tab
~~~



### Rename active tab or console title  {#Rename}

~~~
Rename(<Type>,["<Title>"])
 - Rename tab (Type=0) or console title (Type=1)
~~~



### Scroll console contents  {#Scroll}

~~~
Scroll(<Type>,<Direction>,<Count=1>)
 - Do buffer scrolling actions
   Type: 0; Value: ‘-1’=Up, ‘+1’=Down
   Type: 1; Value: ‘-1’=PgUp, ‘+1’=PgDown
   Type: 2; Value: ‘-1’=HalfPgUp, ‘+1’=HalfPgDown
   Type: 3; Value: ‘-1’=Top, ‘+1’=Bottom
   Type: 4; No arguments; Go to cursor line
~~~



### Start or change console selection  {#Select}

~~~
Select(<Type>,<DX>,<DY>,<HE>)
 - Used internally for text selection
   Type: 0 - Text, 1 - Block, 2 - Stop
   DX: select text horizontally: -1/+1
   DY: select text vertically: -1/+1
   HE: to-home(-1)/to-end(+1) with text selection
   HE: word-left(-2)/word-right(+2) with text selection
Select(2)
 - Use to cancel active selection
~~~



### Change used DPI for ConEmu window (debug purposes)  {#SetDpi}

~~~
SetDpi(<DPI>)
 - Change effective dpi for ConEmu window: 96, 120, 144, 192
~~~



### Try to set focus in ConEmu window  {#SetFocus}

~~~
SetFocus()
 - May be useful during inside mode
~~~


### Change setting by numeric ID of the checkbox  {#SetOptionID}

~~~
SetOption("Check",<ID>,<Value>)
   ID: numeric identifier of checkbox (ConEmu.rc, resource.h)
   Value: 0 - off, 1 - on, 2 - third state
   Read about SetOption below
~~~



### Change some setting by name  {#SetOptionName}

~~~
SetOption("<Name>",<Value>[,<IsRelative>])
 - Name=one of allowed for changing ConEmu options
   IsRelative=1 to use relative instead of absolute for some options
   "AlphaValue": set transparency level of active window
     Value: 40 .. 255 (255==Opaque)
   "AlphaValueInactive": set transparency level of inactive window
     Value: 0 .. 255 (255==Opaque)
   "AlphaValueSeparate": enable separate active/inactive transparency level
     Value: 0(disable) .. 1(enable)
   "AlwaysOnTop": place ConEmu window above all non-topmost windows
     Value: 2 - toggle, 1 - enable, 0 - disable
   "bgImage": change background image
      Value: file or color, e.g. "C:\image.jpg" or "#3182a4"
   "bgImageDarker": darkening of background image
     Value: 0 .. 255
   "FarGotoEditorPath": path to the highlight/error editor
     Value: path to the executable with arguments (Issue 1704)
   "QuakeAutoHide": auto hide on focus lose, Quake mode
     Value: 2 - switch auto-hide, 1 - enable, 0 - disable
~~~



### Change ConEmu parent window  {#SetParentHWND}

~~~
SetParentHWND(<HWND>)
 - Change ConEmu parent window during Inside mode
   HWND: new parent window handle
~~~


### Show ‘Settings’ dialog with specified (optionally) page activated  {#Settings}

~~~
Settings([<PageResourceId>])
 - Show ‘Settings’ dialog with specified page activated (optionally)
     PageResourceId: integer DialogID from ‘resource.h’
~~~



### Start any process inside or outside of ConEmu window  {#Shell}

~~~
Shell("<Verb>","<File>"[,"<Parms>"[,"<Dir>"[,<ShowCmd>]]])
 - Verb can be "open", "print" and so on, or special value "new_console",
   which starts File in the new tab of ConEmu window. Examples:
     Shell("open","cmd.exe","/k")
     Shell("","","cmd.exe /k -new_console:b"),
     Shell("new_console:b","","cmd.exe /k")
     Shell("new_console:sV")
     Shell("new_console:Ibn","cmd","/k start explorer \"%CD%\" && exit")
~~~



### Do some sleeping  {#Sleep}

~~~
Sleep(<Milliseconds>)
 - Milliseconds: max 10000 (10 seconds)
~~~



### Create and control splitting of active group  {#Split}

~~~
Split(<Cmd>,<Horz>,<Vert>)
 - Cmd=0, Horz=1..99, Vert=0: Duplicate active ‘shell’ split to right, same as Shell("new_console:s50Hn")
   Cmd=0, Horz=0, Vert=1..99: Duplicate active ‘shell’ split to bottom, same as Shell("new_console:s50Vn")
   Cmd=1, Horz=-1..1, Vert=-1..1: Move splitter between panes (aka resize panes)
   Cmd=2, Horz=-1..1, Vert=-1..1: Put cursor to the nearest pane (preferred direction may be choosed)
   Cmd=3, Maximize/restore active pane
~~~



### Show/Hide [StatusBar](StatusBar.html) or set its text  {#Status}

~~~
Status(0[,<Parm>])
 - Show/Hide status bar, Parm=1 - Show, Parm=2 - Hide
Status(1[,"<Text>"])
 - Set status bar text
~~~



### Control ConEmu [TabBar](TabBar.html)  {#Tab}

~~~
Tab(<Cmd>[,<Parm>])
 - Control ConEmu tabs
   Cmd==0:  show/hide tabs
   Cmd==1:  commit lazy changes
   Cmd==2:  switch next (eq. CtrlTab)
   Cmd==3:  switch prev (eq. CtrlShiftTab)
   Cmd==4:  switch tab direct (no recent mode), Parm=(1,-1)
   Cmd==5:  switch tab recent, Parm=(1,-1)
   Cmd==6:  switch console direct (no recent mode), Parm=(1,-1)
   Cmd==7:  activate console by number, Parm=(1-based console index or -1 for last tab)
   Cmd==8:  show tabs list menu (indiffirent Far/Not Far)
   Cmd==9:  close active tab, same as Close(3)
   Cmd==10: switches visible split-panes, Parm=(1,-1)
   Cmd==11: activates tab by name, title or process name
   Cmd==12: return tabs list "1: tab1\n2: tab2\n..."
~~~



### Start specified [Task](Tasks.html)  {#Task}

~~~
Task(Index[,"Dir"])
 - start task with 1-based index
Task("Name"[,"Dir"])
 - start task with specified name
~~~
 


### Create new [Task](Tasks.html) and save it to [Settings](ConEmuXml.html)  {#TaskAdd}

~~~
TaskAdd("Name","Commands"[,"GuiArgs"[,Flags]])
 - create new task and save it to settings
~~~



### Changes active terminal modes  {#TermMode}

~~~
TermMode(<Mode>[,<Action>])
  - changes active terminal modes
    Mode==0: Keyboard emulation (Xterm/Windows)
    Mode==1: Bracketed paste
    Mode==2: Application cursor keys (DECCKM)
    Action==0: Disable mode
    Action==1: Enable mode
    Action==2: Switch mode (default)
~~~



### Change ConEmu window transparency level  {#Transparency}

~~~
Transparency(<Cmd>,<Value>)
 - Change ConEmu window transparency level
   Cmd = 0, Value = 40..255 (255==Opaque)
   Cmd = 1, Value = <relative inc/dec>
   Cmd = 2, Value = 0..255 (255==Opaque) - for inactive window
   Cmd = 3, Value = <relative inc/dec> - for inactive window
   Cmd = 4, Value = <0/1> - AlphaValueSeparate
~~~



### Open online documentation  {#Wiki}

~~~
Wiki(["PageName"])
 - Open online documentation
~~~



### Change ConEmu window mode  {#WindowMode}

~~~
WindowFullscreen()
 - Switch fullscreen window mode
   returns previous window mode
WindowMaximize([<Cmd>])
 - Switch maximized window mode (Cmd==0)
 - Maximize window by width (Cmd==1) or height (Cmd==2)
   returns previous window mode
WindowMinimize() or WindowMinimize(1)
 - Minimize ConEmu window ("1" means "minimize to the TSA")
WindowMode(["<Mode>"])
 - Returns or set current window mode
   "NOR", "MAX", "FS" (fullscreen), "MIN", "TSA"
   "TLEFT", "TRIGHT" (tile to left/right),
   "THEIGHT", "TWIDTH" (tile/maximize height/width),
   "MPREV", "MNEXT" (move ConEmu to prev/next monitor)
   "HERE" (move ConEmu to monitor with mouse cursor)
~~~



### Change ConEmu window geometry  {#WindowPosSize}

~~~
WindowPosSize("<X>", "<Y>", "<W>", "<H>")
  - Change ConEmu window geometry
    "<X>" and "<Y>" are pixels (numbers in doublequotes);
    "<W>" and "<H>" may be cells, percentage or pixels:
      "80", "40%", "800px".
~~~



### Write Text to console output {#Write}

> Use it at you own risk! Calling this function may cause unexpected behavior
> of running console application! That is because function changes console
> contents and cursor position directly, bypassing detouring standard
> ConIn/ConOut processing queue.

~~~
Write("<Text>")
  - Write text to console OUTPUT
~~~

In most cases **safe** functions [Paste](#Paste), [Print](#Print) and [Keys](#Keys) are preferable!

However, with `Write` you may implement some interesting features,
like printing sort of ‘hints’ in shell prompt:

~~~
Write "\e7\e[90mEcho \"Hello world!\"\e[m\e8"
~~~

Or push to console several colored lines to ‘mark’ some point in real-time logs (tail -f).

~~~
Write "\n\n\e[91m========== '\e]9;8;\"time\"\e\\' ==========\e[m\n\n"
~~~



### Change font zoom value  {#Zoom}

~~~
Zoom(N)
 - Set zoom value, 100 - original font size
~~~


<!-- *************** List of functions ends *************** -->



## SetOption  {#SetOptionExample}


You may change some (or most) of ConEmu settings using [SetOption](#SetOptionID) macro function.


It may be used **by name** for several options, for example

~~~
SetOption("FarGotoEditorPath","far.exe /e%1:%2 \"%3\"")
~~~

Or **by CheckBox/RadioButton ID**. Of course you must know that number-ID.
Look up the control by its label in the
[ConEmu.rc](https://github.com/Maximus5/ConEmu/blob/master/src/ConEmu/ConEmu.rc)
(don't forget about possible ‘`&`’),
and then look up the exact number-ID by its string-ID in the
[resource.h](https://github.com/Maximus5/ConEmu/blob/master/src/ConEmu/resource.h).

For example, turn scrollbar on:

~~~
ConEmuC -GuiMacro SetOption Check 2488 1
~~~

Turn Quake style activation off:

~~~
ConEmuC -GuiMacro SetOption Check 2333 0
~~~



## Examples  {#Examples}

Examples below show how to call GuiMacro from different versions of Far Manager.
All of them checks and show message if ‘Far started under ConEmu’.

Also, Far 3 examples show how to run `FarEncyclopedia.ru.chm`
and new instance of `far.exe` in the new ConEmu tab.
These are just an examples of using Far Macro language.

### Far3-Lua   {#Far3-Lua}

~~~
local conemu = "4B675D80-1D4A-4EA9-8436-FDC23F2FC14B"

if Plugin.SyncCall(conemu,"IsConEmu")=="Yes" then
  far.Message("Far started under ConEmu","Macro")
end

local cmd = ('shell("open",@"%s")'):format(win.GetEnv"FARHOME"..[[\Encyclopedia\FarEncyclopedia.ru.chm]])
Plugin.SyncCall(conemu,cmd)

local cmd = ('shell("new_console",@"%s")'):format(win.GetEnv"FARHOME".."\\far.exe")
Plugin.SyncCall(conemu,cmd)
~~~



### Far3-pre-Lua   {#Far3-pre-Lua}

~~~
$if (callplugin("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","IsConEmu()")!=0 && env("ConEmuMacroResult")=="Yes")
  MsgBox("Macro", "Far started under ConEmu")
$end

callplugin("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","shell(\"open\",@\""+env("FARHOME")+"\\Encyclopedia\\FarEncyclopedia.ru.chm\")")

callplugin("4b675d80-1d4a-4ea9-8436-fdc23f2fc14b","shell(\"new_console\",@\""+env("FARHOME")+"\\far.exe\")")
~~~



### Far2   {#Far2}

~~~
$if (callplugin(0x43454D55,"IsConEmu()")!=0 && env("ConEmuMacroResult")=="Yes")
  MsgBox("Macro", "Far started under ConEmu")
$end
~~~



### Far1   {#Far1}

This is most complicated, cause of 'callplugin' absence in the Far 1.x

~~~
F11
$if (menu.Select("ConEmu",2)<=0) MsgBox("ConEmu","Plugin was not found in list!",1)
  $Exit
$end
Enter %r="";
$if (menu.select("~.",1)>0)
  ~ $Text "IsConEmu()" Enter %r=Dlg.GetValue(5,0);
$end
Esc
$if (%r=="Yes")
  MsgBox("Macro", "Far started under ConEmu")
$end
~~~
