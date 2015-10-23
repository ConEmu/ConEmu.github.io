---
redirect_from:
 - /ru/SettingsDefTerm.html

title: "ConEmu | Settings › Default Term page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: DefaultTerminal.html
   title: The only way to replace default Windows terminal
---

# Settings: Default term

{% comment %}
This page was manually edited
{% endcomment %}

{% comment %} IDD_SPG_DEFTERM {% endcomment %}

![ConEmu Settings: Default term](/img/Settings-DefTerm.png)

<span class="warning">
WARNING!!!  
Enabling this option may cause [false alarms](FalseAlarms.html) in some antiviral programs!!!
</span>

DefTerm feature is described thoroughly in
[docs](DefaultTerminal.html),
only settings are descibed here.


#### Force ConEmu as default terminal for console applications  {#id2515}
Main switch

#### Register on OS startup  {#id2547}
ConEmu may start automatically when you logon. Registered via registry, example is below.
~~~
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]
"ConEmuDefaultTerminal"="\"C:\\Tools\\ConEmu\\ConEmu.exe\" /SetDefTerm /Detached /MinTSA /Exit"
~~~

#### Leave in TSA  {#id2627}
If checked, ConEmu will not terminates after all [hooked processes](#id2516)
are hooked. Instead, ConEmu will minimize to the [TSA](ConEmuTerms.html#TSA),
to speed up terminal startup when you run [console application](ConsoleApplication.html).

#### Aggressive mode  {#id2684}
If enabled, running ConEmu instance will not be required for hooking new processes.
One already [hooked process](#id2516), e.g. ‘Explorer.exe’, will be enough.

#### List of hooked executables or window class names  {#id2516}
Delimit them by `|`. For example:
~~~
explorer.exe|devenv.exe|totalcmd.exe|TaskManagerWindow|codeblocks.exe|lazarus.exe|gdb.exe
~~~

Don't forget to press **[Apply](#id2865)** and **[Save settings](Settings.html#id1610)** buttons after
making changes.

#### Apply  {#id2865}
Certain information is required to be written in the registry.
That is because [hooked processes](#id2516) do not know anything
about ConEmu and its [settings](ConEmuXml.html) location.
An example below.
~~~
[HKEY_CURRENT_USER\Software\ConEmu]
"DefTerm-Agressive"=dword:00000000
"DefTerm-ConEmuExe"="C:\\Tools\\ConEmu\\ConEmu.exe"
"DefTerm-NewWindow"=dword:00000001
~~~

#### Don't use ConEmuHk.dll in started console  {#id2518}
That may be useful if you want to minimize ConEmu's influence
on your debugging application.

#### Use existing ConEmu window if available  {#id2661}
Uncheck this box if you want to run you application in new ConEmu window.

#### Enable logging of hooked processes (debug purposes)  {#id2866}
For debugging and reporting purposes you may tick this box.
More information [here](LogFiles.html#Logging_in_DefTerm).


## Confirm close (Press Enter or Esc to close console)  {#id2660}

If your application just prints some information and exits,
usually you have to set breakpoint in your debugger on the last line of
your code or add some code to ‘Press enter to exit’.
With ConEmu's confirmation you will not lose your output anymore.

#### Automatic  {#id2519}
Some heuristics is used. Choose [**Always**](#id2520) if it is not enough.
#### Always     {#id2520}
Show confirmation.
#### Never      {#id2521}
ConEmu tab will be closed automatically.
