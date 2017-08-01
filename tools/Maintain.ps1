param([string]$mode="sitemap",[string]$add_arg)

# -mode format
#    This will reformat all site pages using templates
# -mode trim
#    This will trim all formatting from site pages to easify editing
# -mode short
#    This will reformat all site pages using light template without google scripts
# -mode sitemap
#    This will create ./sitemap.xml

$tools_path = split-path -parent $MyInvocation.MyCommand.Definition
$root = split-path -parent $tools_path
$xml_sitedata = "$tools_path\sitedata.xml"
$xml_sitemap = "$tools_path\sitemap.xml"
$sitemap_prefix = "https://conemu.github.io/"
$root_pages = @("index.html", "auto.html", "donate.html")
$ignore_pages = @(
  "ClipFixer.html", "Far3Wrapper.html", "FarPlugins.html", "FARSelector.html", "FarWDS.html", "FileTypes.html",
  "ImpEx.html", "Issues2.html", "MBlockEditor.html", "MMView.html", "PicView.html", "PVSStudio.html",
  "QSearchSwitch.html", "RegEditor.html", "Resolve.html", "UnInstall.html", "DirSync.html",
  "Command_Line.html")

$tag_start = "<!-- Content starts -->"
$tag_end   = "<!-- Content ends -->"

$toc_file  = "TableOfContents.html"
$toc_start = "<!-- BackToContents start -->"
$toc_end   = "<!-- BackToContents end -->"

$simple_wrapper = "<html><head><link rel=`"stylesheet`" href=`"../main.css`"></head><body><div class=`"wrapper`"><div class=`"maincol`" id=`"wikimaincol`"><div class=`"middle`"><div class=`"container`"><div class=`"content`">"

function ReadFileContent($file)
{
  if ([System.IO.File]::Exists($file)) {
    $src = Get-Content $file -Encoding UTF8
    $text = [System.String]::Join("`r`n",$src)
  } else {
    $text = ""
  }
  return $text
}

