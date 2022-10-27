Import-Module posh-git
$env:POSH_GIT_ENABLED = $true
Import-Module DockerCompletion
Start-Job -ScriptBlock {gpgconf.exe --launch gpg-agent} | Out-Null
oh-my-posh init pwsh --config "C:/Users/$env:USERNAME/Documents/PowerShell/powerlevel10k_rainbow_refined.omp.json" | Invoke-Expression
