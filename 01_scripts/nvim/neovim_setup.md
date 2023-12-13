## Installation
Our setup will go in `~/.config/nvim/...`

Download packer from github
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Add packages to packer.lua and ensure lua scripts are in place
```
...
```

When in a packer.lua, ensure sourced
```bash
:so
```

Have packer grab those packages
```bash
:PackerSync
```

Ensure sourced
```bash
:so
```

## Mason Manager:
### LSP

bashls - For Bash
clangd - For C, C++
dockerls
docker_compose_language_service
groovyls - For Groovy (Jenkins)
html
lua_ls
perlnavigator
pyright - For Python
ruby_ls
sqls - For SQL
svlangserver - For SystemVerilog
yamlls - For YAML

### DAP
debugpy - For Python

### Linter
flake8 - For Python

### Formatter
black - For Python
isort - For Python
docformatter - For Python

* Python info: https://stackoverflow.com/a/77153991

## Useful pages:
* https://www.lazyvim.org/installation
* https://github.com/nvim-lua/kickstart.nvim
* https://github.com/folke/which-key.nvim
* https://github.com/neovim/neovim/wiki/FAQ#python-support-isnt-working