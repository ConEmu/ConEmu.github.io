---
redirect_from: /ru/CygwinStartCmd.html

title: "ConEmu | Cygwin Startup Command"
---

# cygwin and startup command

One of the most asked questions related to bash is:
‘How to run some command on startup and leave bash run interactively?’

The simplest thing with `cmd.exe` - `/k` switch, but the bash has no equivalent.

Of course, the question is not related to ConEmu, but let options be here.

* [Modify your ~/.bashrc](#bashrc)
* [Use the conveyer](#conveyer)
* [Use GuiMacro and command conveyers](#guimacro)

All examples below suppose that `bash.exe` exists in your `%PATH%`.



<h2 id="bashrc"> Modify your ~/.bashrc </h2>

The example lines were copied from [SU question](http://superuser.com/a/344486/139371).

You need to modify your `~/.bashrc` profile script adding at the end:

~~~
[[ $startup_cmd ]] && {
  declare +x startup_cmd
  eval "$startup_cmd"
}
~~~

And configure your ConEmu's task like following:

~~~
set "startup_cmd=echo 'This is sample command' && echo 'And this is another command'" && bash -l -i
~~~



<h2 id="conveyer"> Use command conveyers </h2>

This method supposed that your command will be executed
before your login shell have to be started.
And there is overhead because your login script is to be
executed twice actually.

~~~
bash -l -i -c "echo 'This is sample command' && echo 'And this is another command' && bash -l -i"
~~~



<h2 id="guimacro"> Use GuiMacro and command conveyers </h2>

You may use [GuiMacro](GuiMacro.html) function [print](GuiMacro.html#Print)
to post some command into console input buffer after console starts.
You still need to use conveyer to run `ConEmuC` before `bash`.

**NB** The `\n` is appended to press `Enter` automatically.

~~~
cmd /c "ConEmuC -Silent -GuiMacro print "echo 'This is sample command' && echo 'And this is another command'\n" && bash -l -i"
~~~
