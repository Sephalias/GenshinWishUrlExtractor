# This script is written to simplify getting the url in the output_log.txt
# which contains the link to the wishes as an alternative to the feedback url
# which is currently broken.

$OutputLogTxtFilePath = ""
$Region = ""
[bool]$OutputLogTxtFileExists = 0

function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host " [1] China"
    Write-Host " [2] Global" -ForegroundColor White
    Write-Host
    $Region = Read-Host -Prompt "Select Region (default: Global)"
    switch ($Region) {
        1 {
            $Script:Region = "China"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt"
        }
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    $script:OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath
    Clear-Host
}


$host.UI.RawUI.WindowTitle = "Genshin Wish URL Extractor"
function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host "*************************************"
    Write-Host "*             Main Menu             *"
    Write-Host "*************************************"
    Write-Host
    Write-Host " [1] Show output_log.txt info."
    Write-Host " [2] Show output_log.txt content." -ForegroundColor White
    Write-Host " [3] Show current clipboard."
    Write-Host " [4] Select Region. Current: " -NoNewline
    Write-Host $Region -ForegroundColor White
    Write-Host " [5] Show Powershell Info."
    Write-Host " [q] Quit."
    Write-Host "_____________________________________"
}

function ShowPSVersion {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*       Powershell Info Info        *"
    Write-Host "*************************************"
    Write-Host
    $PSVersionTable
    Write-Host
    Write-Host "_____________________________________"
}

