
#Always reset to a pristine VM snapshot for each curated package

#Do human curation, submit to virus total
code "$env:ChocolateyInstall\lib"

#submit to virus total, view MSI content
code "$env:temp\Chocolatey"

Get-ChildItem -Recurse -Filter *.nupkg "$env:ChocolateyInstall\lib" | % { choco push "$($_.Fullname)" -source http://localhost:8085/repository/curatedchoco/ }

choco list -source http://localhost:8085/repository/curatedchoco/

<#
Nupkg Caches:
Chocolatey: 
Get-ChildItem -Recurse -Filter *.nupkg $env:ChocolateyInstall\lib\*\
NuGet: 
Get-ChildItem -Recurse -Filter *.nupkg "$env:programfiles\NuGet\Packages"
Get-ChildItem -Recurse -Filter *.nupkg "$env:localappdata\Local\NuGet\Cache"
Package Management: 
Get-ChildItem -Recurse -Filter *.nupkg 'C:\Program Files\PackageManagement\'
#>