# A package that contains a set of procmon filters for analyzing software installs
# It depends on the package "procmon"
# Push procmonapppackagingfilters.1.1.0.nupkg

choco push procmonapppackagingfilters.1.1.0.nupkg  -source http://localhost:8085/repository/curatedchoco/

#Install procmon filters and get dependencies from another feed:
choco install -confirm procmonapppackagingfilters -source http://localhost:8085/repository/curatedchoco/,http://localhost:82/nuget/offlinechoco/

<#
Approach Enables:
- multiple customization packages over the same base package (many purposes)
- uninstall / update customizations without affecting software
- create a flexible parameters driven customization while retaining the ability to keep curating new versions of the OSS base package - especially if it is already a complex package
- same customization packages over multiple versions of the base package
- best practice separation of config from install
#>