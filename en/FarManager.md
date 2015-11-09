---
redirect_from: /ru/FarManager.html

title: "Far Manager Introduction"
---

# Far Manager

*Page still under development. If you can help with writing, have questions or suggestions - follow the link at the page bottom.*

Far is my favorite shell. It is not only file/archive management,
it is powerful editor, huge number of plugins, powerful macro engine.

* [First of all](#First-of-all)
  * [There are two platforms (?)](#Two-platforms)
  * [There are three (already) branches of Far Manager](#Three-branches)
  * [There are several types of plugins](#There-are-several-types-of-plugins)
* [1. Downloads / Installation](#p1-Downloads-Installation)
* [2. Install plugins to your's mind](#p2-Install-plugins)
  * [Examples](#Examples)
  * [Main plugins sources](#Main-plugins-sources)
  * [Developer sites](#Developer-sites)
* [3. Help, FAQ, Documentation](#p3-Help-FAQ-Documentation)
* [4. Control](#p4-Control)
* [5. Automation](#p5-Automation)



## First of all  {#First-of-all}

### There are two platforms (?)   {#Two-platforms}

* x86 (32-bit binaries) it works everywhere, beginning from Windows 2000 SP4 with one hotfix.
* x64 (64-bit binaries) it requires 64-bit OS.

And yes, plugins compiled for x86 does not works in x64 Far Manager and vice versa. You owe to use appropriate plugin versions.

Most developers creates binaries with obvious names.

This is the general mistake of new users. They install x64 Far Manager and try to use x86 versions of plugins.
So, they asks ‘Why plugin does not appears in the list?’

IMHO, there is no considerable difference between them, but not every plugin has x64 version.

I'm using Far 3.0 x86 version (my primary OS is Win 7 x64).



### There are three (already) branches of Far Manager   {#Three-branches}

* 1.x (closed) oldschool version. It is ANSI (OEM to be more precise),
  so it can't deal with unicode characters out of system OEM codetable.
  However, some users believe ‘the best the enemy of good’ and do not
  switch to newer versions.
  All settings are stored in registry `HKEY_CURRENT_USER\Software\Far`.
* 2.x (closed). General difference - unicode support (file system, editor, viewer).
  There was API break, but 2.x natively supports most of 1.x plugins via internal plugin wrapper.
  All settings are stored in registry `HKEY_CURRENT_USER\Software\Far2`.
* 3.x (curren). General difference - Far Manager settings and native (3.x) plugins settings are stored in SQLiteDB.
  API was completely redesigned (and is not stable for current day). Many bugfixes and improvements.
  Far 3.x can still deal with ANSI plugins (from Far 1.x), but due to API break can't work
  with ‘old’ unicode plugins (from Far 2.x).



### There are several types of plugins   {#There-are-several-types-of-plugins}

* **Panels**. This is most common type. Examples:
  * Miscellaneous archives: Arclite, [Observer](http://forum.farmanager.com/viewtopic.php?f=11&t=4643),
    [MultiArc](http://www.farmanager.com/files/Far175b2634.x86.20110203.7z) (from Far 1.7x) - these are the basic
  * Remote access: Network, Pocket and Phone, [Shell extension](http://forum.farmanager.com/viewtopic.php?p=81676#p81676),
    [SFTP/SCP/FTP/FTPS/WebDAV](http://forum.farmanager.com/viewtopic.php?f=11&t=6316),
    [Registry](http://code.google.com/p/conemu-maximus5/wiki/RegEditor) and so on
* **C0 panel plugins**. These plugins works in panels, but does not emulates virtual file system.
  They provide data for special ‘С0’ column for real file system:
  * ver_c0 - show versions for PE files (exe, dll, sys, ocx, ...)
  * svn_c0 - revision and status, only svn 1.6.x
  * pdf_c0, html_c0 - show title of document
  * mp3_c0 - artist/title for MP3 files (ID1)
  * diz_c0 - descript.ion, files.bbs, etc.
* **Modal**. In most cases these plugins executes some specific action. Examples:
  * Uninstall - display list of installed applications and allows Modify/Repair/Uninstall.
    This is the same as Windows ‘Uninstall or change a program’ but much faster and support fast filtering.
  * HexEditors - as is :)
  * Bulk file renamers
  * Picture viewers, Audio/Video players, yes, it is possible in console :)
  * Unicode CharMap
* **Editor related**
  * Searching, sorting, filtering, line wrapping, syntax hilighting...
* **Non categorized**. These plugins can't be placed in specific category, for example
  * Regular Expression Search - it work in Editor and panels



## 1. Downloads / Installation  {#p1-Downloads-Installation}

* Download Full version from [official site](http://www.farmanager.com/download.php?l=en).
  Does not matter whatever you use - msi installer or 7z package.
* (Optionally) update binary files with my [Far3bis](http://sourceforge.net/projects/conemu/files/FarManager/Far3bis).
  List of improvements [here](http://github.com/Maximus5/Far3bis/wiki/ListOfPatches).
  In breaf - improvements of plugin manager (AltShiftF9), optimization of C0 column.

After installing (unpacking) Far Manager you have such directory structure (by example of Far 3.x).

| Names | Purpose |
|:---|:---|
| .\Far.exe<br/>.\FarEng.hlf<br/>.\FarEng.lng | General Far Manager files - executable, help, language data |
| .\Addons | Sample color schemes, tweaks, macros |
| .\Documentation\eng | Some useful information, on english :) |
| .\Plugins | Here, in subfolders, plugins are located |



## 2. Install plugins to your's mind  {#p2-Install-plugins}

There thousands of plugins written for many years. There many sources, where you can download them.

Installing choosen plugin (in most cases) means create subfolder in ‘Plugins’ and unpack plugin distribution to this folder.

To make Far Manager load new plugins you may:

* Simply restart Far Manager
* or, for [bis](https://sourceforge.net/projects/conemu/files/FarManager/) versions,
  press `Alt+Shift+F9` in panels to open ‘Plugins configuration’ menu, and press `Ctrl+R`
* or, navigate to plugin folder, type in command prompt `load:plugin_file_name.dll` and press `Enter`.



### Examples   {#Examples}

* (Note, this plugin already included in the latest Far distro).
  You have downloaded [FarColorer_far3_1.0.3.10.7z](https://sourceforge.net/projects/colorer/files/FAR%20Colorer/)
  (syntax hilighting in editor). This archive already contans root folder ‘FarColorer’.
  So, just unpack 7z package to ‘Plugins’ and restart far. Note, this 7z package contains
  both x86 and x64 versions of FarColorer.
* You have downloaded [RegEdit3.1.1.36.2580.7z](http://code.google.com/p/conemu-maximus5/wiki/RegEditor).
  This package does not have root folder, so create and unpack package files to `Plugins\RegEdit`.
  Note, this 7z package contains both x86 and x64 versions of plugin.



### Main plugins sources   {#Main-plugins-sources}

* [PlugRing](http://plugring.farmanager.com/index.php?l=en)
* [Plugin announces (russian)](http://forum.farmanager.com/viewforum.php?f=11)
* [Plugin dashboard 1](http://forum.farmanager.com/viewtopic.php?f=5&t=4590),
  [dashboard 2](http://forum.farmanager.com/viewtopic.php?f=5&t=3478).



### Developer sites   {#Developer-sites}

* [Regeditor, Picture View, ImpEx (PE browser), Far3wrap and others](https://github.com/Maximus5/FarPlugins)
  and [old mirror](http://code.google.com/p/conemu-maximus5/wiki/FarPlugins).
* [MacroLib, Unicode CharMap, Visual Compare, and others](http://code.google.com/p/far-plugins/)
* [Macros repository](http://code.google.com/p/far-macro-library/wiki/Common.html)
* [Observer multi-format (msi/pst/iso/mime/pdb) browser](http://sourceforge.net/projects/far-observer/)
* [farplug-alvls](http://code.google.com/p/farplug-alvls/)
* [Hexitor (Hex editor), Media Info, Image Info, SQLiteDB, Disk menu and others](http://code.google.com/p/farplugs/)
* (Note, this plugin already included in the latest Far distro). [Colorer (syntax hilighting in Editor, even in truecolor)](http://colorer.sourceforge.net/farplugin.html)
* [Many plugin sources](https://code.google.com/p/evil-programmers/)



## 3. Help, FAQ, Documentation  {#p3-Help-FAQ-Documentation}

Unfortunately for non-Russian speaking users, most of resources are on russian.
However, you may use google translate, or ask competent users, for example,
on [official forum](http://forum.farmanager.com/index.php).
Or, may be, on [SuperUser](http://superuser.com/questions/tagged/far-manager).

* [Far 3.0 FAQ (russian)](http://forum.farmanager.com/viewtopic.php?t=5207)
* [Links for plugin developers](http://www.farmanager.com/opensource.php?l=en)



## 4. Control  {#p4-Control}

Far have oldschool and intuitive NC-like interface :)

Look on keybar press modifiers (Alt/Ctrl/Shift) and you'll see function keys actions.
Most useful are (in panels).

| Key | Description |
|:---|:---|
| F1 | Yes! Read it first. BTW, FarEng.hlf is a simple text file, you can open it in any editor. |
| ShiftF1 | Create new archive from selected files |
| ShiftF2 | Extract files from selected archive |
| CtrlPgDn | In most cases it is like as Enter, but generally, CtrlPgDn forces enter into archive, but it 'execution'. Compare behavior for `*.exe` files |
| F2 | Configurable multilevel user menu |
| F3, F4 | File viwer and editor |
| F5, F6 | Rename or move. Use ShiftF5 or ShiftF6 to copy/rename single file/folder under cursor |
| AltF6 | Create hard or symbolic link. Also, F7 can create links to any folder |
| F7 | Create folder |
| F8 | Delete file/folder (to recycle, by default) |
| ShiftDel | Delete file/folder pass by recycle |
| AltDel | Wipe files/folder |
| AltF8 | Show history of executed commands |
| F9 | Pull down menu |
| F10 | Quit |
| F11 | Open list of plugins, available for current context |
| AltF11 | File viewer/editor history |
| F12 | Show screens (Panel/Editors/Viewers) |
| CtrlG | Group operations on files\folders |
| Ins, Gray+, Gray-, Gray** | Selecting/deselecting files | **

This is **very** breaf list of key kombos, read F1 for more information.



## 5. Automation  {#p5-Automation}

One of most powerful options of Far Manager are Macros. There are two styles of Macro.

* Sequence of recorded keypresses. This is very useful, when you need to repeat multiple times one routine operation,
  or for simplifying access to most useful operations.
  * For example, how to create oldschool keymapping - `Esc` turns panels on/off.
    * Press `Ctrl+.` (`Ctrl` and `Dot` on main keyboard) to start recording (red `R` lights in upper-left corner)
    * Press keys, the sequence: `Ctrl+O`
    * Press `Ctrl+`. again, recording stopped, Far shows small dialog ‘Press the desired key’.
      * Some ‘keys’ may be selected only from drop-down list. Choose `Esc` from there and press `Enter`.
      * If you press `Ctrl+Shift+.` instead of `Ctrl+.`, you may change recorded sequence after choosing desired key.
    * Press `Enter` to confirm key selection.
  * If you want to use recored macro in future sessions, you owe to save it
    * Press `Shift+F9` in panels and confirm saving
    * or, type in command line `macro:save` and press `Enter`.
  * If you do not need recorded macro anymore
    * Press (twice) `Ctrl+.` `Ctrl+.`
    * Choose macro key
    * Press `Enter`, confirm deletion
* Scripts, written on [Macro language](http://translate.google.ru/translate?hl=ru&sl=ru&tl=en&u=http%3A%2F%2Fapi.farmanager.com%2Fru2%2Fmacro%2Fmacrocmd%2Findex.html).
  There are several ways to create such macros
  * Press `Ctrl+.` any keys (`Space` for example), `Ctrl+Shift+.` choose the key, and press `Enter`.
    Far opens dialog with recorded key sequence. You can modify it there.
  * Use [MacroLib](http://translate.google.ru/translate?hl=ru&sl=ru&tl=en&u=http%3A%2F%2Fcode.google.com%2Fp%2Ffar-plugins%2Fwiki%2FMacroLib).
    This plugin (my choice for Far 2.x) simplify creation, editing, maintaning and calling Far Macros.
    Read plugin documentation for description of fml (text) file format.
  * Use `*.farconfig` files. Generally, these files may contain any Far Manager settings, not Macros only.
    Import them with command `far.exe /import <farconfig-file>`.
