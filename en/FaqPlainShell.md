---
redirect_from: /ru/FaqPlainShell.html

title: "ConEmu | How to Run Shell Bare"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# How to Run Shell Bare

In some cases third party software or plugins may
affect normal behaviour of your shell.

And that may be **not** a ConEmu issue at all.

* [How to run specified command](#example)
  * [cmd](#cmd)
  * [PowerShell](#PowerShell)
  * [Far Manager](#Far_Manager)

{% include in_article.html %}


## How to run specified command  {#example}

Most of shells have switches to disable loading plugins or extensions.
Just use them plain.

Easiest way to execute `ConEmu64.exe -run ...` from `Win+R` dialog to force proper shell command.

It's recommended to force ConEmu's default settings by `-basic` switch.
Your current [configuration file or registry](ConEmuXml.html)
**will not be changed**: `ConEmu64.exe -basic -run ...`.

![Run ConEmu from Win+R dialog](/img/Win-R-dialog.png)

Of course you may change the ‘Command line’ on the ‘Startup’ settings page,
but running ConEmu from `Win+R` dialog is more strict method.



## cmd  {#cmd}

Just run cmd using `/D` switch.

~~~
ConEmu64.exe -basic -run cmd.exe /D
~~~



## PowerShell  {#PowerShell}

Use `-noprofile` switch.

~~~
ConEmu64.exe -basic -run PowerShell.exe -noprofile
~~~



## Far Manager  {#Far_Manager}

Use `/p` to disable plugins and `/m` to disable macros.

~~~
ConEmu64.exe -basic -run Far.exe /p /m
~~~
