
#While there are dedicated Chocolatey / PSGallery setups - these allow many package formats which might allow you to make the case to have them internally deployed.
#virally spread chocolatey though the first part of this command

Write-Host "This script installs Nexus Repository (port 8082), ProGet (port 82) and  Artifactory (port 8081"

Write-Host "Install Nexus Repository on port 8082"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y nexus-repository -params '"/Port:8082"'

Write-Host "Install ProGet which defaults to port 82"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y progetcustom -source https://www.myget.org/F/chocotesting/

Write-Host "Install Artifactory which defaults to port 8081"
If (!(Test-Path env:chocolateyinstall)) {iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex} ; cinst -y artifactory