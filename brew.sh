#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install homebrew/php/php56 --with-gmp
brew install emacs

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz
brew install ipython

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install rsync
brew install timemachineeditor

# Install Python
brew install python
brew install python3

# Install node.js
brew install node

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew tap caskroom/drivers

# Drivers
brew cask install logitech-options

# Core casks
#brew cask install --appdir="/Applications" alfred
#brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
#brew cask install --appdir="/Applications" sublime-text
#brew cask install --appdir="/Applications" atom
#brew cask install --appdir="/Applications" virtualbox
#brew cask install --appdir="/Applications" vagrant
#brew cask install --appdir="/Applications" macdown

# Misc casks
#brew cask install --appdir="/Applications" google-chrome
#brew cask install --appdir="/Applications" firefoxdeveloperedition
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
#brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" 1password
#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape
#brew cask install --appdir="/Applications" crashplan
#brew cask install --appdir="/Applications" freedome
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" parallels
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" visual-studio-code
#brew cask install --appdir="/Applications" visual-studio
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" whatsapp
brew cask install --appdir="/Applications" mactex
brew cask install --appdir="/Applications" anaconda
brew cask install --appdir="/Applications" teamviewer
brew cask install --appdir="/Applications" github
brew cask install --appdir="/Applications" osxfuse
brew cask install --appdir="/Applications" cryptomator
#brew cask install --appdir="/Applications" joplin
#brew cask install --appdir="/Applications" zotero
brew cask install --appdir="/Applications" protonvpn
brew cask install --appdir="/Applications" grammarly
brew cask install --appdir="/Applications" prowritingaid
brew cask install --appdir="/Applications" istat-menus
brew cask install --appdir="/Applications" rsyncosx
brew cask install --appdir="/Applications" macs-fan-control
brew cask install --appdir="/Applications" caffeine
brew cask install borgbackup

# Install Docker, which requires virtualbox
#brew install docker
#brew install boot2docker

# Install the Adobe Creative Suite setup
brew cask install --appdir="/Applications" adobe-creative-cloud

# Remove outdated versions from the cellar.
brew cleanup

# Install tldr through npm
npm install -g tldr
