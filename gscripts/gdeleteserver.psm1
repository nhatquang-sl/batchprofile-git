function gdeleteserver([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git push -d origin " + $BranchInput.replace("*", "").trim()
        RunBatchCmd $cmd
    } else {
        $branches = git branch
        SearchItemOfArray -CmdArray $branches -CmdTemplate 'git push -d origin [cmdSelected]'
    }
}

Export-ModuleMember -Function gdeleteserver