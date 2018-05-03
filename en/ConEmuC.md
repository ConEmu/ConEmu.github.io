---
redirect_from: /ru/ConEmuC.html

title: ConEmu | ConEmuC - Console Part of ConEmu

description: "ConEmuC implements full-featured console window.
   Also it can be used from command line to do many jobs like
   posting GuiMacro, downloading files, exporting environment and more."

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps
 - url: CommandLine.html
   title: Switches
---

# Console part of ConEmu

ConEmuC is a console part of ConEmu.
It implements full-featured console window and serves all console requests.
Also it can be used from command line to do many jobs like
[posting GuiMacro](#GuiMacro), [downloading files](#Download),
[exporting environment](#Export) and much more.

There are two versions - ConEmuC.exe and ConEmuC64.exe.

In the 32-bit operation systems only ConEmuC.exe (and ConEmuHk.dll library) is used.

64-bit systems are more complicated, so both versions must exists in the ConEmu folder.
ConEmuC.exe is used, when You run 32bit applications from started console,
ConEmuC64.exe (and ConEmuHk64.dll) for 64bit applications.

Root console process will be ConEmuC.exe, when You are using ConEmu.exe,
and ConEmuC64.exe, when You are using ConEmu64.exe.

* [Font in real console](#Font_in_real_console)
  * [Warning](#font-warning)
* [ConEmuC.exe command line switches](#ConEmuC_switches)
  * [Show help screen](#HelpScreen)
  * [Useful checks](#UsefulChecks)
  * [Attach consoles to ConEmu](#Attach)
  * [ConEmu GUI macro command](#GuiMacro)
  * [Echo and Type](#EchoAndType)
  * [Debug and MiniDump](#Debug)
  * [Export environment variables to the parent processes](#Export)
  * [Download from http/https/ftp](#Download)
  * [Execute commands and create tabs (use with caution!)](#Commands)
  * [Show errorlevel of `<command>`](#ShowErrorlevel)
  * [Return errorlevel = `<number>`](#ReturnErrorlevel)
* [-new_console and -cur_console switches](#new_console_and_cur_console)
  * [Warnings](#new_console-warnings)
  * [Examples](#new_console-examples)




## Font in real console  {#Font_in_real_console}

ConEmu use small *Lucida console* font in real console by default,
cause of this font is shipped with Windows and it is unicode
(unicode font must be selected in real console to allow ConEmu
retrieve unicode characters from real console).

You may specify font face name and size to the real console.



### Warning  {#font-warning}

* This font must be preinstalled in the system.
* It **must** be **unicode** (means TTF).
* It **must** be smaller than main font (selected for ConEmu).



## ConEmuC.exe command line switches  {#ConEmuC_switches}

**Note** From build 140106 you may use '-'style switches with ConEmuC too, for example, following commands acts the same.

~~~
ConEmuC /IsConEmu
ConEmuC -IsConEmu
~~~



### Show help screen  {#HelpScreen}

~~~
ConEmuC /?
~~~



### Useful checks  {#UsefulChecks}

~~~
ConEmuC /IsConEmu
    returns 1 as errorlevel if running in ConEmu tab, 2 if not
ConEmuC /IsAnsi
    returns 1 as errorlevel if ANSI are processed, 2 if not
ConEmuC /IsTerm
    returns 1 as errorlevel if running in telnet, 2 if not
~~~



### Attach consoles to ConEmu  {#Attach}

~~~
ConEmuC /AUTOATTACH [/GHWND=NEW|<HWND>]
    asynchronous attach to ConEmu GUI (for batches)
    always returns 0 as errorlevel on exit (Issue 1003)
ConEmuC /ATTACH /NOCMD [/GHWND=NEW|<HWND>]
    asynchronous attach current (existing) console to ConEmu
ConEmuC /ATTACH [/GHWND=NEW|<HWND>] /[FAR|CON|TRM]PID=<PID>
    synchronous attach specified console process to ConEmu
  Switches
    /GHWND        - you may force new ConEmu window or attach to specific one
    /PID=<PID>    - use <PID> as root process
    /FARPID=<PID> - for internal use from Far plugin
    /CONPID=<PID> - 'soft' mode, don't inject ConEmuHk into <PID>
    /TRMPID=<PID> - called from *.vshost.exe when 'AllocConsole' just created
~~~



### [ConEmu GUI macro command](GuiMacro.html)  {#GuiMacro}

Read full description on [GuiMacro](GuiMacro.html#Command_line) page.

~~~
ConEmuC [/SILENT] /GUIMACRO[:PID|HWND][:T<tab>][:S<split>] <GuiMacro command>
~~~



### Echo and Type  {#EchoAndType}

These two was implemented for test purposed mostly. But may be useful.
Use any of `-e`, `-echo`, `/echo` to echo a string with ANSI sequences.

~~~
ConEmuC -e [-r] [-n] [-x] [-b] "String to echo"
  Switches
    -r  - do not replace "^e^r^n^t^a^b" with ASCII equivalents
          to print single "^" char - double it "^^"
          escape char alias - "^["
    -n  - do not add CRLF after printed line
    -x  - expand environment variables
    -b  - scroll to bottom of the buffer before printing (TrueColor buffer compatible)
~~~

Use any of `-t`, `-type`, `/type` to type text file with ANSI sequences.

~~~
ConEmuC -t [-b] [-CP] "Path to text file to echo"
  Switches
    -b  - scroll to bottom of the buffer before printing (TrueColor buffer compatible)
    -CP - consider that text file code page is specified "CP"
          ConEmuC -t -utf8 "utf8-file.txt"
          ConEmuC -t -1251 "russian-file.txt"
          Without specified code page BOM may be used for utf-8 and CP1200
          Otherwise the file will be threated as ANSI
~~~

Both commands are able to process [ANSI sequences](AnsiEscapeCodes.html). But take into account, that `"ConEmuC -t ..."` does not do replacements with ASCII equivalents.

~~~
ConEmuC -e "^[[1;33;45mqwerty^[[m"
~~~



### Debug and [MiniDump](MemoryDump.html)  {#Debug}

~~~
ConEmuC /DEBUGPID=<Debugging PID> [/DUMP | /MINI | /FULL]
    start debugger or create memory dump
ConEmuC /DEBUGEXE <command line>
    start <command line> under debugger
ConEmuC /DEBUGTREE <command line>
    start <command line> under debugger, debug all children
~~~



### [Export environment variables](ConEmuEnvironment.html#Export_variables) to the parent processes  {#Export}

~~~
ConEmuC /EXPORT[=CON|ALL] [Var1 [Var2 [...]]]
~~~



### Download from http/https/ftp  {#Download}

~~~
ConEmuC -download [-login <name> -password <pwd>]
    [-proxy <address:port> [-proxylogin <name> -proxypassword <pwd>]]
    [-async Y|N] [-otimeout <ms>] [-timeout <ms>] [-agent <name>]
    [-debug] "full_url_to_file" "local_path_name"
~~~



### Execute commands and create tabs (use with caution!)  {#Commands}

~~~
ConEmuC [switches] /ROOT <program with arguments, far.exe for example>
ConEmuC [switches] [/U | /A] [/Async | /Fork] /C <command line>
  Switches
    /[NO]CONFIRM - [don't] confirm closing console on program termination
    /B{W|H|Z}    - define window width, height and buffer height
    /F{N|W|H}    - define console font name, width, height
    /LOG[N]      - create (debug) log file, N is number from 0 to 3
~~~



### Show errorlevel of `<command>`  {#ShowErrorlevel}

~~~
ConEmuC /Result /C <command>
~~~



### Return errorlevel = `<number>`  {#ReturnErrorlevel}

~~~
ConEmuC /ErrorLevel <number>
~~~



## -new_console and -cur_console switches  {#new_console_and_cur_console}

When you run application from ConEmu console, you may use **[-new_console](NewConsole.html)** or **[-cur_console](NewConsole.html)** switches.


Btw, this is one of the ways to start **GUI** application in ConEmu tab.

### Warnings  {#new_console-warnings}

* These are NOT a switches of ConEmuC, specify them as application (far, vim, putty, etc.) switches.
* Option 'Inject ConEmuHk' must be enabled in ConEmu settings!


### Examples  {#new_console-examples}

~~~
dir "-new_console:bh9999c" c:\ /s
vim.exe -new_console:nh0 c:\sources\1.cpp
hiew.exe -cur_console:h0 c:\tools\far.exe
~~~
