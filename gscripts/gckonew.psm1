function gckonew([string]$branchNew) {
    if (-not ([string]::IsNullOrEmpty($branchNew))) {
        $cmd = "git checkout -b " + $branchNew
        Write-Host $cmd
        RunBatchCmd -SelectCmd $cmd
    } else {
        Write-Host 'Please input the new branch name.' -ForegroundColor Red -BackgroundColor Black
        Write-Host 'e.g. gckonew "{the new branch name}"' -ForegroundColor Red -BackgroundColor Black
    }
}

Export-ModuleMember -Function gckonew