---
redirect_from:
 - /ru/CmdPrompt.html

title: "ConEmu | Configuring Cmd Prompt"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: PowershellPrompt.html
   title: "Extending Powershell Prompt"
 - url: PromptAtTheBottom.html
   title: "Hold Shell Prompt at the Bottom"
---

# Configuring Cmd Prompt

All configuration of `cmd.exe` prompt (color, text, linefeeds) is done
either by the `PROMPT` command (run `PROMPT /?` for help)
or the `PROMPT` [environment variable](WindowsEnvironment.html).

The example below shows how the default ConEmu's [Task](Tasks.html)
`cmd (Admin)` looks like:

![cmd's Admin prompt in ConEmu](/img/ConEmuCmdAdminPrompt.png)

If you run `set PROMPT` there you'll see following configuration string:

~~~
$ set prompt
PROMPT=$E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S$E[92m$P$E[90m$_$E[90m$$$E[m$S
~~~

As I've said before all macros are described in the `PROMPT /?` printout.
Also, there are some `$E...` macroses which are [ANSI escape codes](AnsiEscapeCodes.html).
For example, `$E[32m` is a standard ANSI color switch.
But `$E]9;8;"USERNAME"` is a ConEmu extension to ANSI standard which prints
the content of the `USERNAME` [environment variable](WindowsEnvironment.html).

## How to set up your prompt automatically

There are two ways actually. First one is to define `PROMPT` variable before `cmd.exe` starts.
For example you may type the following in your [Task](Tasks.html):

~~~
set PROMPT=$P$_$G & cmd.exe
~~~

And your prompt will looks like `Directory` + `LineFeed` + `>`.

Another way is to use initialization script. The nice example you may see in the ConEmu files:
[ConEmu\CmdInit.cmd](https://github.com/Maximus5/ConEmu/blob/master/Release/ConEmu/CmdInit.cmd).
In breif you have to create `YourInit.cmd` file with following command:

~~~
PROMPT $P$_$G
~~~

and run your `cmd.exe` as follows

~~~
cmd.exe /k YourInit.cmd
~~~

## Bottom line

Again, run `PROMPT /?` to learn possible macros
and look at [ANSI escape codes](AnsiEscapeCodes.html) for the more power.
