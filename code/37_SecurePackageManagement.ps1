#listing breaks
choco list 

#remove unauthenticated
choco source remove -name chocolatey 

choco source add -name chocolatey -source http://localhost:8085/repository/curatedchoco/ -u repouser -p Just4demos

choco source list
#works

cat C:\ProgramData\chocolatey\config\chocolatey.config

choco list

unregister-psrepository -name psgallery

$creds = get-credential

register-psrepository -name mypsgallery -sourcelocation http://localhost:8085/repository/curatedpsgallery/ -publishlocation http://localhost:8085/repository/curatedpsgallery/ -credential $creds
#these creds are not cached - just used to do a round trip check on the feed

find-package 

find-package -Credential $creds

#Package management does not allow storing of the password, nuget and chocolatey do