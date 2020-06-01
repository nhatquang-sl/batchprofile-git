# Overview
As a developer, I use the git command line every day, and I found some difficult things when using it like:
- I have to remember the full command.
- I have to use my mouse to copy/paste a branch name that I want to checkout.
- I cannot use the tab key as an autocomplete feature.
- There are some git commands that I rarely use so each time I use I have to google search.

So I used the PowerShell core to created some scripts that help me.
- Create shortcuts for git commands.
- Use the tab key for auto-complete.
- Use up/down to select a branch/tag that I want to checkout
- Search a branch/tag that I want to checkout
- Store and simplify some commands that I rarely use.

I choose the PowerShell to write the script because it can run with Windows and Mac.

# Setup

## [Installing PowerShell on Windows](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7)

## [Installing PowerShell on macOS](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos?view=powershell-7)

## Open PowerShell profile. 
For Mac use need to run `pwsh` in terminal to switch to PowerShell core.

Run the following command in terminal to open the PowerShell profile.
```
code $PROFILE
```

The **$PROFILE** variable stores the path to the "Current User, Current Host" profile

## Update the PowerShell profile.

Add more PowerShell script modules.
```
$env:GCmdScripts = "D:\gcmd"

Import-module "$env:GCmdScripts\search.psm1"
Import-module "$env:GCmdScripts\gscripts\gbranch.psm1"
Import-module "$env:GCmdScripts\gscripts\gcommit.psm1"
Import-module "$env:GCmdScripts\gscripts\gdelete.psm1"
Import-module "$env:GCmdScripts\gscripts\gdeleteserver.psm1"
Import-module "$env:GCmdScripts\gscripts\gadd.psm1"
Import-module "$env:GCmdScripts\gscripts\gckonew.psm1"
Import-module "$env:GCmdScripts\gscripts\gcko.psm1"
Import-module "$env:GCmdScripts\gscripts\gpush.psm1"
Import-module "$env:GCmdScripts\gscripts\gpushforce.psm1"
Import-module "$env:GCmdScripts\gscripts\gpull.psm1"
Import-module "$env:GCmdScripts\gscripts\gmaster.psm1"
Import-module "$env:GCmdScripts\gscripts\gmerge.psm1"

Import-module "$env:GCmdScripts\gscripts\gtagnew.psm1"
Import-module "$env:GCmdScripts\gscripts\gtaglist.psm1"
```
# gcmd

## gadd
This run the `git add .` to add all your changes to staged changes.
![gadd](/assets/gadd.gif)

## gbranch
This run the `git branch` to list all your local branches.
![gbranch](/assets/gbranch.gif)

## gcko
This run the `git checkout` to checkout to the branch that you want.
You can enter some keywords or use up/down key to choose your branch.
![gcko](/assets/gcko.gif)

## gckonew {new branch name}
This run the `git checkout -b` to help you create a new branch.
![gckonew](/assets/gckonew.gif)

## gcommit {your comment}
This run the `git commit -m` to commit your changes with comment.
![gcommit](/assets/gcommit.gif)


