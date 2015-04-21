---
redirect_from: /ru/GitForWindows.html

title: "ConEmu | Using Git for Windows"

description: "Some hints about setting up Git for Windows in ConEmu"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: SolarizedColors.html
   title: Solarized color scheme
---

# Using Git for Windows

## cygwin_exception in less.exe

Just updated my git to `PortableGit-2.3.5.8-dev-preview-32-bit.7z.exe` and bumped into strange exception.

~~~
2 [main] less 3872 cygwin_exception::open_stackdumpfile: Dumping stack trace to less.exe.stackdump
~~~

The exception actually happens at `msys-ncursesw6.dll!664465b1`.

After some investigations found how to fix that.
The problem was in `TERM` environment variable, it was set to `msys`.
After removing that variable (clearing it) git's less begins to work normally.
