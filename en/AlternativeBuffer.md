---
redirect_from: /ru/AlternativeBuffer.html

title: "ConEmu | Pause and Alternative Buffer"

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms
---

# Pause and Alternative Buffer

ConEmu is able to ‘pause’ console output in two ways.

* [Alternative Buffer](#alternative-buffer)
* [Pause console applications](#pause)

{% include in_article.html %}


## Alternative Buffer  {#alternative-buffer}

ConEmu may ‘freeze’ your [console application](ConsoleApplication.html) output.
Just press Win+A or press the ‘lock’ button on the [ToolBar](ToolBar.html).

Your console application will not be paused or freezed actually,
it will continue its work.

Instead, ConEmu will load the entire console back-scroll buffer in memory
(that may takes few seconds in some cases) and display it.

User may scroll this output.

If any [ConsoleApplication](ConsoleApplication.html) will change output in the
[RealConsole](RealConsole.html) at that time, changes will not be displayed in ConEmu until you exit
AlternativeBuffer by pressing Esc or Win+A.


## Pause console applications  {#pause}

Also, you may press `Pause` key.
It will pause most console applications (who just print text to ‘StdOut’).
Press `Pause` key again to release.
