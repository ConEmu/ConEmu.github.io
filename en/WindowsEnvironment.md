---
redirect_from: /ru/WindowsEnvironment.html

title: "ConEmu | Windows Environment Variables"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
  - url: ConEmuEnvironment.html
    title: ConEmu Environment Variables
  - url: ConEmuEnvironment.html#Export_variables
    title: Export variables
---

# ConEmu and Windows Environment Variables

With several exceptions defined in [ConEmuEnvironment](ConEmuEnvironment.html) wiki,
ConEmu inherent all variables from calling process (which is explorer.exe in most cases).

ConEmu does not change variables with exception of `%PATH%`,
defined on the ‘Environment’ settings page,
and all `%ConEmu...%` variables.

**All** other variables are left intact!

That means, if you notice some strange in your environment - find problems on your side.

Some common problems described below.


## Variables doesn't match defined in system settings  {#Variables_doesn't_match_defined_in_system_settings}

Well, sometimes Windows Explorer fails with automatic acceptance of changes
done by user or installation programs. This is known Microsoft behavior.

### Resolution   {#Resolution}

Logoff your Windows session and logon again.



## Something strange with home  {#Something_strange_with_home}

Are you using clink? Is you `%HOME%` point to clink's profile?
You may be using old clink version.
There was an [issue](https://code.google.com/p/clink/issues/detail?id=113)
on old clink's project site about that.

### Resolution   {#Resolution}

* Update clink (if you are using it)
* Use [ProcessExplorer](ProcessExplorer.html) to examine environment variables
  of all parent processes (from your shell and above). That may give you a clue.
