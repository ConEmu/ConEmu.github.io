---
redirect_from:
 - /ru/SplitScreen.html
 - /ru/Panes.html
 - /en/Panes.html

title: "ConEmu | Split Screen or Panes"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls

readalso:
 - url: NewConsole.html
   title: "-new_console switch"
---

# Split Screen or Panes in ConEmu

ConEmu may split any tab into several panes with free (user choice) grid configuration.
Unlike many other terminals (who can start in the split only the same shell as original one),
you may

* create new pane (split) with any shell of your choice, with different credentials or elevated (as Administrator);
* or just duplicate shell from your active pane (classic way) with Ctrl+Shift+O or Ctrl+Shift+E.

Article navigation

* [Ways to split](#Ways-to-split)
  * [<a href="SplitScreen.html">SplitScreen</a> options in ‘Create new console’ dialog](#Create-new-console-dialog)
  * [From your shell prompt](#From-your-shell-prompt)
  * [Default hotkeys](#Default-hotkeys)
  * [Start several consoles in 2x2 grid from the named Task](#task-grid-2x2)
  * [More examples](#more-examples)
* [Working with splits](#Working-with-splits)



## Ways to split  {#Ways-to-split}

As usual, ConEmu provides more than a one way to do any action.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}


### SplitScreen options in ‘Create new console’ dialog  {#Create-new-console-dialog}

Open ‘[Create new console](LaunchNewTab.html)’ dialog by pressing Win+W or
<code class="plus">[+]</code> toolbar button and set up ‘New console split’ options.

**NB**, if you have disabled [Create confirmation](SettingsConfirm.html)
press `Win+Shift+W` or `Shift`+<code class="plus">[+]</code>.



### From your shell prompt   {#From-your-shell-prompt}

You may use `-new_console:s[<SplitTab>T][<Percents>](H|V)` switch
appended to any command typed in your prompt or [Task contents](Tasks.html).
Option ‘Inject [ConEmuHk](ConEmuHk.html)’ must be enabled to use this feature in prompt.

#### Examples  {#new_console-examples}

|:---|:---|
| `cmd -new_console:s` | split current pane, run `cmd` shell, new pane and old (current) pane become 50% width of current pane |
| `cmd -new_console:s50H` | same as `cmd -new_console:s` |
| `powershell -NoProfile -new_console:sV` | split current pane, run `powershell -NoProfile`, create new pane to the bottom |
| `sh --login -i -new_console:s3T30H` | split 3-d pane, create new pane to the right with 30% width |

#### SplitTab  {#SplitTab}

Usually the active console is splitted, but with this 1-based number you may
select ‘proper’ console (pane or tab) to split.

The switch has meaning only when used within [Task commands](Tasks.html),
and only consoles started **from the Task** are counted.

So, you may create complicated geometry starting tabs in desired order.

~~~
cmd
cmd -new_console:s66H
cmd -new_console:s50H
cmd -new_console:s2T50V
cmd -new_console:s3T50V
~~~



### Default hotkeys   {#Default-hotkeys}

Split key macros (default as `Ctrl+Shift+O` and `Ctrl+Shift+E`) work
like ‘[Duplicate root...](LaunchNewTab.html#Duplicate_root)’ menu item.
These macros will duplicate shell from your active pane!



### Start several consoles in 2x2 grid from the named Task   {#task-grid-2x2}

The question from [superuser.com](http://superuser.com/q/473807/139371).

You may set up named task to open several consoles on startup in the grid. Here the example for 2x2 grid.

~~~
>cmd -cur_console:n
powershell -cur_console:s1TVn
sh --login -i -cur_console:s1THn
putty -load mysrv -cur_console:s2THn
~~~



### More examples  {#more-examples}

* [-new_console usage examples](https://conemu.github.io/en/NewConsole.html#example-6)
* [Examples on StackOverflow](http://stackoverflow.com/search?q=%5Bconemu%5D+split)
* [Examples on SuperUser](http://superuser.com/search?q=%5Bconemu%5D+split)



## Working with splits  {#Working-with-splits}

* Cycle switche visible split-panes: `Apps+Tab`, `Apps+Shift+Tab`
  {[GuiMacro](GuiMacro.html): Tab(10,...)}.
* Put focus to nearest pane: `Apps+Up`, `Apps+Down`, `Apps+Left`, `Apps+Right`
  {[GuiMacro](GuiMacro.html): Split(2,...)}.
* Move splitter (resize panes): `Apps+Shift+Up`, `Apps+Shift+Down`, `Apps+Shift+Left`, `Apps+Shift+Right`
  {[GuiMacro](GuiMacro.html): Split(1,...)}.

`Apps` is a key between `RightWin` and `RightShift` on the most of keyboards.
[More...](AppsKey.html)
