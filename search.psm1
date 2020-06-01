function SearchItemOfArray([System.Collections.ArrayList]$CmdArray, [string] $CmdTemplate, [string] $SearchStr) {
    $cmdSelected = ""
    $userInput = ""
    if(-not ([string]::IsNullOrEmpty($SearchStr))) {
        $userInput = $SearchStr
    } 
    $cmdIndexSelected = 0
    $ascii = 0

    do {
        Clear-Host
        if ($ascii -ne 13 -AND $ascii -ge 0) {
            $cmdIndexes = IndexOfItemInArray -CmdArray $CmdArray -SeachStr $userInput -SelectCmdIndex $cmdIndexSelected
        }
        $keyPress = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

        $ascii = $keyPress.VirtualKeyCode
         # normal characters: a-z, 0-9, ' ', '.'
        if (($ascii -ge 65 -AND $ascii -le 90) -OR ($ascii -ge 48 -AND $ascii -le 57) -OR $ascii -eq 32 -OR $ascii -eq 190)
        {
            $cmdIndexSelected = 0
            $userInput += $keyPress.Character
        }
        if ($ascii -eq 40) { # Up 
            $cmdIndexSelected = $cmdIndexes[2]
        }
        
        if($ascii -eq 38) { # Down
            $cmdIndexSelected = $cmdIndexes[0]
        }  
        
        if ($ascii -eq 13) { # Enter
            $cmdSelected = $CmdArray[$cmdIndexes[1]]
            $cmdSelected = $cmdSelected.replace("*", "").trim()
            Write-Host $cmdSelected
            break;
        } 
        
        if ($ascii -eq 8) { # Backspace
            if ([string]::IsNullOrWhiteSpace($userInput)) {
                $ascii = -1
            } else {
                $cmdIndexSelected = 0
                $userInput = $userInput.Substring(0, $userInput.Length-1)
            }
        }
    } while ($keyPress.VirtualKeyCode -ne 27 -AND $keyPress.VirtualKeyCode -ne 13);

    Clear-Host
    if (-not ([string]::IsNullOrEmpty($cmdSelected)) -and -not ([string]::IsNullOrEmpty($CmdTemplate))) {
        $CmdTemplate = $CmdTemplate.replace('[cmdSelected]', $cmdSelected)
        RunBatchCmd $CmdTemplate
    }

    if ($ascii -eq 13) {
        $cmdSelected
    }
#    return $keyPress.VirtualKeyCode -eq 27
}

function IndexOfItemInArray([System.Collections.ArrayList]$CmdArray, [string]$SeachStr, [int] $SelectCmdIndex) {
    $indexSelectedArray = 0, $SelectCmdIndex, 1
    $matchSearchStrArray = New-Object System.Collections.ArrayList

    for($i=0; $i -lt $CmdArray.Count; $i++) {
        $isMatch = 1
        $searchStrSub = $SeachStr.split()
        ForEach ($str in $searchStrSub) {
            if($CmdArray[$i] -NotLike "*$str*") {
                $isMatch = 0
            }
        }
        
        if($isMatch -eq 1) {
            $matchSearchStrArray += $i
        }

        # Display maximum 25 results
        if($matchSearchStrArray.length -eq 25) {
            break;
        }
    }

    for($i = 0; $i -lt $matchSearchStrArray.length; $i++) {
        if(($indexSelectedArray[1] -eq 0 -AND $i -eq 0) -OR $matchSearchStrArray[$i] -eq $indexSelectedArray[1]) {
            # Write-Host $CmdArray[$matchSearchStrArray[$i]] $i $matchSearchStrArray[$i] $matchSearchStrArray[$i - 1] $matchSearchStrArray[$i + 1] $matchSearchStrArray.length -ForegroundColor Green
            Write-Host $CmdArray[$matchSearchStrArray[$i]] -ForegroundColor Green
            
            $indexSelectedArray[0] = $matchSearchStrArray[$i - 1]
            $indexSelectedArray[2] = $matchSearchStrArray[$i + 1]
            
            if($i -eq 0) {
                $indexSelectedArray[0] = $matchSearchStrArray[0]
                $indexSelectedArray[1] = $matchSearchStrArray[0]
            }

            if($i -eq ($matchSearchStrArray.length - 1)) {
                $indexSelectedArray[2] = $matchSearchStrArray[0]
            }

        } else {
            # Write-Host $CmdArray[$matchSearchStrArray[$i]] $i $matchSearchStrArray[$i] $matchSearchStrArray[$i - 1] $matchSearchStrArray[$i + 1] $matchSearchStrArray.length
            Write-Host $CmdArray[$matchSearchStrArray[$i]]
        }
    }

    Write-Host -NoNewline $SeachStr.split()
    return $indexSelectedArray
}

function RunBatchCmd([string]$SelectCmd, [bool]$IsContinue) {
    if($IsContinue -eq $false) {
        Clear-Host
    }
    Write-Host $SelectCmd -ForegroundColor Green

    Invoke-Expression $SelectCmd
}

Export-ModuleMember -Function SearchItemOfArray, IndexOfItemInArray, RunBatchCmd