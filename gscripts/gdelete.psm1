function gdelete([string]$BranchInput) {
    if (-not ([string]::IsNullOrEmpty($BranchInput))) {
        $cmd = "git branch -D " + $BranchInput.replace("*", "").trim()
        RunBatchCmd $cmd
    } else {
        while($true) {
            $branches = git branch
            $escape = SearchItemOfArray -CmdArray $branches -CmdTemplate 'git branch -D [cmdSelected]'
            if($escape -eq $true) {
                return;
            }
        };
        
    }
}

Export-ModuleMember -Function gdelete