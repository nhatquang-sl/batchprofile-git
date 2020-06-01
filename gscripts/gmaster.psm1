function gmaster() {
    $cmd = "git checkout master" 
    Write-Host $cmd
    RunBatchCmd -SelectCmd $cmd
}

Export-ModuleMember -Function gmaster