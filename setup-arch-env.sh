#! /usr/bin/bash


if ! command -v aura &> /dev/null
then
    echo "Install aura you idiot sandwich: https://github.com/fosskers/aura"
    exit
fi

sudo aura -S stow
echo "Setting up Bash Shell"
aura -S starship # Install starship
aura -S lsd # Install lsd, the better ls command
aura -S bat # Install bat, the better cat command
aura -S zoxide # Install zoxide, the better cd command
aura -S sshpass

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
	aura -S zsh, zsh-syntax-highlighting, zsh-autosuggestions
	sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	stow zsh/
fi

read -p "Set up browser? [y/n]: " librewolf_opt
if [ $librewolf_opt = "y" ]
then 
	aura -A librewolf-bin
fi

# Firejail
read -p "Set up Firejail? [y/N]: " firejail_opt
if [ $firejail_opt = "y" ] 
then 
	aura -S firejail
	stow firejail/
fi

# Zathura
read -p "Set up Zathura? [y/N]: " zathura_opt
if [ $zathura_opt = "y" ]
then 
	aura -S zathura
	aura -S zathura-pdf-mupdf
	stow zathura/
fi

# Neovim
read -p "Set up Neovim? [y/N]: " nvim_opt
if [ $nvim_opt = "y" ]
then 
	sudo aura -S neovim
	stow nvim/
fi

# Entire Desktop
read -p "Set up desktop? [y/N]: " desktop_opt
if [ $desktop_opt = "y" ]
then 
	# Kitty
	aura -S kitty
	stow kitty/

	# Hyprland
	aura -A hyprland
	aura -A hyprpaper-git
	aura -A xdg-desktop-portal-hyprland-git
	stow hypr/
	
	# Waybar
	aura -A waybar-hyprland-git
	stow waybar/
	
	# Avizo
	aura -S brightnessctl
	aura -S pamixer
	aura -A avizo
	
	# Everything else
	aura -S dunst
	aura -S polkit-kde-agent
	aura -S swaylock
	aura -S grim
	aura -S slurp
	aura -S wl-clipboard
	aura -A safeeyes
fi

read -p "Set up Gimp? [y/N]: " gimp_opt
if [ $gimp_opt = "y" ]
then 
	aura -S gimp
	stow gimp
fi
