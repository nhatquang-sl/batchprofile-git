function gcko([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git checkout $BranchInput"
        Write-Host $cmd -ForegroundColor Green
        RunBatchCmd $cmd
    } else {
        $branches = git branch

        if($branches -is [System.String]) {
            Write-Host $branches -ForegroundColor Green
        } else {
            SearchItemOfArray -CmdArray $branches -CmdTemplate 'git checkout [cmdSelected]'
        } 
    }
}

Export-ModuleMember -Function gcko 