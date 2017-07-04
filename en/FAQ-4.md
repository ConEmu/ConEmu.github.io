---
title: ConEmu | FAQ - Part 4

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-4.html
   ru: /ru/FAQ-4.html
---

# Updates  {#q-4-update}

{% include faq_disclaimer_en.md %}

* [Q. Can ConEmu update automatically?](#q-4-1)
* [Q. What are the capabilities of the automatic updater?](#q-4-2)




#### Q. Can ConEmu update automatically?   {#q-4-1}


**A.** Yes. ConEmu can check for new versions on launch, every hour, or by user request (System menu -> Help -> Check for updates).




#### Q. What are the capabilities of the automatic updater?   {#q-4-2}

**A.** You can configure updates however you like it.

* Proxy support.
* Selection between «stable» or «alpha» builds.
* In the presence of a new version, ConEmu can ask for confirmation before downloading the package (archive or installer).
* If ConEmu was installed using the installer, and the install path for ConEmu.exe (or ConEmu64.exe) coincides with the current process, updating is done using the installer («`ConEmuSetup.*.exe`»).
* Otherwise, updating is done using the 7-zip archive.
* Updating from the archive requires that file compression software ([7-Zip](http://www.7-zip.org/) or [WinRAR](http://www.rarlab.com/)) is installed.
* By default, packages are downloaded to %TEMP% and deleted after installation is complete.
* However, you can indicate any directory, and choose not to delete installed packages.
* The installation command is ran from a temporary .cmd-file, launched in the directory containing ConEmu.exe. The .cmd-file is created in %TEMP%.
  * The default installer command is: `"%1" /p:%3 /qr`. It launches the corresponding (x86/x64) MSI package with the `/qr` parameter (silent update).
  * The default archiver command is: `<archiver> x -y "%1"`. `<archiver>` is substituted with the full path to any file compression software, capable of unpacking 7-Zip archives: [7zg.exe, 7z.exe](http://www.7-zip.org/), [Unrar.exe, WinRar.exe](http://www.rarlab.com/), etc.
* Launching the update script (.cmd-file) is done after ConEmu closes (all tabs are closed), if the user consents.
* Before launching the update script, ConEmu checks that no other ConEmu windows are open.
* After a successful update, you can run any command or script (via cmd.exe). For example, you can copy the new files to other directories, if you have multiple ConEmu installations on your computer. By default, the file ConEmuUpdate.info is created in the same directory as ConEmu.exe, containing a timestamp of the last update.
* New versions are polled from [this URL](https://conemu.github.io/version.ini). This address can be configured in the registry or XML using the "Update.VerLocation", should the need arise (e.g. centralized updating in a networked environment?).
