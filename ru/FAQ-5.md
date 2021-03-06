---
title: ConEmu | FAQ - Часть 5

description: Частые вопросы пользователей о работе с ConEmu

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-5.html
   ru: /ru/FAQ-5.html
---

# x64 issues  {#q-5-x64}

{% include faq_disclaimer_ru.md %}

* [Q. Зачем нужны файлы ConEmuC.exe, ConEmuCD.dll и ConEmuHk .dll в 64битных ОС?](#q-5-1)
* [Q. Зачем нужны файлы ConEmuC64 .exe, ConEmuCD64.dll и ConEmuHk64 .dll в 32битной версии ConEmu ?](#q-5-2)
* [Q. При запуске команд start, echo (и прочих команд cmd.exe) на 64битной ОС возникает ошибка вида "File not found. Cannot execute. start".](#q-5-3)
* [Q. При попытке запуска (из Far Manager) возникает системная ошибка вида: «Ошибка при запуске приложения (0xc0000142). Для выхода из приложения нажмите кнопку "OK".»](#q-5-4)
* [Q. Что происходит с переменными окружения в 64битных OS?](#q-5-5)



#### Q. Зачем нужны файлы ConEmuC.exe, ConEmuCD.dll и ConEmuHk.dll в 64битных ОС?   {#q-5-1}


**A.** Эти файлы необходимы для запуска 32битных приложений, а также для
работы 32битной версии ConEmu.exe. Наверняка в какой-то момент вам
окажется необходимо запустить 32битную консольную программу. Без
этих файлов это не получится. В принципе, можно пользоваться
64битной версией ConEmu64.exe, которая доступна в дистрибутиве
`ConEmuSetup.*.exe`, она запускает ConEmuC64.exe в качестве
корневого консольного процесса.




#### Q. Зачем нужны файлы ConEmuC64.exe, ConEmuCD64.dll и ConEmuHk64.dll в 32битной версии ConEmu?   {#q-5-2}


**A.** Эти файлы необходимы для запуска 64битных приложений в 64битных ОС.




#### Q. При запуске команд start, echo (и прочих команд cmd.exe) на 64битной ОС возникает ошибка вида "File not found. Cannot execute. start".   {#q-5-3}


**A.** Скорее всего вы удалили необходимый файл ConEmuC64.exe и сопутствующие ConEmuHk64.dll, ConEmuCD64.dll.




#### Q. При попытке запуска (из Far Manager) возникает системная ошибка вида: «Ошибка при запуске приложения (0xc0000142). Для выхода из приложения нажмите кнопку "OK".»   {#q-5-4}


**A.** Причина пока не найдена, какая-то проблема в Windows. Причем, ошибка возникает не только в ConEmu, но и в 'чистой' консоли. Для восстановления нормальной работы нужно перезапустить консоль (например через Win-~).




#### Q. Что происходит с переменными окружения в 64битных OS?   {#q-5-5}

**A.** ConEmu не управляет переменными окружения.
