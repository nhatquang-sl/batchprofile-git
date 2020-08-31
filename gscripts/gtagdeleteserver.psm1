function gtagdeleteserver([string]$tagInput) {
    if (-not ([string]::IsNullOrEmpty($tagInput))) {
        $cmd = "git push origin --delete $tagInput"
        RunBatchCmd $cmd
    } else {
        $branches = git tag
        SearchItemOfArray -CmdArray $branches -CmdTemplate 'git push origin --delete [cmdSelected]'
    }
}

Export-ModuleMember -Function gtagdeleteserver