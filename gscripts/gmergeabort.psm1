function gmergeabort() {
    $cmd = "git merge --abort"
    RunBatchCmd $cmd
}

Export-ModuleMember -Function gmergeabort