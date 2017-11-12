---
redirect_from:
 - /ru/SettingsMarkCopy.html

title: "ConEmu | Settings › MarkCopy page"

breadcrumbs:
 - url: TableOfContents.html#settings
   title: Settings
---

# Settings: Mark/Copy

*This page was generated automatically from ConEmu sources*
{% comment %} IDD_SPG_MARKCOPY {% endcomment %}

![ConEmu Settings: Mark/Copy](/img/Settings-MarkCopy.png)



## Text selection  {#id2975}

#### Freeze console contents before selection (may cause small lag)  {#id2257}


#### Detect line ends  {#id2358}
Try to copy wrapped text as single line when possible (Text selection)

#### Bash margin  {#id2359}
Bash leave one space-character on the right edge of console when wrapping lines, skip these spaces when copying to clipboard

#### Trim trailing spaces  {#id2365}
3rd-state means ‘Only for Text selection’

#### EOL  {#id2367}
Choose preferred line separator (\r\n, \n or \r)

Copying format





## Color indexes  {#id2976}



Foreground



Background









## Select text with mouse (LeftClick+Drag)  {#id2979}

#### Intelligent mode  {#id2657}


#### Exceptions ("|"-separated)


#### Text selection  {#id1630}
Enable streaming selection (like GUI text editors)

#### Block (rectangular) selection  {#id1635}
Enable rectangular selection (like standard Windows console)

#### Copy on Left Button release  {#id2340}
Copy immediately on left mouse button up (when selecting with mouse)

Choose modifier to starting ‘Text selection’ with mouse LeftClick+Drag

#### Reset selection on Left Button release  {#id3029}
Reset selection region on left mouse button up (when selecting with mouse)

Choose modifier to starting ‘Block selection’ with mouse LeftClick+Drag

#### Show IBeam cursor  {#id2603}
Show IBeam (text selection) cursor when available and allowed by settings and key modifiers



## Select text with keyboard (Also there are two hotkeys on KeysMacro page)  {#id2980}

#### Start selection with Shift+Arrow (Text = Left/Right/Home/End, Block = Up/Down)  {#id2553}
Start text selection with Shift+Left/Right/Home/End or block selection with Shift+Up/Down

#### Reset selection on input  {#id2412}
Reset selection region on keypress

#### any non-alpha-numeric key  {#id2436}
When ‘Off’ - only characters ends selection When ‘On’ - any key ends selection (Arrows, PgUp, End, etc.)

#### copy before reset  {#id2579}
Copy selection to clipboard before selection region reset

#### try to cut/erase selection before reset  {#id3030}
Try to erase selected region if possible by posting sequence of Del/BS to console. Implement ‘usual’ hotkeys Ctrl+X, Shift+Del, BS and Del.



