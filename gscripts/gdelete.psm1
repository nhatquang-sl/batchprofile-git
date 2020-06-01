function gdelete([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git branch -D " + $BranchInput.replace("*", "").trim()
        RunBatchCmd $cmd
    } else {
        do {
            $branches = git branch
            $isEscapse = SearchItemOfArray -CmdArray $branches -CmdTemplate 'git branch -D [cmdSelected]'
        } while ($isEscapse -ne $true)
    }
}

Export-ModuleMember -Function gdelete