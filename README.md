# WSL Config

This config is intended for Debian and will thus use "apt" for installing software.
It should however work on all or most distributions.

## Dependencies
Make sure you have **git** and **curl** installed before continuing.
```zsh
sudo apt install git curl
```
## Shell
### Zsh
This configuration will be using **zsh** as its main shell.

You can install **zsh** with the following command:
```zsh
sudo apt install zsh
```

### oh-my-zsh
**[oh-my-zsh](https://ohmyz.sh/)** provides a framework for configuring zsh and comes with a good config out of the box.
We will add some configuration to this preset.

**oh-my-zsh** can be installed with the following command:
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
When prompted to make **zsh** your main shell, press **Y** and **Enter**.

Lastly copy the **.zshrc** file from this repository into **~**.

### Plugins
To install plugins we need to clone the git repositories of the plugin into the **zsh** plugin directory.
For this config the only external plugin we use is **zsh-autosuggestions** which can be retrieved like this:
```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
The plugin should then be enabled using the **.zshrc** file in this repo.

Plugins activated by default are:
* [z](https://github.com/agkozak/zsh-z)
    * Allows you to quickly jump between directories you often visit.
* [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) 
    * Provides aliases of git functions.
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    * Suggests commands as you type them.

Plugins preinstalled with **oh-my-zsh** can be found on the [oh-my-zsh git repository](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins) and must be enabled in the **plugins** part in **.zshrc**.

## Neovim
### Installing
Before installing **neovim** make sure you have **FUSE** installed on the system:
```zsh
sudo apt install fuse
```

Installing **neovim** on Debian using apt gets an old version of **neovim**.
In order to get the newest version we need to download it from the **neovim** git repo.
```zsh
curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage -o nvim.appimage
```
Then in order to make it exectuable, run:
```zsh
chmod +x nvim.appimage
```
Lastly move it to **/usr/bin/nvim**
```zsh
sudo mv nvim.appimage /usr/bin/nvim
```

### Config
This config uses [lazy.nvim](https://github.com/folke/lazy.nvim) as its package manager.
The plugins that are installed and their configuration can be found under **nvim/lua/plugins**.

Before copying the **nvim** folder to **~/.config** make sure to have the following installed:
* C compiler
    * Treesitter, the plugin for syntax highlighting, requires a C compiler to function.
    C compilers and other tools can be installed with the following command on Debian:
    ```zsh
    sudo apt install build-essential
    ```
* ripgrep
    * ripgrep is required by the plugin Telescope to provide Grep functionality in files.
    ```zsh
    sudo apt install ripgrep
    ```

Once the dependencies are installed copy the **nvim** folder to **~/.config/**
 and start **neovim**. **lazy.nvim** will automatically download the plugins and set them up.

## Tmux
Tmux is my terminal multiplexer of choice. It can be installed with the following command:
```zsh
sudo apt install tmux
```

In order to get the config from this repo into **tmux** we just copy the  **.tmux.conf** file into **~**.
