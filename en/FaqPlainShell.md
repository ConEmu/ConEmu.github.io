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



## How to run specified command  {#example}

Most of shells have switches to disable loading plugins or extensions.
Just use them. Easiest way to use `ConEmu -run ...` to force proper shell command.

For example.

~~~
ConEmu -run PowerShell -noprofile
~~~

Also, you may turn on ConEmu's default settings by `-basic`.
Your current [configuration file or registry](ConEmuXml.html)
**will not be changed**.

~~~
ConEmu -basic -run PowerShell -noprofile
~~~

Alternatively, you may change the ‘Command line’ on the ‘Startup’ settings page.




## cmd  {#cmd}

Just run cmd using `/D` switch.

~~~
cmd /D
~~~



## PowerShell  {#PowerShell}

Use `-noprofile` switch.

~~~
PowerShell -noprofile
~~~



## Far Manager  {#Far_Manager}

Use `/p` to disable plugins and `/m` to disable macros.

~~~
Far /p /m
~~~
