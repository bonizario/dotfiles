# 🛠 My Personal Settings

These are the settings I'm currently using in my code editor and terminal.

Feel free to copy whatever you find useful!

## 🕵 Terminal

### Install Terminator

```bash
sudo add-apt-repository ppa:mattrose/terminator

sudo apt-get update

sudo apt install terminator
```

### Install ZSH

```bash
sudo apt install zsh

# Verify installation
zsh --version

# Make it the default shell
chsh -s $(which zsh)

# Logout, login, and run
echo $SHELL
# Should return /usr/bin/zsh or similar
```

### Install Oh-My-Zsh (ZSH framework)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc.pre-oh-my-zsh

# Paste the .zshrc configuration
code ~/.zshrc
```

### Install Spaceship Prompt and ZSH Plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# F-Sy-H
git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H

ls ~/.oh-my-zsh/custom/plugins
# Should show all 3 plugins

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```
