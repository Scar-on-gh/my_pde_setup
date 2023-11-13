#!/bin/bash
# ----------------------------------------------------
# Title:      setup_tmux.sh
# License:    agpl-3.0
# Author:     Samuel Carlson
# Created on: 2023-11-12
# Editor:     
# Edited on:  
# ----------------------------------------------------
#
# Description: The purpose of this script is to install and setup zsh for my env.
# 
# Arguments: 
#   $1 - ("y"/"n") to run the script if you have admin to do install and updates.
#   $2 - ("y"/"n") the system uses module files to provide tools/binaries.
#   $3 - ("y"/"n") to make backups before possibly blowing away original files.
# ----------------------------------------------------
#
# Notes:  
# source setup_tmux.sh "n" "n" "n"
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
    sudo apt update
    sudo apt install tmux -y
    # To make it yourself:
    # git clone https://github.com/tmux/tmux.git
    # cd tmux
    # sh autogen.sh
    # ./configure && make
  fi 
  
  # $2 = y means the system uses module files to provide tools/binaries. 
  if [[ $2 == "y" ]]; then
    echo "Module loading tmux."
    module load tmux
  fi 
  
  if [[ $3 == "y"]]; then
    echo "Making backups with suffix .bak_${current_date}"
    # Make backup of existing zshrc file
    mv ~/.config/tmux{,.bak_${current_date}}
    mv ~/.tmux.config{,.bak_${current_date}}
  fi
  
  # Do the following always:
  # Go to home dir to star the install
  cd /home/${USER}
  config_dir="/home/${USER}/.config/tmux"
  echo "Making dir for config files at ${config_dir}"
  mkdir -p ${config_dir}
  # Install tmux package manager (TPM)
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  
  echo "Done."
  
} # end main()

# To start the script we call main.
main $@;