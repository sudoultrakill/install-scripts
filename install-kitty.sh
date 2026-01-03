sudo pacman -Syu kitty zsh

echo "Creating kitty config ..."
mkdir ~/.config/kitty
touch ~/.config/kitty.conf

echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh)

echo "Installing oh-my-zsh plugin manager for zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

echo "Installing zsh-syntax-highlighting ..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "Sourcing ~/.zshrc ..."
source ~/.zshrc

