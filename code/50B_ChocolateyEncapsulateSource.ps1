
new-item "$env:chocolateyinstall\curatedlib" -itemtype Directory

copy "$env:chocolateyinstall\lib" "$env:chocolateyinstall\curatelib" -force

#Retrieve Installers and place in "tools"
dir "$env:chocolateyinstall\curatedlib" | % { copy "$env:temp\chocolatey\$($_.Name)\*\*" "$_\tools\" }

cd "$env:chocolateyinstall\curatedlib"
#remove unwanted files

#Change URLs to have: $(Split-Path -parent $MyInvocation.MyCommand.Definition) as the first part of the path and just the file name afterward.
code chocolateyinstall.ps1

cpack

cuninst -y procexp
cinst -y procexp -source $pwd
