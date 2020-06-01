function gbranch() {
    $branches = git branch

    if($branches -is [System.String]) {
        Write-Host $branches -ForegroundColor Green
    } else {
        $branchCurr = git rev-parse --abbrev-ref HEAD
        for($i = 0; $i -lt $branches.length; $i++) {
            if($branches[$i] -Like "*$branchCurr*"){
                Write-Host $branches[$i] -ForegroundColor Green
            } else {
                Write-Host $branches[$i]
            }
            
        }
    } 
}

Export-ModuleMember -Function gbranch