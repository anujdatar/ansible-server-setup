#!/bin/bash

echo "Initial setup"

echo "Updating installed packages"
sudo apt update && sudo apt upgrade

echo "Checking if basic packages are installed"

# basic packages one might use for general or dev projects
packages=(
	"python-minimal"
	"python3-minimal"
	"software-properties-common"
	"wireless-tools"
	"ntfs-3g" "exfat-utils"
	"samba" "avahi-daemon"
  "git" "htop"
  "policykit-1"
	)

missing=()

for package in ${packages[@]}
  do
    dpkg -s $package >/dev/null 2>&1 || missing=("${missing[@]}" $package)
done

echo $missing
