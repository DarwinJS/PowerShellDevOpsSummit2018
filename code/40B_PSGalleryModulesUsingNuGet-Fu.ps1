<# 
Installing PS Gallery Modules on pre-PackageManagement PSH Using NuGet Fu
Auto downloads Nuget, Uses it to pull and extract .nupkg, and moves the module files to their final locations
C:\ProgramData\Microsoft\Windows\PowerShell\PowerShellGet\nuget.exe
#>
Function Install-PSModuleViaNuget
{
  param (
    [parameter(Mandatory=$true)]
    [string]$Name,
    [string]$PackagesRoot = "$env:temp\ModuleInstalls",
    [string]$PreferredModuleFolder = "$env:ProgramFiles\WindowsPowerShell\Modules\"
)

    If (!(Test-Path $PackagesRoot)) {New-Item -ItemType Directory $PackagesRoot | Out-Null}
    cd $PackagesRoot

    If (!(Test-Path "$PackagesRoot\nuget.exe")) { Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -outfile "$PackagesRoot\nuget.exe" }

    .\nuget install $Name -source https://www.powershellgallery.com/api/v2/ -outputdirectory $PackagesRoot

    #Don't need the nupkgs anymore
    Remove-Item "$PackagesRoot\*" -include *.nupkg -recurse -force

    $ModuleFolderList = @(Get-ChildItem $PackagesRoot -Attributes Directory)
    
    ForEach ($ModuleFolder in $ModuleFolderlist)
    {
      $ModuleFolderOnly = $ModuleFolder.tostring().split('.')[0] 
      $ModuleVnumber = $ModuleFolder.tostring().split('.',2)[1]

      If ($ModuleVnumber)
      {
        New-Item "$PreferredModuleFolder\$moduleFolderOnly" -Type Directory -Force | Out-Null
        Move-Item "$($modulefolder.fullname)" -force -Destination "$PreferredModuleFolder\$moduleFolderOnly"
        Rename-Item "$PreferredModuleFolder\$moduleFolderOnly\$ModuleFolder" "$PreferredModuleFolder\$moduleFolderOnly\$ModuleVnumber"
      }
      else 
      {
        Move-Item "$($modulefolder.fullname)" -force -Destination "$PreferredModuleFolder"   
      }
    }
}