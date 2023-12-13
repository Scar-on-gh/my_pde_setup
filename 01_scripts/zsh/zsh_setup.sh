#!/bin/bash
# ----------------------------------------------------
# Title:      setup_zsh.sh
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
#   $3 - ("y"/"n") change the default shell.
#   $4 - ("y"/"n") to make backups before possibly blowing away original files.
# ----------------------------------------------------
#
# Notes:  
# source setup_zsh.sh "n" "n" "n" "n"
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
    echo "sudo updating and installing zsh."
    sudo apt update
    sudo apt install zsh -y
  fi 
  
  # $2 = y means the system uses module files to provide tools/binaries. 
  if [[ $2 == "y" ]]; then
    echo "Module loading zsh."
    module load zsh
  fi 
  
  # $3 = y means change the default shell 
  if [[ $3 == "y" ]]; then
    echo "Changing default shell to zsh."
    # Make zsh default, I don't think this requires admin
    chsh -s $(which zsh)
  fi
  
  if [[ $4 == "y"]]; then
    echo "Making backups with suffix .bak_${current_date}"
    # Make backup of existing zshrc file
    mv ~/.zshrc{,.bak_${current_date}}
  fi
  
  # Do the following always:
  # Go to home dir to star the install
  config_dir="/home/${USER}/.config/zsh"
  echo "Making dir for config files at ${config_dir}"
  mkdir -p ${config_dir}
  ln -s ../../.zshrc ${config_dir}
  # Call sh to grab the ohmyzsh install:
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  # Get zsh-autosuggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # Get zsh syntax highlighting plugin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # Get zsh powerlevel10k theme
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  # Change theme by replacing line start with ZSH_THEME with what we actually want
  sed -i "/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"" ${HOME}/.zshrc
  # Change plugins line
  sed -i "/^plugins=/c\(git zsh-autosuggestiosn zsh-syntax-highlighting)" ${HOME}/.zshrc
  
  echo "Done."
  
} # end main()

# To start the script we call main.
main $@;