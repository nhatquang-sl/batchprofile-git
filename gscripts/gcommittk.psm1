function gcommittk([string]$comment) {
    if (-not ([string]::IsNullOrEmpty($comment))) {
        $branchCurr = git rev-parse --abbrev-ref HEAD
        if ($branchCurr -match '^\D*(\d+).*$') {
            $comment = '[#' + $Matches[1] + '] ' + $comment
        }
        $cmd = 'git commit -m "{0}"' -f $comment
        RunBatchCmd -SelectCmd $cmd
    } else {
        Write-Host 'Please input your comment.' -ForegroundColor Red -BackgroundColor Black
        Write-Host 'e.g. gcommit "{comment here}"' -ForegroundColor Red -BackgroundColor Black
    }
}

Export-ModuleMember -Function gcommittk