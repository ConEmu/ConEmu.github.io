---
title: ConEmu | FAQ - Часть 7

description: Частые вопросы пользователей о работе с ConEmu

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-7.html
   ru: /ru/FAQ-7.html
---

# Far Manager  {#q-7-far}

{% include faq_disclaimer_ru.md %}

* [Q. Ctrl+Number не переключают режимы панелей.](FAQ-7.html#q-7-9)
* [Q. Почему не работают табы (вкладки)?](#q-7-1)
* [Q. Почему не работает (плагин) Drag-n-Drop?](#q-7-2)
* [Q. Как закрыть таб (редактор/вьювер/фар) мышкой?](#q-7-3)
* [Q. В Far не передаются нажатия кнопок мышки, колесо.](#q-7-4)
* [Q. Почему не работает плагин FarHints ?](#q-7-5)
* [Q. В какой-то момент перестают работать табы, Drag-n-Drop,...](#q-7-6)
* [Q. По щелчку правой кнопкой мышки не появляется контекстное меню для файла/папки.](#q-7-7)
* [Q. По щелчку правой кнопкой мышки появляется графическое меню, а хочу текстовое.](#q-7-8)



#### Q. Ctrl+Number doesn't switch panel modes.  {#q-7-9}

Due to dozens of complains ConEmu doesn't intercept `Win+Numbers`
to switch consoles since [build 170622](/blog/2017/06/22/Build-170622.html).
It's intuitive to use `Ctrl` modifier and ConEmu uses `LCtrl+Numbers`
to switch tabs by default nowadays.

To continue switch panel modes in Far Manager you may:

**A.** Far Manager macro [ConEmu.CtrlNumber.lua](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/Far3_lua/ConEmu.CtrlNumber.lua)
let you switch panel modes by `Ctrl+Shift+Numbers`.
Macro is located in ‘[ConEmuBaseDir](ConEmuEnvironment.html)/Far3_lua’.

**A.** Choose another hotkey on the [Keys & Macro](SettingsHotkeys.html)
settings page. Just type `Ctrl+1` in the ‘Filter hotkeys’ field,
select hotkey row and choose desired modifier.




#### Q. Почему не работают табы (вкладки)?   {#q-7-1}


**A.** Плагин ConEmu.dll (ConEmu.x64.dll) установлен?


**A.** При использовании инсталлятора плагин ConEmu.dll мог быть установлен в неправильную папку, нужно ставить в подпапку Plugins для Far.exe. Инсталлятор мог не найти папку Far.exe, если Far был установлен не через msi. Проще всего сделать Uninstall для ConEmu и установить его заново, но убедиться, что для элемента 'Far Manager plugins' указана корректная папка.


**A.** Флажок 'Enable Tabs' в настройке включен? Если флажок в 'третьем состоянии' табы появляются только после открытия редактора/вьювера.




#### Q. Почему не работает (плагин) Drag-n-Drop?   {#q-7-2}


**A.** «Shell style Drag and Drop» встроен в ConEmu и настраивается на вкладке 'Far Manager' окна 'Settings'. ConEmu умеет вытаскивать файлы «наружу» в другие приложения (проводник, GIMP, и т.п.) и принимать файлы внутрь (на панели и командную строку) из других приложений. Для корректной работы «Shell style Drag and Drop» в Far должен быть установлен плагин ConEmu.dll (ConEmu.x64.dll). ConEmu может драгать файлы как левой (флажок LDrag) так и правой (RDrag) кнопками мышки. Опционально можно назначить модификатор, например драгать файлы левой кнопкой только при удерживаемом LCtrl.


**A.** Скриншоты и некоторые пояснения можно посмотреть/почитать здесь:
[Issue 527](http://github.com/Maximus5/conemu-old-issues/issues/527).


**A.** Плагин (сторонний) Drag-n-Drop не поддерживался, не поддерживается и поддерживаться не будет, т.к. эта функциональность встроена в ConEmu.




#### Q. Как закрыть таб (редактор/вьювер/фар) мышкой?   {#q-7-3}


**A.** При удерживании Ctrl 'правый щелчок' мышки активирует таб и сразу посылает в Far Manager макрос закрытия. Вы можете переопредлить макрос на вкладке 'Far Manager' окна 'Settings', поле 'Close tab'.


**A.** Без удерживания Ctrl 'правый щелчок' мышки активирует таб и отображает контекстное меню, в котором можно выбрать пункт 'Close'.




#### Q. В Far не передаются нажатия кнопок мышки, колесо.   {#q-7-4}


**A.** Проверьте настройку Far -> Interface settings -> `[x]` Mouse.


**A.** Если Far работает в режиме «far /w» (System\WindowMode=1) то необходимо наличие плагина ConEmu.dll (ConEmu.x64.dll), иначе ConEmu будет считать что сейчас работает обычное консольное приложение типа cmd.exe в которое событие мышки посылать не нужно.




#### Q. Почему не работает плагин FarHints?   {#q-7-5}


**A.** Его необходимо обновить (версия 1.0.15 и выше) и он требует наличия плагина ConEmu.dll (ConEmu.x64.dll).




#### Q. В какой-то момент перестают работать табы, Drag-n-Drop,...   {#q-7-6}


**A.** Посмотрите на вкладку 'Info' окна 'Settings'. Скорее всего не включен статус 'Far' или 'Panels'. Учтите, что для D&D необходим плагин ConEmu.dll (ConEmu.x64.dll).




#### Q. По щелчку правой кнопкой мышки не появляется контекстное меню для файла/папки.   {#q-7-7}


**A.** Не включен флажок 'RightClick 4 context menu'? Если флажок в 3-м состоянии - меню появляется после 'долгого' клика, дождитесь пока замкнется кружок вокруг курсора мышки.


**A.** По какой-то причине ConEmu не обнаружил 'панели' в Far. Может быть не установлен плагин ConEmu.dll (ConEmu.x64.dll)? Если все-таки установлен - присылайте скриншоты ConEmu, вкладки 'Info' окна 'Settings' и файл 'Dump screen...' (системное меню ConEmu -> Debug -> Dump screen...).




#### Q. По щелчку правой кнопкой мышки появляется графическое меню, а хочу текстовое.   {#q-7-8}


**A.** Соответствующий макрос можно указать на вкладке 'Far Manager' окна 'Settings'. Например: `F11 e Enter 2`. Предполагается, что для EMenu назначен hotkey 'e'.
