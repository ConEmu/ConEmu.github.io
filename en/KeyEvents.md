---
redirect_from: /ru/KeyEvents.html

title: ConEmu | KeyEvents Tool

description: "Keyboard and mouse console events logging utility.
  It reads events from console input and prints in user-friendly manner."

h1_title: KeyEvents Tool

h1_content: "KeyEvents tool is a keyboard and mouse console events logging utility.
  It may be useful for troubleshooting console keyboard and mouse input."

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras
---

This tool utilizes [ReadConsoleInput](https://msdn.microsoft.com/en-us/library/windows/desktop/ms684961%28v=vs.85%29.aspx)
function to read console events and prints them to the console.

Press `Esc` button twice to exit KeyEvents.

## Download
  - KeyEvents is available as optional feature in the [ConEmu Installer](VersionComparison.html#installer);
  - Or it may be freely downloaded from [Sourceforge.net](https://sourceforge.net/projects/conemu/files/Tools/).

## Sample output of the tool

```
KeyEvents from Maximus5, ver 4.2. FAR SysLog mode
Current console mode = 0x000000B7

Press 'Esc' twice to exit program
Press 'Enter' to insert empty line

18:37:53 KEY_EVENT_RECORD: Up, 1, Vk="VK_RETURN" [13/0x000D], Scan=0x001C uChar=[U=' ' (0x000D): A=' ' (0x0D)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)

18:37:56 MOUSE_EVENT_RECORD: [97,9960], Btn=0x00000000 (lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000001 ((Moved)) (Windowed)
Skipping MOUSE_MOVED (18)
18:37:59 MOUSE_EVENT_RECORD: [106,9968], Btn=0x00000001 (Lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000000 () (Windowed)
18:37:59 MOUSE_EVENT_RECORD: [106,9968], Btn=0x00000000 (lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000000 () (Windowed)
18:37:59 MOUSE_EVENT_RECORD: [106,9968], Btn=0x00000000 (lr   )
         Ctrl=0x00000020 (casac - ecNs), Flgs=0x00000001 ((Moved)) (Windowed)
18:38:01 KEY_EVENT_RECORD: Dn, 1, Vk="VK_Q" [81/0x0051], Scan=0x0010 uChar=[U='q' (0x0071): A='q' (0x71)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
18:38:01 KEY_EVENT_RECORD: Up, 1, Vk="VK_Q" [81/0x0051], Scan=0x0010 uChar=[U='q' (0x0071): A='q' (0x71)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
18:38:02 KEY_EVENT_RECORD: Dn, 1, Vk="VK_ESCAPE" [27/0x001B], Scan=0x0001 uChar=[U='←' (0x001B): A='←' (0x1B)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
18:38:02 KEY_EVENT_RECORD: Up, 1, Vk="VK_ESCAPE" [27/0x001B], Scan=0x0001 uChar=[U='←' (0x001B): A='←' (0x1B)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
18:38:02 KEY_EVENT_RECORD: Dn, 1, Vk="VK_ESCAPE" [27/0x001B], Scan=0x0001 uChar=[U='←' (0x001B): A='←' (0x1B)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
18:38:02 KEY_EVENT_RECORD: Up, 1, Vk="VK_ESCAPE" [27/0x001B], Scan=0x0001 uChar=[U='←' (0x001B): A='←' (0x1B)]
         Ctrl=0x00000020 (casac - ecNs) (Windowed)
```
