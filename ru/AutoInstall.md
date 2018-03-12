---
redirect_from:
 - /ru/auto.html

title: ConEmu | Автоматизация установки

description: "PowerShell и Chocolatey упрощают установку ConEmu на новую машину."

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation

readalso:
 - url: Installation.html
   title: Installation
 - url: VersionComparison.html
   title: "Сравнение версий: distros, bitness, stages"

otherlang:
   en: /en/AutoInstall.html
   ru: /ru/AutoInstall.html
---

# Автоматизация установки системы
Если нужно автоматизировать установку вашей системы,
здесь вы можете узнать как установить ConEmu с помощью одной команды PowerShell.
Для установки требуется подключение к Internet.



## Автоматическая установка по умолчанию <a id="default"/>

|:---------------------------|:----------|
| ConEmu version             | Latest    |
| Destination folder         | C:\ConEmu |
| Create shortcut on desktop | Yes       |
| Run after installation     | No        |

Просто выполните следующую команду в диалоге `Win+R`.

~~~
powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install.ps1'))"
~~~




## Автоматическая установка с параметрами <a id="params"/>

Если вам нужно настроить параметры установки (путь, xml-файл, и т.п.)
можно использовать другой синтаксис.

**Внимание**, здесь используется файл ‘install2.ps1’, а не ‘install.ps1’.

| Описание | Имя | Примеры значений |
|:---|:---|:---|
| Destination folder | dst | Full path to desired location <br/> C:\Tools\ConEmu |
| ConEmu version | ver | • 'alpha' <br/> • 'preview' <br/> • 'stable' |
| Create shortcut on desktop | lnk | • $TRUE <br/> • $FALSE <br/> • 'Desired link name' |
| ConEmu.xml bootstrap | xml | 'https://conemu.github.io/ConEmu.xml' |
| Run after installation | run | • $TRUE <br/> • $FALSE |

Вставьте команду (пример ниже) в ваш скрипт установки
(cmd-file например) и измените требуемые значения.

~~~
powershell -NoProfile -ExecutionPolicy RemoteSigned -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; set ver 'alpha'; set dst 'C:\ConEmu'; set lnk $TRUE; set run $TRUE; set xml 'https://conemu.github.io/ConEmu.xml'; iex ((new-object net.webclient).DownloadString('https://conemu.github.io/install2.ps1'))"
~~~



## chocolatey.org <a id="cinst"/>

[Chocolatey](https://chocolatey.org/) это ‘менеджер пакетов’,
что-то вроде apt-get в Linux, но созданный для Windows.

Если на вашей машине установлен Chocolatey то установка
ConEmu (как и многих других программ) выполняется одной командой.

ConEmu будет установлен в папку `Program Files` посредством
последней версии `ConEmuSetup.exe`.

|:---------------------------|:------------------------|
| ConEmu version             | Preview or Latest       |
| Destination folder         | C:\Program Files\ConEmu |
| Create shortcut on desktop | Yes                     |
| Run after installation     | No                      |

Просто выполните команду в вашем терминале.

~~~
choco install conemu
~~~




## Manual installation <a id="manual"/>

Just choose [preferred format](VersionComparison.html)
(7-zip, installer or PortableApps.com),
download and [unpack or install](Installation.html) ConEmu.

[![Download mirrors](/img/Downloads.png)](Downloads.html "Choose ConEmu download mirrors")
