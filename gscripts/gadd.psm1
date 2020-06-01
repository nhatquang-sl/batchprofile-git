function gadd() {
    $cmd = "git add ."
    RunBatchCmd -SelectCmd $cmd

    $cmd = "git branch"
    RunBatchCmd -SelectCmd $cmd -IsContinue $true
}

Export-ModuleMember -Function gadd