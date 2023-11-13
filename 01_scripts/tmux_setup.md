## Installation
Our config will go in `~/.config/tmux/tmux.config`

Get Tmux package manager (TPM)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install packages
```bash
prefix combo (ctrl + s) + shift + i
```

Reload - required after installing packages
```bash
prefix combo (ctrl + s) + r 
# -OR-
tmux source-file ~/.config/tmux/tmux.config
```

## Useful pages
* https://github.com/tmux/tmux
* https://tmuxcheatsheet.com/
* https://www.baeldung.com/linux/tmux-kill-respawn-pane
* https://leimao.github.io/blog/Tmux-Tutorial/
* https://github.com/tmux-plugins/tmux-continuum
* https://github.com/tmux-plugins/tmux-resurrect/
* https://unix.stackexchange.com/questions/52144/tmux-eclipsed-colorized-output-of-ls
* https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file
* https://superuser.com/questions/343572/how-do-i-reorder-tmux-windows