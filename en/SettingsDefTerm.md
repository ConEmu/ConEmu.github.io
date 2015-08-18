---
redirect_from:
 - /ru/SettingsDefTerm.html

title: "ConEmu | Settings › Default Term page"

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

DefTerm feature is described thoroughly in
[docs](DefaultTerminal.html),
only settings are descibed here.

## WARNING!!! Enabling this option may cause false alarms in antiviral programs!!!

**Force ConEmu as default terminal for console applications**
Main switch

**Register on OS startup** 

**Leave in TSA** 

**Aggressive mode**
If enabled, running ConEmu instance will not be required for hooking new processes.
One already hooked process, e.g. ‘Explorer.exe’, will be enough.

**List of hooked executables or window class names**
Delimited them by `|`. For example:
~~~
explorer.exe|devenv.exe|totalcmd.exe|TaskManagerWindow|codeblocks.exe|lazarus.exe|gdb.exe
~~~

Don't forget to press **Apply** and **Save settings** buttons after
making changes.

**Don't use ConEmuHk.dll in started console** 
That may be useful if you want to minimize ConEmu's influence
on your debugging application.

**Use existing ConEmu window if available**
Uncheck this box if you want to run you application in new ConEmu window.

**Enable logging of hooked processes (debug purposes)**
For debugging and reporting purposes you may tick this box.
More information [here](LogFiles.html#Logging_in_DefTerm).


## Confirm close (Press Enter or Esc to close console)

If your application just prints some information and exits,
usually you have to set breakpoint in your debugger on the last line of
your code or add some code to ‘Press enter to exit’.
With ConEmu's confirmation you will not lose your output anymore.

* **Automatic**: Some heuristics is used. Choose **Always** if it is not enough.
* **Always**: Show confirmation.
* **Never**: ConEmu tab will be closed automatically.
