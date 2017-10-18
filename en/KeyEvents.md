---
redirect_from: /ru/KeyEvents.html

title: ConEmu | KeyEvents Tool

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras
---

# Console events tools

These tools show raw keyboard and mouse console events.
They read events from console input and prints in user-friendly manner.
It's useful for troubleshooting console keyboard and mouse input.
Choose the tool from the list below based on the type of console application
you want to troubleshoot.

* If console application utilizes [WinAPI](WinApi.html) (cmd, powershell, far, ...)
  * [KeyEvents](#key-events)
* POSIX compatible (cygwin, msys, WSL, ...)
  * [key-reader and key-curses](#key-reader)
  * [‘showkeys -a’ Unix command](#show-keys)



## KeyEvents  {#key-events}

KeyEvents utilizes [ReadConsoleInput](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684961%28v=vs.85%29.aspx)
function from [WinAPI](WinApi.html) to read console events and prints them to the console.
KeyEvents shows you keypresses and mouse events obtained by `cmd`, `powershell`, `far`
and other native [console applications](ConsoleApplication.html).

* KeyEvents is available as optional feature in the [ConEmu Installer](VersionComparison.html#installer);
* Or it may be freely downloaded from [Sourceforge.net](https://sourceforge.net/projects/conemu/files/Tools/).

[Sample KeyEvents output](#key-events-out).


## key-reader and key-curses  {#key-reader}

Both tools are distributes as [sources on GitHub](https://github.com/Maximus5/key-reader)
and may be compiled with [cygwin, msys-2](CygwinMsys.html) or [WSL](BashOnWindows.html).

key-reader shows just [raw character codes](#key-reader-out).

key-cureses tries to output [mnemonic key names and mouse events](#key-curses-out).


## ‘showkeys -a’ Unix command  {#show-keys}

This simple tool is available from the box on many Unix distro
and is available in [WSL](BashOnWindows.html) too.
Just execute `showkeys -a` from your prompt.

[Sample showkeys output](#show-keys-out).
  

## Sample output of the tools

### ‘key-reader’ output (Unix)  {#key-reader-out}

Press `Ctrl+C` to exit.

~~~
~$ ./key-reader
Starting raw conin reader, press Ctrl+C to stop
<ENTER>
<x71:q><x7F><x1F><x1B><x4F:O><x41:A><x1B><x4F:O><x42:B><x1B><x4F:O><x50:P>
~~~


### ‘key-curses’ output (Unix)  {#key-curses-out}

Press `Esc` twice to exit.

~~~
~$ ./key-curses
<x0a: > ^J
<x71:q> q
<x107: > KEY_BACKSPACE
<x1f: > ^_
<x103: > KEY_UP
<x102: > KEY_DOWN
<x109: > KEY_F(1)
<x199: > KEY_MOUSE
  bstate=x04 x=73 y=15
<x199: > KEY_MOUSE
  bstate=x4000 x=73 y=15
~~~


### ‘showkeys -a’ output (Unix)  {#show-keys-out}

Press `Ctrl+D` to exit.

~~~
~$ showkey -a

Press any keys - Ctrl-D will terminate this program

^M       13 0015 0x0d
q       113 0161 0x71
       127 0177 0x7f
^_       31 0037 0x1f
^[       27 0033 0x1b
O        79 0117 0x4f
A        65 0101 0x41
^[       27 0033 0x1b
O        79 0117 0x4f
B        66 0102 0x42
^[       27 0033 0x1b
O        79 0117 0x4f
P        80 0120 0x50
~~~

### KeyEvents output (Windows API)  {#key-events-out}

Press `Esc` twice to exit.

~~~
KeyEvents from Maximus5, ver 4.3. Far SysLog mode
Current console mode = 0x000000B7

Press 'Esc' twice to exit program
Press 'Enter' to insert empty line

14:45:44 KEY_EVENT_RECORD: Dn, 1, Vk="VK_RETURN" [13/0x000D], Scan=0x001C uChar=[U=' ' (0x000D): A=' ' (0x0D)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:44 KEY_EVENT_RECORD: Up, 1, Vk="VK_RETURN" [13/0x000D], Scan=0x001C uChar=[U=' ' (0x000D): A=' ' (0x0D)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)

14:45:48 KEY_EVENT_RECORD: Dn, 1, Vk="VK_Q" [81/0x0051], Scan=0x0010 uChar=[U='q' (0x0071): A='q' (0x71)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:48 KEY_EVENT_RECORD: Up, 1, Vk="VK_Q" [81/0x0051], Scan=0x0010 uChar=[U='q' (0x0071): A='q' (0x71)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:49 KEY_EVENT_RECORD: Dn, 1, Vk="VK_BACK" [8/0x0008], Scan=0x000E uChar=[U=' (0x0008): A=' (0x08)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:50 KEY_EVENT_RECORD: Up, 1, Vk="VK_BACK" [8/0x0008], Scan=0x000E uChar=[U=' (0x0008): A=' (0x08)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:51 KEY_EVENT_RECORD: Dn, 1, Vk="VK_CONTROL" [17/0x0011], Scan=0x001D uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000028 (Casac - ecNs) (Windowed)
14:45:51 KEY_EVENT_RECORD: Dn, 1, Vk="VK_BACK" [8/0x0008], Scan=0x000E uChar=[U='⌂' (0x007F): A='⌂' (0x7F)]
         Ctrl=0x00000028 (Casac - ecNs) (Windowed)
14:45:51 KEY_EVENT_RECORD: Up, 1, Vk="VK_BACK" [8/0x0008], Scan=0x000E uChar=[U='⌂' (0x007F): A='⌂' (0x7F)]
         Ctrl=0x00000028 (Casac - ecNs) (Windowed)
14:45:51 KEY_EVENT_RECORD: Up, 1, Vk="VK_CONTROL" [17/0x0011], Scan=0x001D uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:55 KEY_EVENT_RECORD: Dn, 1, Vk="VK_UP" [38/0x0026], Scan=0x0048 uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000120 (casac - EcNs) (Windowed)
14:45:55 KEY_EVENT_RECORD: Up, 1, Vk="VK_UP" [38/0x0026], Scan=0x0048 uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000120 (casac - EcNs) (Windowed)
14:45:56 KEY_EVENT_RECORD: Dn, 1, Vk="VK_DOWN" [40/0x0028], Scan=0x0050 uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000120 (casac - EcNs) (Windowed)
14:45:56 KEY_EVENT_RECORD: Up, 1, Vk="VK_DOWN" [40/0x0028], Scan=0x0050 uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000120 (casac - EcNs) (Windowed)
14:45:59 KEY_EVENT_RECORD: Dn, 1, Vk="VK_F1" [112/0x0070], Scan=0x003B uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:45:59 KEY_EVENT_RECORD: Up, 1, Vk="VK_F1" [112/0x0070], Scan=0x003B uChar=[U=' ' (0x0000): A=' ' (0x00)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
14:46:01 MOUSE_EVENT_RECORD: [153,32733], Btn=0x00000001 (Lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000000 () (Windowed)
14:46:01 MOUSE_EVENT_RECORD: [153,32733], Btn=0x00000000 (lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000000 () (Windowed)
14:46:01 MOUSE_EVENT_RECORD: [153,32733], Btn=0x00000000 (lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000001 ((Moved)) (Windowed)
Skipping MOUSE_MOVED (19)
~~~
