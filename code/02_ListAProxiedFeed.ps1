#PowerShellGallery, Chocolatey and NuGet.org all use the same NuGet backend - which means we can do some nuget-foo with them all ;)

#On a pristine nexus server
find-package send2procmon -source http://localhost:8085/repository/nuget.org-proxy/

#Proxy feeds helps with
#- service availability
#- performance
#- Cost (extra-cloud bandwidth)
#- LTS packages
# not full curation
# choco - does not cache underlying installers

#Gallery view is ugly - but only packagers care ;)