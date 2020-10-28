---
redirect_from: /ru/TerminalVsShell.html

title: "ConEmu | Terminal vs Shell"

description: "The large difference between ‘terminal’ and ‘shell’ terms.
   ConEmu is a ‘terminal’ where you anyone may run any desired shell."

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu

readalso:
 - url: Delusions.html
   title: Console-related delusions
 - url: ConEmuTerms.html
   title: Terms
---

# The large difference

{% comment %}
http://github.com/Maximus5/conemu-old-issues/issues/823#22
http://github.com/Maximus5/conemu-old-issues/issues/887
http://github.com/Maximus5/conemu-old-issues/issues/1219
http://github.com/Maximus5/conemu-old-issues/issues/1292
{% endcomment %}

From time to time somebody says ‘ConEmu is still running the Windows cmd.exe, it's not a bash’.

That is absolutely wrong.


### Terminals

ConEmu is a ‘[local terminal](http://en.wikipedia.org/wiki/Terminal_emulator)’ or ‘console window’, these are synonyms.
There are many different [terminals](http://en.wikipedia.org/wiki/List_of_terminal_emulators) for all OS and tastes.

Few examples: [iTerm2](http://en.wikipedia.org/wiki/ITerm2), [konsole](http://en.wikipedia.org/wiki/Konsole),
[guake](http://en.wikipedia.org/wiki/Guake), [xterm](http://en.wikipedia.org/wiki/Xterm),
[mintty](http://en.wikipedia.org/wiki/Mintty).


### Command-line interpreters

When user starts terminal, it runs some console application.

Few examples: [Powershell](http://en.wikipedia.org/wiki/Windows_PowerShell), [cmd.exe](http://en.wikipedia.org/wiki/Cmd.exe),
[bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)), [zsh](http://en.wikipedia.org/wiki/Z_shell),
[iPython](http://en.wikipedia.org/wiki/IPython).

These applications and many others all are
[command-line interpreters (CLI) or ‘shells’](http://en.wikipedia.org/wiki/List_of_command-line_interpreters).
They do ‘read-evaluate-print’ cycle, aka command execution.


## Bottom line
ConEmu is a Windows terminal where you can run any shell you want.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}
