
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Install git
brew install git

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install stable
nvm alias default stable

# Apps
apps=(
  google-chrome
  iterm2
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Install ZSH
brew install zsh zsh-completions
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Make some commonly used folders
mkdir ~/Personal
mkdir ~/Work
