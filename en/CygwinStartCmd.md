---
redirect_from: /ru/CygwinStartCmd.html

title: "ConEmu | Cygwin Startup Command"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys
---

# cygwin and startup command

One of the most asked questions related to bash is:
‘How to run some command on startup and leave bash run interactively?’

The simplest thing with `cmd.exe` - `/k` switch, but the bash has no equivalent.

Of course, the question is not related to ConEmu, but let options be here.

* [Modify your ~/.bashrc](#bashrc)
* [Piping ~/.bashrc copy](#bashrc-temp)
* [Use the conveyer](#conveyer)
* [Use GuiMacro and command conveyers](#guimacro)

All examples below suppose that `bash.exe` exists in your `%PATH%`.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}



## Modify your ~/.bashrc  {#bashrc}

The example lines were copied from [SU question](http://superuser.com/a/344486/139371).

You need to modify your `~/.bashrc` profile script adding at the end:

~~~
[[ $STARTUP_CMD ]] && {
  declare +x STARTUP_CMD
  eval "$STARTUP_CMD"
  unset STARTUP_CMD
}
~~~

Or, if previous snippet does not work (msys1 does not have `locale`):

~~~
if [[ -n "${STARTUP_CMD}" ]]; then
  $STARTUP_CMD
  unset STARTUP_CMD
fi
~~~

And configure your ConEmu's task like following:

~~~
set "STARTUP_CMD=echo 'This is sample command' && echo 'And this is another command'" && bash -l -i
~~~

**NB** It's recommended to use **upper-case** variable name.
Some versions have ignored lower-case or camel-case variable names.



## Piping ~/.bashrc copy {#bashrc-temp}

Solution from [StackOverflow](http://stackoverflow.com/a/36152028/1405560):

~~~
bash --rcfile <(echo '. ~/.bashrc; some_command')
~~~

No modifications of original `~/.bashrc` are required, just take care of properly
escaped special symbols (single quote) in `some_command`.



## Use command conveyers  {#conveyer}

This method supposed that your command will be executed
before your login shell have to be started.
And there is overhead because your login script is to be
executed twice actually.

~~~
bash -l -i -c "echo 'This is sample command' && echo 'And this is another command' && bash -l -i"
~~~



## Use GuiMacro and command conveyers  {#guimacro}

You may use [GuiMacro](GuiMacro.html) function [print](GuiMacro.html#Print)
to post some command into console input buffer after console starts.
You still need to use conveyer to run `ConEmuC` before `bash`.

**NB** The `\n` is appended to press `Enter` automatically.

~~~
cmd /c "ConEmuC -Silent -GuiMacro print "echo 'This is sample command' && echo 'And this is another command'\n" && bash -l -i"
~~~
