#Better Option than NuPkg Viewer vs code add-on
code --install-extension slevesque.vscode-zipexplorer

<# Manual Settings Splice for zip explorer
Files => Preferences => Settings => User Settings
{
    "files.associations": {
        "*.nupkg": "zip"
    }
}
#>

#Virus Scanning
cinst -y virustotaluploader

#simple msi viewing
cinst -y insted

#Windows Explorer Context Menu (For Virus Total and Others)
code --install-extension electrotype.windows-explorer-context-menu