function TrimFileContent($file)
{
  $text = ReadFileContent $file

  if (($text -eq "") -Or ($text -eq $NULL)) {
    return ""
  }

  # Don't trim anything from jekyll pages
  if ($text.StartsWith("---")) {
    return $text
  }

  # Cut to contents only
  $c1 = $text.IndexOf($tag_start)
  if ($c1 -ge 0) {
    $c1 += $tag_start.Length
    $c2 = $text.IndexOf($tag_end)
    #Write-Host "Content tag found $c1..$c2"
    $text = $text.Substring($c1, $c2-$c1).Trim()
  }

  # First <h?> must be declared with ' id="h0" '
  $h1 = $text.IndexOf("<h")
  if ($h1 -ge 0) {
    if ([char]::IsDigit($text.Substring($h1+2,1)) -And ($text.Substring($h1+3,1) -eq ">")) {
      $text = $text.Substring(0,$h1+3) + " id=`"h0`">" + $text.Substring($h1+4)
    }
  }

  # Simple ‘wrapper’ formatting?
  if ($text.StartsWith($simple_wrapper)) {
    $text = $text.Remove(0, $simple_wrapper.Length).Trim()
  }

  return $text
}

function WriteFileContent($file,$text)
{
  #Set-Content $file $text -Encoding UTF8
  #$Utf8NoBom = new-object -TypeName System.Text.UTF8Encoding($FALSE)
  #[System.IO.File]::WriteAllText($file, $text, $Utf8NoBom)
  [System.IO.File]::WriteAllLines($file, $text)
}

function TrimFiles($files)
{
  Write-Host "Trimming to file contents"

  $pagesCount = $files.Count

  for ($i = 0; $i -lt $pagesCount; $i++) {
    $file = "$root\en\$($files[$i])"
    Write-Host $file
    $text = TrimFileContent $file
    WriteFileContent $file ($simple_wrapper + "`r`n`r`n" + $text)

    $file = "$root\ru\$($files[$i])"
    Write-Host $file
    $text = TrimFileContent $file
    WriteFileContent $file ($simple_wrapper + "`r`n`r`n" + $text)
  }
}

function TrimContent($folder)
{
  $parentAction = "Processings folders (trimming to file contents)"
  $activity = "Trim to file contents"

  Write-Progress -Activity $parentAction -PercentComplete ($script:folderIndex * 100 / $script:folderCount) -Status "$folder" -Id 1
  $script:folderIndex++

  $pages = (Get-ChildItem -Path $folder -Filter "*.html")
  $pagesCount = $pages.Count

  for ($i = 0; $i -lt $pagesCount; $i++) {
    $file = Join-Path $folder $pages[$i].Name
    Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file" -ParentId 1 -Id 2
    $text = TrimFileContent $file
    WriteFileContent $file ($simple_wrapper + "`r`n`r`n" + $text)
  }

  Write-Progress -Activity $activity -PercentComplete 100 -Completed -ParentId 1 -Id 2
}

function FormatFileByTemplate($file,$templ)
{
  $template = ReadFileContent $templ

  $text = TrimFileContent $file

  # TODO: Process page title

  $new_text = $template.Replace("Dummy text", $text)

  if ((Split-Path $file -Leaf) -eq $toc_file) {
    $t1 = $new_text.IndexOf($toc_start)
    $t2 = $new_text.IndexOf($toc_end)
    #Write-Host "Found $toc_file, $t1 .. $t2"
    if (($t1 -gt 1) -And ($t2 -gt $t1)) {
      $new_text = $new_text.Remove($t1, $t2 - $t1 + $toc_end.Length)
    }
  }

  WriteFileContent $file $new_text
}

function PrintPageHash($folder,$templ)
{
  $parentAction = "Processings folders (formatting by template)"
  $activity = "Format by template"

  Write-Progress -Activity $parentAction -PercentComplete ($script:folderIndex * 100 / $script:folderCount) -Status "$folder" -Id 1
  $script:folderIndex++

  $pages = (Get-ChildItem -Path $folder -Filter "*.html")
  $pagesCount = $pages.Count

  $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
  $utf8 = new-object -TypeName System.Text.UTF8Encoding

  for ($i = 0; $i -lt $pagesCount; $i++) {
    $file = Join-Path $folder $pages[$i].Name
    Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file" -ParentId 1 -Id 2
    $text = ReadFileContent $file
    $sum = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($text)))
    Write-Host ($pages[$i].Name.PadRight(30) + " - " + $sum)
  }

  Write-Progress -Activity $activity -PercentComplete 100 -Completed -ParentId 1 -Id 2
}

function RefreshSitePages([boolean]$force_update)
{
  $all_pages = @()

  $activity = "Refreshing sitedata.xml"
  $today = [string](get-date -Format "yyyy-MM-dd")

  if ([System.IO.File]::Exists($xml_sitedata)) {
    $sitedata = [xml](Get-Content $xml_sitedata -Encoding UTF8)
  } else {
    #$sitedata = [xml]("<?xml version=`"1.0`" encoding=`"UTF-8`"?>`r`n<urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`"/>")
    $sitedata = [xml]("<?xml version=`"1.0`" encoding=`"UTF-8`"?>`r`n<urlset/>")
  }
  $urlset = $sitedata.SelectSingleNode("/urlset")

  Write-Progress -Activity $activity -PercentComplete 0

  $pages = (Get-ChildItem -Path (Join-Path $root "en\*") -Include @("*.md","*.html"))
  $pagesCount = $pages.Count

  $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
  $utf8 = new-object -TypeName System.Text.UTF8Encoding

  $root_pages | % {
    $file_name = $_
    $file_en = $_
    $file_ru = $_

    $src_path_en = (Join-Path $root $file_en)
    $src_path_ru = (Join-Path $root $file_en)

    #Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file_en"

    if ([System.IO.Path]::GetExtension($file_en) -eq ".md") {
      $file_en = ([System.IO.Path]::GetFileNameWithoutExtension($file_en) + ".html")
      $file_ru = ([System.IO.Path]::GetFileNameWithoutExtension($file_ru) + ".html")
    }

    $text = TrimFileContent $src_path_en
    if ($text -ne "") {
      $all_pages += $file_en

      $sum_en = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($text)))
      $sum_ru = $sum_en

      $xUrl = $urlset.url | ? { $_.loc -eq $file_en }

      if ($xUrl -ne $NULL) {
        $cur_en_md5 = $xUrl.md5_en

        if (($cur_en_md5 -eq $sum_en) -And (-Not $force_update)) {
          #Write-Host "Existing: $file_en"

        } else {
          Write-Host -ForegroundColor Green "Modified: $file_en"

          $xUrl.md5_en = $sum_en
          $xUrl.md5_ru = $sum_ru
          $xUrl.date = $today
        }

      } else {
        Write-Host -ForegroundColor Cyan "New file: $file_en"

        $xUrl = $sitedata.CreateElement("url")
          $x = $sitedata.CreateElement("loc")
            $x.InnerText = $file_en
            $x = $xUrl.AppendChild($x)
          $x = $sitedata.CreateElement("md5_en")
            $x.InnerText = $sum_en
            $x = $xUrl.AppendChild($x)
          $x = $sitedata.CreateElement("md5_ru")
            $x.InnerText = $sum_ru
            $x = $xUrl.AppendChild($x)
          $x = $sitedata.CreateElement("date")
            $x.InnerText = $today
            $x = $xUrl.AppendChild($x)
          $x = $sitedata.CreateElement("changefreq")
            $x.InnerText = "monthly"
            $x = $xUrl.AppendChild($x)
          $x = $sitedata.CreateElement("priority")
            $x.InnerText = "0.5"
            $x = $xUrl.AppendChild($x)
        $x = $urlset.AppendChild($xUrl)
      }
    }
  }

  $last_bare_name = ""

  for ($i = 0; $i -lt $pagesCount; $i++) {
    $file_name = $pages[$i].Name
    if (($ignore_pages -contains $file_name) -Or
        ($file_name.StartsWith(".")))
    {
      continue
    }

    $bare_name = [System.IO.Path]::GetFileNameWithoutExtension($file_name)
    if ($last_bare_name -eq $bare_name) {
      continue
    }
    $last_bare_name = $bare_name
    if (($bare_name.EndsWith("-auto")) -Or
       ($bare_name.EndsWith("-bad")) -Or
       ($bare_name.StartsWith("0-"))) {
      continue
    }

    $file_en = "en/$file_name"
    $file_ru = "ru/$file_name"

    $src_path_en = (Join-Path $root $file_en)
    $src_path_ru = (Join-Path $root $file_en)

    if ([System.IO.Path]::GetExtension($file_name) -eq ".md") {
      $file_en = "en/$bare_name.html"
      $file_ru = "ru/$bare_name.html"
    }

    # Enlish pages only yet
    $all_pages += $file_en

    Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file_en, $file_ru"

    $text = TrimFileContent $src_path_en
    $sum_en = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($text)))
    $text = TrimFileContent $src_path_ru
    $sum_ru = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($text)))

    $xUrl = $urlset.url | ? { $_.loc -eq $file_en }

    if ($xUrl -ne $NULL) {
      $cur_en_md5 = $xUrl.md5_en
      $cur_ru_md5 = $xUrl.md5_ru

      if (($cur_en_md5 -eq $sum_en) -And ($cur_ru_md5 -eq $sum_ru) -And (-Not $force_update)) {
        #Write-Host "Existing: $file_en, $file_ru"

      } else {
        Write-Host -ForegroundColor Green "Modified: $file_en, $file_ru"

        $xUrl.md5_en = $sum_en
        $xUrl.md5_ru = $sum_ru
        $xUrl.date = $today
      }
    } else {
      Write-Host -ForegroundColor Cyan "New file: $file_en, $file_ru"

      $xUrl = $sitedata.CreateElement("url")
        $x = $sitedata.CreateElement("loc")
          $x.InnerText = $file_en
          $x = $xUrl.AppendChild($x)
        $x = $sitedata.CreateElement("md5_en")
          $x.InnerText = $sum_en
          $x = $xUrl.AppendChild($x)
        $x = $sitedata.CreateElement("md5_ru")
          $x.InnerText = $sum_ru
          $x = $xUrl.AppendChild($x)
        $x = $sitedata.CreateElement("date")
          $x.InnerText = $today
          $x = $xUrl.AppendChild($x)
        $x = $sitedata.CreateElement("changefreq")
          $x.InnerText = "monthly"
          $x = $xUrl.AppendChild($x)
        $x = $sitedata.CreateElement("priority")
          $x.InnerText = "0.5"
          $x = $xUrl.AppendChild($x)
      $x = $urlset.AppendChild($xUrl)
    }
  }

  Write-Progress -Activity $activity -PercentComplete 100 -Completed

  $sitedata.Save($xml_sitedata)

  return $all_pages
}

