---
redirect_from: /ru/CrashDump.html

title: "ConEmu | Crash Dump"

readalso:
 - url: MemoryDump.html
   title: "Creating memory dumps"

breadcrumbs:
 - url: TableOfContents.html#feedback
   title: Feedback
---

# Reporting ConEmu crashes

ConEmu is stable enough.

**Note!** I often receive reports related to several
[MicrosoftBugs](MicrosoftBugs.html).
If you see the crash, please read [wiki](MicrosoftBugs.html)
and make sure [Inject ConEmuHk](ConEmuHk.html) feature is enabled!

Well, if any unknown crash was occured in `ConEmu` or `ConEmuC` processes,
[MemoryDump](MemoryDump.html) may greatly help to locate and fix the problem.

Crashes in `ConEmu[64].exe` and `ConEmuC[64].exe` are handled automatically
and application suggests to user (message box) to create
[MemoryDump](MemoryDump.html) (full or mini).
Due to limitation of issues attachments, please upload **zipped** dumps to
[DropBox](DropBox.html) or any other hosting and post the link
to issues or via email.

ConEmu does not handle crashes (exceptions actually) in the running console applications.
That is because to minimize intrusion to running application.

If you need to create dump manually (of any ConEmu's processes or console application)
please read that [wiki](MemoryDump.html).
