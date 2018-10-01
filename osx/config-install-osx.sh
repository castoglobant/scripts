#!/bin/bash

mkdir -p $HOME/Pictures/screenshots/
defaults write com.apple.screencapture location $HOME/Pictures/screenshots/ && killall SystemUIServer

xcode-select --install
xcode-select -p /Library/Developer/CommandLineTools
gcc --version
ruby --version

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap caskroom/versions
brew doctor
brew update

brew cask install iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
source ~/.zshrc

#These plugins add support for the corresponding file type to Mac Quick Look 
#(In Finder, mark a file and press Space to start Quick Look).
brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    webpquicklook \
    suspicious-package
brew install homebrew/fuse/ntfs-3g

brew install nvm 
nvm install --lts
#npm install -g exp
npm install -g expo-cli
npm install -g create-react-native-app
brew install yarn --without-node

sudo sysctl -w kern.maxfiles=5242880;
sudo sysctl -w kern.maxfilesperproc=524288

brew cask install virtualbox 
brew cask install genymotion

brew cask install java8

brew cask install android-sdk android-platform-tools androidtool android-ndk android-studio

brew cask install docker

#export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

brew cask install slack
brew cask install sublime-text
brew cask install google-chrome
brew cask install postman
brew cask install robo-3t
brew cask install gitkraken
brew cask install sourcetree
#brew cask install master-pdf-editor

brew install tree
brew install ack
brew install vim
brew install golang

python --version
brew list --versions
go version
java -version
docker run hello-world
docker -v
docker-compose -v
