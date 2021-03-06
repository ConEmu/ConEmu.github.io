---
redirect_from: /ru/Installation.html

title: ConEmu | Installation

description: How to properly install ConEmu

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

readalso:
 - url: VersionComparison.html
   title: "Comparison: distros, bitness, stages"
 - url: ConEmuFolders.html
   title: "Installation Folders Structure"
 - url: AutoInstall.html
   title: "Automate your box installation"
 - url: UpdateModes.html
   title: "Automatic update modes"
 - url: SettingsFast.html
   title: "First start: Fast Configuration Dialog"
 - url: Settings.html
   title: "ConEmu Settings"
 - url: Tasks.html
   title: "Tasks: Set up your favourite shells"
 - url: ConEmuXml.html
   title: "ConEmu settings, portable mode"
---

# ConEmu Installation

In general, ConEmu installation is easy.
Just unpack or install to any folder and run `ConEmu.exe`.

* [General installation routine](#general-install)
* [Far Manager notes](#far-manager)
  * [Far Manager macros for ConEmu](#far-macros)
* [MSI installer](#installer)
  * [Desktop icons](#installer-icons)
* [MacType issues](#mactype)
* [Java issues](#java)


## General installation routine  {#general-install}

* You may use either [`ConEmuSetup.*.exe` installer](VersionComparison.html#installer) or 
  [7-Zip package `ConEmuPack.*.7z`](VersionComparison.html#7-zip-package), both contain identical binaries.
  * Run installer `ConEmuSetup.*.exe` and follow MSI installation wizard steps.
    Read more about [installer](#installer) below.
  * Or just unpack all files from `ConEmuPack.*.7z` to desired directory.
* **Note**. ‘Far Manager plugins’ MSI feature installs plugins required to get most of [Far Manager integration](ConEmuFarPlugin.html)
  provided by ConEmu. These files located in `plugins` subfolder are not required if you don't use Far Manager.
* When installation or unpacking finishes run `ConEmu.exe` or `ConEmu64.exe`. ConEmu shows [simplified configuration dialog](SettingsFast.html)
  on the first start where you may turn on [portable mode](ConEmuXml.html#search-sequence).

{% include in_article.html %}


## Far Manager notes  {#far-manager}

In general, installation for using with Far Manager is the same as in general.
With the only exception:

* You must ensure [ConEmu plugin](ConEmuFarPlugin.html) is loaded by Far Manager.

To simplify that ConEmu creates a Task for each Far Manager version found on your PC.
If Far Manager was installed after ConEmu you may use
[Add/refresh default tasks](Tasks.html#add-default-tasks) feature.

The example command line for Far Manager installed in the `C:\Tools\Far` folder:

```
C:\Tools\Far\far.exe /w /p"%ConEmuDir%\Plugins\ConEmu;%FarHome%\Plugins"
```

If you install ConEmu in the same folder where `far.exe` is located,
`C:\Tools\Far` for example, there will be no problem at all,
[ConEmu plugin](ConEmuFarPlugin.html) will be (most probably)
installed into `C:\Tools\Far\plugins\ConEmu` folder
and will be loaded by `far.exe` automatically.

Otherwise you have to use `/p` switch as shown in the example above.


#### Far Manager macros for ConEmu  {#far-macros}

The subfolder `ConEmu` contains several useful macros for different Far Manager versions.
For example, folder `Far1_reg` contains `*.reg` macros for old-school Far 1.75,
and `Far3_lua` supplies `*.lua` macros for latest Far 3.0 branch.

Just browse them and choose what you want, each macro file has description in the header.

For example, `ConEmu.ShiftEnter.*`
let you run application under cursor or typed command in the new ConEmu tab.
Just press `Alt+Enter` to run tab in foreground and `Shift+Enter` to run in background.

How to use the desired macro.

* `*.lua` macro files. Standard for Far 3.0 branch. Copy the file to the `%FARPROFILE%\macros\scripts`
  and run in Far prompt `Macro:Load`.
* `*.fml` macro files. This requires ‘MacroLib’ plugin, please refer to its documentation.
* `*.reg` macro files. Just double click the file to import its contents to Windows registry.

If your Far version does not know `Macro:Load` command, just restart the Far to reload macros list.



## MSI installer  {#installer}

The installer `ConEmuSetup.*.exe` is a bundle for standard 32-bit and 64-bit MSI installers.
There are not differences between them except of default installation folder on 64-bit OS.

| Bitness | Default folder on 64-bit OS |
|:---|:---|
| 32-bit | `C:\Program Files (x86)\ConEmu` |
| 64-bit | `C:\Program Files\ConEmu` |

But you may choose any desired folder, and `ConEmuSetup.*.exe` shows if the version
is already installed and where. The following screenshot depicts that 64-bit ConEmu
version was installed in the `C:\ConEmu` folder.

![Choose desired version](/img/Installer1.png)

There are no differences between 32-bit and 64-bit packages, both contain
all required files to run on any Windows.

Selected MSI installer is unpacked to `%TEMP%` folder and you'll face usual MSI wizard.
Just follow usual installation steps, selecting options and pressing ‘Next’ button.



#### Desktop icons  {#installer-icons}

By default, the installer creates icons on the ‘Desktop’ and in the ‘Start menu’.
And these icons will be recreated by MSI each time you update ConEmu.
If you dislike the behavior, if you want to rename icons or remove them from ‘Desktop’,
you shall:

* Run the installer `ConEmuSetup.*.exe` changing installed features.

![Change installed features](/img/Installer2.png)

* Uncheck ‘Desktop’ shortcuts creation.

![Disable Desktop icon creation](/img/Installer3.png)

* Go to the end of MSI wizard process.

After that you may create you own personalized shortcuts on the Desktop.



## MacType issues  {#mactype}

If you are using MacType you can get crashes when starting any application
from a shell started in ConEmu tab.

That is because MacType tries to hook `ConEmuC.exe` and `ConEmuC64.exe` processes.
But [ConEmuC](ConEmuC.html) is a [console application](ConsoleApplication.html)
and it does not draw any text on graphical canvas at all.

### The workarounds  {#mactype-workaround}
* Use ‘Load with MacTray’ + ‘Standalong loading mode’
  instead of ‘Registry’ or ‘Service’.
* Or add `ConEmuC.exe` and `ConEmuC64.exe` to MacType exclusion list,
  if exclusion lists works for you.


## Java issues  {#java}

There is an [Issue 1899](https://github.com/Maximus5/conemu-old-issues/issues/1899)
with Java version 7.x if it was installed in symlinked folder.
You can get java exception like:

```
at sun.nio.fs.WindowsNativeDispatcher.GetFinalPathNameByHandle(Native Method)
```

**The workaround**. Use full (but not symlinked) paths in the `%PATH%` and `%JAVA_HOME%`.
Also, Java 8.x seems like does not have that problem.
