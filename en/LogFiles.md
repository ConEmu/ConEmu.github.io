---
redirect_from:
 - /ru/LogFiles.html

title: "ConEmu | Debug Log Files"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: Issues.html
   title: "Contacts, Feedbacks, Suggestions"
 - url: BadIssue.html
   title: "Bad issues has no value"
---

# LogFiles

There are several types of ‘Log Files’. Usually, when you report and issue
developer asks for ‘Debug log files’ which are enabled by `-log` switch.

But there is also logging of console output, [see below](#Log_console_output).

* [Why LogFiles are needed](#Why_they_are_needed)
  * [How to start logging](#How_to_start_logging)
  * [Where log files are created](#Where_log_files_are_created)
  * [Start logging with ‘Default Terminal’](#Logging_in_DefTerm)
  * [Posting files to issues](#Posting_to_issues)
* [Log console output](#Log_console_output)


<h2 id="Why_they_are_needed"> Why LogFiles are needed </h2>

When user reports a problem, frequently, developer needs more information
than user may tell. ConEmu may write internal information in text form into log files.


<h3 id="How_to_start_logging"> How to start logging </h3>

Run `ConEmu.exe` or `ConEmu64.exe` (whatever you are using)
with special switch `-log`.

How to do that? Simpliest way is to press **Win+R**, type (or browse)
in edit field full path to `ConEmu.exe` or `ConEmu64.exe` and
append `-log` switch. There are also `-log2`, `-log3` and `-log4` alternatives.
Larger digit - more information will be written - ConEmu will run slower.



<h3 id="Where_log_files_are_created"> Where log files are created </h3>

This depends of when program folder is write-allowed.
For example, running as normal user any program can't write to `C:\Program Files`.

#### If program folder is locked (read-only)

ConEmu will create on your desktop new folder named `ConEmuLogs`
and write information to `ConEmu*.log` files there.

#### If program folder is write-allowed

ConEmu will create `ConEmu*.log` files near to executable file.
Note, that there are `ConEmuC.exe` and `ConEmuC64.exe` in the `ConEmu` subfolder.



<h3 id="Logging_in_DefTerm"> Start logging with ‘Default Terminal’ </h3>

When you are using [Default Terminal](DefaultTerminal.html) feature,
you may enable logging for [hooked processes](SettingsDefTerm.html).
These are usually `explorer.exe`, `devenv.exe` and so on, in other words,
the programs **from** which you are starting console applications,
which you want to run in ConEmu.

So, to enable logging in ‘DefTerm applications’ you need
to tick checkbox ‘Enable logging of hooked processes’,
and save your settings.

**Please note**, log files in this case are created on the Desktop
in the `ConEmuLogs` folder.



<h3 id="Posting_to_issues"> Posting files to issues </h3>

1. Please, don't post huge log files to issues comments!
2. Please, don't concatenate all files to single one!

Instead, please zip them into one archive and upload to [DropBox](DropBox.html)
or any other hosting and post only link to the issue.



<h2 id="Log_console_output"> Log console output </h2>

Don't confuse this with log files created by `-log` switch.

On the [Settings / Features](SettingsFeatures.html) page you may enable
logging of console applications output. By default logging is disabled,
and suggested folder to store log files is `%ConEmuDir%\Logs\`
(read about [environment variables](ConEmuEnvironment.html)).

Please note, that when you tick checkbox ‘Log console output’ it
will affect newly created consoles only.
