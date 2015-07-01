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
new-item -itemtype file -path $profile
notepad $profile
~~~

Add following function to change (rename actually) ConEmu tab each time prompt appears

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
