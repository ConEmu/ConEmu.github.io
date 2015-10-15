---
---

# Clear Screen

When you need to clear your screen, just issue proper command in your shell. cmd, bash, PowerShell, or dozens of other console applications have either "clear" or "cls". Moreover, many of them respond to Ctrl+L hotkey.

It doesn't matter are you working in ConEmu or any other terminal, your shell behavior is the same.

There are requests from our users to add "Clear" command to the ConEmu system menu. These requests are rejects by a simple and logical reason - ConEmu (terminal) do not know what console application is doing. ConEmu able to show application output, but that is all.

Example. You are editing file in vim, and call this mysterious "clear" menu item. What would happen? Your screen would be garbaged. Vim is sure that cursor is located in certain position and all visible lines of text file were printed properly. But after such "external clear" this would not be true.

Another example. Even with cmd or bash. They have printed PROMPT. But after "external clear" there would be not PROMPT! The screen would be absolutely clean, but shell do not know that it must "reprint" PROMPT. It just waits for user input!

One may say: users know when they want to clear screen in appropriate moment. Yep. But that would case garbaged output due to abovementioned reasons.

Resume. To clear your screen do one of the following:
* Issue "clear" or "cls" in your shell.
* Press Ctrl+L or other hotkey, if your shell supports it. Even cmd+clink may do that.
* Restart your tab. Default hotkey is `Win+~`.
