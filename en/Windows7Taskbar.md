---
redirect_from: /ru/Windows7Taskbar.html

title: "ConEmu | Windows7 Taskbar"

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features
---

# ConEmu and Windows7 Taskbar

ConEmu supports Windows 7/8/10 Taskbar features.


## Customizable Jump list  {#Customizable_Jump_list}

ConEmu may add [Tasks](Tasks.html) and comands from your [tabs history](LaunchNewTab.html)
to the Windows Taskbar Jump List. Just configure your tasks and create Jump List
with ‘Update Now!’ button on the [Task bar](SettingsTaskBar.html) Settings page.

![ConEmu Jump list in Windows7](/img/ConEmuJumpList.png "ConEmu Jump list in Windows7")


## Progress on Windows7 taskbar  {#Progress_on_Windows7_taskbar}

ConEmu can detect the [progress](Progress.html) of processes running in its consoles
and show it on the Windows 7 Taskbar.
Also it's possible to set [progress](Progress.html) state from [GuiMacro](GuiMacro.html).

![ConEmu progress in Windows7](/img/ConEmuProgress.png "ConEmu progress in Windows7")

[Read more about Progress](Progress.html)


## Aero peek and thumbnails  {#Aero_Peek}

To enable Windows 7 Aero Thumbnails you have to enable
option ‘Show all consoles’ on the [Task bar](SettingsTaskBar.html)
settings page. Then if you hover mouse cursor on the ConEmu icon
you will see thumbnailed representation of all consoles running
in ConEmu. Than if you hover mouse cursor on the thumbnail you
will see real-sized image of this tab without actually switching
tab in ConEmu window.

![ConEmu Aero Peek and Thumnails](/img/ConEmuAero.png "ConEmu Aero Peek and Thumnails")

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}
