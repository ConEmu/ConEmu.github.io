param([string]$files="*.md")

function processFile($file) {
  Write-Host "Processing links: $file"
  $t = Get-Content -Path $file -Encoding UTF8
  $mod = $t `
    -replace "(?<![\.\[\/])\b(gh|conemu)([\-#])(\d+)\b(?![\.\]\/])",'[conemu#$3](https://github.com/Maximus5/ConEmu/issues/$3)' `
    -replace "(?<![\.\[\/])\bconnector(\/gh)*([\-#])(\d+)\b(?![\.\]\/])",'[connector#$3](https://github.com/Maximus5/cygwin-connector/issues/$3)' `
    -replace "(?<![\.\[\/])\bconemu-inside(\/gh)*([\-#])(\d+)\b(?![\.\]\/])",'[conemu-inside#$3](https://github.com/Maximus5/conemu-inside/issues/$3)'
  if ($mod -eq $t) { return }
  $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
  [System.IO.File]::WriteAllLines($file, $mod, $Utf8NoBomEncoding)
}

Get-ChildItem $files | % { processFile $_.FullName }
