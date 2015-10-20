---
title: "ConEmu | About Dialog"

description: "ConEmu About dialog is not only version information,
  it also shows a lot of information about switches and macros."

screenshots:
 - title: "About page"
   src:    About.png
 - title: "ConEmu.exe arguments"
   src:    About-ConEmu.png
 - title: "Tasks"
   src:    About-Tasks.png
 - title: "-new_console switches"
   src:    About-new_console.png
 - title: "ConEmuC.exe arguments"
   src:    About-ConEmuC.png
 - title: "GuiMacro functions list"
   src:    About-GuiMacro.png
 - title: "DosBox hotkeys"
   src:    About-DosBox.png
 - title: "Contributors"
   src:    About-Contributors.png
 - title: "ConEmu license"
   src:    About-License.png
 - title: "System information"
   src:    About-SysInfo.png
---

# ConEmu About Dialog

There are several ways to show ‘About’ dialog.

* [Hotkey](KeyboardShortcuts.html#Non_configurable_hotkeys) `Win+Alt+A`.
* [System menu](SystemMenu.html)'s Help \ About.
* [Command line switch](ConEmuArgs.html) `ConEmu -?`.


## About dialog pages

The dialog shows not only ‘About’ text,
but also a lot of other helpful information.

{% for img in page.screenshots %}
* [{{ img.title }}](#{{ img.src }}){% endfor %}



{% for img in page.screenshots %}
<h3 id="{{ img.src }}">{{ img.title }}</h3>
<p><img src="/img/{{ img.src }}" alt="{{ img.title }}" /></p>
{% endfor %}
