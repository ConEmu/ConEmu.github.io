
$Script_File_path = split-path -parent $MyInvocation.MyCommand.Definition
$img_path = Join-Path $Script_File_path "img"

$IDD_SPG_FONTS         = 151
$IDD_SPG_COLORS        = 152
$IDD_SPG_INFO          = 153
$IDD_SPG_FEATURES      = 154
$IDD_SPG_DEBUG         = 155
$IDD_SPG_FEATURE_FAR   = 156
$IDD_SPG_TASKS         = 157
$IDD_SPG_APPDISTINCT   = 158
$IDD_SPG_COMSPEC       = 159
$IDD_SPG_STARTUP       = 160
$IDD_SPG_STATUSBAR     = 161
$IDD_SPG_APPDISTINCT2  = 162
$IDD_SPG_CURSOR        = 163
$IDD_SPG_INTEGRATION   = 164
$IDD_SPG_TRANSPARENT   = 165
$IDD_SPG_SIZEPOS       = 167
$IDD_SPG_MARKCOPY      = 168
$IDD_SPG_TABS          = 169
$IDD_SPG_VIEWS         = 170
$IDD_SPG_KEYS          = 171
$IDD_SPG_UPDATE        = 172
$IDD_SPG_APPEAR        = 174
$IDD_SPG_TASKBAR       = 175
$IDD_SPG_DEFTERM       = 176
$IDD_SPG_FARMACRO      = 177
$IDD_SPG_HIGHLIGHT     = 178
$IDD_SPG_PASTE         = 179
$IDD_SPG_CONFIRM       = 180
$IDD_SPG_HISTORY       = 181
$IDD_SPG_BACKGR        = 182
$IDD_SPG_ENVIRONMENT   = 183
$IDD_SPG_KEYBOARD      = 184
$IDD_SPG_MOUSE         = 185
$IDD_SPG_QUAKE         = 186
$IDD_SPG_CHILDGUI      = 187
$IDD_SPG_ANSI          = 188

$pages = @(
    @{id=$IDD_SPG_FONTS;       child=0; title="Main";        file="Settings-Main.png";},
    @{id=$IDD_SPG_SIZEPOS;     child=1; title="Size & Pos";  file="Settings-SizePos.png";},
    @{id=$IDD_SPG_APPEAR;      child=1; title="Appearance";  file="Settings-Appearance.png";},
#   @{id=0}, # Uncomment to stop processing (for test purposes)
    @{id=$IDD_SPG_QUAKE;       child=1; title="Quake style"; file="Settings-Quake.png";}, # NEW !!
    @{id=$IDD_SPG_BACKGR;      child=1; title="Background";  file="Settings-Background.png";}, # NEW !!
    @{id=$IDD_SPG_TABS;        child=1; title="Tabs";        file="Settings-TabBar.png";},
    @{id=$IDD_SPG_CONFIRM;     child=1; title="Confirm";     file="Settings-Confirm.png";},    # NEW !!
    @{id=$IDD_SPG_TASKBAR;     child=1; title="Task bar";    file="Settings-TaskBar.png";},
    @{id=$IDD_SPG_UPDATE;      child=1; title="Update";      file="Settings-Update.png";},
    @{id=$IDD_SPG_STARTUP;     child=0; title="Startup";     file="Settings-Startup.png";},
    @{id=$IDD_SPG_TASKS;       child=1; title="Tasks";       file="Settings-Tasks.png";},
    @{id=$IDD_SPG_ENVIRONMENT; child=1; title="Environment"; file="Settings-Environment.png";},
    @{id=$IDD_SPG_FEATURES;    child=0; title="Features";    file="Settings-Features.png";},
    @{id=$IDD_SPG_CURSOR;      child=1; title="Text cursor"; file="Settings-TextCursor.png";},
    @{id=$IDD_SPG_COLORS;      child=1; title="Colors";      file="Settings-Colors.png";},
    @{id=$IDD_SPG_TRANSPARENT; child=1; title="Transparency";file="Settings-Transparency.png";},
    @{id=$IDD_SPG_STATUSBAR;   child=1; title="Status bar";  file="Settings-StatusBar.png";},
    @{id=$IDD_SPG_APPDISTINCT; child=1; title="App distinct";file="Settings-AppDistinct.png";},
    @{id=$IDD_SPG_INTEGRATION; child=0; title="Integration"; file="Settings-Integration.png";},
    @{id=$IDD_SPG_DEFTERM;     child=1; title="Default term";file="Settings-DefTerm.png";},
    @{id=$IDD_SPG_COMSPEC;     child=1; title="ComSpec";     file="Settings-Comspec.png";},
    @{id=$IDD_SPG_CHILDGUI;    child=1; title="Children GUI";file="Settings-ChildGui.png";},
    @{id=$IDD_SPG_ANSI;        child=1; title="ANSI execution";file="Settings-ANSI.png";}, # NEW
    @{id=$IDD_SPG_KEYS;        child=0; title="Keys & Macro";file="Settings-Hotkeys.png";},
    @{id=$IDD_SPG_KEYBOARD;    child=1; title="Keyboard";    file="Settings-Keyboard.png";},
    @{id=$IDD_SPG_MOUSE;       child=1; title="Mouse";       file="Settings-Mouse.png";},
    @{id=$IDD_SPG_MARKCOPY;    child=1; title="Mark/Copy";   file="Settings-MarkCopy.png";},
    @{id=$IDD_SPG_PASTE;       child=1; title="Paste";       file="Settings-Paste.png";},
    @{id=$IDD_SPG_HIGHLIGHT;   child=1; title="Highlight";   file="Settings-Highlight.png";},
    @{id=$IDD_SPG_FEATURE_FAR; child=0; title="Far Manager"; file="Settings-Far.png";},
    @{id=$IDD_SPG_FARMACRO;    child=1; title="Far macros";  file="Settings-Far-Macros.png";},
    @{id=$IDD_SPG_VIEWS;       child=1; title="Views";       file="Settings-Far-View.png";},
    @{id=$IDD_SPG_INFO;        child=0; title="Info";        file="Settings-Info.png";},
    @{id=$IDD_SPG_DEBUG;       child=1; title="Debug";       file="Settings-Debug.png";}
    @{id=0}
)

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null

