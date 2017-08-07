---
redirect_from:
 - /ru/ShellWorkDir.html
 - /ru/CygwinCurDir.html
 - /en/CygwinCurDir.html

title: "ConEmu | Shell Working Directory"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: FileLineDetector.html
   title: "Hyperlinks and Errors Detector"
 - url: SettingsHighlight.html
   title: "Settings › Highlight page"
 - url: CygwinMsysConnector.html
   title: "cygwin/msys connector"
 - url: PowershellPrompt.html
   title: "Powershell Prompt"
---

# Shell's Working Directory (Path)

Current directory (working directory, path or just a **CD**) in your
[shell](TerminalVsShell.html) or [active console application](ActiveProcess.html)
is critical to some neat features.
Look at the few examples below.

* Hyperlinks, Files and Compiler Errors
  [Detector/Highlighter](FileLineDetector.html)
* Displaying **CD** (full path or just a folder name) in the tab title using
  [tab templates](SettingsTabBar.html);
* Reusing **CD** in the [Restart](RestartTab.html)
  and [Create new console](LaunchNewTab.html) dialogs;
* Using `%CD%` variable with [Shell](GuiMacro.html#List_of_functions)
  macro function in the [Task's](Tasks.html) `Dir` parameter.

But ConEmu is not able to retrieve working directory by itself from
most of possible [shells](TerminalVsShell.html) available nowadays.
User have to modify their profiles to let ConEmu know working directory.
Please read the rest of article about required profile modifications.

* [About directories](#description)
* [What you shall do to get **CD** support](#What_you_shall_do_to_get_CD_support)
  * [cmd and tcc](#cmd_and_tcc)
  * [cygwin/msys shells via PS1](#connector-ps1)
  * [bash and some other cygwin shells](#bash_and_other_cygwin_shells)
  * [zsh](#zsh)
  * [PowerShell](#PowerShell)



## About directories   {#description}

When you run new console the shell is starting in the directory you specified.
That is the ‘**Startup directory**’.

![ConEmu new console](/img/ConEmuCreate.png "ConEmu confirmation of new console creation")

When you work with shell and do some CD's or run your scripts,
its ‘**Current directory**’ may (and will) be changed.

But directory is changed inside your
[Shell](TerminalVsShell.html) but not inside terminal.
ConEmu does not handle your shell commands when your execute them.
Moreover, some shells (PowerShell, bash, etc.) don't even call
[Window API](WinApi.html) function ‘**SetCurrentDirectory**’,
they handle their working directories internally.

However, since ConEmu's build 140818 you got full support of ‘**Current directory**’ (**CD**).

* Automatic detection of **CD** in `cmd.exe` or `tcc.exe`;
* Ability to inform ConEmu GUI about shell's **CD** using
  [ANSI](AnsiEscapeCodes.html) or [ConEmuC](ConEmuC.html);
* Display **CD** in the tab title using
  [tab templates](SettingsTabBar.html);
* Reuse **CD** in the [Restart](RestartTab.html) and
  [Create new console](LaunchNewTab.html) dialogs;
* At last you may use `%CD%` variable with [Shell](GuiMacro.html#List_of_functions)
  macro function in the `Dir` parameter.
  
But users have to [configure shells they are using](#What_you_shall_do_to_get_CD_support).



## What you shall do to get **CD** support   {#What_you_shall_do_to_get_CD_support}

* [cmd and tcc](#cmd_and_tcc)
* [cygwin/msys shells via PS1](#connector-ps1)
* [bash and some other cygwin shells](#bash_and_other_cygwin_shells)
* [zsh](#zsh)
* [PowerShell](#PowerShell)

### cmd and tcc   {#cmd_and_tcc}

Just enable [Inject ConEmuHk](ConEmuHk.html) feature.
ConEmu will maintain **CD** for you automatically.



### WSL/cygwin/msys shells via PS1   {#connector-ps1}

**Warning!** This options will work only with
[cygwin/msys connector](CygwinMsysConnector.html)!

This is the only option available for [Bash on Ubuntu on Windows](BashOnWindows.html).

Use [ANSI](AnsiEscapeCodes.html#ConEmu_specific_OSC) in `PS1`
environment variable to notify ConEmu about directory changes.
For example, you may configure your bash by appending
to your `~/.bashrc` following sequence:

~~~
if [[ -n "${ConEmuPID}" ]]; then
  PS1='$PS1\[\e]9;9;"\w"\007\033]9;12\007\]'
fi
~~~

**NB** Don't forget to ‘escape’ non-printable parts of `PS1` with `\[` and `\]`.
This is required to avoid weird behavior of readline when you type really long commands.



### bash and some other cygwin shells   {#bash_and_other_cygwin_shells}

**NB**. Dont try this in [Bash on Ubuntu on Windows](BashOnWindows.html).
`ConEmuC.exe` is *native* Windows application which can't be executed by *linux* kernel.

You need to tell bash to run `ConEmuC -StoreCWD` command
each time its prompt executed.
For example, add to your `~/.bashrc`

~~~
if [[ -n "${ConEmuPID}" ]]; then
  PROMPT_COMMAND='ConEmuC -StoreCWD'
fi
~~~


### zsh   {#zsh}

**NB**. Dont try this in [Bash on Ubuntu on Windows](BashOnWindows.html).
`ConEmuC.exe` is *native* Windows application which can't be executed by *linux* kernel.

For zsh just add this to your `~/.zshrc` file.

~~~
prmptcmd() { eval "$PROMPT_COMMAND" }
precmd_functions=(prmptcmd)
PROMPT_COMMAND='ConEmuC -StoreCWD'
~~~


### PowerShell   {#PowerShell}

You need to modify your profile to override prompt function. Just run in your PowerShell prompt:

~~~
New-Item -ItemType directory -Path (Split-Path -Parent $profile) -Force
New-Item -ItemType file -Path $profile
notepad $profile
~~~

And change prompt as in the following example:

~~~
function prompt {
  # Just prettify the prompt
  Write-Host -NoNewline -ForegroundColor Cyan "PS "
  $dir = $(get-location).ProviderPath
  Write-Host -NoNewline -ForegroundColor Yellow $dir
  # You may use ANSI or direct ConEmuC call
  if ($env:ConEmuBaseDir -ne $null) {
  # Write-Host -NoNewline (([char]27) + "]9;9;`"" + $dir + "`"" + ([char]27) + "\")
  & ConEmuC.exe -StoreCWD "$dir"
  }
  return ">"
}
~~~

Also check another variant of `prompt` function exposing input start to ConEmu:
[PowershellPrompt](PowershellPrompt.html).
