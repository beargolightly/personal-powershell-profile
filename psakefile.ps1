task default -depends Copy 

task Copy {
    Copy-Item -Force Microsoft.PowerShell_profile.ps1 $PROFILE -Verbose
}