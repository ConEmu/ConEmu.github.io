[CmdletBinding(SupportsShouldProcess=$true)]
param(
  [string]$arc_path = "",
  [String]$exe_path = "",
  [String]$git_path = "",
  # Build no
  [string]$build_no = "",
  # Type of release: Alpha|Devel, Preview, Preview_Alpha, Stable
  [string]$relType = "Alpha"
)

$ErrorActionPreference = "Stop"
$Script_Working_path = split-path -parent $MyInvocation.MyCommand.Definition
$base_url = "https://github.com/Maximus5/ConEmu/releases/download"

#Push-Location -Path $Script_File_path
#Push-Location -Path $repos

#Pop-Location
#Pop-Location

$ini_file = Join-Path $git_path "version.ini"
$json_file = Join-Path $git_path "version.json"

if ($build_no -eq "") {
  #$build_no = "140819"
  $build_no = Read-Host "Build no"
  if ($build_no -eq "") {
    throw [Exception] "Empty build number"
  }
} else {
  Write-Host "Build no: $build_no"
}

$names = @()
$names += "ConEmuPack.$build_no.7z"
$names += "ConEmuSetup.$build_no.exe"
$names += "ConEmu_$($build_no)_English.paf.exe"

$files = @()
$files += Join-Path $arc_path $names[0]
$files += Join-Path $exe_path $names[1]
$files += Join-Path $exe_path $names[2]

$urls = @()
$urls += "$base_url/v$($build_no.SubString(0,2)).$($build_no.SubString(2,2)).$($build_no.SubString(4))/$($names[0])"
$urls += "$base_url/v$($build_no.SubString(0,2)).$($build_no.SubString(2,2)).$($build_no.SubString(4))/$($names[1])"
$urls += "$base_url/v$($build_no.SubString(0,2)).$($build_no.SubString(2,2)).$($build_no.SubString(4))/$($names[2])"

# Alternative urls for download (sourceforge)
$urls2 = @()
$sf_folder = ""

# If version comes to both channels: Preview & Alpha
$sects = @()
$js_rels = @()
$sf_prefix="http://downloads.sf.net/project/conemu"
$sf_suffix="?use_mirror=autoselect"

$script:json = (Get-Content -Raw $json_file) | ConvertFrom-JSON

function CheckVersion($stage)
{
  $v = ($json.releases | ? { $_.type -eq "Alpha" }).Version
  if ($build_no -gt $v) {
    return $TRUE
  }
  return $FALSE
}

# Type of release: Alpha|Devel, Preview, Stable
if ($relType -eq "Stable") {
  $sf_folder = "Stable"
  $js_rels += "Stable"
  $sects += "ConEmu_Stable_2"
  if ((CheckVersion "Preview")) {
    $js_rels += "Preview"
    $sects += "ConEmu_Preview_2"
  }
  if ((CheckVersion "Alpha")) {
    $js_rels += "Alpha"
    $sects += "ConEmu_Devel_2"
  }
} elseif (($relType -eq "Preview") -Or ($relType -eq "Preview_Alpha")) {
  $sf_folder = "Preview"
  $js_rels += "Preview"
  $sects += "ConEmu_Preview_2"
  if ((CheckVersion "Alpha")) {
    # Version comes to both channels: Preview & Alpha
    $js_rels += "Alpha"
    $sects += "ConEmu_Devel_2"
  }
} else {
  $sf_folder = "Alpha"
  $js_rels += "Alpha"
  $sects += "ConEmu_Devel_2"
}

# http://downloads.sf.net/project/conemu/Preview/ConEmuPack.160219.7z?use_mirror=autoselect
$urls2 += "$sf_prefix/$sf_folder/$($names[0])$sf_suffix"
$urls2 += "$sf_prefix/$sf_folder/$($names[1])$sf_suffix"
$urls2 += "$sf_prefix/PortableApps/$($names[2])$sf_suffix"

Write-Host "Section:  $($sects[0])"


#### CRC32 calculation begin ####
Write-Host "Preparing CRC32 module..."
Add-Type -PassThru '
using System;

