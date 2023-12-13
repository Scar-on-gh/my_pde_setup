# Naive approach to refreshing files in the git repo from my home dir/config files
# Grab nvim files
cp ~/.config/nvim/init.lua /mnt/f/Documents/Personal/Scripts/my_pde_setup/01_scripts/nvim/
cp -a ~/.config/nvim/after /mnt/f/Documents/Personal/Scripts/my_pde_setup/01_scripts/nvim/
cp -a ~/.config/nvim/lua /mnt/f/Documents/Personal/Scripts/my_pde_setup/01_scripts/nvim/

# Grab zsh file(s):
cp ~/.zshrc /mnt/f/Documents/Personal/Scripts/my_pde_setup/01_scripts/zsh/

# Grab tmux file(s):
cp ~/.config/tmux/tmux.conf /mnt/f/Documents/Personal/Scripts/my_pde_setup/01_scripts/tmux/
