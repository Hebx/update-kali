# This file defines what the update script should do. 

# Git Repositories
# My preference is to install most external repositories under a single directory in my home folder, and to the same 
# with other people's repositories in a separate directory. These will be prefixed with the user's home directory.
personal_repo_dir = '/x'
external_repo_dir = '/z'

# These directories will be removed from your home directory
directories_to_remove = ['Documents', 'Music', 'Pictures', 'Public', 'Templates', 'Videos']

# These packages will be installed from APT. 
packages_to_install = ['most', 'ttf-mscorefonts-installer', 'pydf', 'htop',
                       'exif', 'hexedit', 'python3-pip', 'python3-venv']

# These python packages will be installed globally
pip_packages = ['pipenv', 'pylint']