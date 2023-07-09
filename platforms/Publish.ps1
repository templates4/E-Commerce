param(
  [string]$PlatformRootPath
)

Write-Host "Publishing artifacts from: $PlatformRootPath"


function buildPath($pPath = ""){
# Find all .csproj files in the parent directory and subdirectories
  $csprojFiles = Get-ChildItem -Path $pPath -Filter *.csproj -Recurse

# Loop through each .csproj file
  foreach($csprojFile in $csprojFiles)
    {
        Write-Host "Publishing $($csprojFile.FullName)"
        # Extract directory path

        # Run dotnet publish
        dotnet publish $csprojFile.FullName

    }
   
 }

buildPath($PlatformRootPath)

