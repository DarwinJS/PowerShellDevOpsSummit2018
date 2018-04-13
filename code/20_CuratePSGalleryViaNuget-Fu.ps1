<#Curate PSGallery Using NuGet Fu
Nuget is dynamic:
- does not require install (single exe)
- is not fussy about registering sources before using them
- does not cleanup .nupkg (so you can use them directly!)
#>

find-package -source http://localhost:8085/repository/curatedpsgallery/
$CurationRoot = "$env:public\curatedbynuget"
md $CurationRoot
cd $CurationRoot

copy C:\ProgramData\Microsoft\Windows\PowerShell\PowerShellGet\nuget.exe $CurationRoot

.\nuget.exe install azure -source http://localhost:82/nuget/offlinepsgallery/ -outputdirectory $CurationRoot
#.\nuget install azure -source https://www.powershellgallery.com/api/v2/ -outputdirectory $CurationRoot
#pulls dependencies, expands

#Human curation
code $CurationRoot

Get-ChildItem -Recurse -Filter *.nupkg "$CurationRoot" | % { .\nuget push "$($_.Fullname)" -source http://localhost:8085/repository/curatedpsgallery/ -apikey }  

