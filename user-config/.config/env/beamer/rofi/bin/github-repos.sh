#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      github-repos.sh
#   created:   04.04.2017.-09:18:34
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi, git
# Description:
#   Display all repositories connected with a GitHub user account in rofi and
#   clone the selected repository.
# Usage:
#   github-repos.sh
# -----------------------------------------------------------------------------
# Script:

# GitHub username
USER="username"

# GitHub user account URL
#URL="https://github.com/$USER/"
URL="git@github.com:$USER/"

TOKEN="token"
# Clone a repository into the current directory
clone_repository() {
	local repository=$1
	if [ -z "$repository" ]; then
		echo "ERROR: You need to enter the name of the repository you wish to clone."
	else
		#  git clone "$URL$repository"
		echo "gh repo clone $repository" | xclip -sel clip
		kitty -e gh repo clone $repository $HOME/Dokumente/$repository
	fi
}

# Get all the repositories for the user with curl and GitHub API and filter only
# the repository name from the output with sed substitution
all_my_repositories_short_name() {
	gh repo list | awk '{ print $1 }'
}

# Rofi dmenu
rofi_dmenu() {
	rofi -dmenu -matching fuzzy -no-custom -p "Select a repository > " \
		-location 0 -bg "#F8F8FF" -fg "#000000" -hlbg "#ECECEC" -hlfg "#0366d6"
}

main() {
	repository=$(all_my_repositories_short_name | rofi_dmenu)
	clone_repository "$repository"
}

main

exit 0
