---
redirect_from: /ru/DosBox.html

title: "ConEmu | DosBox integration"

breadcrumbs:
 - url: TableOfContents.html#launch-apps
   title: Launch Apps
---

# DosBox and ConEmu

How to run old DOS applications (games) in 64-bit OS (Windows 7 x64 for example)?

It's easy now: install [DosBox](http://www.dosbox.com), ConEmu (feature appeared first in build 110306)
and now, you can start DOS applications from yours favorite console file manager:
[Far](http://www.farmanager.com/index.php?l=en), [DN2](http://www.dnosp.com/), `cmd`,
or directly from ConEmu.

DosBox works in 32 or 64bit OS (Win2k, WinXP, and so on).

{% include in_article.html %}

DosBox direct link download:
[DOSBox0.74-win32-installer.exe](http://sourceforge.net/projects/dosbox/files/dosbox/0.74/DOSBox0.74-win32-installer.exe/download)

In the current version of ConEmu there is no DosBox configuration interface, so:

* Install here: `%ConEmuBaseDir%\DosBox` (i.e. `C:\Program Files\ConEmu\ConEmu\DosBox`)
* Create (or rename) configuration file here: `%ConEmuBaseDir%\DosBox\DosBox.conf`
* Append "mount" commands to the end of `DosBox.conf`,
  cause of application paths in the DosBox and yours host OS must match
  * If short names are disabled on yours NTFS drive DOS application may not start
  * You must not disable 'Use ConEmuHk injects' in ConEmu settings, when You want
    to run DOS applications from batch files.
* **Restart** ConEmu, so checkbox 'DosBox (DOS apps)' must become
  checked ([Features page](Settings.html#Features)).
* **Note**: Drive Z: is reserved in DosBox for emulation purposes.

![ConEmu and old (DOS) games](/img/ConEmuDosBox.png)
