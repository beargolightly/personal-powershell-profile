$MyProfilePath = "C:\psprofile\"
$ScriptLibrary = $MyProfilePath + "scripts\"

$ModulesLibrary = $profile_main + "modules\" # publish modules-in-development to here so they can be loaded automatically
$env:PSModulePath = $env:PSModulePath + ";" + $ModulesLibrary

$ModulesToImport = "posh-git","psake","pester"

$env:path += ";C:\Program Files (x86)\Microsoft VS Code"

Set-PSReadlineOption -BellStyle None -MaximumHistoryCount 1000 # disable console beeps and such

# load named modules, if they exist, and show a version table
foreach ($module in $ModulesToImport) {
  if (Get-Module -listavailable -name $module) {
    $percentComplete = ([int]$ModulesToImport.IndexOf($module)/$ModulesToImport.Length) * 100
    Write-Progress -Activity 'Loading Modules' -Status "Loading $($module)" -PercentComplete $percentComplete
    Import-Module $module
  }  
}
Get-Module $ModulesToImport | Format-Table name, version
Write-Progress -Activity 'Loading Modules' -Completed

Get-ChildItem ($ScriptLibrary + "*.ps1") | 
  ForEach-Object { . (Join-Path $ScriptLibrary $_.Name)}  # dot-source all the .ps1 scripts in $ScriptLibrary, in no particular order

