# $env:Path += ";$env:LOCALAPPDATA/Programs/oh-my-posh/bin"
$env:PATH += ";D:/dev/bin/"
$env:PATH += ";D:/dev/repos/Odin/"
$env:PROFILE_PATH = "C:/Users/alihu/Documents/PowerShell/"

# Extra Sources
. $env:PROFILE_PATH\ohmyposh-completion.ps1
. $env:PROFILE_PATH\zola-completion.ps1
. $env:PROFILE_PATH\procedures-we-need.ps1
. $env:PROFILE_PATH\aliases-list.ps1
. $env:PROFILE_PATH\env-variables.ps1


# Disable Prediction in pwsh
# Set-PSReadLineOption -PredictionSource None

# Initializing oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression
