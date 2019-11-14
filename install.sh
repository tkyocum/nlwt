#!/bin/sh

echo "Installing xcode"
xcode-select --install
echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Brewin' and Caskin' from Brewfile"
brew bundle
echo "Copying ssh config"
mkdir ~/.ssh
cp sshconfig ~/.ssh/config
echo "Copying .zshrc"
cp .zshrc ~/.zshrc
echo "Copying .gitconfig"
cp .gitconfig ~/.gitconfig
echo "Safari/OSX Settings and Tweaks"
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari NewTabBehavior -bool true
defaults write com.apple.Safari NewWindowBehavior -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0
defaults write com.apple.scriptmenu ScriptMenuEnabled -int 1
sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -int 128
killall Dock
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true 
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
killall Finder
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g KeyRepeat -int 2
echo "Installing iTerm Shell Integration"
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