public class Crc32 {
    private static UInt32[] CRCtable = {
        0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
        0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988, 0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
        0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de, 0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
        0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec, 0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
        0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172, 0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
        0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940, 0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
        0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
        0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924, 0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
        0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
        0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
        0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e, 0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
        0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
        0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
        0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0, 0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
        0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
        0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
        0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a, 0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
        0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
        0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
        0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc, 0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
        0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
        0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
        0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236, 0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
        0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
        0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
        0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38, 0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
        0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
        0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
        0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2, 0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
        0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
        0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
        0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94, 0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
    };

    public static string FromData(byte[] bytes)
    {
        UInt32 crc = 0xFFFFFFFF;

        foreach (byte l in bytes) 
        {
            unchecked {
                crc = (crc >> 8) ^ CRCtable[(byte)((byte)crc ^ l)];
            }
        }

        crc ^= 0xFFFFFFFF;

        return crc.ToString("X8");
    }
}
' | Out-Null



Function Crc32-FromFile([string]$fullpath)
{
  $bytes = [System.IO.File]::ReadAllBytes($fullpath)
  return [Crc32]::FromData($bytes)
}

#### CRC32 calculation end ####

#### MD5 calculation begin ####
function md5hash($path)
{
    $fullPath = Resolve-Path $path
    $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $file = [System.IO.File]::Open($fullPath,[System.IO.Filemode]::Open, [System.IO.FileAccess]::Read)
    $sum = [System.BitConverter]::ToString($md5.ComputeHash($file))
    $file.Dispose()
    $sum.ToLower().Replace("-","")
}
#### MD5 calculation end ####


function File-Length([string]$fullpath)
{
  return (Get-Item $fullpath).Length
}


Write-Host "Preparing ProfileAPI module..."
Add-Type -PassThru '
// AUTHOR: James Vierra , DSS
// DATE  : 8/30/2012
using System;
using System.Text;
using System.Runtime.InteropServices;
public class ProfileAPI {
    [DllImport("kernel32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool WritePrivateProfileString(
        string lpAppName,
        string lpKeyName,
        string lpString,
        string lpFileName);
}
' | Out-Null


<#
   The actions
#>

<#
foreach ($f in $files) {
  $len = 
  $crc = (Crc32-FromFile $f).ToUpper()
  $md5 = (md5hash $f)
  $line = ($len + ",x" + $crc + "," + $f)
  Write-Host $line
  Write-Host ("  " + $md5)
}
#>

Push-Location $git_path

#Write-Host -ForegroundColor Yellow "WorkDir: $((get-location).Path)"
#git checkout master
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: Failed to checkout master branch" }

$files_crc = @()
$files_md5 = @()
$files_len = @()
for ($i = 0; $i -lt $files.count; $i++) {
  Write-Host $files[$i]
  $files_crc += (Crc32-FromFile $files[$i]).ToUpper()
  $files_md5 += (md5hash $files[$i])
  $files_len += (File-Length $files[$i])
}


function WriteSection($section) {
  # version=160219
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "version", $build_no, $ini_file)
  # location_arc=2385641,x25028A66,https://github.com/Maximus5/ConEmu/releases/download/v16.02.19/ConEmuPack.160219.7z
  $line = ([string]($files_len[0]) + ",x" + $files_crc[0] + "," + $urls[0])
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "location_arc", $line, $ini_file)
  # md5_arc=056c498c41f8ccfcc95bff1ef86e21ad
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "md5_arc", $files_md5[0], $ini_file)
  # mirror1_arc=http://downloads.sf.net/project/conemu/Preview/ConEmuPack.160219.7z?use_mirror=autoselect
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "mirror1_arc", $urls2[0], $ini_file)

  # location_exe=4679080,x829DA663,https://github.com/Maximus5/ConEmu/releases/download/v16.02.19/ConEmuSetup.160219.exe
  $line = ([string]($files_len[1]) + ",x" + $files_crc[1] + "," + $urls[1])
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "location_exe", $line, $ini_file)
  # md5_exe=c0f23175c4dfe43ce45c18a37b550e23
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "md5_exe", $files_md5[1], $ini_file)
  # mirror1_exe=http://downloads.sf.net/project/conemu/Preview/ConEmuSetup.160219.exe?use_mirror=autoselect
  $rc = [ProfileAPI]::WritePrivateProfileString($section, "mirror1_exe", $urls2[1], $ini_file)
}

