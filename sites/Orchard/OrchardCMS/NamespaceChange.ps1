function RecursivelyReplace-StringInFiles {
    param (
        [Parameter(Mandatory = $true)]
        [string]$RootDirectory,
        
        [Parameter(Mandatory = $true)]
        [string]$SearchString,
        
        [Parameter(Mandatory = $true)]
        [string]$ReplaceString,

        [Parameter(Mandatory = $true)]
        [string]$Filter
    )
    
    $files = Get-ChildItem -Path $RootDirectory -Filter $Filter -Recurse

    foreach ($file in $files) {
        $filePath = $file.FullName
        $content = Get-Content -Path $filePath -Raw
        $newContent = $content -replace $SearchString, $ReplaceString
        
        if ($content -ne $newContent) {
            Write-Host "Updating file: $filePath"
            Set-Content -Path $filePath -Value $newContent
        }
    }

    $folders = Get-ChildItem -Path $RootDirectory -Directory -Recurse
    foreach($folder in $folders)
    {
        RecursivelyReplace-StringInFiles -RootDirectory $folder.FullName -SearchString $SearchString -ReplaceString $ReplaceString -Filter $Filter
    }
}


RecursivelyReplace-StringInFiles -RootDirectory "C:\Users\Owner\e-commerce\platforms\Orchard\src\OrchardCore.Modules" -SearchString "OrchardCore\.Demo"  -ReplaceString "OrchardCMS" -Filter "*.cshtml"

