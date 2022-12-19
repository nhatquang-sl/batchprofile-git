function gdiscardallchanges([string]$branchInput) {
    RunBatchCmd 'git reset –hard'
    RunBatchCmd 'git clean -fxd'
}

Export-ModuleMember -Function gdiscardallchanges