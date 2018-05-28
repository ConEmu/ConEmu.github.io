---
redirect_from:
 - /ru/SettingsStartup.html

title: "ConEmu | Settings › Startup page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Startup

![ConEmu Settings: Startup](/img/Settings-Startup.png)

## Startup options  {#id2868}

Choose here what consoles you want to be started with ConEmu by default.
Defaults may be overriden with `-run` or `-runlist` [argument of ConEmu.exe](ConEmuArgs.html).

* **Command line** Starts ConEmu with single tab opened.
* **Tasks file** Starts ConEmu with several (one or more) tabs,
  commands located in specified text file.
* **Specified named task** (*Recommended option*) Starts ConEmu with several (one or more) tabs,
  commands located in ConEmu Settings, Tasks page.
* **Auto save/restore opened tabs** ConEmu tries to save configuration of your active tabs/panes
  and restore them on ConEmu restart. Please read [Shell working directory](ShellWorkDir.html)
  article for required steps.
  

#### Delay between consoles initialization  {#id2871}

Define here the delay in milliseconds between creating consoles
during ConEmu or [multi-command task](Tasks.html) startup.


## Selected task contents  {#id2754}

*View only, go to the [Tasks](Tasks.html) page for editing.*

You may see here contents of the selected Task or ‘Auto saved tabs’.
