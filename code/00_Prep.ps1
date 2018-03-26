

If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y git, visualstudiocode
code --install-extension ms-vscode.PowerShell
