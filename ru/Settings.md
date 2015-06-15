---
title: "ConEmu | Settings"

description: "Где хранятся настройки, описание диалога настроек,
  конвертация из реестра в xml."
---

# Настройка ConEmu

* [Where settings are stored](#Where_settings_are_stored)
  * [Registry](#Registry)
  * [ConEmu.xml](#ConEmu_.xml)
* [Manual change of settings](#Manual_change_of_settings)
  * [Using registry](#Using_registry)
  * [Using ConEmu .xml](#Using_ConEmu_.xml)
* [Диалог настроек «Settings»](#Settings_dialog)
  * [Main](#Main)
  * [Size and Pos](#Size_and_Pos)
  * [Appearance](#Appearance)
  * [Background](#Background)
  * [Tabs](#Tabs)
  * [Confirm](#Confirm)
  * [Task bar](#Task_bar)
  * [Automatic update](#Automatic_update)
  * [Startup](#Startup)
  * [Tasks](#Tasks)
  * [ComSpec](#ComSpec)
  * [Environment](#Environment)
  * [Features](#Features)
    * [RealConsole font](#RealConsole_font)
  * [Text cursor](#Text_cursor)
  * [Colors](#Colors)
  * [Transparency](#Transparency)
  * [Status bar](#Status_bar)
  * [App distinct](#App_distinct)
  * [Integration](#Integration)
  * [Default Terminal](#Default_term)
  * [Keys and Macro](#Keys_and_Macro)
  * [Controls](#Controls)
  * [Mark & Copy](#Mark_and_Copy)
  * [Paste](#Paste)
  * [Highlight](#Highlight)
  * [Far Manager](#Far_Manager)
  * [Far macros](#Far_macros)
  * [Views](#Far_views)
  * [Info](#Info)
  * [Debug](#Debug)
* [Alphabetical](SettingsAlphabetical.html)


<h2 id="Where_settings_are_stored"> Where settings are stored </h2>

ConEmu may store its settings in the Windows registry (HKCU), or in the ConEmu.xml file.


<h3 id="Registry"> Registry </h3>

All settings are stored in registry in the following key:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
~~~

When You specify the [/config](ConEmuArgs.html) switch in the ConEmu.exe command line settings will be stored here:

~~~
[HKEY_CURRENT_USER\Software\ConEmu\<configname>]
~~~


<h3 id="ConEmu_.xml"> ConEmu.xml </h3>

Любая [версия](VersionComparison.html) ConEmu может быть «портабельной»,
то есть может хранить настройки в xml-файле.
Хотя при желании может быть использован и реестр Windows.

Обычно вам будет предложено выбрать режим хранения настроек при [первом запуске](SettingsFast.html).

Подробнее о хранении настроек:

* [Порядок поиска ConEmu.xml](ConEmuXml.html#search-sequence)
* [Переход от реестра к xml и обратно](ConEmuXml.html#switch-location)
* [Использование специальных xml-файлов](ConEmuXml.html#special-xml-files)
* [Как отправить настройки сообщая о проблемах](ConEmuXml.html#send-to-developer)


<h2 id="Manual_change_of_settings"> Manual change of settings </h2>

So, You want to change a few settings, which are absent in the Settings dialog.
List and description of each setting You may find
in the `Settings-ConEmu.reg` or `ConEmu_Sample.xml` files.


<h3 id="Using_registry"> Using registry </h3>

Go to Registry editor (be careful!) and change appropriate value in the ConEmu subkeys:

* `[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]`, when [/config](ConEmuArgs.html) switch is not used;
* `[HKEY_CURRENT_USER\Software\ConEmu\<configname>]`, when /config switch specified in the ConEmu command line.


<h3 id="Using_ConEmu_.xml"> Using ConEmu.xml </h3>

Open ConEmu.xml file using any text editor (Far Manager, Notepad, Vim and so on)
find appropriate value and change it.


<h2 id="Settings_dialog"> Settings dialog </h2>

Открыть диалог настроек можно несколькими способами

* выбрав пункт «Settings...» из [системного меню](SystemMenu.html) ConEmu, которое можно открыть
* щелкнув правой кнопкой мышки по кнопке "Меню" в тулбаре
* щелкнув правой кнопкой мышки по заголовку окна
* щелкнув левой кнопкой мышки по иконке в заголовке окна
* нажав на клавиатуре Win+Alt+Space
* щелкнув правой кнопкой мышки по иконке ConEmu на панели задач (в Windows 7 нужно удерживать кнопку Shift)
* если в [TSA](ConEmuTerms.html#TSA) включено отображение иконки, можно щелкнуть по ней правой кнопкой мышки
* нажать на клавиатуре Win+Alt+P


<a name="screenshots"></a>

<h3 id="Main"> Main </h3>

[![ConEmu settings, Main page](/img/Settings-Main.png "Щелкните чтобы открыть описание")](SettingsMain.html)


<h3 id="Size_and_Pos"> Size and Pos </h3>

[![ConEmu settings, Size and position page](/img/Settings-SizePos.png "Щелкните чтобы открыть описание")](SettingsSizePos.html)


<h3 id="Appearance"> Appearance </h3>

[![ConEmu settings, Appearance page](/img/Settings-Appearance.png "Щелкните чтобы открыть описание")](SettingsAppearance.html)


<h3 id="Background"> Background </h3>

[![ConEmu settings, Background page](/img/Settings-Background.png "Щелкните чтобы открыть описание")](SettingsBackground.html)


<h3 id="Tabs"> Tabs </h3>

[![ConEmu settings, Tabs page](/img/Settings-TabBar.png "Щелкните чтобы открыть описание")](SettingsTabBar.html)


<h3 id="Confirm"> Confirm </h3>

[![ConEmu settings, Confirm page](/img/Settings-Confirm.png "Щелкните чтобы открыть описание")](SettingsConfirm.html)


<h3 id="Task_bar"> Task bar </h3>

[![ConEmu settings, Task bar page](/img/Settings-TaskBar.png "Щелкните чтобы открыть описание")](SettingsTaskBar.html)


<h3 id="Automatic_update"> Automatic update </h3>

[![ConEmu settings, Update page](/img/Settings-Update.png "Щелкните чтобы открыть описание")](SettingsUpdate.html)


<h3 id="Startup"> Startup </h3>

[![ConEmu settings, Startup page](/img/Settings-Startup.png "Щелкните чтобы открыть описание")](SettingsStartup.html)


<h3 id="Tasks"> Tasks </h3>

* [Простой способ запуска часто используемых оболочек](Tasks.html) в [табах](TabBar.html) или [сплитах](SplitScreen.html)
* [Запуск задач из списка переходов панели задач](Windows7Taskbar.html#Customizable_Jump_list)

[![ConEmu settings, Tasks page](/img/Settings-Tasks.png "Щелкните чтобы открыть описание")](SettingsTasks.html)


<h3 id="ComSpec"> ComSpec </h3>

[![ConEmu settings, Comspec page](/img/Settings-Comspec.png "Щелкните чтобы открыть описание")](SettingsComspec.html)


<h3 id="Environment"> Environment </h3>

[![ConEmu settings, Environment page](/img/Settings-Environment.png "Щелкните чтобы открыть описание")](SettingsEnvironment.html)


<h3 id="Features"> Features </h3>

[![ConEmu settings, Features page](/img/Settings-Features.png "Щелкните чтобы открыть описание")](SettingsFeatures.html)


<h4 id="RealConsole_font"> RealConsole font </h4>

* [RealConsole](RealConsole.html)
* [Unicode support](UnicodeSupport.html)

[![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png "Щелкните чтобы открыть описание")](RealConsole.html)


<h3 id="Text_cursor"> Text cursor </h3>

[![ConEmu settings, Text cursor page](/img/Settings-TextCursor.png "Щелкните чтобы открыть описание")](SettingsTextCursor.html)


<h3 id="Colors"> Colors </h3>

[![ConEmu settings, Colors page](/img/Settings-Colors.png "Щелкните чтобы открыть описание")](SettingsColors.html)

[![ConEmu settings, Predefines palettes](/img/Settings-Colors2.png "Щелкните чтобы открыть описание")](SettingsColors2.html)


<h3 id="Transparency"> Transparency </h3>

[![ConEmu settings, Transparency page](/img/Settings-Transparency.png "Щелкните чтобы открыть описание")](SettingsTransparency.html)


<h3 id="Status_bar"> Status bar </h3>

[![ConEmu settings, Status bar page](/img/Settings-StatusBar.png "Щелкните чтобы открыть описание")](SettingsStatusBar.html)


<h3 id="App_distinct"> App distinct </h3>

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct.png "Щелкните чтобы открыть описание")](SettingsAppDistinct.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct2.png "Щелкните чтобы открыть описание")](SettingsAppDistinct2.html)

[![ConEmu settings, App distinct page](/img/Settings-AppDistinct3.png "Щелкните чтобы открыть описание")](SettingsAppDistinct3.html)


<h3 id="Integration"> Integration </h3>

[![ConEmu settings, Integration page](/img/Settings-Integration.png "Щелкните чтобы открыть описание")](SettingsIntegration.html)


<h3 id="Default_term"> Default Terminal </h3>

* [ConEmu как терминал «по умолчанию»](DefaultTerminal.html)

[![ConEmu settings, DefTerm page](/img/Settings-DefTerm.png "Щелкните чтобы открыть описание")](SettingsDefTerm.html)


<h3 id="Keys_and_Macro"> Keys and Macro </h3>

[![ConEmu settings, Keys and Macro page](/img/Settings-Hotkeys.png "Щелкните чтобы открыть описание")](SettingsHotkeys.html)

[![ConEmu settings, Few GuiMacros](/img/Settings-Hotkeys2.png "Щелкните чтобы открыть описание")](SettingsHotkeys2.html)


<h3 id="Controls"> Controls </h3>

[![ConEmu settings, Controls page](/img/Settings-Controls.png "Щелкните чтобы открыть описание")](SettingsControls.html)


<h3 id="Mark_and_Copy"> Mark and Copy </h3>

* [Пометка, копирование и вставка текста](TextSelection.html)

[![ConEmu settings, Text selection](/img/Settings-MarkCopy.png "Щелкните чтобы открыть описание")](SettingsMarkCopy.html)


<h3 id="Paste"> Paste </h3>

[![ConEmu settings, Paste page](/img/Settings-Paste.png "Щелкните чтобы открыть описание")](SettingsPaste.html)


<h3 id="Highlight"> Highlight </h3>

[![ConEmu settings, Highlight page](/img/Settings-Highlight.png "Щелкните чтобы открыть описание")](SettingsHighlight.html)


<h3 id="Far_Manager"> Far Manager </h3>

[![ConEmu settings, Far Manager page](/img/Settings-Far.png "Щелкните чтобы открыть описание")](SettingsFar.html)


<h3 id="Far_macros"> Far macros </h3>

![ConEmu settings, Far macros page](/img/Settings-Far-Macros.png "ConEmu settings, Far macros page")


<h3 id="Far_Views"> Far Views </h3>

This is settings for ‘Panel Views’ Far Manager plugin.


![ConEmu settings, Views page](/img/Settings-Far-View.png "ConEmu settings, Views page")


<h3 id="Info"> Info </h3>

[![ConEmu settings, Info page](/img/Settings-Info.png "Щелкните чтобы открыть описание")](SettingsInfo.html)


<h3 id="Debug"> Debug </h3>

Enables advanced logging of console processes creation, ANSI output and keypresses.

[![ConEmu settings, Debug page](/img/Settings-Debug.png "Щелкните чтобы открыть описание")](SettingsDebug.html)
