---
redirect_from: /ru/VersionComparison.md
redirect_from: /ru/x64_or_x86.html
redirect_from: /en/x64_or_x86.html
redirect_from: /ru/StableVsPreview.html
redirect_from: /en/StableVsPreview.html

title: ConEmu | Version Comparison

description: "The difference between ConEmu versions.
   Which version to download. Which version to run."

h1_title: Which version to choose

h1_content: "What is the difference between ConEmu versions? <br/>
   Which version to download: ‘Alpha’, ‘Preview’ or ‘Stable’? <br/>
   Which version to run: ‘x86 (32bit)’ or ‘x64 (64bit)’?"

bc1_url: TableOfContents.html#conemu
bc1_title: ConEmu
---

## Contents
  - [Distros comparison](#distros-comparison)
    - [Installer](#installer)
    - [7-Zip package](#zip-package)
    - [PortableApps.com](#portableapps-com)
  - [x64 or x86](#x64-or-x86)
  - [Release stages](#release-stages)
    - [Stable](#stable)
    - [Preview (recommended)](#preview)
    - [Alpha](#alpha)


## Distros comparison
In general, there is no significant differences between distros.
Each may be used as portable.
Each may be used on any Windows versions (x32 or x64).
Windows 2000 and above required.

There are very small set of differences between them. Read below.

### Installer
In fact, `ConEmuSetup.*.exe` is a pack of both both x86 and x64
[msi](http://en.wikipedia.org/wiki/Windows_Installer) packets.
So user does not need to download two `msi` packets for different OS,
but just get and run single `ConEmuSetup.*.exe`.

Installer contains both x86 (aka x32) and x64 versions of all ConEmu binaries.

Installer also contains [KeyEvents](KeyEvents.html) tool which can be downloaded
separately from [Sourceforge.net](https://sourceforge.net/projects/conemu/files/Tools/).

ConEmu installer processes several internal switches and
passes all others to `msiexec.exe` without changes.
Run `ConEmuSetup.150331.exe /?` to view list of internal switches.

```
Usage:
   ConEmuSetup [/p:x86[,adm] | /p:x64[,adm]] [<msi args>]
   ConEmuSetup [/e[:<extract path>]] [/p:x86 | /p:x64]
Example (run x64 auto update as administrator):
   ConEmuSetup /p:x64,adm /qr
```

### 7-Zip package
[7-Zip](http://www.7-zip.org/) archive named `ConEmuPack.*.7z`
contains both x86 (aka x32) and x64 versions of all ConEmu binaries.

Differences from an [Installer](#Installer):
  - You need [7-Zip](http://www.7-zip.org/) or [WinRar](http://www.rarlab.com/download.htm) to unpack it;
  - You have to create a shortcut or add ConEmu folder to the `%PATH%` manually.

But who cares? Most of power users have either 7-Zip or WinRar installed,
and it's very easy to pin `ConEmu.exe` to the Windows TaskBar from the
folder you've extracted ConEmu files.

7-Zip packages does not contain [KeyEvents](KeyEvents.html) tool.


### PortableApps.com
[PortableApps.com](http://portableapps.com/about) is an open source and free platform
allowing you to get all your favourite software and documents on any PC via USB flash
drive, cloud drive or local installation. Doesn't matter, you will always get your
software ‘portable’. And PortableApps.com has its own neat ‘start menu’.

Files named `ConEmu_*_English.paf.exe` are installers created up to the latest
PortableApps.com specifications. They do not create shortcuts on Desktop or in
the Windows start menu. Shortcut will be create in the PortableApps.com launcher only.

To install ConEmu into the PortableApps.com platform:

  - Download `ConEmu_*_English.paf.exe`
  - Start PortableApps.com launcher
  - Choose `Apps > Install a New App`
  - Choose `ConEmu_*_English.paf.exe` and wait while ConEmu appears in the laucher menu


## x64 or x86
ConEmu is distributed as msi package `ConEmuSetup.*.exe`,
or [7-Zip](http://www.7-zip.org/) archive named `ConEmuPack.*.7z`.
Both of them contain x86 (aka x32) and x64 versions of all ConEmu binaries.

Well, there is also PortableApps.com packages named `ConEmu_*_English.paf.exe`.

Also, all distros contain both x86 and x64 versions of ConEmu `Plugins` for Far Manager
(`Plugins\ConEmu\ConEmu.dll` and `Plugins\ConEmu\ConEmu.x64.dll` for example).

So, You can simply unpack downloaded archive or install ConEmu to the
[Far Manager](http://www.farmanager.com/download.php?l=en) folder
or any other folder, if you are not using Far Manager..

Download page: [http://www.fosshub.com/ConEmu.html]

**PS**. In fact, it does not matter which version of GUI you use (ConEmu.exe or ConEmu64.exe).
ConEmu automatically selects the required files (ConEmuHk.dll or ConEmuHk64.dll and so on)
to work with choosen console or GUI application.



## Release stages
ConEmu released with 3-stage manner.
Thought, it must be obvious, that if one don't want new features **and bugfixes** - he may stuck on stable.
But it is strange (for me) enough when user reports a bug which was fixed months ago...

### Stable
This is «Stable» version of ConEmu.

Please, don't think that «Stable» is «totally bug-free»,
in the ConEmu project some builds are marked as «Stable»
when they are ready (in my opinion) for public.

But! Bugfixes, patches, features will not be applied to
«Stable» builds until next «Stable» comes!

On the other hand, that means that «Stable» builds will
not contains breaking changes, side by side with bugfixes
and new features.


### Preview
**Recommended** for most users.

This is «Preview» (also known as «Release Preview») version of ConEmu.
Most of latests bugfixes and features, but these builds comes with delay
in comparison with «Developer» build. Trying to avoid creating new bugs :)


### Alpha
This is «Developer» (also known as «Alpha») version of ConEmu.
Latests bugfixes and features, but some builds may be unstable
due to changes in the code.

However, most of Alpha builds are suitable for most users.