$sects | % { WriteSection $_ }

Write-Host "Success:  $ini_file"

function UpdateJSONFile($js,$urls,$size,$crc,$md5) {
  if ($js -eq $null) {
    Write-Host -ForegroundColor Red "JSON key not found!"
    return
  }
  $js."urls" = $urls
  $js."size" = $size
  $js."crc32" = $crc
  $js."md5" = $md5
}

function UpdateJSON($type) {
  $types = @("7-Zip", "Installer", "PortableApps")
  $script:json."lastmod" = (get-date -Format "yyyy-MM-ddTHH:mm:ss.fffZ")
  #$script:json."releases"
  Write-Host "Updating json release type=$type"
  $script:json."releases" | ? { $_."type" -eq $type } | % {
    #$_
    $_."version" = $build_no
    for ($i = 0; $i -lt $files.count; $i++) {
      UpdateJSONFile ($_."files" | ? { $_."type" -eq $types[$i] }) @($urls[$i], $urls2[$i]) $files_len[$i] $files_crc[$i] $files_md5[$i]
    }
  }
}

function WriteFileContent($file,$text)
{
  $Utf8NoBom = new-object -TypeName System.Text.UTF8Encoding($FALSE)
  [System.IO.File]::WriteAllText($file, $text, $Utf8NoBom)
}

$js_rels | % { UpdateJSON $_ }
# Format with spaces
$json_data = (ConvertTo-JSON $script:json -Depth 99)
$json_fmt = @()
$json_fmt += @{ what="`"".PadLeft(56); to="`"".PadLeft(14); }
$json_fmt += @{ what="]".PadLeft(52); to="]".PadLeft(10); }
$json_fmt += @{ what="`"".PadLeft(43); to="`"".PadLeft(12); }
$json_fmt += @{ what="`"".PadLeft(25); to="`"".PadLeft(8); }
$json_fmt += @{ what="{".PadLeft(39); to="{".PadLeft(8); }
$json_fmt += @{ what="}".PadLeft(39); to="}".PadLeft(8); }
$json_fmt += @{ what="{".PadLeft(21); to="{".PadLeft(4); }
$json_fmt += @{ what="}".PadLeft(21); to="}".PadLeft(4); }
$json_fmt += @{ what="],".PadLeft(21); to="];".PadLeft(10); }
$json_fmt += @{ what="]".PadLeft(21); to="]".PadLeft(6); }
$json_fmt += @{ what="]".PadLeft(20); to="]".PadLeft(6); }
$json_fmt += @{ what="]".PadLeft(17); to="]".PadLeft(2); }
$json_fmt += @{ what="`"".PadLeft(4); to="`"".PadLeft(2); }
$json_fmt += @{ what="`"type`":  `"";  to="`"type`": `""; }
$json_fmt += @{ what=":  [";  to=": ["; }
$json_fmt += @{ what="`"size`":  ";  to="`"size`":   "; }
$json_fmt += @{ what="`"crc32`":  `""; to="`"crc32`": `""; }
$json_fmt += @{ what="`"md5`":  `"";   to="`"md5`":   `""; }
$json_fmt += @{ what="`"description`":  `""; to="`"description`": `""; }
$json_fmt | % {
  $json_data = $json_data.Replace($_.what, $_.to)
}
# Write to version.json
WriteFileContent $json_file $json_data
#Set-Content $json_file (ConvertTo-JSON $script:json) -Encoding UTF8
Write-Host "Success:  $json_file"




#git add version.ini
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: Failed to add version.ini" }
#git commit -m "ConEmu $build_no AutoUpdate information"
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: Failed to commit version.ini" }
#git checkout conemu-ru
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: Failed to checkout conemu-ru branch" }
#git merge master
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: merge failed" }
#git checkout master
#if ($LASTEXITCODE -gt 0) { throw [Exception] "git: Failed to checkout master branch" }

Pop-Location

#Write-Host "Git operations finished successfully"
