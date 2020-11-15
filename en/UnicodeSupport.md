---
redirect_from:
 - /ru/UnicodeSupport.html
 - /ru/CheckUnicode.html
 - /en/CheckUnicode.html

title: "ConEmu | Unicode Support"

description: "ConEmu is a unicode application. It is able to show unicode (e.g. UTF-8 or UTF-16)
   if the console application can produce unicode output."

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks

readalso:
 - url: Tasks.html
   title: "Tasks: Set up your favourite shells"
 - url: CommandLine.html
   title: CommandLine - GUI, Console and Shells switches
 - url: ConEmuEnvironment.html#ConEmuCpCvt
   title: ConEmuCpCvt - hack to force output CP conversion
 - url: ConEmuEnvironment.html#ConEmuDefaultCp
   title: ConEmuDefaultCp - hack to change output CP if you don’t want to use ‘chcp’
---

# Unicode Support

ConEmu is a unicode application.

That means ConEmu is able to show unicode (e.g. UTF-8 or UTF-16)
if the console application (cmd, java, perl, powershell,
bash and so on) can produce unicode output.


* [UTF-8 (UTF8)](#utf-8)
* [On-the-fly conversion (ConEmuCpCvt)](#on-the-fly_conversion)
* [Font charset](#font-charset)
* [Troubleshooting](#troubleshooting)
* [Check if the font used in ConEmu has proper glyphs](#check-proper-glyphs)
  * [What font you are using](#what-font-you-are-using)
  * [Check font glyphs](#Check_font_glyphs)
* [Check if RealConsole is capable to accept unicode](#Check_if_is_capable_to_accept_unicode)
* [Check if your console application is Unicode-aware](#check-your-console-application)
* [ConEmu provide some tests you may run](#some-tests)
  * [CheckUnicode test](#checkunicode-test)
  * [UTF-8 test](#utf-8-test)
* [Some hints](#some-hints)

{% include in_article.html %}



## UTF-8 (UTF8)  {#utf-8}

On Windows, unlike Unix, the console itself is not a stream of
‘bytes’ but a spreadsheet of cells, each of which contains an UTF-16
character and a color attribute.

That means if your application produces output using single-byte or
multi-byte character sets (which are ANSI, OEM, UTF-8 and many
others) the Windows converts that output to UTF-16 automatically
regarding active codepage selected in your console (run `chcp`
from console command prompt to check your active codepage).

If you want to work with UTF-8 encoding you have to select UTF-8 as
active console codepage. Just run `chcp 65001` command to do that.
You may call this command from your shell prompt or run it before
shell in a ConEmu task content. Of course your application must be
able to output data using UTF-8. Refer to your application manual.

~~~
chcp 65001 & cmd
~~~

By the way, you may set UTF8 as default encoding for all consoles
starting in ConEmu. If you **really** like to do that, go to
[Settings / Environment](SettingsEnvironment.html) page
and add following line:

~~~
chcp utf8
~~~

At last, there is an environment variable for ‘hacking’ purposes:
[ConEmuDefaultCp](ConEmuEnvironment.html#ConEmuDefaultCp).
You may use it if `chcp` is not suitable for some reasons.

~~~
set ConEmuDefaultCp=65001
~~~

**Note** [ConEmuHk](ConEmuHk.html) must be enabled.




## On-the-fly conversion  {#on-the-fly_conversion}

Sometimes you may observe a broken output if your application uses
wrong codepage. That is, for example, if you run `git app -p`
and your sources have some national encoding (Russian 1251 cp for example).
Perl prints chunks using codepage 1252
and I failed to find a simple way to force it using proper codepage.
That why the environment variable
[ConEmuCpCvt](ConEmuEnvironment.html#ConEmuCpCvt) was created.
Run the following to fix broken output.

~~~
set ConEmuCpCvt=perl.exe:1252:1251
git app -p
~~~

**Note** [ConEmuHk](ConEmuHk.html) must be enabled.

There is also [ConEmuDefaultCp](ConEmuEnvironment.html#ConEmuDefaultCp),
hack to change output CP if you don’t want to use ‘chcp’.




## Font charset  {#font-charset}

There is a ‘Font charset’ option in the font settings. This setting
is **not** related to UTF-8 or Unicode itself, it just tells to
Windows what font it must choose if there are several fonts
available in one family. But you may play with this option and see
how the result is changed.



## Troubleshooting  {#troubleshooting}

If you observe some non-ascii characters are not displayed correctly you may check the following.


## Check if the font used in ConEmu has proper glyphs  {#check-proper-glyphs}

### What font you are using   {#what-font-you-are-using}

[Main](SettingsMain.html) settings page has two section:
‘Main console font’ and ‘Change pseudographics font’.


‘Pseudographics font’ is used for some unicode ranges generally
containing frames and some pseudographics symbols. For example:
`= ¦ - г г ¬ ¬ ¬ L L L - - - ¦ ¦`.
The default range is U2013..U25C4.
You may change it on the [Main](SettingsMain.html) settings page in the ‘Unicode reanges’ drop down.
BTW, it is prefilled with some ranges: Preudographics, CJK, and others.

Actually, you may untick the ‘Change pseudographics font’ if you do not need it.


‘Main console’ font is used for all other symbols.


There is ‘Font charset’ there. Usually it must contain ‘Default’ or ‘ANSI’. Read ‘Font charset’ section above.


One more strange thing: the option ‘Treat font height as device units’ reflects on created font too.


### Check font glyphs   {#Check_font_glyphs}

Check if the font has proper glyphs: run from `Win+R` the
`charmap.exe` tool and examine your font.


<h2 id="Check_if_is_capable_to_accept_unicode"> Check if <a href="RealConsole.html">RealConsole</a> is capable to accept unicode </h2>

Press ‘Ctrl+Win+Alt+Space’ to reveal [RealConsole](RealConsole.html)
and check its contents. Actually, it may fails for hieroglyphs and
some others unicode ranges.


Anyway, the critical thing is that [RealConsole](RealConsole.html)
has TrueType font selected in the console properties.

![RealConsole properties](/img/RealConsoleProperties.png)

This font may be configured from ConEmu's [Features setting page](SettingsFeatures.html)
with button `...` on the right of ‘Show real console’.

![ConEmu settings, RealConsole font](/img/Settings-More-RealFont.png)



## Check if your console application is Unicode-aware  {#check-your-console-application}

What shell or application is responsible for your broken output? In
most cases you will see the active application exe name in the
[StatusBar](StatusBar.html). If it does not support unicode output
you need to check for updates of this application. For example,
MSYS1 is not unicode-aware. May be your application has some
configuration where you may choose proper encoding.


At last, in some cases the following trick may help: set console
codepage to UTF-8 before running your shell or application. For
example, put the following in the startup task.

~~~
chcp 65001 & cmd
~~~



## ConEmu provide some tests you may run  {#some-tests}

### CheckUnicode test   {#checkunicode-test}

~~~
ConEmuC -CheckUnicode
~~~

![‘ConEmuC -CheckUnicode’ output](/img/ConEmuUnicodeTest1.png)


### UTF-8 test   {#utf-8-test}

~~~
cmd /c "%ConEmuBaseDir%\Addons\utf-8-test.cmd"
~~~

![‘utf-8-test.cmd’ output](/img/ConEmuUnicodeTest2.png)



## Some hints  {#some-hints}

For Python 2 and 3 you may use
[win-unicode-console](http://stackoverflow.com/questions/31846091/python-unicode-console-support-under-windows#comment51688033_31846091)

