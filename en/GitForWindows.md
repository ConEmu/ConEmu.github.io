---
redirect_from: /ru/GitForWindows.html

title: "ConEmu | Using Git for Windows"

description: "Some hints about setting up Git for Windows in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: SolarizedColors.html
   title: Solarized color scheme
 - url: SettingsConfirm.html
   title: "Settings › Confirm page"
 - url: StartupDir.html
   title: Startup Directory
 - url: Tasks.html
   title: "Tasks: Set up your favourite shells"
---

# Using Git for Windows

Native and full-featured set of [Git SCM](http://git-scm.com/) tools.

* [Version 2.x.x](https://git-for-windows.github.io/)
* [Version 1.9.5 (deprecated)](https://github.com/msysgit/msysgit/releases)


## Contents  {#Contents}

* [Starting shell](#start-shell)
  * [Use proper sh.exe from version 2.x](#proper-sh)
* [Colorizing fix for Solarized color scheme](#Solarized)
* [Useful aliases](#aliases)
* [Fix `git diff` output](#git-utf8)
* [Use Far Manager as editor](#FarManager)
* [cygwin_exception in less.exe](#cygwin-exception)
* [Git Credential Manager for Windows](#credentials)



## Starting shell  {#start-shell}

Git-for-Windows package provides a lot of msys tools,
useful for users used to Unix environment. So, anyone
may easily run `bash.exe` prepared for Git environment.

~~~
git-cmd.exe --no-cd --command=usr/bin/bash.exe -l -i
~~~

When you start ConEmu first time, it will create a task `{Git bash}`
with similar contents.

Also, you may run in ConEmu tab `git-bash.exe`, but this is not recommended,
because it runs `mintty.exe`, which is another terminal, actually.
And of course, ConEmu can't change behavior and appearance
of [ChildGui](ChildGui.html) applications.



### Use proper sh.exe from version 2.x  {#proper-sh}

**NB** Don't run `/bin/sh.exe` as your shell ([root process](RootProcess.html))
in ConEmu tab! This is just a wrapper for ‘full version’ located in `/usr/bin/`
folder. That's why ConEmu will not be able to determine if your tab has running
process, or there is a shell only.

Run `/usr/bin/sh.exe -l -i` to get proper behavior of
[tab closing confirmation](SettingsConfirm.html#id2756)
option.


{% include in_article.html %}



## Colorizing fix for Solarized color scheme  {#Solarized}

Fix for [Solarized color scheme](SolarizedColors.html).

~~~
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"

git config --global color.interactive.prompt "white cyan"
git config --global color.diff.meta "cyan"
~~~



## Useful aliases  {#aliases}

~~~
# Colorized one-line with hash, author, date:time, tags and commit message
git config --global alias.tree 'log --graph "--date=format:%y%m%d:%H%M" "--pretty=format:%C(auto)%h%d %C(bold blue)%an %Cgreen%ad  %Creset%s"'
# Simpler one-liner, useful with sort by date
git config --global alias.log-date 'log "--date=format:%y%m%d:%H%M" "--pretty=format:%Cgreen%ad %C(auto)%h %C(bold blue)%an  %Creset%s"'
~~~

And few shell aliases to call these git aliases (.

~~~
alias gl="git tree"
alias gl1="git tree -1"
alias gl10="git tree -10"
alias glb="git tree --branches --date-order"
alias glbr="git tree --branches --date-order --remotes"
alias gld="git log-date --author=mxmmsk --branches | sort -r | less"
~~~

Few more shell aliases from my config.

~~~
alias gcim="git commit -m"
alias gcn!="git commit --amend --no-edit"
alias gst="git status"
alias gbr="git branch"
alias grbc="git rebase --continue"
~~~



## Fix `git diff` output  {#git-utf8}

To fix `git diff` output when you see character codes in angle brackets instead of non-english letters
(e.g. `<D0><9F><D0><BE><D0><B4><D1><82>...`) setting the `LANG` environment to soft of **UTF-8** locales may help.

~~~
set LANG=en_US.UTF-8
~~~



## Use Far Manager as editor  {#FarManager}

I use [FarRun](https://github.com/Maximus5/FarPlugins/releases/tag/FarRun-1.1s)
to simplify `core.editor` configuration (it's used when you edit commit messages,
rebase scripts, etc.)

~~~
git config --global core.editor "farrun -e1:1"
~~~

Hint. Some useful macros: move/swap lines, keys e/f/s to change rebase actions to edit/fixup/squash.



## cygwin_exception in less.exe  {#cygwin-exception}

When updated my git to `PortableGit-2.3.5.8-dev-preview-32-bit.7z.exe` (obsolete build),
bumped into strange exception.

~~~
2 [main] less 3872 cygwin_exception::open_stackdumpfile: Dumping stack trace to less.exe.stackdump
~~~

The exception actually happens at `msys-ncursesw6.dll!664465b1`.

After some investigations found how to fix that.
The problem was in `TERM` environment variable, it was set to `msys`.
After removing that variable (clearing it) git's less begins to work normally.



## Git Credential Manager for Windows  {#credentials}

As of git `2.x.x`, [Git Credential Manager for Windows](https://github.com/Microsoft/Git-Credential-Manager-for-Windows) is used as a shell-integrated authentication mechanism supporting both password-only and 2-factor authentication.

In certain cases, terminals like `cmd` and `powershell` spawned by `ConEmu` may
[encounter problems](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/issues/502)
when running `git pull` or `git push`. Git fails with a `Win32Exception` ("Failed to write credentials")
if the terminal user does not have access to the OS provided credential vault. You can check for such a
constellation by running the following command within a `ConEmu`-spawned `powershell` terminal. 

```
[Security.Principal.WindowsIdentity]::GetCurrent()
```

Output:

```
AuthenticationType : Kerberos
ImpersonationLevel : None
IsAuthenticated    : True
IsGuest            : False
IsSystem           : False
IsAnonymous        : False
...
Owner              : S-1-5-32-***
User               : S-1-5-21-1801674531-***
...
```

If the displayed `SID`s for `User` and `Owner` differ, you encounter an impersonation problem.
`git push` and `git pull` can only be run correctly if the two `SID`s are equal.
The most likely [reason](https://github.com/Maximus5/ConEmu/issues/1313#issuecomment-342789949) is
that `ConEmu` root process was started from startup script or Windows Task Scheduler with different
user impersonation than logon user you are trying to use `git` from. Or you started the `ConEmu.exe`
using ‘Run as administrator’ context menu item from Windows Explorer.

Validate this guess by opening the `ConEmu` ["New console..." window](LaunchNewTab.html).

If `Run as administrator` is checked and greyed out / disabled, your terminals will always be spawned
with root priviliges, no matter which terminal type you select and thus `git` will fail to access
the credential vault.

![image](/img/ConEmuCreateDisabled.png)

**More about the problem**:
- [https://github.com/Maximus5/ConEmu/issues/1313](https://github.com/Maximus5/ConEmu/issues/1313)
- [https://github.com/Microsoft/Git-Credential-Manager-for-Windows/issues/502](https://github.com/Microsoft/Git-Credential-Manager-for-Windows/issues/502)
