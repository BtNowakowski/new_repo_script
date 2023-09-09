# Script which shockingly improves my productivity
## How does it work?
It creates new folder inside of provided directory (preferably git repositories directory), there it initializes a new repo, adds .gitignore file, requirements.txt file, source folder and readme.md file which contains header with repository name.   
Lastly, script adds all the files to the initial commit then opens up newly created repository in vscode.
## Usage
Change `<PATH FOR REPOSITORIES>`, `<YOUR EMAIL>`, `<YOUR NAME>` placeholders in the script.  

Add an alias in your system's terminal eg. new_repo:
  
- On Windows:
  - `New-item -Type file -Path $PROFILE -Force`
  - Open `$Profile`
  - `set-alias -name new_repo -value C:\Scripts\create_repo.ps1`
  
- On Mac:
  - Open `~/.zshrc` file and add the command below
  - `Alias new_repo='~/scripts/create_repo.sh'`

Then you should be able run the script by just typing `new_repo <NAME_OF_REPOSITORY>`  

