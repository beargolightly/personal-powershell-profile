$script_library = "C:\ps_profile_scripts"
$f5ltm = "bigip1.nashvillewraps.com"
$f5username = "admin"

$env:path += ";$env:userprofile\AppData\Local\GitHub\PortableGit_d76a6a98c9315931ec4927243517bc09e9b731a0\cmd"
$env:path += ";$env:userprofile\AppData\Local\GitHub\PortableGit_d76a6a98c9315931ec4927243517bc09e9b731a0\usr\bin"
$env:path += ";C:\Program Files (x86)\Microsoft VS Code"

$MaximumHistoryCount = 1000
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


Get-ChildItem ($script_library + "*.ps1") | ForEach-Object {& (Join-Path $script_library $_.Name)} | Out-Null

function changelog {
  $t = git describe --tags --abbrev=0
  git log "$t...HEAD" --oneline
}
    
