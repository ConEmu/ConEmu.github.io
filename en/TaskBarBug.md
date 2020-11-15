---
redirect_from:
 - /ru/TaskBarBug.html

title: "ConEmu | TaskBar Bug"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# TaskBar Pin Bug

Windows 7 and higher allows to pin application icons to the taskbar.
You can pin ConEmu icon too, just run it, right-click taskbar icon and choose ‘Pin to taskbar’.

Right-clicking on that icon may pop up list of registered tasks.
If you want to use that handy way to start tasks, do the following:

* goto ‘Tasks’ page of the Settings dialog and set up your favorites;
* goto ‘Task bar’ page, check ‘Add ConEmu tasks to taskbar’ and press ‘Update Now!’ button.

{% include in_article.html %}


## Failed to reuse  {#Failed_to_reuse}

Sometimes Windows explorer fails to reuse pinned icon.
ConEmu can't do anything with that, absolutely.
This is internal feature of Microsoft, any application can't tell to taskbar
to ‘reuse’ icon, taskbar decides ‘to do or not to do’ itself.

Usual reasons for failing icon reuse are:

* User pin different executable than actually running.
  For example, pinned application is ‘...\KiTTYPortable.exe’,
  but actually running is ‘...\App\KiTTY\kitty_portable.exe’.
  That is not a ConEmu issue usually, user can (and must) pin ‘ConEmu.exe’ itself.
* Bug in the Windows Explorer. Application can't do anything with that.

User may try to bypass reuse bug. How? There is no strict instructions.

* Try to un-pin and re-pin again.
* Try to logoff/logon.
* Try to run ConEmu from pinned icon, and when taskbar fails to reuse the icon,
  pin appeared new icon, and after that un-pin old icon.
* Contact Microsoft support?

At last, pinned shortcut list can't be managed externally,
but I believe they are located here:

~~~
%USERPROFILE%\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
~~~
