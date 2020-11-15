---
redirect_from:
 - /ru/putty.html
 - /putty.html

title: "ConEmu | PuTTY and mintty"

description: "Running third-party terminals like PuTTY and mintty in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys

readalso:
 - url: ChildGui.html
   title: Child GUI
 - url: CygwinMsysConnector.html
   title: cygwin/msys terminal connector
---

# PuTTY and mintty

Both [PuTTY](https://www.putty.org/) and [mintty](https://mintty.github.io/)
are not console applications, they are independent terminals providing connections
to remote hosts or your local [cygwin/msys](CygwinMsys.html) installation.

Being [ChildGui](ChildGui.html) applications they do painting on their window canvas,
instead of using standard input/output as [console applications](ConsoleApplication.html) do.

That means that:

* neither of ConEmu terminal customization options may be used, these applications
  have their own configuration and canvas;
* neither ([almost](ChildGui.html#hotkeys)) hotkey configured in ConEmu may be used.

To avoid limitations it would be better to use real console applications (bash, zsh, ssh, etc.)
from your favorite POSIX distro (cygwin, msys, wsl).

ConEmu creates by default [Tasks](Tasks.html#add-default-tasks) for all found installations,
just use them.

{% include in_article.html %}
