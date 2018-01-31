$script_library = "C:\ps_profile_scripts\" # path ending with \
$env:path += ";C:\Program Files (x86)\Microsoft VS Code"
$modules = "posh-git","psake","pester","POSH-Tips"

$mymodules = $script_library + "modules\"

$env:PSModulePath = $env:PSModulePath + ";" + $mymodules

# disable terminal bells and beeps
Set-PSReadlineOption -BellStyle None -MaximumHistoryCount 1000


# load named modules, if they exist, and show a version table
foreach ($module in $modules) {
  if (Get-Module -listavailable -name $module) {
    Import-Module $module
    # Write-Host "Loaded $($module) v$((get-module $module).version)"
  }  
}
Get-Module $modules | Format-Table name, version

Get-ChildItem ($script_library + "*.ps1") | 
  ForEach-Object { . (Join-Path $script_library $_.Name)}

function changelog {
  $t = git describe --tags --abbrev=0
  git log "$t...HEAD" --oneline
}

function edittips {
  code C:\code\POSH-Tips\POSHTips.json
}

function editprofile {
  code C:\code\personal-powershell-profile
}

new-alias psake Invoke-psake

