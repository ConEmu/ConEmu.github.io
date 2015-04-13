---
redirect_from:
 - /ru/FaqTabVsTitle.html
 - /en/FaqTabVsTitle.html
 - /ru/TabVsTitle.html

title: "ConEmu | Tab or Title"

readalso:
 - url: NewConsole.html
   title: "-new_console and -cur_console switches"
 - url: GuiMacro.html
   title: "GuiMacro - Syntax, Functions, Examples"
 - url: SettingsTasks.html
   title: "Settings › Tasks page"
 - url: SettingsTabBar.html
   title: "Settings › TabBar page"
---

# Console title vs tab label

There are two different things.

### Console title

Well, you can set it from ConEmu task, but that title
will be overrided/changed in the most cases by your shell.

~~~
title 'Your cool tab' &amp; cmd
~~~

### Tab title

By default it shows console title with console number as prefix.
It can be configured by templates on the
[SettingsTabBar](SettingsTabBar.html) page.
Also, it can be renamed by user (Apps+R or tab menu).
And of course it can be specified from your task.
Read wiki [NewConsole](NewConsole.html) switch `t`.

~~~
cmd -new_console:t:'Your cool tab'
~~~
