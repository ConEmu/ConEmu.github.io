# ==============================================================================
#
# Copyright 2018 ConEmu.Maximus5@gmail.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

# urls
$url_ver = "https://conemu.github.io/version.ini"
$url_7za = "https://github.com/ConEmu/ConEmu.github.io/releases/download/7zip-9.20/7za.exe"

# predefines        default val    arg name
$script:dstdir    = "C:\ConEmu"  # dst
$script:build     = "alpha"      # ver
$script:xmlsrc    = ""           # xml
$script:createlnk = $TRUE        # lnk = $TRUE | lnk = 'ConEmu'
$script:lnkname   = "ConEmu"
$script:runconemu = $FALSE       # run

# check arguments and fill absent

# $dst may contains valid full path, example: 'C:\Tools\ConEmu'
if (($dst -ne $null) -And ($dst.GetType().Name -eq "String") -And ($dst -ne "") -And `
    (Test-Path -IsValid -PathType Container $dst) -And (Split-Path -IsAbsolute $dst) -And `
    ((Split-Path -Qualifier $dst).Length -eq 2) -And ((Split-Path -NoQualifier $dst).Length -gt 1)) {
  $script:dstdir = $dst
}
# $ver may contains release type: stable | preview | alpha
if (($ver -ne $null) -And ($ver.GetType().Name -eq "String") -And ($ver -ne "") -And `
    (($ver -eq "stable") -Or ($ver -eq "beta") -Or ($ver -eq "preview"))) {
  $script:build = $ver
}
# $xml may contains full path or url to your ConEmu.xml config, example:
# https://gist.github.com/Maximus5/0e52de383841a241d9a0/raw/2f6c80330ed86fd4c3df06d68edc3a5a8a3e2d57/ConEmu.xml
if (($xml -ne $null) -And ($xml.GetType().Name -eq "String") -And ($xml -ne "") -And `
    (Split-Path -IsAbsolute $xml)) {
  $script:xmlsrc = $xml
}
# $lnk may be $TRUE, $FALSE, or 'Shortcut name' ('ConEmu' for example)
if ($lnk -ne $null) {
  if ($lnk.GetType().Name -eq "Boolean") {
    $script:createlnk = $lnk
  } elseif (($lnk.GetType().Name -eq "String") -And ($lnk -ne "")) {
    $script:lnkname = $lnk
  }
}
# $run may be $TRUE or $FALSE
if (($run -ne $null) -And ($run.GetType().Name -eq "Boolean")) {
  $script:runconemu = $run
}


# helper functions
function DownloadFile([string]$url,[string]$file)
{
  Write-Host -ForegroundColor Gray -NoNewline "   from "
  Write-Host -ForegroundColor White $url
  Write-Host -ForegroundColor Gray -NoNewline "     to "
  Write-Host -ForegroundColor White $file
  $downloader = new-object Net.WebClient
  $downloader.DownloadFile($url, $file)
}

function DownloadString([string]$url)
{
  Write-Host -ForegroundColor Gray -NoNewline "   from "
  Write-Host -ForegroundColor White $url
  $downloader = new-object Net.WebClient
  return $downloader.DownloadString($url)
}

function GetDownloadUrl([string]$data,[string]$section)
{
  $lines = $ver_ini.Split("`r`n")
  $url = ""
  for ($i = 0; $i -lt $lines.Length; $i++) {
    if (($lines[$i]) -eq $section) {
      for ($j = $i+1; $j -lt $lines.Length; $j++) {
        if (($lines[$j].Length -gt 14) -And ($lines[$j].Substring(0,13)) -eq "location_arc=") {
          $tokens = $lines[$j].Split(",")
          if ($tokens.Length -eq 3) {
            return $tokens[2]
          }
        } elseif (($lines[$j] -ne "") -And ($lines[$j].Substring(0,1) -eq "[")) {
          return ""
        }
      }
      return ""
    }
  }
  return ""
}


