#!/bin/bash
#
# Install binaries for Boxen profile
#

# This tap is needed to install binaries that collide with OSX versions, like
# grep and coreutils
brew tap homebrew/dupes

# Install stuff from Homebrew
brew install bash
brew install cmake
brew install coreutils
brew install fzf
brew install grep
brew install python
brew install reattach-to-user-namespace
brew install tmux
brew install vim

# Install powerline
pip install powerline-status
