# ☕ Ubuntu 20.04 Setup


```bash
sudo apt update && sudo apt full-upgrade
```

Install VS Code (login to sync settings) and install GNOME Tweaks

Install git, curl, and asdf

```bash
sudo apt install git curl

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
```

Edit global git configs `~/.gitconfig`

```bash
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
git config --global core.editor 'code --wait'
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true
git config --global gpg.program gpg
```

<br />

# 🚀 Performance

## Updates

Stop "automatically check for updates" in Software & Updates

Manually update every once in a while:

```bash
sudo apt update && sudo apt full-upgrade
```

## Make the grub menu disappear faster when booting

```bash
sudo nano /etc/default/grub
# Change GRUB_TIMEOUT from 10 to 0

sudo update-grub
```

## Remove firefox from snap and install via debian package

```bash
sudo snap remove firefox

sudo add-apt-repository ppa:mozillateam/ppa

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install firefox
```

## Completely remove snapd

```bash
sudo apt
sudo apt remove --purge snapd gnome-software-plugin-snap
sudo rm -rf /var/cache/snapd
sudo rm -rf ~/snap
```

## Remove annoying report messages

```bash
sudo apt remove --purge apport apport-gtk apport-symptoms
```

## Install preload and manually (GUI) edit hidden startup applications

```bash
sudo apt install preload

sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
```

## Speed activities search

Settings > Search > Disable all options (Files, Calculator, etc)

## Configure swap usage

```bash
cat /etc/sysctl.conf

sudo nano /etc/sysctl.conf

# Add the following 2 lines:
vm.swappiness=10
vm.vfs_cache_pressure=50
```

<br />

# 🎨 Appearance

## Install extensions

Install:
- Hide top bar
- Custom hot corners

Disable:
- Ubuntu dock
- Desktop icons
- Ubuntu appindicators

## Install Ulauncher and Plank and add them to startup applications with GNOME Tweaks

Change Ulauncher shortcut to Ctrl+Shift+Space to avoid conflicting with VS Code Ctrl+Space keybinding

Add Ulauncher extensions and theme: emoji and system

```
https://github.com/tjquillan/ulauncher-system
```
```
https://github.com/Ulauncher/ulauncher-emoji
```

```bash
git clone https://github.com/KiranWells/ulauncher-nord/ ~/.config/ulauncher/user-themes/nord
```

Ctrl+Right Click to edit Plank settings:

Theme: transparent, Alignment: center, Icon Size: 72, Icon Zoom: 144, Hide Dock: autohide, Lock Icons: true

## Install system themes and fonts

- Applications theme: Nordic darker v40
- Icons theme: Papirus
- Font: JetBrainsMono

<br />

# 🕵️‍♂️ Terminal

## Aura Theme (GNOME Terminal that will be used in VS Code)

Create ~/aura-theme.dconf file with the following content:

```
[/]
background-color='rgb(21,20,27)'
bold-color='rgb(237,236,238)'
bold-color-same-as-fg=false
bold-is-bright=false
cursor-background-color='rgb(162,119,255)'
cursor-colors-set=true
cursor-foreground-color='rgb(162,119,255)'
foreground-color='rgb(237,236,238)'
highlight-background-color='rgb(162,119,255)'
highlight-colors-set=true
palette=['rgb(17,15,24)', 'rgb(255,103,103)', 'rgb(97,255,202)', 'rgb(255,202,133)', 'rgb(162,119,255)', 'rgb(162,119,255)', 'rgb(97,255,202)', 'rgb(237,236,238)', 'rgb(109,109,109)', 'rgb(255,202,133)', 'rgb(162,119,255)', 'rgb(255,202,133)', 'rgb(162,119,255)', 'rgb(162,119,255)', 'rgb(97,255,202)', 'rgb(237,236,238)']
use-theme-colors=false
visible-name='Aura Theme'
```

Run:

```bash
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < ~/aura-theme.dconf
```

## Install Terminator

Paste https://github.com/bonizario/dotfiles/blob/master/config inside `~/.config/terminator/config`

## Open in fullscreen

Settings > Keyboard Shortcuts

Change "Launch terminal" to something else (e.g.: CTRL + ALT + M)

Create custom shortcut:

- Name: Launch terminator fullscreen

- Shortcut: CTRL + ALT + T

- Command: `terminator --full-screen`


## Install ZSH Shell

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

## Install Oh-My-Zsh (ZSH framework)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm ~/.zshrc.pre-oh-my-zsh

# Paste https://github.com/bonizario/dotfiles/blob/master/.zshrc
code ~/.zshrc
```

## Install plugins and spaceship prompt

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

## Change login-screen background-image (GNOME Tweaks has no effect BUG?)

```bash
sudo apt install libglib2.0-dev-bin

wget -qO - https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background/archive/main.tar.gz | tar zx --strip-components=1 ubuntu-gdm-set-background-main/ubuntu-gdm-set-background

sudo ./ubuntu-gdm-set-background --image /usr/share/backgrounds/berserk.jpg
```
