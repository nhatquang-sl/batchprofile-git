function gtaglist([string]$searchText) {
    $branches = git tag | Sort-Object -Descending
    SearchItemOfArray -CmdArray $branches -CmdTemplate 'Set-Clipboard -Value "[cmdSelected]"' -SearchStr $searchText
}

Export-ModuleMember -Function gtaglist