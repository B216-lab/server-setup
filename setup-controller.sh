# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found!"
fi


# Install pipx
python3 -m pip install --upgrade --user setuptools
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Reload shell so pipx is in PATH for this script/session
export PATH="$PATH:~/.local/bin"

# Install Ansible, molecule, linter and docker driver via pipx
pipx install --include-deps ansible molecule "molecule-plugins[docker]" ansible-lint ansible-dev-tools

# Install roles and collections
ansible-galaxy role install -r requirements.yml
ansible-galaxy collection install -r requirements.yml

echo "Controller setup complete!"
