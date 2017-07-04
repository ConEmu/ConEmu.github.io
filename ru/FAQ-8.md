---
title: ConEmu | FAQ - Часть 8

description: Частые вопросы пользователей о работе с ConEmu

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-8.html
   ru: /ru/FAQ-8.html
---

# Windows Vista  {#q-8-vista}

{% include faq_disclaimer_ru.md %}

* [Q. В Windows Vista не срабатывает комбинация Ctrl-Win-Alt-Space для показа RealConsole .](#q-8-1)
* [Q. В Windows Vista зависают другие консольные процессы.](#q-8-2)




#### Q. В Windows Vista не срабатывает комбинация Ctrl-Win-Alt-Space для показа RealConsole.   {#q-8-1}

**A.** Почему-то первое наатие пробела вистой иногда 'проглатывается'. Не отпуская Ctrl-Win-Alt нажмите пробел еще раз.




#### Q. В Windows Vista зависают другие консольные процессы.   {#q-8-2}

**A.** "Виноват" процесс ConIme.exe. Вроде бы он служит для ввода иероглифов (китай и т.п.). Зачем он нужен, если ввод теперь идет в графическом окне? Нужно запретить его автозапуск или вообще переименовать этот файл, например в 'ConIme.ex1' (видимо это возможно только в безопасном режиме). Запретить автозапуск: Внесите в реестр и перезагрузитесь

~~~
[HKEY_CURRENT_USER\Console]
"LoadConIme"=dword:00000000
~~~
