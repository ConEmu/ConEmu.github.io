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

* [Automatic update (internal)](#automatic)
  * [Internet access issues](#auto-troubleshoot)
    * [Change version.ini location](#auto-location)
    * [Change internal downloader switches](#auto-commandline)
    * [Use any third-party downloader tool](#auto-curl-wget)
* [Chocolatey](#chocolatey)
* [Manual update](#manual)
* [PortableApps.com](#portableapps)
* [MSYS2](#msys2)



## Automatic update (internal)   {#automatic}

ConEmu is able to update itself if it was installed by
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
or
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package).

All what you need is to enable
[Automatic updates](SettingsUpdate.html)
or just call ‘Help > Check for updates’ from
[SystemMenu](SystemMenu.html).


### Internet access issues   {#auto-troubleshoot}

ConEmu's internal update is using [ConEmuC](ConEmuC.html#Download)
for accessing external sites. When automatic update check is issued,
ConEmu tries to download `version.ini` with information about current
versions available, and than, after confirmation, it downloads appropriate
[Installer](http://conemu.github.io/en/VersionComparison.html#installer)
or
[7-Zip package](http://conemu.github.io/en/VersionComparison.html#zip-package).

At the moment there are several maintained locations where `version.ini` is located:

* [http://conemu.github.io/version.ini](http://conemu.github.io/version.ini) (default)
* [https://conemu.github.io/version.ini](https://conemu.github.io/version.ini) (same as above but using **https**)
* [http://conemu.ru/version.ini](http://conemu.ru/version.ini)

If your antivirus, proxy, firewall, router or provider
blocks `ConEmuC.exe` from accessing these locations,
ConEmu will not be able to update automatically.

If these locations are inaccessible from any browser on users PC,
there are no options. User have to contact their network
administrators for assistance.

But if `version.ini` is available, look for the options below.

* [Change version.ini location](#auto-location)
* [Change internal downloader switches](#auto-commandline)
* [Use any third-party downloader tool](#auto-curl-wget)


#### Change version.ini location   {#auto-location}

If your provider/proxy/router blocks, for example, an access to
[http://conemu.github.io/version.ini](http://conemu.github.io/version.ini),
but **https** [location](https://conemu.github.io/version.ini), or
[http://conemu.ru/version.ini](http://conemu.ru/version.ini) are available,
you may switch to working location by changing value `Update.VerLocation`
via [xml or registry](ConEmuXml.html). Look at the snippet below.

~~~
...
<value name="Update.VerLocation" type="string" data="http://conemu.ru/version.ini"/>
...
~~~


#### Change internal downloader switches   {#auto-commandline}

To check internet issues from command line, run the following command.

~~~
ConEmuC.exe -download http://conemu.github.io/version.ini -
~~~

Actually, `-download` command has a lot of options like proxy settings,
timeouts, agent name and others.
They are described in `ConEmuC -?` printout, [About dialog](AboutDialog.html)
and [online](ConEmuC.html#Download).
You may play with them and if some option helps, change them in the
[Settings dialog](SettingsUpdate.html) or [let us know](Issues.html).


#### Use any third-party downloader tool   {#auto-curl-wget}

Most known utilities available are ‘Curl’ and ‘Wget’.
Just install them and switch to `External downloader`
on the [Update settings page](SettingsUpdate.html).
Sample commands lines are below, choose appropriate
and tune their options if required.

~~~
wget.exe %1 -O %2
curl.exe -L %1 -o %2
~~~



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
