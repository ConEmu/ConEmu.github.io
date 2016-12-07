---
redirect_from:
 - /ru/BadIssue.html

title: "ConEmu | Bad issues has no value"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback

readalso:
 - url: ThirdPartyProblems.html
   title: Third-party problems
 - url: SearchBeforePost.html
   title: Search before post
 - url: OldBuild.html
   title: Old Builds
 - url: LogFiles.html
   title: Log Files
---

# Bad issues has no value

After many issues and mails received, the question appeared:
why some users do not even read what they posting?

If reporter wants to help developer make the application better,
or reporter wants some fix in the application,
they have to provide enough information to reproduce or locate the problem.

Software has a great deal of lines of code and
it is impossible to fix something abstract...

* [Be verbose](#Be_verbose)
* [Software version](#Software_version)
  * [Update your installation](#Update_your_installation)
* [OS version](#OS_version)
* [Screenshot](#Screenshot)
* [Log files](#LogFiles)
* [Text of the error](#Text_of_the_error)
* [Assertions are not crashes!](#Assertions)
* [Crash dumps](#Crash_dumps)



## Be verbose  {#Be_verbose}

Appreciating yours reporting efforts, but
**only properly prepared issues are meaningful**.

Bad issues has no sense, developers can't fix them and
reporters waste their time (both reporters and developers).

Few examples.

* There was some error, but I will not tell you what exactly.
* I was doing something, do not remember what, and application crashes.
* Crash.

Supply as many information as you can.
Your [Windows](#OS_version) and [ConEmu versions](#Software_version),
[screenshots](#Screenshot) of the problem,
step-by-step description.
Additional information,
such as [settings](ConEmuXml.html) and [log files](LogFiles.html),
will be appreciated.




## Software version  {#Software_version}

One of the most significant information, omitted by many reporters.
And do not say ‘I'm using last version’.
Only numbers, please!

ConEmu version is visible in the [status bar](StatusBar.html),
[Settings](Settings.html) or [About](AboutDialog.html) dialogs.
Just press `Win+Alt+A` to be sure ([SystemMenu](SystemMenu.html) \ Help \ About).




### Update your installation  {#Update_your_installation}

If you are using old build, there is big chance
that your problem was fixed already.
Why not to update?

Note, if you are using third-party bundles (like cmder)
you may not using latest build.
There is ConEmu [internal updater](UpdateModes.html).
Just call it from [SystemMenu](SystemMenu.html) \ Help \ Check for updates.
Or visit download page at [FossHub](http://www.fosshub.com/ConEmu.html).

Also, thanks to googlecode for stopping Download service,
if you are using **very old build** (pre 140115)
ConEmu may be **automatically** updated in **two steps** only.




## OS version  {#OS_version}

The Windows version matter!
From version to version Windows behavior differs.
And there are serious [MicrosoftBugs](MicrosoftBugs.html),
wich may be fixed my Microsoft only.
Fortunaterly, in the most cases developer can create some workaround.




## Screenshot  {#Screenshot}

Doesn't matter how do you create screenshots, but they must be descriptive.
Personally, I prefer [ShareX](http://getsharex.com/) to make screenshots.
You may use any other program.
Or simply press `PrintScreen`, run `MSPaint` from `Win+R` and press `Ctrl+V`.

Full-sized screenshot may tell about the problem more than you can imagine.
Reporter may omit something from the problem description,
but screenshot will not omit anything.

### Screenshot Requirements  {#Screenshot-Requirements}

* Do not cut them!
* Do not downscale (resize) them!
* Do not hide [Status bar](StatusBar.html)!




## [Log Files](LogFiles.html)  {#LogFiles}

How to create log files is described thoroughly [here](LogFiles.html).

In brief, you have to run `ConEmu -log`, reproduce the problem,
**Zip** logs and upload them into [DropBox](DropBox.html) for example.
Post your links to the issue.

1. Please, don't post huge log files to issues comments!
   A great deal of lines with debug information makes
   your issue unintelligible. Moreover, your log files
   will be trimmed most probably!
2. Please, don't concatenate all files to single one!
   Developer needs all files created by application,
   they are written simultaneously and concatenating them
   will make them unreadable.




## Text of the error  {#Text_of_the_error}

If the error message box appears, screenshot may helps, of course.
But the text itself will be helpful.

And reporter do not need to re-type the text!
Just press `Ctrl+C` in the dialog box, and its message will be placed
to the Windows clipboard. Tada... Just paste it to the issue text.



## Assertions are not crashes!  {#Assertions}

In [‘Peview’ and ‘Alpha’ builds](VersionComparison.html#release-stages)
ConEmu may show some critical messages called ‘Assertions’.
Check the example below.

~~~
Assertion: ConEmu 161203 [32] PID=1234, TID=12345
C:\Tools\ConEmu\ConEmu.exe
conemu\src\conemu\menu.cpp:2441
-----------------------
FALSE && "This is RELEASE test assertion"
-----------------------

Press <Ignore> to continue your work.

Press <Abort> to throw exception, ConEmu will be terminated!

Press <Retry> to copy text information to clipboard
and report a bug (open project web page).
~~~

**These are not crashes of ConEmu**!

If fact, these messages shows that something unexpected happened.

For example, if the ‘conhost.exe’ was crashed user may receive
the assertion message ‘nNewWidth>0 && nNewHeight>0’.
The ‘conhost.exe’ is Microsoft process and ConEmu does not inject
any code into that process, so actually any crashes of ‘conhost.exe’
have to be reported to Microsoft directly. ConEmu can't be responsible
for [Microsoft Bugs](MicrosoftBugs.html).

Assertion may appear in some race condition too. For example
if the tab in ConEmu was closed before ‘ConEmuC.exe’ process was terminated
properly, user may be notified that ‘tab not found’.

**Assertions are disabled in [Stable](VersionComparison.html#stable) build**
since [build 161206](https://conemu.github.io/blog/2016/12/06/Build-161206.html).



## Crash dumps  {#Crash_dumps}

When crash or assertion occures, automatically created
[crash dump](CrashDump.html) will be very helpful!
In most cases, Memory Dump may tell developer the exact location
and conditions of the problem.

Due to large size of created dumps, do not upload/attach them to the issues.
Upload them to [DropBox](DropBox.html) or any other hosting and post the link.
Use email if you do worry about availability to public.