Add-Type -ReferencedAssemblies "System.Drawing" -PassThru '
// (C) 2015 ConEmu.Maximus5@gmail.com
using System;
using System.Drawing;
using System.Runtime.InteropServices;
public class ActiveWindowAPI {

    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [StructLayout(LayoutKind.Sequential)]
    public struct RECT
    {
        public int Left, Top, Right, Bottom;
    };

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool GetWindowRect(IntPtr hWnd, out RECT rect);

    public static System.Drawing.Rectangle GetWndRect(IntPtr hWnd)
    {
        System.Drawing.Rectangle rect;
        RECT rct = new RECT();
        if (GetWindowRect(GetForegroundWindow(), out rct))
            rect = System.Drawing.Rectangle.FromLTRB(rct.Left, rct.Top, rct.Right, rct.Bottom);
        else
            rect = System.Drawing.Rectangle.FromLTRB(0, 0, 0, 0);
        return rect;
    }
}
' | Out-Null

$os_shift_left = 0
$os_shift_right = 0
$os_shift_top = 0
$os_shift_bottom = 0

$v = [System.Environment]::OSVersion.Version
if ($v.Major -eq 10) {
  $os_shift_left = 2
  $os_shift_right = -2
  $os_shift_top = 0
  $os_shift_bottom = -2
} elseif (($v.Major -eq 6) -And (($v.Minor -eq 2) -Or ($v.Minor -eq 3))) {
  $os_shift_left = -5
  $os_shift_right = 5
  $os_shift_top = -5
  $os_shift_bottom = 5
}

function ScreenShot([Drawing.Rectangle]$bounds, $path) {
 $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
 $graphics = [Drawing.Graphics]::FromImage($bmp)

 $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)
 $bmp.Save($path)
 $graphics.Dispose()
 $bmp.Dispose()
}

function DoScreenShoot($page,$file)
{
  #$preWnd = [ActiveWindowAPI]::GetForegroundWindow()
  & ConEmuC -GuiMacro Settings $page
  Sleep 1
  $wnd = [ActiveWindowAPI]::GetForegroundWindow()
  #if ($preWnd -eq $wnd) {
  #  Write-Host -ForegroundColor Red "Settings window was not opened"
  #  return
  #}
  $r = [ActiveWindowAPI]::GetWndRect($wnd)
  $bounds = [Drawing.Rectangle]::FromLTRB($r.Left+$os_shift_left,$r.Top+$os_shift_top,$r.Right+$os_shift_right,$r.Bottom+$os_shift_bottom)
  ScreenShot $bounds $file
}

if (-Not [System.IO.Directory]::Exists($img_path)) {
  mkdir $img_path | Out-Null
}

$pages | % {
  if ($_.id -eq 0) {
    exit
  }
  Write-Host ([String]$_.id + ": " + $_.title)
  DoScreenShoot $_.id (Join-Path $img_path $_.file)
}
