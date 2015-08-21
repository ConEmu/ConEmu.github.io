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



<h2 id="example"> How to run specified command </h2>

Most of shells have switches to disable loading plugins or extensions.
Just use them. Easiest way to use `ConEmu -cmd ...` to force proper shell command.

For example.

~~~
ConEmu -cmd PowerShell -noprofile
~~~

Also, you may turn on ConEmu's default settings by `-basic`.
Your current [configuration file or registry](ConEmuXml.html)
**will not be changed**.

~~~
ConEmu -basic -cmd PowerShell -noprofile
~~~

Alternatively, you may change the ‘Command line’ on the ‘Startup’ settings page.




<h2 id="cmd"> cmd </h2>

Just run cmd using `/D` switch.

~~~
cmd /D
~~~



<h2 id="PowerShell"> PowerShell </h2>

Use `-noprofile` switch.

~~~
PowerShell -noprofile
~~~



<h2 id="Far_Manager"> Far Manager </h2>

Use `/p` to disable plugins and `/m` to disable macros.

~~~
Far /p /m
~~~
