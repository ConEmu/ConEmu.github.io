---
title: "ConEmu | xml or registry settings storage"

description: "Where ConEmu settings are stored
  and how to send your config to developer if report problems."

otherlang:
   eng: /en/ConEmuXml.html
   rus: /ru/ConEmuXml.html
---

# ConEmu settings storage

ConEmu settings [may be stored](Settings.html#Where_settings_are_stored)
in the ‘Windows Registry’ and in the xml files (`ConEmu.xml` usually).

By default, ConEmu uses `ConEmu.xml` on Windows XP or higher.
Windows 2000 is limited to using Registry.

* [ConEmu.xml search sequence](#search-sequence)
  * [Note for PortableApps.com format](#PortableApps-format)
* [How to send your config to developer](#send-to-developer)



<h2 id="search-sequence"> ConEmu.xml search sequence </h2>

You may use ConEmu in ‘portable’ mode,
so all settings will be stored in the `ConEmu.xml` file
or its dotted variant `.ConEmu.xml`.
File without leading dot has priority.

ConEmu search sequence of this file:

|:---|:---|
| `%ConEmuDir%\` | Folder with `ConEmu.exe` and `ConEmu64.exe` |
| `%ConEmuBaseDir%\` | Folder with `ConEmuC.exe` and `ConEmuC64.exe` |
| `%APPDATA%\` | I don't think this is really ‘portable’, but many users was asked about `%APPDATA%` |
| Windows registry | If the xml file does not exist in any of the specified folders ConEmu will use Windows registry |

On [first time ConEmu run](SettingsFast.html),
you may choose ‘portable’ mode and location of xml file.

Or you may create manually a new empty `ConEmu.xml`
or just rename `ConEmu_Sample.xml` to `ConEmu.xml` for engaging xml-mode.
Template file `ConEmu_Sample.xml` is shipped with ConEmu.

You may use [named configuration (/config)](ConEmuArgs.html) switch with xml-mode too.

Also, there are switches [/loadcfgfile and /safecfgfile](ConEmuArgs.html)
to use any special locations (may be not so useful for daily using, but available).


**Note**. You may rename/create `ConEmu.xml` file any time,
even after ConEmu starts and loads its settings from registry.



<h3 id="PortableApps-format"> Note for PortableApps.com format </h3>

When you are running ConEmu installed with ‘paf’ bundle, your settings will be stored
in `<app>/Data/settings/ConEmu.xml`.



<h2 id="send-to-developer"> How to send your config to developer </h2>

When one reports about problem, developer needs your ConEmu settings often.

The easiest (and may be most proper) way to provide it is ‘Export...’ button in the
[ConEmu Settings dialog](Settings.html#Settings_dialog).

Save your config in the new xml
(**don't overwrite your existing config**)
file and attach it to the created issue.
