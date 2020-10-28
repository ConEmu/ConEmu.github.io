---
redirect_from:
 - /ru/ZoneId.html

title: "ConEmu | Zone Identifier"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: Certificate.html
   title: Digital certificate
 - url: FalseAlarms.html
   title: False alarms
---

# Blocking by Zone Identifier

Under some circumstances ConEmu's binaries may be marked as
[Downloaded from Internet](https://msdn.microsoft.com/en-us/library/dn392609.aspx).

This, in turn, may cause:

* blocking by [Windows SmartScreen](/img/ZoneIdSmartScreen.png);
* superfluous [UAC confirmations](https://en.wikipedia.org/wiki/User_Account_Control)
  while starting ConEmu or consoles;
* [False alarms](FalseAlarms.html) from antiviral software;
* and so on...

## Unblocking

You may unblock each binary file by opening their properties,
clicking ‘Unblock’ and ‘Apply’.

![Might be blocked](/img/ZoneIdUnblock.png)

Check files `ConEmu.exe`, `ConEmu64.exe`, `ConEmuC.exe`, `ConEmuC64.exe`,
`ConEmuCD.dll`, `ConEmuCD64.dll`, `ConEmuHk.dll`, `ConEmuHk64.dll`.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}
