---
redirect_from:
 - /ru/ClearScreen.html

title: "ConEmu | Clear Screen"

breadcrumbs:
 - url: TableOfContents.html#extras
   title: Extras

readalso:
 - url: TerminalVsShell.html
   title: "Terminal vs Shell"
 - url: CygwinMsysConnector.html
   title: "cygwin/msys connector"
 - url: RoadMap.html
   title: "RoadMap"
---

# Clear Screen

When you need to clear your screen, just issue proper command in
your shell. cmd, bash, PowerShell, or dozens of other console
applications have either `clear` or `cls`. Moreover, many of them
respond to `Ctrl+L` hotkey.

It doesn't matter are you working in ConEmu or any other terminal,
your shell behavior is the same.


## ‘Clear’ command in the ConEmu menu  {#clear-command}

There are requests from our users to add ‘Clear’ command to the
ConEmu [system menu](SystemMenu.html).

[References](https://github.com/Maximus5/ConEmu/issues?q=is:issue clear screen label:status-rejected]):
[gh-550](https://github.com/Maximus5/ConEmu/issues/550),
[gh-372](https://github.com/Maximus5/ConEmu/issues/372),
[gh-234](https://github.com/Maximus5/ConEmu/issues/234).

These requests are rejects by a simple and logical reason - ConEmu
(terminal) do not know what console application is doing. ConEmu
able to show application output, but that is all.

### Reason 1  {#reason-1}

You are editing file in vim, manage your files with Far Manager,
or do something else not related to simple ‘read-line-execute-command’,
and call this mysterious ‘clear’ menu item. What would happen?

Your screen would be garbaged.

Console app is sure that cursor is located in certain position and all
visible lines of text file were printed properly. But after such
‘external clear’ this would not be true.

### Reason 2  {#reason-2}

Even with cmd or bash. They have printed PROMPT.
But after ‘external clear’ there would be no PROMPT! The screen
would be absolutely clean, but shell do not know that it must
‘reprint’ PROMPT. It just waits for user input!

### Reason 3  {#reason-3}

One may say: users know when they want to clear screen in
appropriate moment. Yep. But that would case garbaged output due to
abovementioned reasons.

### Reason 4  {#reason-4}

Not related to the terminals, but it may serve as obvious example.

Imagine, that Windows would have a hotkey to Clear The Monitor.
What shall it do? Fill screen with black color. And how do you think
running applications and Windows would look after that? Garbage,
rubbish and more.

### Reason 5  {#reason-5}

In the [Issue 550](https://github.com/Maximus5/ConEmu/issues/550)
I been noted about ‘example’ of the feature implementation in the Tera Term.

Well, I have tried both local cygwin connection and remote ssh to Ubuntu
in the Tera Term, and it just doesn't work.

* Connect (to cygwin or remote via ssh)
* Execute `ls`
* Call menu item ‘Reset terminal’
* Get fail
  * Cursor jumps to the {0,0} and that's all!
  * Screen is not cleared!
  * Prompt is not re-printed!


## Resume  {#resume}

To clear your screen do one of the following:

* Issue `clear` or `cls` in your shell.
* Press `Ctrl+L` or other hotkey, if your shell supports it. Even cmd+clink may do that.
* Restart your tab. Default hotkey is `Win+~`.