# Main cycle
try {

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

  # retrieve url of the latest version
  Write-Host "Download latest version information"
  $ver_ini = DownloadString $url_ver

  # parse ini file and find the url
  if ($script:build -eq "stable") {
    # That may be old
    $url_pack = GetDownloadUrl $ver_ini "[ConEmu_Stable_2]"
  } elseif (($script:build -eq "beta") -Or ($script:build -eq "preview")) {
    # Updated more frequently
    $url_pack = GetDownloadUrl $ver_ini "[ConEmu_Preview_2]"
  } else {
    # Latest fixes and features
    $url_pack = GetDownloadUrl $ver_ini "[ConEmu_Devel_2]"
  }

  if ($url_pack -eq "") {
    Write-Host -ForegroundColor Red "Error: Download url was not found!"
    return 99
  }

  #preparing paths
  $ConEmuTempDir = Join-Path $env:TEMP "ConEmuDownloads"
  if (-Not (Test-Path -Path $ConEmuTempDir -PathType Container)) {
    $d = mkdir $ConEmuTempDir
  }

  # download the package
  Write-Host "Download ConEmu package"
  $file = Join-Path $ConEmuTempDir "ConEmuPack.7z"
  #$log = Join-Path $ConEmuTempDir "ConEmuPack.log"
  DownloadFile $url_pack $file

  # download 7zip
  Write-Host "Download 7-Zip commandline tool"
  $7zaExe = Join-Path $ConEmuTempDir "7za.exe"
  DownloadFile $url_7za $7zaExe

  #((test-path -isvalid -pathtype container $d) -And (split-path -isabsolute $d))

  # preparing destination folder
  if (-Not (Test-Path -Path $script:dstdir -PathType Container)) {
    $d = mkdir $script:dstdir
  }
  # and some file path names
  $exe_file = Join-Path $script:dstdir "ConEmu.exe"
  $xml_file = Join-Path $script:dstdir "ConEmu.xml"

  # unpacking
  Write-Host "Extracting $file to $script:dstdir..."
  Start-Process $7zaExe -ArgumentList "x -o`"$script:dstdir`" -y `"$file`"" -Wait -NoNewWindow # -RedirectStandardOutput $log

  # create ConEmu.xml if not exists yet
  if (-Not (Test-Path -Path $xml_file -PathType Leaf)) {
    if ($script:xmlsrc -ne "") {
      $xml_data = DownloadString $script:xmlsrc
    } else {
      $xml_data = ""
    }
    #Set-Content $xml_file $xml_data
    $Utf8NoBom = new-object -TypeName System.Text.UTF8Encoding($FALSE)
    [System.IO.File]::WriteAllText($xml_file, $xml_data, $Utf8NoBom)
  }

  # create shortcut on desktop?
  if ($script:createlnk) {
    $desktop = [Environment]::GetFolderPath("Desktop")
    if ($desktop -eq "") {
      $desktop = Join-Path ([Environment]::GetFolderPath("UserProfile")) "Desktop"
    }
    if (-Not (Test-Path -Path $xml_file -PathType Leaf)) {
      Write-Host -ForegroundColor Red "Desktop folder detection failed!"
    } else {
      $lnkpath = Join-Path $desktop ($script:lnkname + ".lnk")
      Write-Host ("Creating shortcut: " + $lnkpath)
      $WshShell = New-Object -comObject WScript.Shell
      $Shortcut = $WshShell.CreateShortcut($lnkpath)
      $Shortcut.TargetPath = $exe_file
      $Shortcut.IconLocation = ($exe_file + ",-1")
      if (Test-Path -Path $env:UserProfile -PathType Container) {
        $Shortcut.WorkingDirectory = $env:UserProfile
      }
      $Shortcut.Save()
    }
  }

  # start installed ConEmu?
  if ($script:runconemu) {
    Start-Process $exe_file -ArgumentList "-dir `"$env:UserProfile`""
  }

} catch {
  $se = [String]$error[0].Exception
  Write-Host -ForegroundColor Red $se
  return 99
}

# succeeded
Write-Host -ForegroundColor Green "`nConEmu installation succeeded`n"
