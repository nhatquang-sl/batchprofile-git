function gmerge([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git merge " + $BranchInput.replace("*", "").trim() + " --no-ff"
        RunBatchCmd $cmd
    } else {
        $branches = git branch
        SearchItemOfArray -CmdArray $branches -CmdTemplate 'git merge [cmdSelected] --no-ff'
    }
}

Export-ModuleMember -Function gmerge