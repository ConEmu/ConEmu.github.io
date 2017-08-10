---
redirect_from:
 - /ru/SettingsDebug.html

title: "ConEmu | Settings › Debug page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings

readalso:
 - url: LogFiles.html
   title: Log Files
 - url: ProcessMonitor.html
   title: Process Monitor
 - url: ProcessExplorer.html
   title: Process Explorer
---

# Settings: Debug

{% comment %}
This page was manually edited
{% endcomment %}

{% comment %} IDD_SPG_DEBUG {% endcomment %}

![ConEmu Settings: Debug](/img/Settings-Debug.png)

This settings page may be very useful for troubleshoting.

Just open [Settings dialog](Settings.html),
activate ‘Debug’ page and choose one of activity logging
modes (read their descriptions below).

Than, reproduce your problem - run the command in your shell started in ConEmu tab,
export captured lines to `*.csv` file by pressing `Save as...` button,
upload the file to [DropBox](DropBox.html) or create a [gist](https://gist.github.com/),
post links to your issue.

**NB** Don't close Settings dialog or Debug page during problem repro!
When you close Debug page logging is stopped automatically!


### Capture modes

Some modes may be not implemented because this page was intended
for internal purposes, or troubleshooting on user side by request only.

* **Disabled** Disable debug logging. This implies on ‘Settings’ dialog close.
* **Shell** Log shell calls (progress creations, library loadings, etc.) [Inject ConEmuHk](ConEmuHk.html) is required.
* **Input** Log keyboard and mouse activities including XTerm sequences.
* **Cmd** Log internal ConEmu (GUI<-->Server) calls.
* **Ansi** *Deprecated* Instead you may turn on [Log console output](SettingsFeatures.html#id2679).
* **Debug** Automatically attach ConEmu debugger to all started processes.


### Buttons

**Reset** Clear captured lines.

**Save as...** Save captured lines to `*.csv` file.
