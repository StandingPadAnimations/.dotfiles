#! /usr/bin/bash


if ! command -v sudo aura &> /dev/null
then
    echo "Install sudo aura you idiot sandwich: https://github.com/fosskers/aura"
    exit
fi

sudo aura -S stow
echo "Setting up shell"
sudo aura -S starship # Install starship
sudo aura -S lsd # Install lsd, the better ls command
sudo aura -S bat # Install bat, the better cat command
sudo aura -S zoxide # Install zoxide, the better cd command
sudo aura -S sshpass

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
	sudo aura -S zsh, zsh-syntax-highlighting, zsh-autosuggestions
	sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	stow zsh/
fi

read -p "Set up browser? [y/n]: " librewolf_opt
if [ $librewolf_opt = "y" ]
then 
	sudo aura -A librewolf-bin
fi

# Firejail
read -p "Set up Firejail? [y/N]: " firejail_opt
if [ $firejail_opt = "y" ] 
then 
	sudo aura -S firejail
	stow firejail/
fi

# Zathura
read -p "Set up Zathura? [y/N]: " zathura_opt
if [ $zathura_opt = "y" ]
then 
	sudo aura -S zathura
	sudo aura -S zathura-pdf-mupdf
	stow zathura/
fi

# Neovim
read -p "Set up Neovim? [y/N]: " nvim_opt
if [ $nvim_opt = "y" ]
then 
	sudo sudo aura -S neovim
	stow nvim/
fi

# Entire Desktop
read -p "Set up desktop? [y/N]: " desktop_opt
if [ $desktop_opt = "y" ]
then 
	# Kitty
	sudo aura -S kitty
	stow kitty/

	# Hyprland
	sudo aura -A hyprland
	sudo aura -A hyprpaper-git
	sudo aura -A xdg-desktop-portal-hyprland-git
	stow hypr/
	sudo stow wrappedhl -t / 
	
	# Waybar
	sudo aura -A waybar-hyprland-git
	stow waybar/
	
	# Avizo
	sudo aura -S brightnessctl
	sudo aura -S pamixer
	sudo aura -A avizo
	
	# Everything else
	sudo aura -S dunst
	sudo aura -S polkit-kde-agent
	sudo aura -S swaylock
	sudo aura -S grim
	sudo aura -S slurp
	sudo aura -S wl-clipboard
	sudo aura -A safeeyes
fi

read -p "Set up Gimp? [y/N]: " gimp_opt
if [ $gimp_opt = "y" ]
then 
	sudo aura -S gimp
	stow gimp
fi
