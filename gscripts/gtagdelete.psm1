function gtagdelete([string]$tagInput) {
    if (-not ([string]::IsNullOrEmpty($tagInput))) {
        $cmd = "git tag -d $tagInput"
        RunBatchCmd $cmd
    } else {
        $branches = git tag
        SearchItemOfArray -CmdArray $branches -CmdTemplate 'git tag -d [cmdSelected]'
    }
}

Export-ModuleMember -Function gtagdelete