---
redirect_from: /ru/CygwinStartCmd.html

title: "ConEmu | Cygwin Startup Command"
---

# cygwin and startup command

One of the most asked questions related to bash is:
‘How to run some command on startup and leave bash run interactively?’

The simplest thing with `cmd.exe` - `/k` switch, but the bash has no equivalent.

Of course, the question is not related to ConEmu, but let it be here.
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
