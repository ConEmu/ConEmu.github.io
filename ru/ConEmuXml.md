---
title: "ConEmu | хранение настроек в xml или реестре"

description: "Where ConEmu settings are stored
  and how to send your config to developer if report problems."
---

# ConEmu settings storage

ConEmu settings [may be stored](Settings.html#Where_settings_are_stored)
in the ‘Windows Registry’ and in the xml files (`ConEmu.xml` usually).

By default, ConEmu uses `%USERPROFILE%\ConEmu.xml` on Windows XP or higher.
Windows 2000 is limited to using Registry.


<h2 id="PortableApps-format"> Note for PortableApps.com format </h2>

When you are running ConEmu installed with ‘paf’ bundle, your settings will be stored
in `<app>/Data/settings/ConEmu.xml`.


<h3 id="ConEmu_.xml"> ConEmu.xml </h3>

Вы можете включить в ConEmu «портабельный» режим,
в котором все настройки будут храниться в файле *ConEmu.xml*,
опционально поддерживается вариант с лидирующей точкой *.ConEmu.xml*.
Файл без точки имеет приоритет.

ConEmu ищет этот файл в следующем порядке:

|:---|:---|
| `%ConEmuDir%\` | Папка с файлами `ConEmu.exe` и `ConEmu64.exe` |
| `%ConEmuBaseDir%\` | Папка с файлами `ConEmuC.exe` и `ConEmuC64.exe` |
| `%APPDATA%\` | Я не считаю этот случай действительно «портабельным», но многие просили `%APPDATA%` |
| Реестр Windows | Если xml файл не найден в указанных папках будет использован реестр Windows |

При [первом запуске ConEmu](SettingsFast.html),
вы можете включить «портабельный» режим и выбрать расположение xml файла.

Также вы можете создать новый пустой `ConEmu.xml`,
или просто переименовать `ConEmu_Sample.xml` в `ConEmu.xml` для включения xml-режима.
Пример настроек `ConEmu_Sample.xml` поставляется с ConEmu.

Ключ [именованных конфигураций (/config)](ConEmuArgs.html) также можно использовать в xml-режиме.

И наконец, есть два ключа [/loadcfgfile и /safecfgfile](ConEmuArgs.html)
для использования специально указанных файлов (может быть полезно в некоторых случаях).


**Примечание**. Вы можете переименовать/создать файл `ConEmu.xml` в любое время,
даже после загрузки настроек из реестра.



<h2 id="send-to-developer"> How to send your config to developer </h2>

When one reports about problem, developer needs your ConEmu settings often.

The easiest (and may be most proper) way to provide it is ‘Export...’ button in the
[ConEmu Settings dialog](Settings.html#Settings_dialog).

Save your config in the new xml
(**don't overwrite your existing config**)
file and attach it to the created issue.