function GetRussianSideFile($file_en)
{
  if (-Not $file_en.StartsWith("en/")) {
    return ""
  }

  $file_name = $file_en.Substring(3)
  $path_ru = Join-Path $root "ru/$file_name"
  if (-Not [System.IO.File]::Exists($path_ru)) {
    if ([System.IO.Path]::GetExtension($file_name) -eq ".html") {
      $md_name = [System.IO.Path]::GetFileNameWithoutExtension($file_name) + ".md"
      $path_md = Join-Path $root "ru/$md_name"
      if (-Not [System.IO.File]::Exists($path_md)) {
        return ""
      }
    } else {
      return ""
    }
  }
  return "ru/$file_name"
}

function GenerateSiteMap([boolean]$force_update,[string]$sitemap_file)
{
  # Check what pages were changed since last indexing
  $pages = RefreshSitePages $force_update

  # Generate $sitemap_file (sitemap-en.xml)
  $sitemap = @("<?xml version=`"1.0`" encoding=`"UTF-8`"?>",
    "<urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`" xmlns:xhtml=`"http://www.w3.org/1999/xhtml`">")

  $sitedata = [xml](Get-Content $xml_sitedata -Encoding UTF8)

  $activity = "Generating $sitemap_file"
  $pagesCount = $pages.Count
  $i = 0

  $pages | % {
    $file_en = $_

    Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file_en"
    $i ++

    $info = $sitedata.urlset.url | ? { $_.loc -eq $file_en }

    if ($info -eq $NULL) {
      Write-Host -ForegroundColor Red "File $_ was not found in sitedata.xml!"

    } else {
      $sitemap += "  <url>"
      $sitemap += "    <loc>$($sitemap_prefix)$($file_en)</loc>"
      if ($file_en.StartsWith("en/")) {
        $file_ru = GetRussianSideFile $file_en
        if ($file_ru -ne "") {
          $sitemap += "    <xhtml:link rel=`"alternate`" hreflang=`"en`" href=`"$($sitemap_prefix)$($file_en)`" />"
          $sitemap += "    <xhtml:link rel=`"alternate`" hreflang=`"ru`" href=`"$($sitemap_prefix)$($file_ru)`" />"
        }
      }
      $sitemap += "    <lastmod>$($info.date)</lastmod>"
      $sitemap += "    <changefreq>$($info.changefreq)</changefreq>"
      $sitemap += "    <priority>$($info.priority)</priority>"
      $sitemap += "  </url>"
    }
  }

  $sitemap += "</urlset>"

  # Save it for history
  [System.IO.File]::WriteAllLines($xml_sitemap, $sitemap)

  # Copy to site root without BOM
  [System.IO.File]::WriteAllLines((Join-Path $root $sitemap_file), $sitemap)
}

