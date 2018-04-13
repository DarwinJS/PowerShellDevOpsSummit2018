#Slides 3-4 - public egress

# Hating on sample code that never shows the secure way to do it

# Nexus => Security => Anonymous => Uncheck

choco list -source http://localhost:8085/repository/nuget.org-proxy/
#prompted for user name

# Security => Roles => Nexus Role
# Name: chocoread
# Privileges: nx-repository-view-curatedchoco-browse, nx-repository-view-curatedchoco-read, nx-repository-view-curatedpsgallery-browse, nx-repository-view-curatedpsgallery-read

#User, Name: repouser => add to Role

choco list -source http://localhost:8085/repository/nuget.org-proxy/
enter repouser => fail, per feed auth

choco list -source http://localhost:8085/repository/curatedchoco/

