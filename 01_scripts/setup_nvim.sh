#!/bin/bash
# ----------------------------------------------------
# Title:      setup_nvim.sh
# License:    agpl-3.0
# Author:     Samuel Carlson
# Created on: 2023-11-12
# Editor:     
# Edited on:  
# ----------------------------------------------------
#
# Description: The purpose of this script is to install and setup nvim for my env.
# 
# Arguments: 
#   $1 - ("y"/"n") to run the script if you have admin to do install and updates.
#   $2 - ("y"/"n") the system uses module files to provide tools/binaries.
#   $3 - ("y"/"n") to make backups before possibly blowing away original files.
# ----------------------------------------------------
#
# Notes:  
# source setup_nvim.sh "n" "n" "n"
# TODO:         
#   1) Add named args.
# ----------------------------------------------------

# ----------------------------------------------------
# Function    : main()
# Description : Does main-y things.
# ----------------------------------------------------
main(){
  # Grab the current date of form Y-M-D_H-M-S
  current_date=$(date +%F_%H-%M-%S)
  
  #if [[ ! -a $(readlink -f ${activate_fp}) ]];then
  # $1 = y means runs the script as admin. Not going to bother with complicated arg names in version 1.
  if [[ $1 == "y" ]];then
    echo "sudo updating and installing neovim."
    # This will get latest, usually stable despite the branch name.
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt install neovim -y
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    python -m pip install setuptools
    python -m pip install --upgrade pynvim
    python3 -m pip install --upgrade pynvim
  fi 
  
  # $2 = y means the system uses module files to provide tools/binaries. 
  if [[ $2 == "y" ]]; then
    echo "Module loading neovim."
    module load neovim
  fi 
  
  if [[ $3 == "y"]]; then
    echo "Making backups with suffix .bak_${current_date}"
    # Make backup of existing nvim config file
    mv ~/.config/nvim{,.bak_${current_date}}
  fi
  
  # Do the following always:
  # Go to home dir to star the install
  cd /home/${USER}
  config_dir="/home/${USER}/.config/nvim"
  echo "Making dir for config files at ${config_dir}"
  mkdir -p ${config_dir}
  # Install packer plugin
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  
  echo "Done."
  
} # end main()

# To start the script we call main.
main $@;