function GenerateSiteMapYandex([boolean]$force_update,[string]$sitemap_file)
{
  # Check what pages were changed since last indexing
  $pages = RefreshSitePages $force_update

  # Generate $sitemap_file (sitemap-en.xml)
  $sitemap = @("<?xml version=`"1.0`" encoding=`"UTF-8`"?>",
    "<urlset xmlns=`"http://www.sitemaps.org/schemas/sitemap/0.9`">")

  $sitedata = [xml](Get-Content $xml_sitedata -Encoding UTF8)

  $activity = "Generating $sitemap_file"
  $pagesCount = $pages.Count
  $i = 0

  $pages | % {
    $file_en = $_

    Write-Progress -Activity $activity -PercentComplete ($i * 100 / $pagesCount) -Status "Page: $file_en"
    $i ++

    $info = $sitedata.urlset.url | ? { $_.loc -eq $file_en }

    if ($info -eq $NULL) {
      Write-Host -ForegroundColor Red "File $_ was not found in sitedata.xml!"

    } else {
      $sitemap += "  <url>"
      $sitemap += "    <loc>$($sitemap_prefix)$($file_en)</loc>"
      $sitemap += "    <lastmod>$($info.date)</lastmod>"
      $sitemap += "    <changefreq>$($info.changefreq)</changefreq>"
      $sitemap += "    <priority>$($info.priority)</priority>"
      $sitemap += "  </url>"
      if ($file_en.StartsWith("en/")) {
        $file_ru = GetRussianSideFile $file_en
        if ($file_ru -ne "") {
          $sitemap += "  <url>"
          $sitemap += "    <loc>$($sitemap_prefix)$($file_ru)</loc>"
          $sitemap += "    <lastmod>$($info.date)</lastmod>"
          $sitemap += "    <changefreq>$($info.changefreq)</changefreq>"
          $sitemap += "    <priority>$($info.priority)</priority>"
          $sitemap += "  </url>"
        }
      }
    }
  }

  $sitemap += "</urlset>"

  # Save it for history
  [System.IO.File]::WriteAllLines($xml_sitemap, $sitemap)

  # Copy to site root without BOM
  [System.IO.File]::WriteAllLines((Join-Path $root $sitemap_file), $sitemap)
}

$script:folderCount = 2
$script:folderIndex = 0

if ($mode -eq "trim") {
  TrimContent "$root\en"
  TrimContent "$root\ru"
} elseif ($mode -eq "trimfile") {
  TrimFiles @($add_arg)
} elseif ($mode -eq "hash") {
  $script:folderCount = 1
  PrintPageHash "$root\en"
} elseif ($mode -eq "sitemap") {
  GenerateSiteMap -force_update ($add_arg -eq "force") -sitemap_file "sitemap-en.xml"
  GenerateSiteMapYandex -force_update ($add_arg -eq "force") -sitemap_file "sitemap-en-ya.xml"
} else {
  Write-Host -ForegroundColor Red "Unknown mode"
}

# Site root has limited set of htmls were created before, let process them too?
