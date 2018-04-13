
# Nexus create=> curatedchoco, curatedpsgallery
clist -source http://localhost:8085/repository/curatedchoco/

choco sources
#Prevent accidental use of or dependency on public chocolatey repo (all machines)
choco source remove -name chocolatey

choco source add -name chocolatey -source http://localhost:8085/repository/curatedchoco/

# Nexus: Security => Realms, Add NuGet API-Key Realm
# Nexus API Key: Admin (profile) => NuGet API Key (left nav) => Access API Key
choco apikey -s=http://localhost:8085/repository/curatedchoco/ -k=

#default operations now use this feed
choco sources