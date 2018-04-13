#Install-Package inconveniently cleans up it's temp files and therefore the .nupkg

#Nexus => Create curatedpsgallery

#Offline: register-psrepository -name offlinepsgallery -sourcelocation http://localhost:82/nuget/offlinepsgallery/  -InstallationPolicy Trusted ; unregister-psrepository -name PSGallery

register-psrepository -name mypsgallery -sourcelocation http://localhost:8085/repository/curatedpsgallery/ -publishlocation http://localhost:8085/repository/curatedpsgallery/ -InstallationPolicy Trusted

get-psrepository

find-package -source http://localhost:8085/repository/curatedpsgallery/

#If your module has no dependencies, save-package and publish-module -path work fine - if, however, you have dependencies, it get's deep fast.

$CurationRoot = "$env:public\curatedpsgallery"
New-Item $CurationRoot -ItemType Directory
cd $CurationRoot

#Must install same modules in order to publish dependencies because installed modules, not other save-package folders are consulted for dependencies.  Do both at the same time to maintain version immutability.  If you have zero dependencies you can publish from a save-module folder without installing packages
"azure" | % { save-module -Name $_ -Path $CurationRoot ; Install-Module $_ }

#Do human curation
code $CurationRoot

#Conventional Publish
Publish-module -name Azure -repository mypsgallery -NuGetApiKey ee62e34c-cc64-3a67-ba69-a4f6b693bae

#Arg - it's not smart enough to load dependencies in reverse order - so let's give it some help.  And then file a github issue eh?

Get-ChildItem $CurationRoot | sort-object lastwritetime | % {Publish-module -name $_ -repository mypsgallery -NuGetApiKey ee62e34c-cc64-3a67-ba69-a4f6b693baea }