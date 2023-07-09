

function buildPath($pPath = "C:\a\platforms\Nop"){
# Find all .csproj files in the parent directory and subdirectories
$csprojFiles = Get-ChildItem -Path $pPath -Filter *.csproj -Recurse

# Loop through each .csproj file
foreach($csprojFile in $csprojFiles)
{
        Write-Host $csprojFile.FullName
        # Extract directory path
        //$directoryPath = [System.IO.Path]::GetDirectoryName($csprojFile)

        //# Change to the directory of the csproj file
        Set-Location -Path $directoryPath

        # Run dotnet build
        dotnet build $csprojFile.FullName

        # Run dotnet publish
        dotnet publish $csprojFile.FullName

        # Change back to the original directory
        Set-Location -Path $ParentDirectoryPath
}
$directoryPath = [System.IO.Path]::GetDirectoryName($csprojFile)

      //# Change to the directory of the csproj file
        Set-Location -Path $directoryPath
        foreach($dir in $directoryPath) {
           buildPath($dir);
           }
}

buildPath("C:\a\platforms\Nop")

