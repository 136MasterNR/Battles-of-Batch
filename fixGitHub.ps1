# Run this in order to convert Unix-style EOF files to Windows-style EOF.

# Get the current directory path
$directoryPath = (Get-Item -Path ".\").FullName

# Get all files in the directory and its subdirectories with any extension
$files = Get-ChildItem -Path $directoryPath -File -Recurse

# Loop through each file
foreach ($file in $files) {
    # Get the file contents and check if it contains Unix-style line endings
    $fileContent = Get-Content $file.FullName -Raw
    if ($fileContent -match "`n" -and $fileContent -notmatch "`r`n") {
        # Replace the Unix-style line endings with Windows-style line endings
        $fileContent = $fileContent.Replace("`n", "`r`n")
        Set-Content $file.FullName $fileContent -Encoding Default
        Write-Host "Converted $($file.Name) from Unix to Windows format."
    }
}
