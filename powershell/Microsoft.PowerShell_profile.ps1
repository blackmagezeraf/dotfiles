# $env:Path += ";$env:LOCALAPPDATA/Programs/oh-my-posh/bin"
$env:PATH += ";E:/dev/bin/"
$env:PATH += ";E:/dev/git/Odin/"
$env:PROFILE_PATH = "C:/Users/alihu/Documents/PowerShell/"

# Extra Sources
. $env:PROFILE_PATH\ohmyposh-completion.ps1
. $env:PROFILE_PATH\procedures-we-need.ps1
. $env:PROFILE_PATH\aliases-list.ps1
. $env:PROFILE_PATH\env-variables.ps1
. $env:PROFILE_PATH\zola-completion.ps1
. $env:PROFILE_PATH\hugo-completion.ps1
. $env:PROFILE_PATH\ghcli-completion.ps1


# Disable Prediction in pwsh
# Set-PSReadLineOption -PredictionSource None

# Initializing oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression

vsvars && clear
