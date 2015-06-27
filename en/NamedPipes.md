---
redirect_from:
 - /ru/NamedPipes.html

title: "ConEmu | Named Pipes"

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras

readalso:
 - url: http://conemu.github.io/en/SettingsFeatures.html#cpu-consuming
   title: CPU consuming features
 - url: RealConsole.html
   title: RealConsole
 - url: ConEmuC.html
   title: ConEmuC - Console Part of ConEmu
---

# High ConEmu I/O rate

Some process monitoring tools (Process Hacker or Anvir for example)
may show high I/O rate of `ConEmuC[64].exe` and `ConEmu[64].exe` processes.
Windows 8 Task Manager do not do that by the way.

The reason is simple - ConEmu utilizes
[Named Pipes](https://msdn.microsoft.com/en-us/library/windows/desktop/aa365780.aspx)
for interprocess communication with [RealConsole](RealConsole.html)
and graphic part (GUI). Named Pipes are not related to **disk** activities at all
and I believe these tools just confuse users summarizing both
real disk activites and ‘in-memory’ transfers.

Well, most of I/O transfer actually consists of two parts (types):

* Continuous scanning of the [RealConsole](RealConsole.html) surface
* and transmitting real changes to the GUI.

We can't decrease throughput of first part without decreasing the responsiveness
of ConEmu but there are two options on the
[Features](http://conemu.github.io/en/SettingsFeatures.html#cpu-consuming)
settings page allowing to dramatically descrease I/O rate of the **inactive**
consoles ([Tabs](Tabs.html) or [Panes](Panes.html)) notably
‘Sleep in background’ and ‘Retard inactive panes’.

The thoughput of the second I/O part can't be controlled directly by user,
but it has linear relationship with the number of changes occurred in the
[RealConsole](RealConsole.html). However, ConEmu tries to limit its ‘speed’
to something about 60 [FPS](https://en.wikipedia.org/wiki/Frame_rate).
And if there were no changes in the console, there would be no I/O transfer
of this type.

{% comment %}
--- Some references ---
<a title="Windows 8 - x64 Edition of EMU.... using process Hacker to monitor ConEMU" 
href="http://code.google.com/p/conemu-maximus5/issues/detail?id=820">Issue 820&nbsp;</a>, 
<a title="Процессы ConEmuC(32/64) беспрерывно осуществляют дисковую активность в районе 2.5Mb/s…" 
href="http://code.google.com/p/conemu-maximus5/issues/detail?id=1241">Issue 1241&nbsp;</a>
{% endcomment %}
