function gpush([string]$BranchInput) {
    if ([string]::IsNullOrEmpty($BranchInput)) {
        $BranchInput = git rev-parse --abbrev-ref HEAD
    }

    $cmd = "git push origin " + $BranchInput 
    Write-Host $cmd
    RunBatchCmd -SelectCmd $cmd
}

Export-ModuleMember -Function gpush