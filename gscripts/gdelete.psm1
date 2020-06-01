function gdelete([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git branch -D " + $BranchInput.replace("*", "").trim()
        RunBatchCmd $cmd
    } else {
        $branches = git branch
        SearchItemOfArray -CmdArray $branches -CmdTemplate 'git branch -D [cmdSelected]'
    }
}

Export-ModuleMember -Function gdelete