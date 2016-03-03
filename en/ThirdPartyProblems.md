---
redirect_from:
 - /ru/ThirdPartyProblems.html

title: "ConEmu | Third-party software problems"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: BadIssue.html
   title: Bad issues has no value
 - url: SearchBeforePost.html
   title: Search before post
 - url: OldBuild.html
   title: Old Builds
---

# Third-party software problems

Before posting problems to the ConEmu issue tracker,
you have to be sure that you issue belongs to ConEmu,
but not to any **third-party software**!

For example, if you bump into some rendering problem in **Chromium**,
you would not try to report the problem to **Microsoft**, because you
run the browser in Windows, would you? Does it make sense?

Same with ConEmu. It's a **[terminal](TerminalVsShell.html)**,
it just shows output of spawned [console applications](ConsoleApplication.html).
Obviously, if third-party console application produces broken output,
ConEmu can't magically make this output valid.

Also, if you run [ChildGui](ChildGui.html) application (PuTTY, mintty, and so on)
ConEmu does not control their behavior, and does not process their keyboard
or mouse input. Use of ‘native’ [console analogues](ConsoleApplication.html)
is preferable.

* [Check third-party software stand-alone](#stand-alone)
* [Run your shell without profile](#bare-shell)
* [Note about DefaultTerminal](#defterm)



## Check third-party software stand-alone  {#stand-alone}

First thing you have to do - run you application outside of ConEmu.
Keep in mind few things!

* Run your application (shell) with same switches and environment as in ConEmu!
  Obviously, this is critical.
  * For example, the behaviour of `cmd.exe` is different, when you run it with `/v` switch,
    or you have specified cmd startup script with `/k` switch.
  * Third-party extensions (like [clink for cmd](TabCompletion.html#ConEmu_and_clink),
    or [PSReadLine for PowerShell](TabCompletion.html#PowerShell))
    changes the behavior of the shell too.
* Run your application in the [Standard Windows terminal](RealConsole.html)
  using same console window and buffer sizes. A lot of problems ‘magically’
  disappear when console window size is lesser than some value, hard-coded
  in the third-party software.
* There is [Environment Settings page](SettingsEnvironment.html), where you may predefine
  [environment variables](WindowsEnvironment.html), [desired code page](UnicodeSupport.html),
  and some other initializations. Take them into account too.



## Run your shell without profile  {#bare-shell}

When your [shell](ConsoleApplication.html) starts up, it reads its configuration from ‘profile’.
In theory, this operation must not depends on ConEmu existence, but you may try to
[run your shell without profile](FaqPlainShell.html). Refer to your shell documentation.



## Note about DefaultTerminal  {#defterm}

If you have eneable [Default Terminal](DefaultTerminal.html) feature,
and you want to run [console application](ConsoleApplication.html)
from `Win+R` in the [Standard Windows terminal](RealConsole.html),
just add `-new_console:z` to command line.
