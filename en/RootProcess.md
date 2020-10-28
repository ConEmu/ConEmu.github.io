---
redirect_from:
 - /ru/RootProcess.html

title: "ConEmu | Root Process"

breadcrumbs:
 - url: TableOfContents.html#terms
   title: ConEmu
 - url: ConEmuTerms.html
   title: Terms

readalso:
 - url: RealConsole.html
   title: RealConsole
 - url: ConEmuC.html
   title: ConEmuC.exe
 - url: ActiveProcess.html
   title: "Active process"
---

# Root Process

The ‘Root Process’ is an application which you run ‘first’
when you [start new console](LaunchNewTab.html) in ConEmu.

In the following process tree the `bash.exe` is ‘root process’.

~~~
ConEmu.exe -basic -run bash -l -i
   ConEmuC.exe /ROOT bash -l -i
      bash.exe -l -i
~~~


**NB** Please don't confuse this term with ‘root’ from Unix world.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}
