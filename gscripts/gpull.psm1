function gpull([string]$branchInput) {
    if ([string]::IsNullOrEmpty($branchInput)) {
        $branchInput = git rev-parse --abbrev-ref HEAD
    }

    $cmd = "git pull origin " + $branchInput + " --rebase"
    Write-Host $cmd
    RunBatchCmd -SelectCmd $cmd
}

Export-ModuleMember -Function gpull