---
redirect_from: /ru/PowershellPrompt.html

title: "ConEmu | Extending Powershell Prompt"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: CmdPrompt.html
   title: "Configuring Cmd Prompt"
 - url: PromptAtTheBottom.html
   title: "Hold Shell Prompt at the Bottom"
---

# Extending the Powershell Prompt

Do you want to see your current powershell location
(directory, etc.) in the ConEmu tab title?
You can do it. Tab title will be updated each time
powershell print your prompt.

Open your profile in the editor, Notepad for example

~~~
New-Item -ItemType directory -Path (Split-Path -Parent $profile) -Force
New-Item -ItemType file -Path $profile
notepad $profile
~~~


### Prepare prompt for ConEmu

The following function will pass some crucial information to ConEmu,
which can not be obtained by ConEmu automatically.

* When the prompt ends and user input starts.
  Required to select typed command properly with "Shift+Home" and
  to change cursor position in the prompt by simple mouse click.
* Current PowerShell's working directory (FileSystem only).
  ConEmu may show full path or just current folder name
  in the Tab label (check Tab templates).
  Also this knowledge is crucial to process ‘hyperlinks’ clicks
  on files in the output from compilers and source control
  systems (git, hg, ...)

~~~
function prompt
{
  $loc = Get-Location

  # Emulate standard PS prompt with location followed by ">"
  $out = "PS $loc> "

  # Simple check for ConEmu existance and ANSI emulation enabled
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



### Few more examples with GuiMacro

Add following function to change (rename) ConEmu Tab title each time prompt appears.

These are just GuiMacro usage examples, the Tab title may be perfectly processed
by prompt function suggested above.

~~~
function prompt
{
  & "$env:ConEmuBaseDir\ConEmuC.exe" "/GUIMACRO", 'Rename(0,@"'$(Get-Location)'")' > $null
  return "PS " + $(Get-Location) + ">"
}
~~~

or use following code to change console title, but not only tab title

~~~
function prompt
{
  & "$env:ConEmuBaseDir\ConEmuC.exe" "/GUIMACRO", 'Rename(1,@"'$(Get-Location)'")' > $null
  return "PS " + $(Get-Location) + ">"
}
~~~
