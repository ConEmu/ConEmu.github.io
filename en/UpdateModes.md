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
 - url: InternetIssues
   title: "Troubleshoot internet issues"
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

* [Automatic update (internal)](#automatic)
  * [Internet access issues](#auto-troubleshoot)
    * [Update Internet Explorer](#auto-ie)
    * [Change version.ini location](#auto-location)
    * [Change internal downloader switches](#auto-commandline)
    * [Use any third-party downloader tool](#auto-curl-wget)
* [Chocolatey](#chocolatey)
* [Manual update](#manual)
* [PortableApps.com](#portableapps)
* [MSYS2](#msys2)

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}


## Automatic update (internal)   {#automatic}

ConEmu is able to update itself if it was installed by
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
or
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package).

All what you need is to enable
[Automatic updates](SettingsUpdate.html)
or just call ‘Help > Check for updates’ from
[SystemMenu](SystemMenu.html).

ConEmu's internal update is using [ConEmuC](ConEmuC.html#Download)
for accessing external sites. When automatic update check is issued,
ConEmu tries to download `version.ini` with information about current
versions available, and than, after confirmation, it downloads appropriate
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
or
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package).

If download procedure fails for some reason please read
[Troubleshoot internet issues](InternetIssues.html) article.




## Chocolatey   {#chocolatey}

[Chocolatey](https://chocolatey.org/) is a Machine Package Manager,
somewhat like apt-get, but built with Windows in mind.

With help of Chocolatey you may execute the command,
which will download the
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
and do the update by `msiexec`.

~~~
choco upgrade conemu
~~~



## Manual update   {#manual}

If ConEmu failed to download update package, you may download the package yourself
from the [primary download site](Downloads.html).

Than you may trigger update procedure by Dropping downloaded package:

* either on the ConEmu shortcut on the desktop;
* or on the ConEmu's window title bar or [tab bar](TabBar.html).



## PortableApps.com   {#portableapps}

You may use automatic update by
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package)
or PortableApps' standard method by selecting downloaded `ConEmu_*_English.paf.exe`.



## MSYS2   {#msys2}

**Note** Version of the available package may be obsolete because it's not maintained by ConEmu's authors.
Anyway, the command to update MSYS2 package is below.

~~~
pacman --needed -S conemu
~~~
