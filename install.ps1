param([String]$dstdir="",[String]$build="alpha")

# ==============================================================================
# 
# Copyright 2014 ConEmu.Maximus5@gmail.com
#
# Released under the Apache 2.0 License
# 
# Copyright 2007-2008 The Apache Software Foundation.
#  
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use 
# this file except in compliance with the License. You may obtain a copy of the 
# License at 
#
#     http://www.apache.org/licenses/LICENSE-2.0 
# 
# Unless required by applicable law or agreed to in writing, software distributed 
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
# CONDITIONS OF ANY KIND, either express or implied. See the License for the 
# specific language governing permissions and limitations under the License.
# ==============================================================================

# urls
$url_ver = "http://conemu-maximus5.googlecode.com/svn/trunk/ConEmu/version.ini"
$url_7za = "http://conemu.github.io/7zip/7za.exe"

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

  # retrieve url of the latest version
  Write-Host "Download latest version information"
  $ver_ini = DownloadString $url_ver

  # parse ini file and find the url
  if ($build -eq "stable") {
    # That may be old
    $url_pack = GetDownloadUrl $ver_ini "[ConEmu_Stable_2]"
  } elseif (($build -eq "beta") -Or ($build -eq "preview")) {
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
    mkdir $ConEmuTempDir
  }

  # download the package
  Write-Host "Download ConEmu package"
  $file = Join-Path $ConEmuTempDir "ConEmuPack.7z"
  DownloadFile $url_pack $file

  # download 7zip
  Write-Host "Download 7-Zip commandline tool"
  $7zaExe = Join-Path $ConEmuTempDir "7za.exe"
  DownloadFile $url_7za $7zaExe

  # preparing destination folder
  if ($dstdir -eq "") {
    $dstdir = "C:\ConEmu"
  }
  if (-Not (Test-Path -Path $dstdir -PathType Container)) {
    mkdir $dstdir
  }

  # unpacking
  Write-Host "Extracting $file to $dstdir..."
  Start-Process $7zaExe -ArgumentList "x -o`"$dstdir`" -y `"$file`"" -Wait -NoNewWindow

  # create ConEmu.xml if not exists yet
  $xml_file = Join-Path $dstdir "ConEmu.xml"
  if (-Not (Test-Path -Path $xml_file -PathType Leaf)) {
    Set-Content $xml_file '<?xml version="1.0" encoding="utf-8"?>'
  }

  # start installed ConEmu?
  $ConEmuExe = Join-Path $dstdir "ConEmu.exe"
  #Start-Process $ConEmuExe -ArgumentList "-dir `"$env:UserProfile`""

} catch {
  $se = [String]$error[0].Exception
  Write-Host -ForegroundColor Red $se
  return 99
}

Write-Host "ConEmu installation succeeded"
