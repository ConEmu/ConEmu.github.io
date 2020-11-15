---
redirect_from: /ru/SolarizedColors.html

title: "ConEmu | Solarized Colors"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
 - url: GitForWindows.html
   title: Using Git for Windows

readalso:
 - url: SettingsColors.html
   title: "Settings › Colors page"
 - url: GitForWindows.html
   title: "Setting up Git for Windows in ConEmu"
---

# Solarized, ConEmu, git and settings

[Solarized](http://ethanschoonover.com/solarized) is an eye-candy color scheme
specially designed for console and GUI applications.

The screenshot below shows `<ConEmu>` palette adapted for Windows' console applications.

![ConEmu: Solarized Git](/img/SolarizedGit.png)

* [Solarized scheme limitation](#limitation)
  * [Setup your application](#Setup_your_application)
  * [Use modified color scheme](#Use_modified_color_scheme)

{% include in_article.html %}


## Solarized scheme limitation  {#limitation}

Standard ‘Solarazed’ color scheme has eight monotones and eight accent colors,
in opposite to the Windows standard palette and many others,
which have twelve accent colors.

That may be a problem for many console applications which suppose that
both lower and upper color octets has accented colors. Look at screenshot,
colors 0..15 show Solarized palette, colors 16..31 show standard Windows colors.

![ConEmu: Settings' Colors](/img/Settings-Colors.png)

If your application looks weird, some colors are fade or undistinguished there are two ways.



### Setup your application  {#Setup_your_application}

For example, [Git for Windows](GitForWindows.html) uses low color octet
(dark green actually) for displaying branch names, updated (indexed) files,
new diffs' lines and may be smth else.

If you want to use unmodified ‘Solarized’ scheme and have distinctive colors,
just tell git use ‘green bold’ insted.

~~~
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"
~~~



### Use modified color scheme  {#Use_modified_color_scheme}

ConEmu has several Solarized schemes.

* `<ConEmu>` was optimized for Windows' console applications, because there are
  twelve accent colors, which are usual to standard Windows console palette.
  This scheme is default one in ConEmu.
* `<Solarized Git>` was optimized for vanilla [MSysGit](http://msysgit.github.io/).
* `<Solarized (Luke Maciak)>` has accented colors in lower octet.

Just choose the desired scheme from dropdown list box.

![ConEmu: Settings' Colors](/img/Settings-Colors2.png)
