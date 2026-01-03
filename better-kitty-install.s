#!/bin/bash

set -e

sudo pacman -Syu --noconfirm kitty zsh curl git

echo "Creating kitty config..."
mkdir -p ~/.config/kitty
touch ~/.config/kitty/kitty.conf

echo "Changing default shell to zsh..."
sudo chsh -s "$(which zsh)" "$USER"

echo "Installing Oh My Zsh..."
RUNZSH=no CHSH=no sh -c \
  "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "Configuring .zshrc..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc

echo "Done."
echo "➡️ Log out and log back in, then run: p10k configure"
