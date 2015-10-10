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
---

# Shell Working Directory

Knowing current (working) directory in your [shell](TerminalVsShell.html)
or [active console application](ActiveProcess.html) is critical to some
neat featured. Look at the few examples below.

* Hyperlinks, Files and Compiler Errors
  [Detector/Highlighter](FileLineDetector.html)
* Displaying **CD** in the tab title using
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
* [bash and some other cygwin shells](#bash_and_other_cygwin_shells)
* [zsh](#zsh)
* [PowerShell](#PowerShell)

### cmd and tcc   {#cmd_and_tcc}

Just enable [Inject ConEmuHk](ConEmuHk.html) feature.
ConEmu will maintain **CD** for you automatically.


### bash and some other cygwin shells   {#bash_and_other_cygwin_shells}

You need to tell bash to run `ConEmuC -StoreCWD` command
each time its prompt executed.
For example, add to your `.bashrc`

~~~
PROMPT_COMMAND='ConEmuC -StoreCWD'
~~~


### zsh   {#zsh}

For zsh just add this to your `.zshrc` file.

~~~
prmptcmd() { eval "$PROMPT_COMMAND" }
precmd_functions=(prmptcmd)
PROMPT_COMMAND='ConEmuC -StoreCWD'
~~~


### PowerShell   {#PowerShell}

You need to modify your profile to override prompt function. Just run in your PowerShell prompt:

~~~
notepad $Profile
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
