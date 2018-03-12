---
redirect_from:
 - /auto.html
 - /en/auto.html

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

otherlang:
   en: /en/AutoInstall.html
   ru: /ru/AutoInstall.html
---

# Automate your box installation
If you need to automate your box installation, this page describes how to
setup ConEmu via PowerShell with single command.
Internet connection is required.



## Default automatic installation   {#default}

|:---------------------------|:----------|
| ConEmu version             | Latest    |
| Destination folder         | C:\ConEmu |
| Create shortcut on desktop | Yes       |
| Run after installation     | No        |

Just copy the following command, press `Win+R`, paste command and press `Enter`.

~~~
powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install.ps1'))"
~~~




## Automatic installation with parameters   {#params}

If you need to customize parameters (folder, default xml file, etc.)
you may use another syntax.

**Note**, ‘install2.ps1’ is used here instead of ‘install.ps1’.

| Description | Name | Values |
|:---|:---|:---|
| Destination folder | dst | Full path to desired location <br/> C:\ConEmu |
| ConEmu version | ver | • 'alpha' <br/> • 'preview' <br/> • 'stable' |
| Create shortcut on desktop | lnk | • $TRUE <br/> • $FALSE <br/> • 'Desired link name' |
| ConEmu.xml bootstrap | xml | 'https://conemu.github.io/ConEmu.xml' |
| Run after installation | run | • $TRUE <br/> • $FALSE |

Paste the command (see example below) to your box startup script
(cmd-file for example) and change arguments to desired values.

~~~
powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; set ver 'alpha'; set dst 'C:\ConEmu'; set lnk $TRUE; set run $TRUE; set xml 'https://conemu.github.io/ConEmu.xml'; iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install2.ps1'))"
~~~



## Using chocolatey   {#cinst}

[Chocolatey](https://chocolatey.org/) is a Machine Package Manager,
somewhat like apt-get, but built with Windows in mind.

When you have Chocolatey installed on your PC you can install
ConEmu (and many other programs) with one command.

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




## Manual installation   {#manual}

Just choose [preferred format](VersionComparison.html)
(7-zip, installer or PortableApps.com),
download and [unpack or install](Installation.html) ConEmu.

[![Download mirrors](/img/Downloads.png)](Downloads.html "Choose ConEmu download mirrors")
