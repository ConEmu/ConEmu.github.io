---
redirect_from:
 - /ru/UpdateModes.html

title: ConEmu | Automatic update modes

description: ConEmu may be updated automatically in several ways

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation

readalso:
 - url: SettingsUpdate.html
   title: "Settings › Update page"
 - url: VersionComparison.html
   title: "Comparison: distros, bitness, stages"
 - url: Installation.html
   title: "Installation"
 - url: AutoInstall.html
   title: "Automate your box installation"
 - url: UpdateSpeedup.html
   title: "Speedup update with installer"
---

# Automatic update modes

You may choose any suitable way to update you ConEmu installation

## Automatic update (internal)

ConEmu is able to update itself if it was installed by
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
or
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package).

All what you need is to enable
[Automatic updates](SettingsUpdate.html)
or just call ‘Help > Check for updates’ from
[SystemMenu](SystemMenu.html).


## Chocolatey

Actually, the command `choco upgrade conemu` will download the
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
and do the update by `msiexec`.


## Manual update

If ConEmu failed to download update package, you may download the package yourself
from the [primary download site](Downloads.html).

Than you may trigger update procedure by Dropping downloaded package:

* either on the ConEmu shortcut on the desktop;
* or on the ConEmu's window title bar or [tab bar](TabBar.html).


## PortableApps.com

You may use automatic update by
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package)
or PortableApps' standard method by selecting downloaded `ConEmu_*_English.paf.exe`.


## MSYS2

**Note** Version of the available package may be obsolete because it's not maintained by ConEmu's authors.
Anyway, the command to update MSYS2 package is below.

~~~
pacman --needed -S conemu
~~~
