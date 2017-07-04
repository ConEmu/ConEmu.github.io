---
title: ConEmu | FAQ - Part 8

description: Frequenly asked user questions about ConEmu usage

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu

otherlang:
   en: /en/FAQ-8.html
   ru: /ru/FAQ-8.html
---

# Windows Vista  {#q-8-vista}

{% include faq_disclaimer_en.md %}

* [Q. The key combination Ctrl-Win-Alt-Space does not show the RealConsole .](#q-8-1)
* [Q. Other console processes hang in Windows Vista.](#q-8-2)



#### Q. The key combination Ctrl-Win-Alt-Space does not show the RealConsole.   {#q-8-1}

**A.** For some reason, the first Space press is sometimes ignored by Vista.
Without releasing Ctrl-Win-Alt, hit Space once more.



#### Q. Other console processes hang in Windows Vista.   {#q-8-2}

**A.** The fault lies with the ConIme.exe process. It seems to be required for input of hieroglyphs (Chinese etc.) in console windows. Why is it needed, if input is done in a graphical window? Forbid its startup, or simply rename the file, e.g. to 'ConIme.ex1' (Safe Mode only). To forbid its startup, apply the following to your registry and reboot:

~~~
[HKEY_CURRENT_USER\Console]
"LoadConIme"=dword:00000000
~~~
