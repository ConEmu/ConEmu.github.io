---
title: "ConEmu | Inside Parent (Embedding)"

description: "Feature ‘ConEmu Inside’ or ‘Embedding’ allows to run it inside any
   other window, for example inside Windows' Explorer's details pane. Like ‘ConEmu Here’."

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features

readalso:
 - url: SettingsIntegration.html
   title: "Settings: ConEmu Here & Inside"
 - url: CygwinStartDir.html
   title: "Cygwin Startup Directory"
 - url: StartupDir.html
   title: "ConEmu Startup Directory"
 - url: ConEmuArgs.html
   title: "ConEmu.exe Command Line Switches"

otherlang:
   en: /en/InsideParent.html
   ru: /ru/InsideParent.html
---

# ConEmu Inside or Embedding

Функция ‘Inside’ позволяет запустить ConEmu-Maximus5 внутри какого-либо другого окна.

* [В качестве панели в окне проводника](#settings) - выбираете
  в контекстном меню для диска/папки/файла пункт ‘ConEmu Inside’
  и внутри окна проводника появится настроенный вами shell
  (cmd/powershell/bash) в текущей папке Проводника.
* [В качестве дочернего окна в любом выбранном вами окне](#inside-switches).
  Пример сейчас не придумаю, но может кому-то пригодится такой способ
  интеграции удобной консоли в свое приложение.



## Настройка для работы в окне Проводника Windows  {#settings}

Режим навеян вопросом
‘<a href="http://superuser.com/a/441531/139371" rel="nofollow"
 >How to embed PowerShell into Explorer or Explorer-like tool</a>’?

Add item ‘ConEmu Inside’ into Windows ‘Explorer’ context menu,
it will open ConEmu as child window inside ‘Explorer’ window.
It's similar to ‘ConEmu Here’ - working folder will be current folder from ‘Explorer’ window.

В ‘Проводник’ Windows добавляется пункт контекстного меню ‘ConEmu Inside’,
при выборе которого ConEmu запускается в ‘области переходов’, внутри окна ‘Проводника’.
Похож на режим ‘ConEmu Here’ - текущей папкой в ConEmu устанавливается папка из ‘Проводника’.

Все на вкладке [Integration](SettingsIntegration.html) окна [Settings](Settings.html).


### Группа элементов ‘ConEmu Inside’   {#inside-group}
Можно создать несколько пунктов контекстного меню проводника,
и просмотривать/редактировать ранее назначенные пункты
(выберите пункт в выпадающем списке ‘Menu Item’).


### Опция ‘Sync current directory (Explorer > ConEmu)’   {#sync-dir}
Пока что эта не сохраняется в настройке и включена по умолчанию.
Для быстрого включения/выключения в режиме Inside в [статустной строке](StatusBar.html)
отображается колонка ‘Sync’.
Смысл опции в том, что ConEmu может следить за текущей папкой в окне проводника
и синхронизировать ее, автоматически выполняя `cd /d ...` в окне консоли.
Чтобы эта опция работала в WinXP/Win2k3 в заголовке окне проводника
должен отображаться полный путь текущей папки.


## Запуск из Проводника Windows  {#startup}

Как уже было сказано ранее, запуск ConEmu в этом режиме осуществляется
через выбор пункта контекстного меню проводника.
Имя пункта по умолчанию - ‘ConEmu Inside’, но вы можете настроить любое имя
и создать более одного пункта меню.

Для работы в этом режиме в окне проводника должно быть место для размещения окна консоли.

| OS | Панель |
|:----|:----|
| Windows 2000 | Не проверено |
| Windows XP <br/> Windows 2003 | Должна быть показана панель ‘**Полезный совет**’. <br/> Меню проводника ‘Вид’ Панели обозревателя ‘Полезный совет’. <br/> * English: ‘Explorer Bar’ > ‘Tip of the Day’ * |
| Windows Vista | Не проверено |
| Windows 7 | Нужно увеличить высоту области **статуса** или отобразить область **предварительного просмотра**. |
| Windows 8 | Нужно отобразить либо ‘**Preview pane**’ либо ‘**Details pane**’ |

**Подсказка** Если при выборе пункта меню удерживать ‘Shift’,
то ConEmu запустит таб в режиме ‘As Administrator’.

Если ConEmu уже был открыт в режиме Inside, то в ранее открытом окне запускается новый Tab.
Панель табов в этом режиме по умолчанию не отображается (можете включить при желании),
поэтому переключаться между табами можно через статусную строку кликом
по полю ‘ActiveCon/TotalCount’.

**Подсказка** Вызвать окно [Settings](Settings.html) можно:

  *  Нажав Win+Alt+P;
  *  Щелкнув правой кнопкой мышки по ‘гамбургеру’ в [Панели инструментов](ToolBar.html);
  *  Выбрав пункт ‘Settings’ в [Системном меню](SystemMenu.html);
  *  Щелкнув правой кнопкой мышки по крайней левой части статусной строки.



## ConEmu command line switches  {#inside-switches}

| | |
|:----|:----|
| `/inside` | Automatic mode. Used to run ConEmu in the Explorer window. <br/> ConEmu will search for appropriate parent process window suitable to embed into. |
| `/insidepid PID` | То же что и ‘/inside’ но с явным указанием PID процесса, в окно которого нужно внедриться. <br/> *PID* - ИД процесса (dec). |
| `/insidewnd 0xHWND` | Directly specified window handle (HWND) to embed into. Unlike automatic mode ConEmu will cover all client area of this HWND. <br/> *HWND* - window descriptor (hex). |
