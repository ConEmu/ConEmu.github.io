---
redirect_from: /ru/ConEmuXml.html

title: "ConEmu | ConEmuXml"

description: "Where ConEmu settings are stored
  and how to send your config to developer if report problems."
---

# ConEmu settings storage

ConEmu settings [may be stored](Settings.html#Where_settings_are_stored)
in the ‘Windows Registry’ and in the xml files (`ConEmu.xml` usually).

By default, ConEmu uses `%USERPROFILE%\ConEmu.xml` on Windows XP or higher.
Windows 2000 is limited to using Registry.


<h2 id="send-to-developer"> How to send your config to developer </h2>

When one reports about problem, developer needs your ConEmu settings often.

The easiest (and may be most proper) way to provide it is ‘Export...’ button in the
[ConEmu Settings dialog](Settings.html#Settings_dialog).

Save your config in the new xml
(**don't overwrite your existing config**)
file and attach it to the created issue.


<h2 id="PortableApps-format"> Note for PortableApps.com format </h2>

When you are running ConEmu installed with ‘paf’ bundle, your settings will be stored
in `<app>/Data/settings/ConEmu.xml`.
