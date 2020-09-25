---
redirect_from: /ru/KeyboardShortcuts.html

title: "ConEmu | Keyboard Shortcuts"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls

readalso:
 - url: SettingsHotkeys.html
   title: Settings › Keys & Macro page
 - url: SettingsKeyboard.html
   title: Settings › Keyboard
 - url: GlobalHotKeys.html
   title: Global Hot Keys
 - url: AppsKey.html
   title: "Where is an Apps Key?"
---

<!-- Content starts -->

# ConEmu keyboard shortcuts

* [Non configurable hotkeys](#Non_configurable_hotkeys)
* [Configurable hotkeys](#Configurable_hotkeys)
* [Host key](#Host_key)
* [Full list of hotkeys](#Full_list)
* [Where is an Apps Key?](AppsKey.html)


## Please note!  {#Please_note}

These shortcuts are only defaults!
You may redefine almost all combinations
and define up to 32 [GuiMacro](GuiMacro.html) hotkeys
on the [Keys](SettingsHotkeys.html#Hotkeys_list) page.

Moreover, many actions have no default hotkeys.

For example, you may choose hotkey
for ‘Start text selection (like text editors)’,
‘Switch Always on top window mode’ and so on.

There are also several [global hotkeys](GlobalHotKeys.html)
available even ConEmu has not focus.

{% if site.url != 'local' %}{% include in_article.html %}{% endif %}

## Non configurable hotkeys  {#Non_configurable_hotkeys}

| *Hotkey* | *Description* |
|:---|:---|
| Win+Alt+A | Displays ConEmu About dialog. Also, you may see there useful information about comand line switches. |
| Win+Alt+P | Displays ConEmu [Settings dialog](Settings.html). |
| Win+Alt+Space | Pops up ConEmu [system menu](SystemMenu.html). |
| Ctrl+Win+Alt+Space | Reveals or hide the [real console window](ConEmuTerms.html#RealConsole). On some systems (Vista, i.e.) You may press Space twice. |
| Ctrl+Win+Enter | Maximize ConEmu window and hide window caption (FullScreen mode). |
| Ctrl+Tab,<br/>Ctrl+Shift+Tab | Tabs switching. In lazy switching mode (tab bar must be visible) window will not be really switched, until Ctrl is released. When lazy tab switching was started in recent mode, You may use Left and Right keys to select tabs directly. **Note**, tabs must be shown in the ConEmu window. |
| Ctrl+Left, Ctrl+Right,<br/>Ctrl+Up, Ctrl+Down | Switch tab to left/right (while Ctrl-Tab was pressed and Ctrl - hold). |
| Win+Left, Win+Right,<br/>Win+Up, Win+Down | When ‘Win+Arrows - resize window’ checked - obviously resize ConEmu window.<br/>**Note**, you may change ‘Win’ hostkey to any combination of maximum three modifiers. |
| Win+1 … Win+0 | [Activates consoles](Tabs.html#Switching_between_consoles) by numbers (1,2,3,4,5,6,7,8,9,0).<br/>**Note**, you may change ‘Win’ hostkey to any combination of maximum three modifiers. |


## Configurable hotkeys  {#Configurable_hotkeys}

The list below is very brief. [Full list of hotkeys](#Full_list) is located at the botom of the article.

### Multiconsole   {#multiconsole-hotkeys}

| *Hotkey* | *Description* |
|:---|:---|
| Win+W | Create new console tab. [Confirmation dialog](Screenshots.html#Confirmation_of_new_console_creation_(Win-W)) will be displayed, when ‘[Create confirmation](Settings.html#Tabs)’ setting is enabled. **W** is default, [configurable](Settings.html#Tabs). |
| Win+Shift+W | Create new console tab with [confirmation dialog](Screenshots.html#Confirmation_of_new_console_creation_(Win-W)), regardless of ‘[Create confirmation](Settings.html#Tabs)’ setting. **W** is default, [configurable](Settings.html#Tabs). |
| [Win+~](Screenshots.html#Confirmation_of_restarting_console_(Win-%7E)) | Restart current console, all applications running in the current console will be terminated. **~** is default, [configurable](Settings.html#Tabs). |
| Win+Q, Win+Shift+Q | Activate next/previous console tab. **Q** is default, [configurable](Settings.html#Tabs). |
| Win+Del | Terminate current console. This hotkey is **disabled** by default! You may enable it in the [ConEmu Settings](Settings.html#Manual_change_of_settings) |
| Win+A | Show alternative console buffer (last command output). This is sort of ‘Pause’ for the console. **A** is default. |
| Win+S | Duplicate tab with current state of [root process](RootProcess.html). |
| *Unset* | Turns [BufferHeight](ConEmuTerms.html#BufferHeight) mode on/off. **Ignored in Windows 7**. |

### Some selected hotkeys   {#selected-hotkeys}

| *Hotkey* | *Description* |
|:---|:---|
| Ctrl+~ | Minimize or Restore ConEmu window. **C** is default, [configurable](Settings.html#Manual_change_of_settings). This is [global hotkey](GlobalHotKeys.html), it works even ConEmu has no focus. |
| Win+X | Create new console tab with [cmd.exe or some selected task](SettingsTasks.html). [configurable](Settings.html#Manual_change_of_settings). |
| Ctrl+Up, Ctrl+Down,<br/>Ctrl+PgUp, Ctrl+PgDn | [Buffer](ConEmuTerms.html#BufferHeight) scrolling |
| Ctrl+Alt | Drag ConEmu window with mouse by client area |
| Win+Alt+Left, Win+Alt+Right | Move active tab leftward/rightward (aka reorder ConEmu tabs) |
| Apps+R | Rename current tab. In the current ConEmu version Far Manager editors/viewers can not be renamed |
| Apps+F | Search text in the console |


### Host key   {#Host_key}

Note, **Win** is default ‘[Host key](ConEmuTerms.html#Host_key)’,
keys combination is [configurable](Settings.html#Tabs).


### Full list of hotkeys   {#Full_list}

Take a look at full list of keyboard shortcuts below
and notes about [global hotkeys](GlobalHotKeys.html).

{% comment %} LIST OF HOTKEYS {% endcomment %}

*Note* `Apps` key is a key between RWin and RCtrl.

| **Hotkey** | **SaveName/GuiMacro** | **Description** |
|:---|:---|:---|:---|
| Ctrl+~ | `MinimizeRestore` | Minimize/Restore (Quake-style hotkey also) |
| *NoDefault* | `MinimizeRestore2` | Minimize/Restore (alternative) |
| *NoDefault* | `GlobalRestore` | Restore (bring to front) |
| *NoDefault* | `CdExplorerPath` <br/> `PasteExplorerPath(1,1)` | Activate ConEmu and ‘CD’ to last (top in Z-order) Explorer window path |
| Ctrl+Win+Alt+Enter | `ForcedFullScreen` | Enter TEXT fullscreen mode, when available. If not - standard fullscreen and always on top |
| Win+Z | `SwitchGuiFocus` | Switch focus between ConEmu and child GUI application (e.g. PuTTY or Notepad) |
| *NoDefault* | `SetFocusGui` | Set focus to ConEmu |
| *NoDefault* | `SetFocusChild` | Set focus to child GUI application |
| *NoDefault* | `ChildSystemMenu` | Child GUI window system menu (PuTTY, Notepad, etc.) |
| Win+W | `Multi.NewConsole` | Create new console or new window (check ‘Multiple consoles in one ConEmu window’) |
| Win+Shift+W | `Multi.NewConsoleShift` | Create new console (after ‘Create confirmation’) |
| Win+X | `Multi.CmdKey` | Create new ‘cmd.exe’ console |
| *NoDefault* | `Multi.NewWindow` | Create new window (after ‘Create confirmation’) |
| Win+N | `Multi.NewConsolePopup` | Show create new console popup menu |
| *NoDefault* | `Multi.NewConsolePopup2` | Show create new console popup menu with task submenus |
| Win+Shift+G | `Multi.NewAttach` | Attach existing Console or GUI application |
| Ctrl+Shift+O | `Multi.NewSplitV` <br/> `Split(0,0,50)` | Split: Duplicate active ‘shell’ split to bottom |
| Ctrl+Shift+E | `Multi.NewSplitH` <br/> `Split(0,50,0)` | Split: Duplicate active ‘shell’ split to right |
| Apps+Enter | `Multi.SplitMaximize` <br/> `Split(3)` | Split: Maximize/restore active pane |
| Apps+Shift+UpArrow | `Multi.SplitSizeVU` <br/> `Split(1,0,-1)` | Split: Move splitter upward |
| Apps+Shift+DownArrow | `Multi.SplitSizeVD` <br/> `Split(1,0,1)` | Split: Move splitter downward |
| Apps+Shift+LeftArrow | `Multi.SplitSizeHL` <br/> `Split(1,-1,0)` | Split: Move splitter leftward |
| Apps+Shift+RightArrow | `Multi.SplitSizeHR` <br/> `Split(1,1,0)` | Split: Move splitter rightward |
| Apps+Tab | `Key.TabPane1` <br/> `Tab(10,1)` | Split: Put focus to next visible pane |
| Apps+Shift+Tab | `Key.TabPane2` <br/> `Tab(10,-1)` | Split: Put focus to previous visible pane |
| Apps+UpArrow | `Multi.SplitFocusU` <br/> `Split(2,0,-1)` | Split: Put focus to nearest pane upward |
| Apps+DownArrow | `Multi.SplitFocusD` <br/> `Split(2,0,1)` | Split: Put focus to nearest pane downward |
| Apps+LeftArrow | `Multi.SplitFocusL` <br/> `Split(2,-1,0)` | Split: Put focus to nearest pane leftward |
| Apps+RightArrow | `Multi.SplitFocusR` <br/> `Split(2,1,0)` | Split: Put focus to nearest pane rightward |
| Apps+Alt+X | `Multi.SplitSwap` <br/> `Split(4)` | Split: Exchange (swap) with nearest pane |
| Apps+Alt+UpArrow | `Multi.SplitSwapU` <br/> `Split(4,0,-1)` | Split: Exchange (swap) with nearest pane upward |
| Apps+Alt+DownArrow | `Multi.SplitSwapD` <br/> `Split(4,0,1)` | Split: Exchange (swap) with nearest pane downward |
| Apps+Alt+LeftArrow | `Multi.SplitSwapL` <br/> `Split(4,-1,0)` | Split: Exchange (swap) with nearest pane leftward |
| Apps+Alt+RightArrow | `Multi.SplitSwapR` <br/> `Split(4,1,0)` | Split: Exchange (swap) with nearest pane rightward |
| Win+Shift+Q | `Multi.Next` | Switch next console |
| *NoDefault* | `Multi.NextShift` | Switch previous console |
| Win+192/*тильда*/ | `Multi.Recreate` | Recreate active console |
| Win+A | `Multi.AltCon` | Show alternative console buffer (last command output) |
| Pause | `Multi.Pause` <br/> `Pause` | Pause current console |
| *NoDefault* | `Multi.Scroll` | Switch bufferheight mode |
| Apps+G | `Multi.GroupInput` <br/> `GroupInput(0)` | Group keyboard input for visible splits |
| Apps+ Shift+G | `Multi.GroupInputAll` <br/> `GroupInput(3)` | Group keyboard input for all consoles |
| Apps+ Alt+G | `Multi.GroupInputKey` <br/> `GroupInput(6)` | Add active console into group keyboard input |
| *NoDefault* | `Multi.Detach` <br/> `Detach` | Detach active RealConsole from ConEmu |
| *NoDefault* | `Multi.Unfasten` <br/> `Unfasten` | Unfasten active RealConsole from active ConEmu window |
| Win+Delete | `Multi.Close` <br/> `Close(0)` | Close active console |
| Win+Alt+Delete | `CloseTabKey` <br/> `Close(6)` | Close current tab |
| Win+Ctrl+Delete | `CloseGroupKey` <br/> `Close(4)` | Close all panes of the active group |
| *NoDefault* | `CloseGroupPrcKey` <br/> `Close(7)` | Close all active processes of the active group |
| *NoDefault* | `CloseAllConKey` <br/> `Close(8)` | Close all consoles |
| *NoDefault* | `CloseZombiesKey` <br/> `Close(9)` | Close all zombies |
| *NoDefault* | `CloseExceptConKey` <br/> `Close(5)` | Close all but active |
| Ctrl+Alt+Break | `KillProcessKey` <br/> `Close(1)` | Terminate (kill) active process in the current console |
| Win+Alt+Break | `KillAllButShellKey` <br/> `Close(10,1)` | Terminate (kill) all but shell processes in the current console |
| Win+S | `DuplicateRootKey` | Duplicate tab with current state of root process |
| Win+F4 | `CloseConEmuKey` <br/> `Close(2)` | Close all tabs (same as ‘Cross’ click) |
| Apps+R | `Multi.Rename` | Rename active tab |
| Apps+A | `AffinityPriorityKey` <br/> `AffinityPriority` |  |
| Win+Alt+LeftArrow | `Multi.MoveLeft` | Move active tab leftward |
| Win+Alt+RightArrow | `Multi.MoveRight` | Move active tab rightward |
| *NoDefault* | `CTS.VkBlockStart` | Start vertical block selection (like standard console) |
| *NoDefault* | `CTS.VkTextStart` | Start text selection (like text editors) |
| Ctrl+C | `CTS.VkCopyFmt0` <br/> `Copy(0,0)` | Copy: Current selection as plain text |
| Ctrl+Shift+C | `CTS.VkCopyFmt1` <br/> `Copy(0,1)` | Copy: Current selection HTML formatted |
| *NoDefault* | `CTS.VkCopyFmt2` <br/> `Copy(0,2)` | Copy: Current selection as HTML |
| *NoDefault* | `CTS.VkCopyAll` <br/> `Copy(1)` | Copy: All active console text output (buffer including) |
| Apps+L | `HighlightMouseSwitch` <br/> `HighlightMouse(1)` | Highlighting: Switch ‘Highlight row under mouse cursor’ |
| Apps+X | `HighlightMouseSwitchX` <br/> `HighlightMouse(3)` | Highlighting: Switch ‘Highlight row & col under mouse cursor’ |
| *NoDefault* | `Multi.ShowTabsList` | Show opened tabs list (ignored in Far - use macro instead) |
| Apps+F12 | `Multi.ShowTabsList2` <br/> `Tabs(8)` | Show opened tabs list (works in Far too) |
| Shift+Ins | `ClipboardVkAllLines` | Paste clipboard contents (ignored in Far) |
| Ctrl+V | `ClipboardVkFirstLine` | Paste first line of clipboard contents, autoconvert paths for cygwin's applications (ignored in Far) |
| *NoDefault* | `Key.AltNumpad` <br/> `AltNumber(16)` | Start Alt+Number mode to enter unicode symbol by its hex codebase |
| Ctrl+BACK | `DeleteWordToLeft` | Delete word leftward to the cursor (ignored in Far) |
| Apps+F | `FindTextKey` | Find text in active console |
| Win+H | `ScreenshotKey` | Make screenshot of active window |
| Win+Shift+H | `ScreenshotFullKey` | Make screenshot of entire desktop |
| Apps+S | `ShowStatusBarKey` | Show status bar |
| Apps+T | `ShowTabBarKey` | Show tab bar |
| Apps+C | `ShowCaptionKey` | Show window caption |
| *NoDefault* | `AlwaysOnTopKey` | Switch ‘Always on top’ window mode |
| *NoDefault* | `TransparencyInc` <br/> `Transparency(1,-20)` | Transparency: more translucent |
| *NoDefault* | `TransparencyDec` <br/> `Transparency(1,+20)` | Transparency: more opaque |
| Apps+Space | `Key.TabMenu` | Show Tab context menu |
| Shift+RightMouseButton | `Key.TabMenu2` | Show Tab context menu |
| Alt+F9 | `Key.Maximize` <br/> `WindowMaximize()` | Maximize/restore |
| Win+Shift+DownArrow | `Key.MaximizeWidth` <br/> `WindowMode(11)` | Snap ConEmu window to the monitor's left/right edges (maximize width) |
| Win+Shift+UpArrow | `Key.MaximizeHeight` <br/> `WindowMode(8)` | Snap ConEmu window to the monitor's top/bottom edges (maximize height) |
| Win+LeftArrow | `Key.TileToLeft` <br/> `WindowMode(6)` | Snap ConEmu window to the monitor's left edge |
| Win+RightArrow | `Key.TileToRight` <br/> `WindowMode(7)` | Snap ConEmu window to the monitor's right edge |
| *NoDefault* | `Key.JumpActiveMonitor` <br/> `WindowMode(12)` | Move ConEmu window to the monitor with mouse cursor (Bring here) |
| Win+Shift+LeftArrow | `Key.JumpPrevMonitor` <br/> `WindowMode(9)` | Move ConEmu window to previous monitor |
| Win+Shift+RightArrow | `Key.JumpNextMonitor` <br/> `WindowMode(10)` | Move ConEmu window to next monitor |
| Alt+Enter | `Key.FullScreen` <br/> `WindowFullscreen()` | Full screen |
| Alt+Space | `Key.SysMenu` | Show ConEmu System menu |
| Ctrl+RightMouseButton | `Key.SysMenu2` | Show ConEmu System menu |
| Win+Shift+D | `Key.DebugProcess` <br/> `Debug(0)` | Debug active process |
| *NoDefault* | `Key.DumpProcess` <br/> `Debug(1)` | Active process memory dump |
| *NoDefault* | `Key.DumpTree` <br/> `Debug(2)` | Active process tree memory dump |
| Ctrl+UpArrow | `Key.BufUp` | Scroll buffer one line up (disabled in Far /w) |
| Ctrl+DownArrow | `Key.BufDn` | Scroll buffer one line down (disabled in Far /w) |
| Ctrl+PageUp | `Key.BufPgUp` | Scroll buffer one page up (disabled in Far /w) |
| Ctrl+PageDown | `Key.BufPgDn` | Scroll buffer one page down (disabled in Far /w) |
| Apps+PageUp | `Key.BufHfPgUp` <br/> `Scroll(2,-1)` | Scroll buffer one half-page up |
| Apps+PageDown | `Key.BufHfPgDn` <br/> `Scroll(2,+1)` | Scroll buffer one half-page down |
| Apps+Home | `Key.BufTop` <br/> `Scroll(3,-1)` | Scroll buffer to the top |
| Apps+End | `Key.BufBottom` <br/> `Scroll(3,+1)` | Scroll buffer to the bottom |
| Ctrl+Alt+PageUp | `Key.BufPrUp` <br/> `Scroll(5,-1)` |  |
| Ctrl+Alt+PageDown | `Key.BufPrDn` <br/> `Scroll(5,+1)` |  |
| Apps+BACK | `Key.BufCursor` <br/> `Scroll(4)` | Scroll buffer to the cursor position |
| *NoDefault* | `Key.ResetTerm` <br/> `Write(\`\\ec\`)` | Reset terminal: clear screen, backscroll, move cursor to the upper-left corner |
| Ctrl+WheelUp | `FontLargerKey` <br/> `FontSetSize(1,2)` | Make main font larger |
| Ctrl+WheelDown | `FontSmallerKey` <br/> `FontSetSize(1,-2)` | Make main font smaller |
| Ctrl+MiddleMouseButton | `FontOriginalKey` <br/> `Zoom(100)` | Make main font original size |
| Ctrl+Shift+F | `PasteFileKey` <br/> `Paste(4)` | Choose and paste file pathname |
| Ctrl+Shift+D | `PastePathKey` <br/> `Paste(5)` | Choose and paste folder path |
| Apps+Ins | `PasteCygwinKey` <br/> `Paste(8)` | Paste path from clipboard in unix format |
| RAlt | `CTS.VkBlock` | Block selection modifier |
| RShift | `CTS.VkText` | Text selection modifier |
| *NoDefault* | `CTS.VkAct` | Right and middle mouse buttons modifier (Text selection) |
| *NoDefault* | `CTS.VkPrompt` | Change prompt text cursor position with left mouse click (cmd, powershell, tcc/le, ...) |
| RCtrl | `FarGotoEditorVk` | Highlighting: hyperlinks and compiler errors (FarGotoEditor modifier) |
| *NoDefault* | `DndLKey` | Drag from Far panels with left mouse key (LDrag modifier) |
| RCtrl | `DndRKey` | Drag from Far panels with right mouse key (RDrag modifier) |
| Ctrl+Alt+LeftMouseButton | `WndDragKey` | Move ConEmu window by dragging client area |
| Win+Alt+A | `-` <br/> `About()` | Show ‘About’ dialog |
| Win+Alt+P | `-` <br/> `Settings()` | Settings dialog |
| Win+Alt+K | `-` <br/> `Settings(171)` | Setup ‘Hotkeys’ |
| Win+Alt+T | `-` <br/> `Settings(157)` | Setup ‘Tasks’ |
| Win+Alt+H | `-` <br/> `Wiki()` | Open online help/wiki in your browser |
| Win+Alt+Space | `-` | Show ConEmu menu |
| Ctrl+Win+Alt+Space | `-` | Show real console |
| Win+Ctrl+Enter | `-` <br/> `WindowFullscreen()` | Full screen |
| Ctrl+Tab | `-` | Next tab (may be disabled) |
| Ctrl+Shift+Tab | `-` | Previous tab (may be disabled) |
| Ctrl+LeftArrow | `-` | Switch tab to left (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+UpArrow | `-` | Switch tab to left (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+RightArrow | `-` | Switch tab to right (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+DownArrow | `-` | Switch tab to right (while Ctrl-Tab was pressed and Ctrl - hold) |
| Esc | `-` | Minimize ConEmu by Esc when no open consoles left (see option ‘Don't close ConEmu on last console close’) |
| Shift+LeftArrow | `-` <br/> `Select(0,-1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+RightArrow | `-` <br/> `Select(0,1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+Home | `-` <br/> `Select(0,-1,0,-1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+End | `-` <br/> `Select(0,1,0,1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+UpArrow | `-` <br/> `Select(1,0,-1)` | Start block selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+DownArrow | `-` <br/> `Select(1,0,1)` | Start block selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| *NoDefault* | `-` | Decrease window width (check ‘Resize with arrows’) |
| *NoDefault* | `-` | Increase window width (check ‘Resize with arrows’) |
| *NoDefault* | `-` | Decrease window height (check ‘Resize with arrows’) |
| *NoDefault* | `-` | Increase window height (check ‘Resize with arrows’) |
