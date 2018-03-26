
Write-Host "This script installs Nexus Repository, ProGet and Artifactory"

Write-Host "Install Nexus Repository on port 8082"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y nexus-repository -params '"/Port:8082"'

Write-Host "Install ProGet which defaults to port 8081"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y artifactory

Write-Host "Install ProGet which defaults to port 82"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y progetcustom -source https://www.myget.org/F/chocotesting/