Set-Alias -Name vim -Value nvim

$ENV:HTTP_PROXY = "http://127.0.0.1:1089"
$ENV:HTTPS_PROXY = "http://127.0.0.1:1089"

Start-Job -ScriptBlock { gpgconf.exe --launch gpg-agent } | Out-Null
function Use-VS {
    $VsWhere = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
    $VsInstallDir = & $VsWhere -latest -property installationPath
    Import-Module "$VsInstallDir\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell -VsInstallPath $VsInstallDir -SkipAutomaticLocation -Arch amd64 -HostArch amd64
}

function Use-Git {
    Import-Module posh-git
    $env:POSH_GIT_ENABLED = $true
}

function Use-Docker {
    Import-Module DockerCompletion
}

Use-Git

oh-my-posh init pwsh --config "C:/Users/$env:USERNAME/Documents/PowerShell/powerlevel10k_rainbow_refined.omp.json" | Invoke-Expression
