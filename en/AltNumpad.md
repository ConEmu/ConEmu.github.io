---
redirect_from:
 - /ru/AltNumpad.html

title: "ConEmu | Enter characters with Alt+Numpad"

description: "How to enter OEM/ANSI/Unicode characters using Alt+Numpad"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls

readalso:
 - url: TableOfContents.html#controls
   title: "Keyboard and Mouse in ConEmu"
 - url: UnicodeSupport.html
   title: "Unicode support in ConEmu"
 - url: https://msdn.microsoft.com/en-us/goglobal/bb964658.aspx
   title: "Alt+Numpad in Microsoft glossary"
---

# Enter Unicode craracters with Alt+Numpad

There are over million of [Unicode characters](http://www.unicode.org/charts/)
and it's obviously impossible to place all of them on the standard 101-keys
keyboards.

Alt+Numpad helps. Using this method you may enter any character by its number.
Turn on `NumLock`, hold down **left** `Alt` key (**not** an `AltGr`),
and type type number.

**Note** All **numbers** must be entered **on the numpad**
(numeric keypad, right part of keyboard) with `NumLock` **turned on**!
With exception of hexadecimal `A`..`F`, of course they are entered
on the main keyboard part.

* [Unicode: ‘Alt’-‘+’-‘xxxx’](#alt-xxxx)
* [‘Alt’-‘0ddd’ or ‘Alt’-‘ddd’](#alt-decimal)
  * [ANSI: ‘Alt’-‘0ddd’](#alt-0ddd)
  * [OEM: ‘Alt’-‘ddd’](#alt-ddd)


## Unicode: ‘Alt’-‘+’-‘xxxx’  {#alt-xxxx}

This method allows to enter character by its **hexadecimal** number.
Find character codebase on the [www.unicode.org](http://www.unicode.org/charts/).

* Hold `Alt`;
* press `+` on the numeric keypad (aka `GrayPlus`);
* enter unicode ‘codebase’, up to four hex numbers;
* release `Alt`.

For example, to enter Russian capital ‘Я’ press `Alt`-`+`-`42F`.

Another example, to enter ‘£’ press `Alt`-`+`-`A3`.

**Note** To enable this method in Windows you must ensure that your
registry has been set up properly. If not, change registry and re-logon.

~~~
[HKEY_CURRENT_USER\Control Panel\Input Method]
"EnableHexNumpad"="1"
~~~

## ‘Alt’-‘0ddd’ or ‘Alt’-‘ddd’  {#alt-decimal}

Enter character by its decimal codepoint in ANSI or OEM.
In theory, Windows uses system ACP and OEMCP to convert
entered codebases to characters, but how it works in the
real life... check yourself.

To check what is your ACP and OEMCP look at
[About/SysInfo](AboutDialog.html#About-SysInfo.png).


### ANSI: ‘Alt’-‘0ddd’  {#alt-0ddd}

* Hold `Alt`;
* **press `0` on the numeric keypad**;
* enter **ANSI** ‘codebase’,  up to three decimal numbers;
* release `Alt`.

Example: `Alt`-`096` types ‘Grave Accent’.

**Note** Strangely, I can't find a way to enter Russian characters
using this method, regardless the fact my ACP is 1251 and ‘Russian’
was set as default for non-unicode applications in regional settings.


### OEM: ‘Alt’-‘ddd’  {#alt-ddd}

* Hold `Alt`;
* enter **OEM** ‘codebase’, up to three decimal numbers;
* release `Alt`.

Example: `Alt`-`240` types Russian capital ‘Ё’ if OEMCP is 866.

