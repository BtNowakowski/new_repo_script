param (
    [string]$repo_name
)

if (-not $repo_name) {
    Write-Host "        "
    Write-Host " NO PARAMETERS PROVIDED"
    Write-Host " ---------------------------------"
    Write-Host " Script takes a name of repository to be created as a parameter!"
    Write-Host " Usage: ./create_repo.ps1 new_repo_name"
    Write-Host " ---------------------------------"
    exit 2
}

$directory = "<PATH FOR REPOSITORIES>"
$name = "<YOUR NAME>"
$email = "<YOUR EMAIL>"

$path = Join-Path -Path $directory -ChildPath $repo_name

if (-not (Test-Path $directory -PathType Container)) {
    Write-Host "Provided directory doesn't exist."
    exit 2
}

New-Item -Path $path -ItemType Directory -Force
Set-Location -Path $path
New-Item -Name "source" -ItemType Directory
New-Item -Name "README.md" -ItemType File
New-Item -Name ".gitignore" -ItemType File
New-Item -Name "requirements.txt" -ItemType File

Add-Content -Path ".gitignore" -Value ".pytest_cache"
Add-Content -Path ".gitignore" -Value ".vscode"
Add-Content -Path ".gitignore" -Value "/source/__pycache__"

Add-Content -Path "README.md" -Value "# $repo_name"

# Initialize Git repository and configure user email and name
git init
git config user.email "$email"
git config user.name "$name"

# Add all files to the initial commit
git add .
git commit -m "Initial commit"

Invoke-Expression "code ."
