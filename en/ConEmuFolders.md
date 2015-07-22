---
redirect_from: /ru/ConEmuFolders.html

title: "ConEmu | Installation Folders Structure"

breadcrumbs:
 - url: TableOfContents.html#conemu
   title: ConEmu
 - url: Installation.html
   title: Installation
---

# Installation Folders Structure

ConEmu has several required files (`exe` and `dll`) for normal operation.

This page describes possible variants of files layouts.


<h2 id="Standard_structure"> Standard structure </h2>

| File | Description |
|:---|:---|
| `.\ConEmu.exe` <br> `.\ConEmu64.exe` | Main ConEmu files (32bit and 64bit), usually located in `C:\Program Files\ConEmu`.<br> Far Manager users might install ConEmu to the folder, where `far.exe` is located.<br> In that case, default shell will be `far.exe`. |
| `.\ConEmu\ConEmuC.exe` <br> `.\ConEmu\ConEmuCD.dll` <br> `.\ConEmu\ConEmuHk.dll` | Required 32bit console part of ConEmu package.<br> These files are required in 64bit OS`s too, if you want to<br> run any 32bit application in ConEmu. |
| `.\ConEmu\ConEmuC64.exe` <br> `.\ConEmu\ConEmuCD64.dll` <br> `.\ConEmu\ConEmuHk64.dll` | Required 64bit console part of ConEmu package. These files are required in 64bit OS`s only. |
| `.\Plugins\ConEmu\` | This folder contains Far Manager plugins. If you are not using Far Manager, you may delete `Plugins` folder |


<h2 id="Plain_structure"> Plain structure </h2>

| File | Description |
|:---|:---|
| `.\ConEmu.exe` <br> `.\ConEmu64.exe` <br> `.\ConEmuC.exe` <br> `.\ConEmuCD.dll` <br> `.\ConEmuHk.dll` <br> `.\ConEmuC64.exe` <br> `.\ConEmuCD64.dll` <br> `.\ConEmuHk64.dll` | If you wish, you may put all ConEmu files in one folder.<br> But! You must write post-update command to move<br> console-part files to root folder,<br> if you want to use ‘Autoupdate’ feature. |


<h2 id="MinGW_structure"> MinGW structure </h2>

| File | Description |
|:---|:---|
| `.\bin\ConEmu.exe` <br> `.\bin\ConEmu64.exe` | MinGW `bin` folder is located usually in `C:\MinGW\bin`. |
| `.\libexec\conemu\ConEmuC.exe` <br> `.\libexec\conemu\ConEmuCD.dll` <br> `.\libexec\conemu\ConEmuHk.dll` <br> `.\libexec\conemu\ConEmuC64.exe` <br> `.\libexec\conemu\ConEmuCD64.dll` <br> `.\libexec\conemu\ConEmuHk64.dll` | Console-part files located here. |
| `.\libexec\conemu\ConEmu.xml` | Configuration file located here. |
| `.\msys\1.0\bin\sh.exe` | Default shell for this mode (MinGW). |
| `.\bin\sh.exe` | Alternative default shell for this mode (GIT). |
