---
title: ConEmu | FAQ - Частые вопросы

description: Частые вопросы пользователей о работе с ConEmu

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/ConEmuFAQ.html
   ru: /ru/ConEmuFAQ.html
---

# Содержание

Частые вопросы пользователей о работе с ConEmu.

* [О главном](#faq-1)
* [Дистрибутив](#faq-2)
* [Portable-версия](#faq-3)
* [Обновление](#faq-4)
* [x64 issues](#faq-5)
* [Настройка](#faq-6)
* [ConEmu automation](#faq-11)
* [Far Manager](#faq-7)
* [Windows Vista](#faq-8)
* [Аварийные завершения](#faq-9)
* [Unsorted](#faq-10)

{% include faq_disclaimer_ru.md %}

### [О главном](FAQ-1.html#q-1-general)  {#faq-1}
* [Q. Что делать, если нашли ошибку?](FAQ-1.html#q-1-1)
* [Q. А как же ConMan , альтернативная консоль и пр.?](FAQ-1.html#q-1-2)
* [Q. What is an Apps key?](FAQ-1.html#q-1-5)
* [Q. What is a Host key?](FAQ-1.html#q-1-6)
* [Q. Отображаются не все символы (иероглифы, троеточие, копирайты, и др.)](FAQ-1.html#q-1-7)
* [Q. Можно ли запустить во вкладке ConEmu графическое (GUI) приложение?](FAQ-1.html#q-1-8)
* [Q. Как запустить приложение в новой владке ConEmu ?](FAQ-1.html#q-1-9)
* [Q. Как использовать параметр '-new_console'?](FAQ-1.html#q-1-10)
* [Q. Какие переменные окружения устанавливает ConEmu ?](FAQ-1.html#q-1-11)
* [Q. Запущенная консольная программа ничего не выводит на экран.](FAQ-1.html#q-1-12)
* [Q. Программа не работает в режиме «Long console output».](FAQ-1.html#q-1-13)

### [Дистрибутив](FAQ-2.html#q-2-distr)  {#faq-2}
* [Q. Зачем нужен инсталлятор ConEmuSetup.exe?](FAQ-2.html#q-2-1)
* [Q. Для чего нужен файл ConEmuC.exe (ConEmuC64.exe)?](FAQ-2.html#q-2-2)
* [Q. Для чего нужен Far-плагин ConEmu.dll (ConEmu.x64.dll)?](FAQ-2.html#q-2-3)
* [Q. Для чего нужен файл ConEmuHk.dll (ConEmuHk64.dll)](FAQ-2.html#q-2-4)
* [Q. Для чего нужен файл ExtendedConsole.dll (ExtendedConsole64.dll)?](FAQ-2.html#q-2-5)

### [Portable-версия](FAQ-3.html#q-3-portable)  {#faq-3}
* [Q. Может ли ConEmu быть портабельным?](FAQ-3.html#q-3-1)
* [Q. При попытке использования `ConEmu.xml` появляется ошибка «XML setting file can not be used!»](FAQ-3.html#q-3-2)
* [Q. Может ли ConEmu делать портабельными запускаемые в нем консольные приложения?](FAQ-3.html#q-3-3)

### [Обновление](FAQ-4.html#q-4-update)  {#faq-4}
* [Q. Умеет ли ConEmu обновляться автоматически?](FAQ-4.html#q-4-1)
* [Q. Какие возможности у автоматического обновления?](FAQ-4.html#q-4-2)

### [x64 issues](FAQ-5.html#q-5-x64)  {#faq-5}
* [Q. Зачем нужны файлы ConEmuC.exe, ConEmuCD.dll и ConEmuHk .dll в 64битных ОС?](FAQ-5.html#q-5-1)
* [Q. Зачем нужны файлы ConEmuC64 .exe, ConEmuCD64.dll и ConEmuHk64 .dll в 32битной версии ConEmu ?](FAQ-5.html#q-5-2)
* [Q. При запуске команд start, echo (и прочих команд cmd.exe) на 64битной ОС возникает ошибка вида "File not found. Cannot execute. start".](FAQ-5.html#q-5-3)
* [Q. При попытке запуска (из Far Manager) возникает системная ошибка вида: «Ошибка при запуске приложения (0xc0000142). Для выхода из приложения нажмите кнопку "OK".»](FAQ-5.html#q-5-4)
* [Q. Что происходит с переменными окружения в 64битных OS?](FAQ-5.html#q-5-5)

### [Настройка](FAQ-6.html#q-6-settings)  {#faq-6}
* [Q. Как запустить cmd-файл инициализирующий переменные окружения (командную строку)?](#q-6-12)
* [Q. Можно ли запустить ConEmu так, чтобы в нем сразу было открыто несколько вкладок: Far, CMD, PowerShell ?](FAQ-6.html#q-6-1)
* [Q. Двоятся окна Far Manager.](FAQ-6.html#q-6-2)
* [Q. Как настроить растровый шрифт?](FAQ-6.html#q-6-3)
* [Q. Почему горизонтальные рамки отображаются пунктиром/прерывисто?](FAQ-6.html#q-6-4)
* [Q. Как запустить несколько консолей в сетке 2x2](FAQ-6.html#q-6-5)
* [Q. Как настроить запуск cmd.exe под Администратором из контекстного меню Проводника Windows](FAQ-6.html#q-6-6)
* [Q. Как поименовать запускаемые табы при запуске из задачи {Task}](FAQ-6.html#q-6-7)
* [Q. Как настроить Git Bash Here в ConEmu](FAQ-6.html#q-6-8)
* [Q. Как экспортировать настройки ConEmu](FAQ-6.html#q-6-9)
* [Q. Как прицепить открытое консольное окно в новый экземпляр ConEmu](FAQ-6.html#q-6-10)
* [Q. Как удалить пункты из списка «Create new console»](FAQ-6.html#q-6-11)

### [ConEmu automation](FAQ-11.html#q-11-automation)  {#faq-11}
* [Q. Как различать различные экземпляры (окна) ConEmu?](FAQ-11.html#q-11-1)

### [Far Manager](FAQ-7.html#q-7-far)  {#faq-7}
* [Q. Ctrl+Number не переключают режимы панелей.](FAQ-7.html#q-7-9)
* [Q. Почему не работают табы (вкладки)?](FAQ-7.html#q-7-1)
* [Q. Почему не работает (плагин) Drag-n-Drop?](FAQ-7.html#q-7-2)
* [Q. Как закрыть таб (редактор/вьювер/фар) мышкой?](FAQ-7.html#q-7-3)
* [Q. В Far не передаются нажатия кнопок мышки, колесо.](FAQ-7.html#q-7-4)
* [Q. Почему не работает плагин FarHints ?](FAQ-7.html#q-7-5)
* [Q. В какой-то момент перестают работать табы, Drag-n-Drop,...](FAQ-7.html#q-7-6)
* [Q. По щелчку правой кнопкой мышки не появляется контекстное меню для файла/папки.](FAQ-7.html#q-7-7)
* [Q. По щелчку правой кнопкой мышки появляется графическое меню, а хочу текстовое.](FAQ-7.html#q-7-8)

### [Windows Vista](FAQ-8.html#q-8-vista)  {#faq-8}
* [Q. В Windows Vista не срабатывает комбинация Ctrl-Win-Alt-Space для показа RealConsole .](FAQ-8.html#q-8-1)
* [Q. В Windows Vista зависают другие консольные процессы.](FAQ-8.html#q-8-2)

### [Аварийные завершения](FAQ-9.html#q-9-crash)  {#faq-9}
* [Q. При завершении консольной программы возникает ошибка вида: Access violation at address 6F78DE5B in module ' ConEmuHk .dll'. Read of address 0071004E](FAQ-9.html#q-9-1)
* [Q. ConEmu или консольное приложение зависает при выходе?](FAQ-9.html#q-9-2)
* [Q. Как создать дамп памяти приложения?](FAQ-9.html#q-9-3)
* [Q. Как узнать ИД процесса (PID)](FAQ-9.html#q-9-4)
* [Q. Как запустить Диспетчер задач Windows](FAQ-9.html#q-9-5)
* [Q. Что означает: ConEmuC: CreateFile (CONOUT$) failed, ErrCode =0x00000005](FAQ-9.html#q-9-6)

### [Unsorted](FAQ-10.html#q-10-unsorted)  {#faq-10}
* [Q. Как сворачивать ConEmu в трей (в иконку рядом с часами)?](FAQ-10.html#q-10-1)
* [Q. Зачем ConEmu меняет шрифт у реальной консоли?](FAQ-10.html#q-10-2)
* [Q. Почему-то отображается только часть консоли; консоль отображается сдвинутой; не отображается вообще.](FAQ-10.html#q-10-3)
* [Q. Почему исчезает окно быстрого поиска в панелях при переключении языка?](FAQ-10.html#q-10-4)
* [Q. Почему нет кнопок мультиконсоли на панели инструментов?](FAQ-10.html#q-10-5)
* [Q. Зависает (в заголовке ConEmu отображается '...Waiting for result (10 sec)') через некоторое время в FAR появляется меню плагинов (или вызывается какой-то другой плагин).](FAQ-10.html#q-10-6)
* [Q. Почему не отображается 'Background image'?](FAQ-10.html#q-10-7)
* [Q. Зачем нужно подтверждение 'Press Enter to close console...' отображаемое перед закрытием консоли после завершения всех программ в ней?](FAQ-10.html#q-10-8)
* [Q. Как отключить 'Press Enter to close console...'?](FAQ-10.html#q-10-9)
* [Q. Запускается FAR, плагин установлен, но все равно появляется 'Press Enter to close console...'?](FAQ-10.html#q-10-10)
* [Q. Почему Shift-Enter в панелях запускает новое окно с реальной консолью, а не в новой вкладке?](FAQ-10.html#q-10-11)
* [Q. Почему в консоли отображается прямоугольник (рамка) вместо курсора?](FAQ-10.html#q-10-12)
* [Q. В табах отображаются квадратики (вместо иероглифов).](FAQ-10.html#q-10-13)
* [Q. Для консоли ConEmu не всплывает перевод GoldenDict](FAQ-10.html#q-10-14)
