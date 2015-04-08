---
redirect_from: /auto.html
redirect_from: /ru/auto.html

title: ConEmu | Automate Installation

description: "How to use PowerShell or Chocolatey to automate ConEmu installation."

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation

readalso:
 - url: Installation.html
   title: Installation
 - url: VersionComparison.html
   title: "Comparison: distros, bitness, stages"
---

# Automate your box installation
If you need to automate your box installation, this page describes how to
setup ConEmu via PowerShell with single command. Internet connection required.


<!-- ******************************* -->
<h2 id="default">Default automatic installation</h2>

|:---------------------------|:----------|
| ConEmu version             | Latest    |
| Destination folder         | C:\ConEmu |
| Create shortcut on desktop | Yes       |
| Run after installation     | No        |

Just copy the following command, press `Win+R`, paste command and press `Enter`.

~~~
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install.ps1'))"
~~~



<!-- ******************************* -->
<h2 id="params">Automatic installation with parameters</h2>

If you need to customize parameters (folder, default xml file, etc.)
you may use another syntax. Note, ‘install2.ps1’ is used here
instead of ‘install.ps1’.

| Description | Name | Values |
|:---|:---|:---|
| Destination folder | dst | Full path to desired location <br/> C:\Tools\ConEmu |
| ConEmu version | ver | • 'alpha' <br/> • 'preview' <br/> • 'stable' |
| Create shortcut on desktop | lnk | • $TRUE <br/> • $FALSE <br/> • 'Desired link name' |
| Run after installation | run | • $TRUE <br/> • $FALSE |

Paste the following command to your box startup script (cmd-file for example) and change arguments to desired values.

~~~
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "set ver 'alpha'; set dst 'C:\ConEmu'; set lnk $TRUE; set run $TRUE; set xml 'https://conemu.github.io/ConEmu.xml'; iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install2.ps1'))"
~~~


<!-- ******************************* -->
<h2 id="cinst">Using chocolatey</h2>

[Chocolatey](https://chocolatey.org/) is a Machine Package Manager,
somewhat like apt-get, but built with Windows in mind.

When you have Chocolatey installed on your PC you can install ConEmu
with one command.

ConEmu will be installed in your `Program Files` folder using actual
version of `ConEmuSetup.exe`.

|:---------------------------|:------------------------|
| ConEmu version             | Preview or Latest       |
| Destination folder         | C:\Program Files\ConEmu |
| Create shortcut on desktop | Yes                     |
| Run after installation     | No                      |

Just run the following command from any terminal.

~~~
choco install conemu
~~~



<!-- ******************************* -->
<h2 id="manual">Manual installation</h2>

Just choose preferred format (7-zip, installer or PortableApps.com),
download and unpack or install ConEmu.

<a href="/en/Downloads.html"><img src="./img/Downloads.png" alt="Download mirrors" title="Choose ConEmu download mirrors"/></a>
