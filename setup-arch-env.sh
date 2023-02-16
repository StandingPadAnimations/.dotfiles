#! /usr/bin/bash


if ! command -v sudo aura &> /dev/null
then
    echo "Install sudo aura you idiot sandwich: https://github.com/fosskers/aura"
    exit
fi

yes | sudo pacman -S stow
echo "Setting up shell"
yes | sudo pacman -S starship # Install starship
yes | sudo pacman -S lsd # Install lsd, the better ls command
yes | sudo pacman -S bat # Install bat, the better cat command
yes | sudo pacman -S zoxide # Install zoxide, the better cd command
yes | sudo pacman -S sshpass

# Install nerd font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/BigBlueTerminal.zip
mkdir -p ~/.local/share/fonts/nerd-fonts
unzip BigBlueTerminal.zip -d ~/.local/share/fonts/nerd-fonts
rm -f BigBlueTerminal.zip # Force it just in case

# Update cache
fc-cache -fv
stow bash/

read -p "Set up Zsh? [y/n]: " zsh_opt
if [ $zsh_opt = "y" ]
then 
	yes | sudo pacman -S zsh, zsh-syntax-highlighting, zsh-autosuggestions
	sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	stow zsh/
fi

read -p "Set up browser? [y/n]: " librewolf_opt
if [ $librewolf_opt = "y" ]
then 
	sudo aura -Axa librewolf-bin
fi

# Firejail
read -p "Set up Firejail? [y/N]: " firejail_opt
if [ $firejail_opt = "y" ] 
then 
	yes | sudo pacman -S firejail
	stow firejail/
fi

# Zathura
read -p "Set up Zathura? [y/N]: " zathura_opt
if [ $zathura_opt = "y" ]
then 
	yes | sudo pacman -S zathura
	yes | sudo pacman -S zathura-pdf-mupdf
	stow zathura/
fi

# Neovim
read -p "Set up Neovim? [y/N]: " nvim_opt
if [ $nvim_opt = "y" ]
then 
	sudo yes | sudo pacman -S neovim
	stow nvim/
fi

# Entire Desktop
read -p "Set up desktop? [y/N]: " desktop_opt
if [ $desktop_opt = "y" ]
then 
	# Kitty
	yes | sudo pacman -S kitty
	stow kitty/

	# Hyprland
	sudo aura -Axa hyprland
	sudo aura -Axa hyprpaper-git
	sudo aura -Axa xdg-desktop-portal-hyprland-git
	stow hypr/
	sudo stow wrappedhl -t / 
	
	# Waybar
	sudo aura -Axa waybar-hyprland-git
	stow waybar/
	
	# Avizo
	yes | sudo pacman -S brightnessctl
	yes | sudo pacman -S pamixer
	sudo aura -Axa avizo
	
	# Everything else
	yes | sudo pacman -S dunst
	yes | sudo pacman -S polkit-kde-agent
	yes | sudo pacman -S swaylock
	yes | sudo pacman -S grim
	yes | sudo pacman -S slurp
	yes | sudo pacman -S wl-clipboard
	sudo aura -Axa safeeyes
fi

read -p "Set up Gimp? [y/N]: " gimp_opt
if [ $gimp_opt = "y" ]
then 
	yes | sudo pacman -S gimp
	stow gimp
fi
