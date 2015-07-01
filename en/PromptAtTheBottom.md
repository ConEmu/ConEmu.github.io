---
redirect_from: /ru/PromptAtTheBottom.html

title: "ConEmu | Hold Shell Prompt at the Bottom"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# Hold Shell Prompt at the Bottom

Do you want to get your cmd.exe prompt bottom aligned?
On ConEmu startup and after "cls"?


<h2 id="Far_Manager"> Far Manager </h2>

Actually, I can't understand why anyone use cmd as shell but not a [FarManager](FarManager.html).
It's a fast, handy and powerfull combination of:

* command prompt (you may run any console or GUI application from its prompt,
  any %COMSPEC% commands, can be integrated with powershell);
* two pane file manager (copy/move files, create directories and hard links,
  browse remote hosts, and so on); you have no need in file manager?
  are you sure you are working on your PC?
* powerful and fast editor with syntax highlighting;
* dozens of miscellaneous plugins for anyone taste and purpose;

Try it! [Download](http://www.farmanager.com/download.php?l=en) and install into ConEmu's folder
(put far.exe near to ConEmu.exe) and run it.
If you don't need panels on startup (really?) - press **Ctrl+O**, **Ctrl+B**
and save configuration changes **Shift+F9**.
You will get command prompt with permanent history (Alt+F8).


<h2 id="Plain_cmd.exe"> Plain cmd.exe </h2>

OK. If you still want use plain "cmd.exe" - here is one trick
using [AnsiEscapeCodes](AnsiEscapeCodes.html).

<h3 id="Set_up_your_task"> Set up your task </h3>

![cmd.exe prompt at the bottom - 1](/img/PromptAtBottom1.png "Prompt at the bottom of ConEmu window")


<h3 id="Choose_it_as_startup_task"> Choose it as startup task </h3>

![cmd.exe prompt at the bottom - 2](/img/PromptAtBottom2.png "Prompt at the bottom of ConEmu window")


<h3 id="Prompt_will_appears_at_the_bottom"> Prompt will appears at the bottom </h3>

![cmd.exe prompt at the bottom - 3](/img/PromptAtBottom3.png "Prompt at the bottom of ConEmu window")
