# Table of contents

- [Overview](#overview)
- [Setup](#setup)
- [Git Global Config](#git-global-config)
- [gcmd](#gcmd)

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

If got any roadblocks when setting up, you can contact me via email quang.sunlight@gmail.com

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

**NOTE:** Change `$env:GCmdScripts` to your path

```
$env:GCmdScripts = "D:\batchprofile-git"
. "$env:GCmdScripts\profile.ps1"
```

# Git Global Config

Run the following command in terminal to open the git config file.

```
code %USERPROFILE%\.gitconfig
```

Setup your name and email.

```
[user]
	email = {{your email}}
	name = {{your name}}
[alias]
	hist = log --pretty=format:\"%Cgreen%h %Creset%cr %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all
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

## gdelete [branch name]

This run the `git branch -D` to delete a branch that you input or select.
![gdelete](/assets/gdelete.gif)

## gdeleteserver [branch name]

This run the `git push -d origin` to delete on the remote server a branch that you input or select.
![gdeleteserver](/assets/gdeleteserver.gif)

## gmaster

This run the `git checkout master` to checkout to master.
![gmaster](/assets/gmaster.gif)

## gmerge [branch name]

This run the `git merge` to merge the current branch with a branch that you select or input.

## gpull

This run the `git pull origin ` to pull the new code of the current branch.

## gpush

This run the `git push origin` to push all commits in the current branch to remote server.

## gpush

This run the `git merge` to push force all commits in the current branch to remote server.

## gtaglist

This run the `git tag` to list or search a tag that you want. Then copy the tag name that you select to clipboard.

## gtagnew

To create a new tag and push it to remote server.
