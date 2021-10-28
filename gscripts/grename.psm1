function grename([string]$branchNew) {
    if (-not ([string]::IsNullOrEmpty($branchNew))) {
        $branchOld = git rev-parse --abbrev-ref HEAD

        $cmd = "git branch -m " + $branchNew
        Write-Host $cmd
        RunBatchCmd -SelectCmd $cmd

        $cmd = "git push origin -u " + $branchNew
        Write-Host $cmd
        RunBatchCmd -SelectCmd $cmd

        $cmd = "git push origin --delete " + $branchOld
        Write-Host $cmd
        RunBatchCmd -SelectCmd $cmd
    } else {
        Write-Host 'Please input the new branch name.' -ForegroundColor Red -BackgroundColor Black
        Write-Host 'e.g. grename "{the new branch name}"' -ForegroundColor Red -BackgroundColor Black
    }
}

Export-ModuleMember -Function grename