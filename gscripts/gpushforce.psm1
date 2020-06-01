function gpushforce([string]$BranchInput) {
    if ([string]::IsNullOrEmpty($BranchInput)) {
        $BranchInput = git rev-parse --abbrev-ref HEAD
    }

    $cmd = "git push origin " + $BranchInput  + " --force"
    Write-Host $cmd
    RunBatchCmd -SelectCmd $cmd
}

Export-ModuleMember -Function gpushforce