## Install guide:

Get zsh:
```bash
sudo apt update
sudo apt install zsh -y
```

Make it default:
```bash
chsh -s $(which zsh)
```

Get Oh My Zsh:
```bash
cd ~
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
Get zsh-autosuggestions plugin:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Get zsh syntax highlighting plugin:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Change theme by replacing line start with ZSH_THEME with what we actually want:
```bash
sed -i "/^ZSH_THEME=/c\ZSH_THEME="jonathan"" ${HOME}/.zshrc
```

Change plugins line:
```bash
sed -i "/^plugins=/c\(git zsh-autosuggestiosn zsh-syntax-highlighting)" ${HOME}/.zshrc
```

## Useful pages:
* https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet
* https://stackoverflow.com/questions/12765344/oh-my-zsh-slow-but-only-for-certain-git-repo
* https://stackoverflow.com/questions/21162988/how-to-make-zsh-search-configuration-in-xdg-config-home