function gtagnew([string]$tagName) {
    if (-not ([string]::IsNullOrEmpty($tagName))) {
        $cmd = "git tag -a $tagName -m `"$tagName`""
        RunBatchCmd -SelectCmd $cmd

        $cmd = "git push origin $tagName"
        RunBatchCmd -SelectCmd $cmd -IsContinue $true
    } else {
        Write-Host 'Please input the new tag name.' -ForegroundColor Red -BackgroundColor Black
        Write-Host 'e.g. gtagnew "{the new tag name}"' -ForegroundColor Red -BackgroundColor Black
    }
}

Export-ModuleMember -Function gtagnew