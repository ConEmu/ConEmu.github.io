---
redirect_from: /ru/Installation.html

title: ConEmu | Installation

description: How to properly install ConEmu

bc1_url: TableOfContents.html#conemu
bc1_title: ConEmu

readalso:
 - url: VersionComparison.html
   title: "Comparison: distros, bitness, stages"
 - url: SettingsFast.html
   title: "First start: Fast Configuration Dialog"
 - url: Settings.html
   title: "ConEmu Settings"
 - url: Tasks.html
   title: "Tasks: Set up your favourite shells"
---

# ConEmu Installation

In general, ConEmu installation is easy.
Just unpack or install to any folder and run `ConEmu.exe`.

* <a href="#not-a-far-manager">If you are **not** a Far Manager user</a>
* <a href="#far-manager">If you **are** a Far Manager user</a>
* <a href="#mactype">MacType issues</a>
* <a href="#java">Java issues</a>


<h2 id="not-a-far-manager">If you are <strong>not</strong> a Far Manager user</h2>

* Unpack all files (from appropriate `ConEmuPack.\*.7z`)
	or install `ConEmuSetup.\*.exe` package to any folder your choice.
 	Subfolder `plugins` (Far Manager related) is not required in your case
  and may be deleted or unchecked in the installer.
* Run `ConEmu.exe` or `ConEmu64.exe`.


<h2 id="far-manager">If you <strong>are</strong> a Far Manager user</h2>

In general, installation for using with Far Manager does not differ.
With the only exception:

* You must ensure [ConEmu plugin](ConEmuFarPlugin.html) is loaded by Far Manager.

By default, ConEmu will create a Task for each Far Manager version found on your PC.
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

#### Sligtly deprecated

* Use of `ConEmuPack.\*.7z` and `ConEmuSetup.\*.exe` are slightly different
  * `ConEmuPack.\*.7z`: Unpack all files to the folder, containing `far.exe`
  * `ConEmuSetup.\*.exe`: On the `Features` page you must select destination
	for `Far Manager plugins` to the folder, containing `far.exe`.
* Import to the registry Far Manager macroses, related to ConEmu. Macro `*.reg`
	files are located in `ConEmu.Addons` directory. Each macro file (`*.reg`) has
	description in header. Just doubleclick chosen files in Windows Explorer
	to import them.
* By default (started without command line params), ConEmu runs `far.exe` from
	it's home folder, or `cmd.exe` if Far Manager not found.
	Alternatively, You may run any root command, specifying `/Cmd \<App with params\>`
	argument in ConEmu shortcut or command line.


<h2 id="mactype">MacType issues</h2>

If you are using MacType you can get crashes when starting any application
from a shell started in ConEmu tab.

That is because MacType tries to hook `ConEmuC.exe` and `ConEmuC64.exe` processes.
But [ConEmuC](ConEmuC.html) is a [console application](ConsoleApplication.html)
and it does not draw any text on graphical canvas at all.

**The workaround**. Add `ConEmuC.exe` and `ConEmuC64.exe` to MacType exclusion list.


<h2 id="java">Java issues</h2>

There is an [Issue 1899](https://code.google.com/p/conemu-maximus5/issues/detail?id=1899)
with Java version 7.x if it was installed in symlinked folder.
You can get java exception like:

```
at sun.nio.fs.WindowsNativeDispatcher.GetFinalPathNameByHandle(Native Method)
```

**The workaround**. Use full (but not symlinked) paths in the `%PATH%` and `%JAVA_HOME%`.
Also, Java 8.x seems like does not have that problem.
