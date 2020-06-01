function gcommit([string]$comment) {
    if (-not ([string]::IsNullOrEmpty($comment))) {
        $cmd = 'git commit -m "{0}"' -f $comment
        Write-Host $cmd
        RunBatchCmd -SelectCmd $cmd
    } else {
        Write-Host 'Please input your comment.' -ForegroundColor Red -BackgroundColor Black
        Write-Host 'e.g. gcommit "{comment here}"' -ForegroundColor Red -BackgroundColor Black
    }
}

Export-ModuleMember -Function gcommit