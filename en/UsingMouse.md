---
redirect_from: /ru/UsingMouse.html

title: "ConEmu | Using Mouse"

breadcrumbs:
 - url: TableOfContents.html#controls
   title: Controls
---

# Using mouse in ConEmu

* [Common](#Common)
  * [Text selection and clipboard](#Text_selection_and_clipboard)
  * [Left click on the tab](#Left_click_on_the_tab)
  * [Right click on the tab](#Right_click_on_the_tab)
  * [Middle click or Ctrl+Right click on the tab](#Middle_click_or_Ctrl+Right_click_on_the_tab)
  * [Right click on Cross button](#Right_click_on_Cross_button)
  * [Double click on left or right window edges](#Double_click_on_left_or_right_window_edges)
* [Far Manager related](#Far_Manager_related)
  * [Drag-n-Drop](#Drag-n-Drop)
  * [Right click on Far Manager panels](#Right_click_on_Far_Manager_panels)
  * [Resizing Far Manager panels with mouse](#Resizing_Far_Manager_panels_with_mouse)
  * [Hyperlinks and compiler errors](#Hyperlinks_and_compiler_errors)
  * [Right click on KeyBar](#Right_click_on_KeyBar)



<h2 id="Common"> Common </h2>

<h3 id="Text_selection_and_clipboard"> Text selection and clipboard </h3>

ConEmu allows marking console blocks and streams,
copying marked text to Windows Clipboard,
pasting from Clipboard to console.
[Read more...](TextSelection.html)



<h3 id="Left_click_on_the_tab"> Left click on the tab </h3>

ConEmu tries to activate corresponding Far window. This may fails when:

* Dialog is opens;
* Modal editor/viewer is open and ConEmu does not detect this;
* Macro is recording/playing.



<h3 id="Right_click_on_the_tab"> Right click on the tab </h3>

When You right clicking on the Tab:

* Tab will be activated;
* Popup menu will be shown.



<h3 id="Middle_click_or_Ctrl+Right_click_on_the_tab"> Middle click or Ctrl+Right click on the tab </h3>

When You right clicking on the Tab:

* Far panels, editor or viewer - ConEmu sends F10 key to console (You may redefine macro);
* Other programs - ConEmu shows dialog with Restart/Terminate/Cancel buttons (same pressing Win-~).



<h3 id="Right_click_on_Cross_button"> Right click on Cross button </h3>

Right clicking on the Cross button (window title) will minimize ConEmu window
to the taskbar status area (hide window from screen).



<h3 id="Double_click_on_left_or_right_window_edges"> Double click on left or right window edges </h3>

Stretch the window to the width of the monitor.



<h2 id="Far_Manager_related"> Far Manager related </h2>

<h3 id="Drag-n-Drop"> Drag-n-Drop </h3>

You may use dragging either with left or right mouse button.

On the [Features](Settings.html#Features) page You may choose modifier
(i.e. LeftCtrl or RightAlt) for each mouse button, which allows drag starting.
Also, You may disable Right or Left (or both) button drag.

Right button default behavoiur is to create link, Left button - copy.

Behaviour can be changed holding Ctrl, Shift, or Alt when You drop items to the target.

Drop to command line:

* Simple drop: paste full file or folder paths, space separated, autoquoted.
* Ctrl: paste with «edit:» prefix
* Alt: paste with «goto:» prefix
* Shift: paste with «view:» prefix



<h3 id="Right_click_on_Far_Manager_panels"> Right click on Far Manager panels </h3>

You may choose right click behaviour:

* Simple send right click to console;
* Show context menu (via EMenu plugin);
* Short click means simple right click, long click (depress, wait a while, release) means context menu.

**NB** *EMenu* plugin must be installed in Far Manager. No macroses or hotkeys are required,
but You may choose different way to display context menu, by specifying the macro in ConEmu settings.

~~~
[HKEY_CURRENT_USER\Software\ConEmu\.Vanilla]
;; This example assume 'e' hotkey for EMenu plugin
"RightClickMacro"="@F11 e Enter Enter"
~~~



<h3 id="Resizing_Far_Manager_panels_with_mouse"> Resizing Far Manager panels with mouse </h3>

This is simple now. Drag panels by bottom border, or by left border of the **right** panel.
Option [Resize panels by mouse](Settings.html#Features) must be checked.



<h3 id="Hyperlinks_and_compiler_errors"> Hyperlinks and compiler errors </h3>

ConEmu can highlight hyperlinks (e.g. `http://www.farmanager.com`) and compiler errors
(e.g. `FarCtrl.pas(1002,49) Error: Identifier not found...`).

Turn on checkbox ‘Highlight and goto’ and choose appropriate modifier (e.g. ‘Left Ctrl’)
on the [TextSelection](Settings.html#settings) page.
So, when you hold selected modifier (e.g. ‘Left Ctrl’) ConEmu will underlines
hyperlinks/errors detected under mouse cursor. LeftClick (with modifier) will open it:

* hyperlinks - in the default browser
* e-mails - in the default Mail program
* compiler errors - in the Far editor, positioned on row and column of the error



<h3 id="Right_click_on_KeyBar"> Right click on KeyBar </h3>

RClick on KeyBar pop up menu with F-key with possible modifiers.
E.g., when you RClick on `7Search` in the Far Editor you can choose
Ctrl-F7 to run Replace dialog.

**NB** When you choose such menu item, ConEmu post «real» keypress to console.
So, macro will be executed, when there is one associated with this keypress.
