---
redirect_from:
 - /en/ConEmu_Clink.html
 - /ru/ConEmu_Clink.html
 - /en/ConEmuClink.html
 - /ru/ConEmuClink.html
 - /ru/TabCompletion.html

title: "ConEmu | Better tab-completion in Windows consoles"

breadcrumbs:
 - url: TableOfContents.html#features
   title: Features
---

# Better tab-completion in Windows consoles

The ConEmu's disclaimer sais: ‘ConEmu is not a shell, so it does not provide
"shell features" like tab-completion, command history and others.’

That means user have to ‘upgrade’ the shell itself to improve its behavior.

* [cmd.exe](#ConEmu_and_clink)
* [powershell.exe](#PowerShell)
* [zsh.exe](#zsh)


*Note*. If you are pasting in the command line prompt a text
containing some Tab characters (ASCII `\x09`),
you may observe weird result of tab-completion in your prompt,
like in the [issue 225](https://github.com/Maximus5/ConEmu/issues/225).

{% include in_article.html %}


## cmd.exe and clink  {#ConEmu_and_clink}

If you are using `cmd.exe` as shell you may try [clink](http://mridgers.github.io/clink/)
for bash style completion and advanced cmd prompt.
ConEmu provides an [option](SettingsFeatures.html) to autoload clink in cmd tabs.

* Download latest [clink](http://mridgers.github.io/clink/)
  or build it yourself from [sources](https://github.com/mridgers/clink#building-clink).
* Unpack **files** (without subfolder) into `%ConEmuBaseDir%\clink`
  (this folder already created by ConEmu installer and contains `Readme.txt`).
  * Please note, clink archive contains subfolder. Files `clink_dll_x86.dll`, `clink_dll_x64.dll`
    (and others, with subfolders may be) must be located in `%ConEmuBaseDir%\clink`.
* Turn on checkbox ‘Use Clink in prompt’ on ‘Features’ page, save settings and restart [ConEmu's tab](RestartTab.html).
* Well, now bash style completion will be available in `cmd.exe` new session.


**Note**. Clink will be called in shell prompt (cmd) if
`ConEmuHk.dll` or `ConEmuHk64.dll` is loaded into shell process.
This will be done for ‘root’ processes (that you specify when creating console)
or when ‘Inject ConEmuHk’ option is checked on ‘Features’ page.
Checked option ‘Inject ConEmuHk’ is required, if you start second-level cmd
from root process, e.g. `cmd /c cmd /k ...`.
Actually, it's not recommended to uncheck ‘Inject ConEmuHk’ at all.


**Note**. If you do not want to store clink in the ConEmu's subfolder,
you may install it standalone using `clink_setup.exe`.
Actually, option ‘Use Clink in prompt’ is not required,
if clink was set up using its installer.

Please refer to
[https://github.com/mridgers/clink](https://github.com/mridgers/clink)
for further information and bugreports.


## PowerShell.exe  {#PowerShell}

There are two nice PowerShell extensions to make its prompt more friendly:

* [PSReadLine](http://github.com/lzybkr/PSReadLine) (preferred)
* [PowerTab](http://powertab.codeplex.com/) (outdated)


## zsh.exe  {#zsh}

Perhaps zsh tab-complition is good enough, but lately I've found the
[openshift](https://blog.openshift.com/openshift-3-tab-completion-for-windows/)
extension. You may try it.
