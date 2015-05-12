---
redirect_from: /ru/TccInsertOverwrite.html

title: "ConEmu | TCC/LE and Insert/Overwrite Mode"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: InsertOverwrite.html
   title: Using Insert/Overwrite mode in ConEmu's consoles
---

# Change tcc prompt to insert mode by default

From time to time any user complains that ConEmu starts tcc (tcc/le)
prompt in ‘Overwrite’ mode.
But that is not a ConEmu fail (check it with `cmd.exe` as a shell).
You need to configure your tcc properly.

Just run from yours tcc prompt:

~~~
OPTION
~~~

And choose desired mode on the ‘Command Line’ tab.
Do not forget to press ‘OK’ button ;)


![Change tcc prompt to insert mode by default](/img/TccInsertOverwrite.png)

Actually, it will update your `TCMD.INI` file
(located in `%USERPROFILE%\AppData\Local\JPSoft` or near to `tcc.exe`).

~~~
[4NT]
CursorIns=15
CursorOver=100
EditMode=Insert
;; And so on...
~~~

Alternatively, you may use the following command in your tcc prompt.
But note that it will not update yours `TCC.INI` configuration file.

~~~
SETDOS /M1 /S100:15
~~~
