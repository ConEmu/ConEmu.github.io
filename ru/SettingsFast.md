---
pagelang: ru

title: "ConEmu | Fast Configuration Dialog"

description: "При первом запуске ConEmu покажет диалог быстрой конфигурации
   с минимальным набором опций (Fast Configuration Dialog).
   Все опции можно изменить и позже в полном диалоге настроек."

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: Settings.html#screenshots
   title: "Скриншоты диалога настроек"
 - url: Tasks.html
   title: "Удобство запуска shells из ‘Tasks’"
 - url: ConEmuFAQ.html
   title: "ЧаВо (на русском)"
 - url: TableOfContents.html
   title: "Остальная документация"
---

# Первый запуск ConEmu

Основная задача проекта ConEmu – дать пользователям Windows
удобный, надежный и быстрый терминал.


[Установка](Installation.html) ConEmu проста и занимает менее минуты,
сразу после этого вы можете запустить с созданного инсталлятором ярлыка
или любым другим удобным способом `ConEmu.exe` или `ConEmu64.exe`.
Нет никакой разницы между [x64 и x86](VersionComparison.html#x64-or-x86) версиями GUI.

Интерфейс ConEmu минималистичен и интуитивен: [область консоли](VirtualConsole.html),
панель [табов](TabBar.html) c [полем поиска](SearchBar.html)
и [кнопками](ToolBar.html), [статусная строка](StatusBar.html).
Вы можете сразу начинать пользоваться терминалом, выполняя
команды в приглашении `cmd`, `PowerShell`, `bash`, `python`
и других [оболочках (shells)](TerminalVsShell.html).

[Диалог настроек](Settings.html) содержит огромное количество опций,
позволяющих выполнить тюнинг терминала практически под любые нужды,
однако такое количество опций может ошеломить нового пользователя.

При первом запуске ConEmu покажет диалог быстрой конфигурации
с минимальным набором опций (Fast Configuration Dialog).
Все опции можно изменить и позже в полном [диалоге настроек](Settings.html).


* [Диалог «ConEmu Fast Configuration»](#fast-configuration)
  * [Settings storage location](#settings-storage)
  * [Startup task or shell](#startup-task)
  * [Preferred color scheme](#color-scheme)
  * [Single instance mode](#single-instance)
  * [Quake-style](#quake-style)
  * [Show-hide hotkey](#show-hide-hotkey)
  * [Install keyboard hooks](#keyboard-hooks)
  * [Inject ConEmuHk.dll into processes, started in ConEmu tabs](#inject-conemuhk)
  * [Enable automatic updates](#auto-update)
  * [Disable ConIme.exe autorun (Vista only)](#disable-conime)
* [После нажатия кнопки «OK»](#after-ok)
* [Теперь можно открыть диалог настроек](#open-settings)
* [Читайте также](#read-also)


<h2 id="fast-configuration"> Диалог «ConEmu Fast Configuration» </h2>

Итак, при **первом** запуске программы вы, скорее всего,
увидите *диалог быстрой настройки*.

![Диалог предварительной настройки ConEmu](/img/Settings-Fast.png)

Здесь вы можете выбрать предпочитаемый
[интерпретатор командной строки (shell)](TerminalVsShell.html),
внешний вид окна ConEmu,
[параметры автоматического обновления](SettingsUpdate.html)...

Выберете, что будете разрешать ConEmu, т.к. на некоторые функции
(перехват клавиатуры, внедрение в процессы, доступ к интернету)
могут [ошибочно ругаться](FalseAlarms.html) некоторые антивирусные программы.

**ConEmu не содержит троянов или вирусов**,
код открыт, можете [проверить](Source.html).
Тем не менее, вы можете отключить эти функции, хотя это и не рекомендуется.



<h3 id="settings-storage"> Settings storage location </h3>

ConEmu может хранить настройки в реестре Windows или xml-файлах.

По умолчанию ConEmu предлагает хранить настройки в файле
[ConEmu.xml](ConEmuXml.html)
в папке программы, если она не защищена от записи,
или в папке `%APPDATA%`, если ConEmu был установлен,
например, в `C:\Program Files\`.

Если программа была установлена в папку `C:\ConEmu\` то будут предложены следующие варианты:

* HKEY_CURRENT_USER\Software\ConEmu
* %APPDATA%\ConEmu.xml
* C:\ConEmu\ConEmu\ConEmu.xml
* **C:\ConEmu\ConEmu.xml**

**Примечание**. В Windows 2000 текущая версия может иметь проблемы xml,
поэтому для этой OS предлагается использование реестра.

Подробнее о хранении настроек [здесь](ConEmuXml.html).


<h3 id="startup-task"> Startup task or shell </h3>

[Task-и](Tasks.html) это предопределенные командные строки
для запуска [shell-ов](TerminalVsShell.html) или [ChildGui](ChildGui.html)
в [табах](TabBar.html) и [сплитах](SplitScreen.html) ConEmu.
После установки ConEmu находит множество известных приложений и создает для них Task-и.
И вы можете настроить любые Task-и позднее в [Настройках](SettingsTasks.html).

Просто выберите предпочитаемый shell из списка ‘Startup task or shell’.

Но здесь можно указать не только один из [task-ов](Tasks.html),
но и любую программу, просто укажите полный путь к
[программе](https://wikipedia.org/wiki/Executable)
и укажите аргументы.


<h3 id="color-scheme"> Preferred color scheme </h3>
<h3 id="single-instance"> Single instance mode </h3>
<h3 id="quake-style"> Quake-style </h3>
<h3 id="show-hide-hotkey"> Show-hide hotkey </h3>

<h3 id="keyboard-hooks"> Install keyboard hooks </h3>

Если флажок отключить, ConEmu не сможет обрабатывать некоторые
клавиатурные комбинации.
Например, в Windows 7 комбинации Win+*цифра* (Win+*1*, Win+*2*, т.д.)
переключают/запускают программы на панели задач.
А ведь ими удобно переключать [табы](TabBar.html) в окне ConEmu.
Включение флажка «Install keyboard hooks» означает не то,
что ConEmu будет блокировать системные клавиатурные комбинации,
а только то, что у вас есть возможность включить или отключить их
перехват в диалоге настроек.
Например, флажками «Win+Number - activates console»,
«Win+Tab - switch consoles (Tabs)» и т.п.
Посмотрите на вкладку [Keys & Macro](SettingsHotkeys.html) [диалога настроек](Settings.html).


<h3 id="inject-conemuhk"> Inject ConEmuHk.dll into processes, started in ConEmu tabs </h3>

Внедрение хуков требуется для реализации многих возможностей.
Например обработки параметра [-new_console](NewConsole.html),
[ANSI](AnsiEscapeCodes.html), [DosBox](DosBox.html),
логирование вывода консоли в файл, [ChildGui](ChildGui.html) и др.
А также избежания проблем, например [падений](MicrosoftBugs.html)
или появления графических диалогов или меню под окном ConEmu.
Для этого в запускаемые в ConEmu процессы внедряется динамическая библиотека
ConEmuHk.dll (или ConEmuHk64.dll для 64-битных приложений).


<h3 id="auto-update"> Enable automatic updates </h3>

Все очевидно, разрешить обновление программы из интернета.
Потом, в диалоге настроек на вкладке [Update](SettingsUpdate.html)
можно будет настроить параметры обновления.
ConEmu не «самовольничает», перед запуском процесса обновления у вас спросят подтверждение.


<h3 id="disable-conime"> Disable ConIme.exe autorun (Vista only) </h3>

Пользователи Windows Vista могут увидеть этот флажок.
Почему и зачем написано в [FAQ](ConEmuFAQ.html#Windows_Vista).


<h3 id="after-ok"> После нажатия кнопки «OK» </h3>

Теперь ConEmu запустит task или shell
указанный в поле [Startup task or shell](#startup-task).


<h2 id="open-settings"> Теперь можно открыть диалог настроек </h2>

[Как открыть диалог настроек](Settings.html#Settings_dialog)
