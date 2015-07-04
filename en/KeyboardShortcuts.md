---
redirect_from: /ru/KeyboardShortcuts.html

title: "ConEmu | Keyboard Shortcuts"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls

readalso:
 - url: SettingsHotkeys.html
   title: Settings › Keys & Macro page
 - url: SettingsControls.html
   title: Settings › Controls page
 - url: GlobalHotKeys.html
   title: Global Hot Keys
---

<!-- Content starts -->

# ConEmu keyboard shortcuts

* [Non configurable hotkeys](#Non_configurable_hotkeys)
* [Configurable hotkeys](#Configurable_hotkeys)
* [Host key](#Host_key)
* [Full list of hotkeys](#Full_list)


<h2 id="Please_note"> Please note! </h2>

These shortcuts are only defaults!
You may redefine almost all combinations
and define up to 32 [GuiMacro](GuiMacro.html) hotkeys
on the [Keys](SettingsHotkeys.html#Hotkeys_list) page.

Moreover, many actions have no default hotkeys.

For example, you may choose hotkey
for ‘Start text selection (like text editors)’,
‘Switch Always on top window mode’ and so on.


<h2 id="Non_configurable_hotkeys"> Non configurable hotkeys </h2>

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


<h2 id="Configurable_hotkeys"> Configurable hotkeys </h2>

The list below is very brief. [Full list of hotkeys](#Full_list) is located at the botom of the article.

| *Hotkey* | *Description* |
|:---|:---|
| **Multiconsole** | |
| Win+W | Create new console tab. [Confirmation dialog](Screenshots.html#Confirmation_of_new_console_creation_(Win-W)) will be displayed, when ‘[Create confirmation](Settings.html#Tabs)’ setting is enabled. **W** is default, [configurable](Settings.html#Tabs). |
| Win+Shift+W | Create new console tab with [confirmation dialog](Screenshots.html#Confirmation_of_new_console_creation_(Win-W)), regardless of ‘[Create confirmation](Settings.html#Tabs)’ setting. **W** is default, [configurable](Settings.html#Tabs). |
| [Win+~](Screenshots.html#Confirmation_of_restarting_console_(Win-%7E)) | Restart current console, all applications running in the current console will be terminated. **~** is default, [configurable](Settings.html#Tabs). |
| Win+Q, Win+Shift+Q | Activate next/previous console tab. **Q** is default, [configurable](Settings.html#Tabs). |
| Win+Del | Terminate current console. This hotkey is **disabled** by default! You may enable it in the [ConEmu Settings](Settings.html#Manual_change_of_settings) |
| Win+A | Show alternative console buffer (last command output). This is sort of ‘Pause’ for the console. **A** is default. |
| Win+S | **Ignored in Windows 7**. Turns [BufferHeight](ConEmuTerms.html#BufferHeight) mode on/off. **S** is default. |
| **Unsorted** | |
| Win+C | Minimize or Restore ConEmu window. **C** is default, [configurable](Settings.html#Manual_change_of_settings). This is **global** hotkey, it works even ConEmu has no focus. |
| Win+X | Create new console tab with <code>cmd.exe</code>. **X** is default, [configurable](Settings.html#Manual_change_of_settings). |
| Ctrl+Up, Ctrl+Down,<br/>Ctrl+PgUp, Ctrl+PgDn | [Buffer](ConEmuTerms.html#BufferHeight) scrolling |
| Ctrl+Alt | Drag ConEmu window with mouse by client area |
| Win+Alt+Left, Win+Alt+Right | Move active tab leftward/rightward (aka reorder ConEmu tabs) |
| Apps+R | Rename current tab. In the current ConEmu version Far Manager editors/viewers can not be renamed |
| Apps+F | Search text in the console |


<h3 id="Host_key"> Host key </h3>

Note, **Win** is default ‘[Host key](ConEmuTerms.html#Host_key)’,
keys combination is [configurable](Settings.html#Tabs).


<h3 id="Full_list"> Full list of hotkeys </h3>

Take a look at full list of keyboard shortcuts below
and notes about [global hotkeys](GlobalHotKeys.html).

{% comment %} LIST OF HOTKEYS {% endcomment %}

*Note* `Apps` key is a key between RWin and RCtrl.

| **Hotkey** | **SaveName** | **GuiMacro** | **Description** |
|:---|:---|:---|:---|
| Ctrl+~ | `MinimizeRestore` |  | Minimize/Restore (Quake-style hotkey also) |
| *NoDefault* | `MinimizeRestore2` |  | Minimize/Restore (alternative) |
| *NoDefault* | `GlobalRestore` |  | Restore (bring to front) |
| *NoDefault* | `CdExplorerPath` | `PasteExplorerPath(1,1)` | Activate ConEmu and ‘CD’ to last (top in Z-order) Explorer window path |
| Ctrl+Win+Alt+Enter | `ForcedFullScreen` |  | Enter TEXT fullscreen mode, when available. If not - standard fullscreen and always on top |
| Win+Z | `SwitchGuiFocus` |  | Switch focus between ConEmu and child GUI application (e.g. PuTTY or Notepad) |
| *NoDefault* | `SetFocusGui` |  | Set focus to ConEmu |
| *NoDefault* | `SetFocusChild` |  | Set focus to child GUI application |
| *NoDefault* | `ChildSystemMenu` |  | Child GUI window system menu (PuTTY, Notepad, etc.) |
| Win+W | `Multi.NewConsole` |  | Create new console or new window (check ‘Multiple consoles in one ConEmu window’) |
| Win+Shift+W | `Multi.NewConsoleShift` |  | Create new console (after ‘Create confirmation’) |
| Win+X | `Multi.CmdKey` |  | Create new ‘cmd.exe’ console |
| *NoDefault* | `Multi.NewWindow` |  | Create new window (after ‘Create confirmation’) |
| Win+N | `Multi.NewConsolePopup` |  | Show create new console popup menu |
| *NoDefault* | `Multi.NewConsolePopup2` |  | Show create new console popup menu with task submenus |
| Win+G | `Multi.NewAttach` |  | Attach existing Console or GUI application |
| Ctrl+Shift+O | `Multi.NewSplitV` | `Split(0,0,50)` | Split: Duplicate active ‘shell’ split to bottom |
| Ctrl+Shift+E | `Multi.NewSplitH` | `Split(0,50,0)` | Split: Duplicate active ‘shell’ split to right |
| Apps+Enter | `Multi.SplitMaximize` | `Split(3)` | Split: Maximize/restore active pane |
| Apps+Shift+UpArrow | `Multi.SplitSizeVU` | `Split(1,0,-1)` | Split: Move splitter upward |
| Apps+Shift+DownArrow | `Multi.SplitSizeVD` | `Split(1,0,1)` | Split: Move splitter downward |
| Apps+Shift+LeftArrow | `Multi.SplitSizeHL` | `Split(1,-1,0)` | Split: Move splitter leftward |
| Apps+Shift+RightArrow | `Multi.SplitSizeHR` | `Split(1,1,0)` | Split: Move splitter rightward |
| Apps+Tab | `Key.TabPane1` | `Tab(10,1)` | Split: Put focus to next visible pane |
| Apps+Shift+Tab | `Key.TabPane2` | `Tab(10,-1)` | Split: Put focus to previous visible pane |
| Apps+UpArrow | `Multi.SplitFocusU` | `Split(2,0,-1)` | Split: Put focus to nearest pane upward |
| Apps+DownArrow | `Multi.SplitFocusD` | `Split(2,0,1)` | Split: Put focus to nearest pane downward |
| Apps+LeftArrow | `Multi.SplitFocusL` | `Split(2,-1,0)` | Split: Put focus to nearest pane leftward |
| Apps+RightArrow | `Multi.SplitFocusR` | `Split(2,1,0)` | Split: Put focus to nearest pane rightward |
| Win+Q | `Multi.Next` |  | Switch next console |
| Win+Shift+Q | `Multi.NextShift` |  | Switch previous console |
| Win+192/*тильда*/ | `Multi.Recreate` |  | Recreate active console |
| Win+A | `Multi.AltCon` |  | Show alternative console buffer (last command output) |
| Pause | `Multi.Pause` | `Pause` | Pause current console |
| *NoDefault* | `Multi.Scroll` |  | Switch bufferheight mode |
| Apps+G | `Multi.GroupInput` | `GroupInput` | Group keyboard input for visible splits |
| *NoDefault* | `Multi.Detach` | `Detach` | Detach active RealConsole from ConEmu |
| *NoDefault* | `Multi.Unfasten` | `Unfasten` | Unfasten active RealConsole from active ConEmu window |
| Win+Delete | `Multi.Close` | `Close(0)` | Close active console |
| Win+Alt+Delete | `CloseTabKey` | `Close(6)` | Close current tab |
| Win+Ctrl+Delete | `CloseGroupKey` | `Close(4)` | Close all panes of the active group |
| *NoDefault* | `CloseGroupPrcKey` | `Close(7)` | Close all active processes of the active group |
| *NoDefault* | `CloseAllConKey` | `Close(8)` | Close all consoles |
| *NoDefault* | `CloseZombiesKey` | `Close(9)` | Close all zombies |
| *NoDefault* | `CloseExceptConKey` | `Close(5)` | Close all but active |
| *NoDefault* | `KillProcessKey` |  | Terminate active process in the current console |
| Win+Shift+Delete | `KillAllButShellKey` | `Close(10,1)` | Terminate all but shell processes in the current console |
| Win+S | `DuplicateRootKey` |  | Duplicate tab with current state of root process |
| Win+F4 | `CloseConEmuKey` | `Close(2)` | Close all tabs (same as ‘Cross’ click) |
| Apps+R | `Multi.Rename` |  | Rename active tab (for Far Manager only first tab may be renamed) |
| Apps+A | `AffinityPriorityKey` | `AffinityPriority` |  |
| Win+Alt+LeftArrow | `Multi.MoveLeft` |  | Move active tab leftward |
| Win+Alt+RightArrow | `Multi.MoveRight` |  | Move active tab rightward |
| *NoDefault* | `CTS.VkBlockStart` |  | Start vertical block selection (like standard console) |
| *NoDefault* | `CTS.VkTextStart` |  | Start text selection (like text editors) |
| Ctrl+C | `CTS.VkCopyFmt0` | `Copy(0,0)` | Copy: Current selection as plain text |
| Ctrl+Shift+C | `CTS.VkCopyFmt1` | `Copy(0,1)` | Copy: Current selection HTML formatted |
| *NoDefault* | `CTS.VkCopyFmt2` | `Copy(0,2)` | Copy: Current selection as HTML |
| *NoDefault* | `CTS.VkCopyAll` | `Copy(1)` | Copy: All active console text output (buffer including) |
| Apps+L | `HighlightMouseSwitch` | `HighlightMouse(1)` | Highlighting: Switch ‘Highlight row under mouse cursor’ |
| Apps+X | `HighlightMouseSwitchX` | `HighlightMouse(3)` | Highlighting: Switch ‘Highlight row & col under mouse cursor’ |
| *NoDefault* | `Multi.ShowTabsList` |  | Show opened tabs list (does not works in Far - use macro instead) |
| Apps+F12 | `Multi.ShowTabsList2` | `Tabs(8)` | Show opened tabs list (works in Far too) |
| Shift+Ins | `ClipboardVkAllLines` |  | Paste clipboard contents (does not work in Far) |
| Ctrl+V | `ClipboardVkFirstLine` |  | Paste first line of clipboard contents (does not work in Far) |
| Ctrl+BACK | `DeleteWordToLeft` |  | Delete word leftward to the cursor (does not work in Far) |
| Apps+F | `FindTextKey` |  | Find text in active console |
| Win+H | `ScreenshotKey` |  | Make screenshot of active window |
| Win+Shift+H | `ScreenshotFullKey` |  | Make screenshot of entire desktop |
| Apps+S | `ShowStatusBarKey` |  | Show status bar |
| Apps+T | `ShowTabBarKey` |  | Show tab bar |
| Apps+C | `ShowCaptionKey` |  | Show window caption |
| *NoDefault* | `AlwaysOnTopKey` |  | Switch ‘Always on top’ window mode |
| *NoDefault* | `TransparencyInc` | `Transparency(1,-20)` | Transparency: more translucent |
| *NoDefault* | `TransparencyDec` | `Transparency(1,+20)` | Transparency: more opaque |
| Apps+Space | `Key.TabMenu` |  | Show Tab context menu |
| Shift+RightMouseButton | `Key.TabMenu2` |  | Show Tab context menu |
| Alt+F9 | `Key.Maximize` | `WindowMaximize()` | Maximize/restore |
| Win+Shift+DownArrow | `Key.MaximizeWidth` | `WindowMode(11)` | Snap ConEmu window to the monitor's left/right edges (maximize width) |
| Win+Shift+UpArrow | `Key.MaximizeHeight` | `WindowMode(8)` | Snap ConEmu window to the monitor's top/bottom edges (maximize height) |
| Win+LeftArrow | `Key.TileToLeft` | `WindowMode(6)` | Snap ConEmu window to the monitor's left edge |
| Win+RightArrow | `Key.TileToRight` | `WindowMode(7)` | Snap ConEmu window to the monitor's right edge |
| Win+Shift+LeftArrow | `Key.JumpPrevMonitor` | `WindowMode(9)` | Move ConEmu window to previous monitor |
| Win+Shift+RightArrow | `Key.JumpNextMonitor` | `WindowMode(10)` | Move ConEmu window to next monitor |
| Alt+Enter | `Key.FullScreen` | `WindowFullscreen()` | Full screen |
| Alt+Space | `Key.SysMenu` |  | Show ConEmu System menu |
| Ctrl+RightMouseButton | `Key.SysMenu2` |  | Show ConEmu System menu |
| Ctrl+UpArrow | `Key.BufUp` |  | Scroll buffer one line up (disabled in Far /w) |
| Ctrl+DownArrow | `Key.BufDn` |  | Scroll buffer one line down (disabled in Far /w) |
| Ctrl+PageUp | `Key.BufPgUp` |  | Scroll buffer one page up (disabled in Far /w) |
| Ctrl+PageDown | `Key.BufPgDn` |  | Scroll buffer one page down (disabled in Far /w) |
| Apps+PageUp | `Key.BufHfPgUp` | `Scroll(2,-1)` | Scroll buffer one half-page up |
| Apps+PageDown | `Key.BufHfPgDn` | `Scroll(2,+1)` | Scroll buffer one half-page down |
| Apps+Home | `Key.BufTop` | `Scroll(3,-1)` | Scroll buffer to the top |
| Apps+End | `Key.BufBottom` | `Scroll(3,+1)` | Scroll buffer to the bottom |
| Apps+BACK | `Key.BufCursor` | `Scroll(4)` | Scroll buffer to the cursor position |
| Ctrl+WheelUp | `FontLargerKey` | `FontSetSize(1,2)` | Make main font larger |
| Ctrl+WheelDown | `FontSmallerKey` | `FontSetSize(1,-2)` | Make main font smaller |
| Ctrl+MiddleMouseButton | `FontOriginalKey` | `Zoom(100)` | Make main font original size |
| Ctrl+Shift+F | `PasteFileKey` | `Paste(4)` | Choose and paste file pathname |
| Ctrl+Shift+D | `PastePathKey` | `Paste(5)` | Choose and paste folder path |
| Apps+Ins | `PasteCygwinKey` | `Paste(8)` | Paste path from clipboard in unix format |
| RAlt | `CTS.VkBlock` |  | Block selection modifier |
| RShift | `CTS.VkText` |  | Text selection modifier |
| *NoDefault* | `CTS.VkAct`) |  | Right and middle mouse buttons modifier (Text selection) |
| *NoDefault* | `CTS.VkPrompt`) |  | Change prompt text cursor position with left mouse click (cmd, powershell, tcc/le, ...) |
| RCtrl | `FarGotoEditorVk` |  | Highlighting: hyperlinks and compiler errors (FarGotoEditor modifier) |
| *NoDefault* | `DndLKey`) |  | Drag from Far panels with left mouse key (LDrag modifier) |
| RCtrl | `DndRKey` |  | Drag from Far panels with right mouse key (RDrag modifier) |
| Ctrl+Alt+LeftMouseButton | `WndDragKey` |  | Move ConEmu window by dragging client area |
| Win+Alt+A |  | `About()` | Show ‘About’ dialog |
| Win+Alt+P |  | `Settings()` | Settings dialog |
| Win+Alt+K |  | `Settings(171)` | Setup ‘Hotkeys’ |
| Win+Alt+T |  | `Settings(157)` | Setup ‘Tasks’ |
| Win+Alt+H |  | `Wiki()` | Open online help/wiki in your browser |
| Win+Alt+Space |  |  | Show ConEmu menu |
| Ctrl+Win+Alt+Space |  |  | Show real console |
| Win+Ctrl+Enter |  | `WindowFullscreen()` | Full screen |
| Ctrl+Tab |  |  | Next tab (may be disabled) |
| Ctrl+Shift+Tab |  |  | Previous tab (may be disabled) |
| Ctrl+LeftArrow |  |  | Switch tab to left (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+UpArrow |  |  | Switch tab to left (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+RightArrow |  |  | Switch tab to right (while Ctrl-Tab was pressed and Ctrl - hold) |
| Ctrl+DownArrow |  |  | Switch tab to right (while Ctrl-Tab was pressed and Ctrl - hold) |
| Esc |  |  | Minimize ConEmu by Esc when no open consoles left (see option ‘Don't close ConEmu on last console close’) |
| Shift+LeftArrow |  | `Select(0,-1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+RightArrow |  | `Select(0,1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+Home |  | `Select(0,-1,0,-1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+End |  | `Select(0,1,0,1)` | Start text selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+UpArrow |  | `Select(1,0,-1)` | Start block selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| Shift+DownArrow |  | `Select(1,0,1)` | Start block selection, ignored in Far, may be disabled on ‘Mark & Paste’ and ‘App distinct’ pages |
| *NoDefault* |  |  | Decrease window width (check ‘Resize with arrows’) |
| *NoDefault* |  |  | Increase window width (check ‘Resize with arrows’) |
| *NoDefault* |  |  | Decrease window height (check ‘Resize with arrows’) |
| *NoDefault* |  |  | Increase window height (check ‘Resize with arrows’) |
