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
  * [WSL/cygwin/msys shells via PS1](#connector-ps1)
  * [bash and some other cygwin shells](#bash_and_other_cygwin_shells)
  * [zsh](#zsh)
  * [PowerShell](#PowerShell)
  * [Far Manager](#far)



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



### WSL/cygwin/msys shells via PS1 and ANSI   {#connector-ps1}

**Warning!** This options will work only with
[cygwin/msys connector](CygwinMsysConnector.html)!

This is the only option available for [Bash on Ubuntu on Windows](BashOnWindows.html).

Use [ANSI](AnsiEscapeCodes.html#ConEmu_specific_OSC) in `PS1`
environment variable to notify ConEmu about directory changes
and prompt end (command input start).
For example, you may configure your bash by appending
to your `~/.bashrc` following sequence:

~~~
if [[ -n "${ConEmuPID}" ]]; then
  PS1="$PS1\[\e]9;9;\"\w\"\007\e]9;12\007\]"
fi
~~~

**NB** Don't forget to ‘escape’ non-printable parts of `PS1` with `\[` and `\]`.
This is required to avoid weird behavior of readline when you type really long commands.



### bash and some other cygwin shells   {#bash_and_other_cygwin_shells}

**NB**. Dont try this in [Bash on Ubuntu on Windows](BashOnWindows.html).
`ConEmuC.exe` is *native* Windows application which can't be executed by *linux* kernel.

**NB**. Preferred way is using [ANSI sequence](#connector-ps1) described above.

You need to tell bash to run `ConEmuC -StoreCWD` command each time its prompt executed.
For example, add to your `~/.bashrc`

~~~
if [[ -n "${ConEmuPID}" ]]; then
  PROMPT_COMMAND='ConEmuC -StoreCWD'
fi
~~~


### zsh   {#zsh}

**NB**. Dont try this in [Bash on Ubuntu on Windows](BashOnWindows.html).
`ConEmuC.exe` is *native* Windows application which can't be executed by *linux* kernel.

**NB**. Preferred way is using [ANSI sequence](#connector-ps1) described above.

For zsh just add this to your `~/.zshrc` file.

~~~
set_conemu_cwd() { ConEmuC -StoreCWD }
precmd_functions+=set_conemu_cwd
~~~


### PowerShell   {#PowerShell}

You need to modify your profile to override prompt function. Example is below.

Read full article [PowershellPrompt](PowershellPrompt.html) for details.

~~~
function prompt
{
  $loc = Get-Location

  # Emulate standard PS prompt with location followed by ">"
  # $out = "PS $loc> "
  
  # Or prettify the prompt by coloring its parts
  Write-Host -NoNewline -ForegroundColor Cyan "PS "
  Write-Host -NoNewline -ForegroundColor Yellow $loc
  $out = "> "

  # Check for ConEmu existance and ANSI emulation enabled
  if ($env:ConEmuANSI -eq "ON") {
    # Let ConEmu know when the prompt ends, to select typed
    # command properly with "Shift+Home", to change cursor
    # position in the prompt by simple mouse click, etc.
    $out += "$([char]27)]9;12$([char]7)"

    # And current working directory (FileSystem)
    # ConEmu may show full path or just current folder name
    # in the Tab label (check Tab templates)
    # Also this knowledge is crucial to process hyperlinks clicks
    # on files in the output from compilers and source control
    # systems (git, hg, ...)
    if ($loc.Provider.Name -eq "FileSystem") {
      $out += "$([char]27)]9;9;`"$($loc.Path)`"$([char]7)"
    }
  }

  return $out
}
~~~



### Far Manager  {#far}

The [ConEmu plugin](ConEmuFarPlugin.html) have to be loaded in your Far instance.

To ensure the plugin of proper version is loaded in Far Manager,
ConEmu creates [default Task](Tasks.html#add-default-tasks) `{Far}`, just use it.

Supposing Far is installed in `C:\Tools\Far` the `{Far}` task contents is below:

```
set "FARHOME=" & "C:\Tools\Far\far.exe" /w /p"%ConEmuDir%\Plugins\ConEmu;%FARHOME%\Plugins;%FARPROFILE%\Plugins"
```
