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

<h2 id="Please_note"> Please note! </h2>

These shortcuts are only defaults!
You may redefine almost all combinations
and define up to 32 [GuiMacro](GuiMacro.html) hotkeys
on the [Keys](/SettingsHotkeys.html#Hotkeys_list) page.

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


<h3> Full list of hotkeys and notes </h3>

Take a look at full list of
[keyboard shortcuts](/SettingsHotkeys.html#Hotkeys_list)
and notes about [global hotkeys](GlobalHotKeys.html).