function ShowClipboard {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Clipboard Content        *"
    Write-Host "*************************************"
    Write-Host
    Get-Clipboard
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileContent {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*      Ouput Log File Content       *"
    Write-Host "*************************************"
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "File content of output_log.txt:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            $CopySelection = Read-Host -Prompt "Do you want to copy the URL? [y/N]"
            Write-Host
            switch ($CopySelection.ToLower()) {
                'y' { 
                    Set-Clipboard $WishUrl
                    Write-Host "[Success] " -ForegroundColor Green -NoNewline
                    Write-Host "URL was added to clipboard."
                }
                Default {
                    Write-Host "[Info] " -ForegroundColor White -NoNewline
                    Write-Host "URL was not added to clipboard."
                }
            }
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileInfo {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Output File Info         *"
    Write-Host "*************************************"
    Write-Host
    if ($OutputLogTxtFileExists) {
        Write-Host "File output_log.txt exists."
        Get-ChildItem $OutputLogTxtFilePath | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowOutputFileInfo }
        2 { ShowOutputFileContent }
        3 { ShowClipboard }
        4 {
            SelectRegion
            Write-Host
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "Region was set to " -NoNewline
            Write-Host $Script:Region
        }
        5 { ShowPSVersion }
        'q' { continue }
        default {
            Write-Host
            Write-Host "*************************************"
            Write-Host "*" -NoNewline
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid Selection." -NoNewline
            Write-Host "         *"
            Write-Host "*************************************"
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))# This script is written to simplify getting the url in the output_log.txt
# which contains the link to the wishes as an alternative to the feedback url
# which is currently broken.


$OutputLogTxtFilePath
$Region
function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host " [1] China"
    Write-Host " [2] Global" -ForegroundColor White
    Write-Host
    $Region = Read-Host -Prompt "Select Region (default: Global)"
    switch ($Region) {
        1 {
            $Script:Region = "China"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt"
        }
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    Clear-Host
}


$OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath

$host.UI.RawUI.WindowTitle = "Genshin Wish URL Extractor"
function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host "*************************************"
    Write-Host "*             Main Menu             *"
    Write-Host "*************************************"
    Write-Host
    Write-Host " [1] Show output_log.txt info."
    Write-Host " [2] Show output_log.txt content." -ForegroundColor White
    Write-Host " [3] Show current clipboard."
    Write-Host " [4] Select Region. Current: " -NoNewline
    Write-Host $Region -ForegroundColor White
    Write-Host " [5] Show Powershell Info."
    Write-Host " [q] Quit."
    Write-Host "_____________________________________"
}

function ShowPSVersion {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*       Powershell Info Info        *"
    Write-Host "*************************************"
    Write-Host
    $PSVersionTable
    Write-Host
    Write-Host "_____________________________________"
}

function ShowClipboard {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Clipboard Content        *"
    Write-Host "*************************************"
    Write-Host
    Get-Clipboard
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileContent {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*      Ouput Log File Content       *"
    Write-Host "*************************************"
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "File content of output_log.txt:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            $CopySelection = Read-Host -Prompt "Do you want to copy the URL? [y/N]"
            Write-Host
            switch ($CopySelection.ToLower()) {
                'y' { 
                    Set-Clipboard $WishUrl
                    Write-Host "[Success] " -ForegroundColor Green -NoNewline
                    Write-Host "URL was added to clipboard."
                }
                Default {
                    Write-Host "[Info] " -ForegroundColor White -NoNewline
                    Write-Host "URL was not added to clipboard."
                }
            }
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileInfo {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Output File Info         *"
    Write-Host "*************************************"
    Write-Host
    if ($OutputLogTxtFileExists) {
        Write-Host "File output_log.txt exists."
        Get-ChildItem $OutputLogTxtFilePath | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowOutputFileInfo }
        2 { ShowOutputFileContent }
        3 { ShowClipboard }
        4 {
            SelectRegion
            Write-Host
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "Region was set to " -NoNewline
            Write-Host $Script:Region
        }
        5 { ShowPSVersion }
        'q' { continue }
        default {
            Write-Host
            Write-Host "*************************************"
            Write-Host "*" -NoNewline
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid Selection." -NoNewline
            Write-Host "         *"
            Write-Host "*************************************"
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))


# This script is written to simplify getting the url in the output_log.txt
# which contains the link to the wishes as an alternative to the feedback url
# which is currently broken.


$OutputLogTxtFilePath
$Region
function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host " [1] China"
    Write-Host " [2] Global" -ForegroundColor White
    Write-Host
    $Region = Read-Host -Prompt "Select Region (default: Global)"
    switch ($Region) {
        1 {
            $Script:Region = "China"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt"
        }
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    Clear-Host
}


$OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath

$host.UI.RawUI.WindowTitle = "Genshin Wish URL Extractor"
function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host "*************************************"
    Write-Host "*             Main Menu             *"
    Write-Host "*************************************"
    Write-Host
    Write-Host " [1] Show output_log.txt info."
    Write-Host " [2] Show output_log.txt content." -ForegroundColor White
    Write-Host " [3] Show current clipboard."
    Write-Host " [4] Select Region. Current: " -NoNewline
    Write-Host $Region -ForegroundColor White
    Write-Host " [5] Show Powershell Info."
    Write-Host " [q] Quit."
    Write-Host "_____________________________________"
}

function ShowPSVersion {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*       Powershell Info Info        *"
    Write-Host "*************************************"
    Write-Host
    $PSVersionTable
    Write-Host
    Write-Host "_____________________________________"
}

function ShowClipboard {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Clipboard Content        *"
    Write-Host "*************************************"
    Write-Host
    Get-Clipboard
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileContent {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*      Ouput Log File Content       *"
    Write-Host "*************************************"
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "File content of output_log.txt:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            $CopySelection = Read-Host -Prompt "Do you want to copy the URL? [y/N]"
            Write-Host
            switch ($CopySelection.ToLower()) {
                'y' { 
                    Set-Clipboard $WishUrl
                    Write-Host "[Success] " -ForegroundColor Green -NoNewline
                    Write-Host "URL was added to clipboard."
                }
                Default {
                    Write-Host "[Info] " -ForegroundColor White -NoNewline
                    Write-Host "URL was not added to clipboard."
                }
            }
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileInfo {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Output File Info         *"
    Write-Host "*************************************"
    Write-Host
    if ($OutputLogTxtFileExists) {
        Write-Host "File output_log.txt exists."
        Get-ChildItem $OutputLogTxtFilePath | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowOutputFileInfo }
        2 { ShowOutputFileContent }
        3 { ShowClipboard }
        4 {
            SelectRegion
            Write-Host
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "Region was set to " -NoNewline
            Write-Host $Script:Region
        }
        5 { ShowPSVersion }
        'q' { continue }
        default {
            Write-Host
            Write-Host "*************************************"
            Write-Host "*" -NoNewline
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid Selection." -NoNewline
            Write-Host "         *"
            Write-Host "*************************************"
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))


# This script is written to simplify getting the url in the output_log.txt
# which contains the link to the wishes as an alternative to the feedback url
# which is currently broken.


$OutputLogTxtFilePath
$Region
function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host " [1] China"
    Write-Host " [2] Global" -ForegroundColor White
    Write-Host
    $Region = Read-Host -Prompt "Select Region (default: Global)"
    switch ($Region) {
        1 {
            $Script:Region = "China"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt"
        }
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    Clear-Host
}


$OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath

$host.UI.RawUI.WindowTitle = "Genshin Wish URL Extractor"
function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host "*************************************"
    Write-Host "*             Main Menu             *"
    Write-Host "*************************************"
    Write-Host
    Write-Host " [1] Show output_log.txt info."
    Write-Host " [2] Show output_log.txt content." -ForegroundColor White
    Write-Host " [3] Show current clipboard."
    Write-Host " [4] Select Region. Current: " -NoNewline
    Write-Host $Region -ForegroundColor White
    Write-Host " [5] Show Powershell Info."
    Write-Host " [q] Quit."
    Write-Host "_____________________________________"
}

function ShowPSVersion {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*       Powershell Info Info        *"
    Write-Host "*************************************"
    Write-Host
    $PSVersionTable
    Write-Host
    Write-Host "_____________________________________"
}

function ShowClipboard {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Clipboard Content        *"
    Write-Host "*************************************"
    Write-Host
    Get-Clipboard
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileContent {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*      Ouput Log File Content       *"
    Write-Host "*************************************"
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "File content of output_log.txt:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            $CopySelection = Read-Host -Prompt "Do you want to copy the URL? [y/N]"
            Write-Host
            switch ($CopySelection.ToLower()) {
                'y' { 
                    Set-Clipboard $WishUrl
                    Write-Host "[Success] " -ForegroundColor Green -NoNewline
                    Write-Host "URL was added to clipboard."
                }
                Default {
                    Write-Host "[Info] " -ForegroundColor White -NoNewline
                    Write-Host "URL was not added to clipboard."
                }
            }
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileInfo {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Output File Info         *"
    Write-Host "*************************************"
    Write-Host
    if ($OutputLogTxtFileExists) {
        Write-Host "File output_log.txt exists."
        Get-ChildItem $OutputLogTxtFilePath | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowOutputFileInfo }
        2 { ShowOutputFileContent }
        3 { ShowClipboard }
        4 {
            SelectRegion
            Write-Host
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "Region was set to " -NoNewline
            Write-Host $Script:Region
        }
        5 { ShowPSVersion }
        'q' { continue }
        default {
            Write-Host
            Write-Host "*************************************"
            Write-Host "*" -NoNewline
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid Selection." -NoNewline
            Write-Host "         *"
            Write-Host "*************************************"
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))


# This script is written to simplify getting the url in the output_log.txt
# which contains the link to the wishes as an alternative to the feedback url
# which is currently broken.


$OutputLogTxtFilePath
$Region
function SelectRegion {
    Clear-Host
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host " [1] China"
    Write-Host " [2] Global" -ForegroundColor White
    Write-Host
    $Region = Read-Host -Prompt "Select Region (default: Global)"
    switch ($Region) {
        1 {
            $Script:Region = "China"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt"
        }
        Default {
            $Script:Region = "Global"
            $script:OutputLogTxtFilePath = $env:USERPROFILE + "\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt"
        }
    }
    Clear-Host
}


$OutputLogTxtFileExists = Test-Path $OutputLogTxtFilePath

$host.UI.RawUI.WindowTitle = "Genshin Wish URL Extractor"
function prompt { '' }

Function MainMenu {
    if (-Not $Region) {
        SelectRegion
    }
    Write-Host
    Write-Host "     Genshin Wish URL Extractor     "
    Write-Host
    Write-Host "*************************************"
    Write-Host "*             Main Menu             *"
    Write-Host "*************************************"
    Write-Host
    Write-Host " [1] Show output_log.txt info."
    Write-Host " [2] Show output_log.txt content." -ForegroundColor White
    Write-Host " [3] Show current clipboard."
    Write-Host " [4] Select Region. Current: " -NoNewline
    Write-Host $Region -ForegroundColor White
    Write-Host " [5] Show Powershell Info."
    Write-Host " [q] Quit."
    Write-Host "_____________________________________"
}

function ShowPSVersion {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*       Powershell Info Info        *"
    Write-Host "*************************************"
    Write-Host
    $PSVersionTable
    Write-Host
    Write-Host "_____________________________________"
}

function ShowClipboard {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Clipboard Content        *"
    Write-Host "*************************************"
    Write-Host
    Get-Clipboard
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileContent {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*      Ouput Log File Content       *"
    Write-Host "*************************************"
    Write-Host

    if ($OutputLogTxtFileExists) {
        Write-Output "File content of output_log.txt:"
        $OutputLogTxt = Get-Content $OutputLogTxtFilePath
        Write-Host
        $WishUrl = $OutputLogTxt -match "^OnGetWebViewPageFinish.*/log" -replace "OnGetWebViewPageFinish:" 
        if ($WishUrl) {
            Write-Output $WishUrl
            Write-Host
            $CopySelection = Read-Host -Prompt "Do you want to copy the URL? [y/N]"
            Write-Host
            switch ($CopySelection.ToLower()) {
                'y' { 
                    Set-Clipboard $WishUrl
                    Write-Host "[Success] " -ForegroundColor Green -NoNewline
                    Write-Host "URL was added to clipboard."
                }
                Default {
                    Write-Host "[Info] " -ForegroundColor White -NoNewline
                    Write-Host "URL was not added to clipboard."
                }
            }
        }
        else {
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Could not find URL. Try opening wish history in-game first."
        }
        
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}

function ShowOutputFileInfo {
    Write-Host
    Write-Host "*************************************"
    Write-Host "*          Output File Info         *"
    Write-Host "*************************************"
    Write-Host
    if ($OutputLogTxtFileExists) {
        Write-Host "File output_log.txt exists."
        Get-ChildItem $OutputLogTxtFilePath | Select-Object FullName, CreationTime, LastAccessTime, LastWriteTime, Mode, Length
    }
    else {
        Write-Host " Error: " -ForegroundColor Red -NoNewline
        Write-Host "File output_log.txt does not exists."
    }
    Write-Host
    Write-Host "_____________________________________"
}


do {
    Clear-Host
    MainMenu
    $Selection = Read-Host "Select an option" 
    Clear-Host
    switch ($Selection.ToLower()) {
        1 { ShowOutputFileInfo }
        2 { ShowOutputFileContent }
        3 { ShowClipboard }
        4 {
            SelectRegion
            Write-Host
            Write-Host "[Success] " -ForegroundColor Green -NoNewline
            Write-Host "Region was set to " -NoNewline
            Write-Host $Script:Region
        }
        5 { ShowPSVersion }
        'q' { continue }
        default {
            Write-Host
            Write-Host "*************************************"
            Write-Host "*" -NoNewline
            Write-Host " Error: " -ForegroundColor Red -NoNewline
            Write-Host "Invalid Selection." -NoNewline
            Write-Host "         *"
            Write-Host "*************************************"
        }
    }
    Write-Host
    Write-Host
    if ($Selection -ne 'q') {
        Read-Host "Press any key to return to main menu"
    }
    else {
        Read-Host "Application is exiting. Press any key"
    }
} until (($Selection -eq 'q'))


