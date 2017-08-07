---
redirect_from:
 - /ru/TabBar.html
 - /ru/Tabs.html
 - /en/Tabs.html

title: "ConEmu | TabBar"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls
---

# Windows console with tabs

ConEmu may visualize with tabs all opened consoles, GUI applications
(PuTTY for example) and Far Manager windows (panels, editors,
viewers). ConEmu can handle up to 30 consoles and much more Far
Manager editor (viewer) windows.

![ConEmu tabs](/img/ConEmuTabs2.png "ConEmu tabs and multiconsole")

Tab captions may be changed

* with templates on Settings pages [Tabs](SettingsTabBar.html) and [Far Manager](SettingsFar.html)
* manually from tab context menu or customizable hotkey (`Apps+R` by default)

Initially Far Manager Viewer windows are framed by square brackets.
Editor windows are framed by curly brackets.
Modified editors marked with asterisk.
Asterisk immediately appears and disappears on editor status change.
You may change tabs appearence with [templates](SettingsTabBar.html).

**Note**: ConEmu plugin is required to get tabs for Far Manager editors and viewers!

Left click on a tab will activate it, except Far Manager can't switch to this window
(dialog is opened, macro is recorded or played, Far Manager menu bar is active, and so on).

Right click on a tab will activate it (when it is possible)
and (on succeeded activation) immediately close this tab.
Far Manager windows will be closed by sending key sequence (F10 by default).
Key sequence may be changed via registry value TabCloseMacro.
Right click on a tab, containing other console applications (cmd, powershell, etc.)
brings Recreate dialog.

Consoles, started under Administrator (look at Run as administrator checkbox),
are marked with *Shield* icon.
If You want, ConEmu may show ` (Admin)` suffix instead of icon.
You can change suffix text or completely remove it on
[Tabs page](SettingsTabBar.html) of Settings dialog.

Also, you may strip superfluous `Administrator:` prefix from console title:
[Skip words from title](SettingsTabBar.html) edit field.

## Switching between consoles  {#switching-consoles}

‘Activate console by number’ is configurable on the [Keys & Macro](SettingsHotkeys.html) settings page,
`LCtrl+Number` is default hotkey for the action.

* When console count less or equal to 10: `LCtrl+1` activates first console, `LCtrl+9` - ninth, `LCtrl+0` - tenth.
* Otherwise - one-digit-number and two-digit-number activations are allowed. Example:
  * `LCtrl(down) 1 5` - activates 15'th console;
  * `LCtrl(down) 1 LCtrl(up)` - activates 1'th console.

`LCtrl` is default [modifer](ConEmuTerms.html#Host_key),
You may select yours convinent combination (up to 3 keys)
from `Win`, `Ctrl`, `Alt`, `Shift` and [`Apps`](AppsKey.html).

By default, ConEmu [internally handles Ctrl+Tab](SettingsTabBar.html) combination,
which switch consoles too. But this combination does not work with [ChildGui](ChildGui.html).

Also, you may use `Win+Tab` to switch consoles (check box on [Keyboard](SettingsKeyboard.html) page).

At last, there are [hotkeys](SettingsHotkeys.html):
* ‘Switch next console’ - `Win+Shift+Q`;
* ‘Switch previous console’ - unassigned.
