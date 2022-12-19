Set-Alias g git
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
# Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

Import-module "$env:GCmdScripts\search.psm1"
Import-module "$env:GCmdScripts\gscripts\gbranch.psm1"
Import-module "$env:GCmdScripts\gscripts\gcommit.psm1"
Import-module "$env:GCmdScripts\gscripts\gdelete.psm1"
Import-module "$env:GCmdScripts\gscripts\gdeleteserver.psm1"
Import-module "$env:GCmdScripts\gscripts\gdiscardallchanges.psm1"
Import-module "$env:GCmdScripts\gscripts\gadd.psm1"
Import-module "$env:GCmdScripts\gscripts\gckonew.psm1"
Import-module "$env:GCmdScripts\gscripts\gcko.psm1"
Import-module "$env:GCmdScripts\gscripts\gpush.psm1"
Import-module "$env:GCmdScripts\gscripts\gpushforce.psm1"
Import-module "$env:GCmdScripts\gscripts\grename.psm1"
Import-module "$env:GCmdScripts\gscripts\gpull.psm1"
Import-module "$env:GCmdScripts\gscripts\gpullrebase.psm1"
Import-module "$env:GCmdScripts\gscripts\gmaster.psm1"
Import-module "$env:GCmdScripts\gscripts\gmerge.psm1"
Import-module "$env:GCmdScripts\gscripts\gmergeabort.psm1"

Import-module "$env:GCmdScripts\gscripts\gtagdelete.psm1"
Import-module "$env:GCmdScripts\gscripts\gtagdeleteserver.psm1"
Import-module "$env:GCmdScripts\gscripts\gtagnew.psm1"
Import-module "$env:GCmdScripts\gscripts\gtaglist.psm1"