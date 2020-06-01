function gtaglist([string]$searchText) {
    $branches = git tag
    SearchItemOfArray -CmdArray $branches -CmdTemplate 'Set-Clipboard -Value "[cmdSelected]"' -SearchStr $searchText
}

Export-ModuleMember -Function gtaglist