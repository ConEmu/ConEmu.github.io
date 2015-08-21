---
redirect_from:
 - /ru/FileLineDetector.html

title: "ConEmu | Hyperlinks and Errors Detector"

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features
---

# The detector

ConEmu has ability to highlight hyperlinks, files and compiler errors (file+line_number).
Just hover mouse with `Ctrl` pressed.

May be configured on [Highlight](SettingsHighlight.html) settings page.


![ConEmu FileLineDetector](/img/ConEmuFileLineHL.png)



<h2 id="Compiler_errors"> Compiler errors </h2>


Examples:

* macro.cpp(1820) : error C4716
* NewClass.ps1:35 ...
* abc.py (3): ...

**Note!** File will not be highlighted if ConEmu can't find it in the [shell's current directory](ShellWorkDir.html).

Action: File will be opened in the [specified editor](SettingsHighlight.html) on the proper line if possible.



<h2 id="Files"> Files </h2>

File names or full paths produced from `dir`, `ls`, `git status`, `git diff` and so on.

**NB** File will not be highlighted if ConEmu can't find it in the
[shell's current directory](ShellWorkDir.html).

Action:

* Will be opened in the [specified external editor](SettingsHighlight.html),
* or in the default program: [ShellExecute](http://msdn.microsoft.com/en-us/library/windows/desktop/bb762153.aspx).



<h2 id="Hyperlinks"> Hyperlinks </h2>

Examples:

* [http://www.fosshub.com/ConEmu.html](http://www.fosshub.com/ConEmu.html)
* [mailto:user@domain.com](mailto:user@domain.com)
* [file:///c:\\sources\\abc.html](file:///c:\\sources\\abc.html)

Action: will be opened in the default program:
[ShellExecute](http://msdn.microsoft.com/en-us/library/windows/desktop/bb762153.aspx).
