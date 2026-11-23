# Realtime Voice Translator: Windows installer.
#   irm https://raw.githubusercontent.com/shivamrj1035/realtime-voice-translator-releases/main/install.ps1 | iex
# Downloads the latest release, verifies its SHA-256 checksum against SHA256SUMS.txt, and runs the installer.
$ErrorActionPreference = 'Stop'
$repo = 'shivamrj1035/realtime-voice-translator-releases'

Write-Host '-> Finding the latest version...' -ForegroundColor Cyan
$rel = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest"
$version = $rel.tag_name.TrimStart('v')
$file = "RealtimeVoiceTranslator-$version-win-x64.exe"
$base = "https://github.com/$repo/releases/download/$($rel.tag_name)"
$tmp = Join-Path $env:TEMP "rvt-$version"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
$exe = Join-Path $tmp $file

Write-Host "-> Downloading $file..." -ForegroundColor Cyan
$ProgressPreference = 'SilentlyContinue'   # much faster downloads in Windows PowerShell
Invoke-WebRequest "$base/$file" -OutFile $exe -UseBasicParsing
$sums = (Invoke-WebRequest "$base/SHA256SUMS.txt" -UseBasicParsing).Content

Write-Host '-> Verifying checksum...' -ForegroundColor Cyan
$line = ($sums -split "`n") | Where-Object { $_ -match [regex]::Escape($file) } | Select-Object -First 1
if (-not $line) { throw "Checksum for $file not found in SHA256SUMS.txt" }
$expected = ($line -split '\s+')[0].ToLower()
$actual = (Get-FileHash $exe -Algorithm SHA256).Hash.ToLower()
if ($expected -ne $actual) { throw 'Checksum mismatch. The download may be corrupted; please try again.' }

Write-Host '-> Starting the installer...' -ForegroundColor Cyan
Start-Process -FilePath $exe -Wait
Remove-Item -Recurse -Force $tmp
Write-Host 'Done. Open "Realtime Voice Translator" from the Start menu or desktop.' -ForegroundColor Green
