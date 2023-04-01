# Reads the provided artifacts folder path argument
$artifactsPath=$args[0]

# Creates folder
$programFolder="$artifactsPath/Password Manager"
New-Item -Path $programFolder -ItemType Directory

# Moves exe to folder
Move-Item -Path "./src-tauri/target/release/*.exe" -Destination $programFolder

# Zips folder and give it name archive.zip
Compress-Archive -Path $programFolder -DestinationPath "$artifactsPath/password-manager-windows-portable.zip"

# Cleanup
Remove-Item $programFolder -Recurse
