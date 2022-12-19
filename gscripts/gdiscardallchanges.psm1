function gdiscardallchanges([string]$branchInput) {
    RunBatchCmd 'git clean -fxd'
    RunBatchCmd 'git reset --hard'
}

Export-ModuleMember -Function gdiscardallchanges