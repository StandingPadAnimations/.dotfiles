#! /usr/bin/bash
sudo pacman -S stow

echo "Setting up Bash Shell"
stow bash/

# Firejail
read -p "Set up Firejail? [y/N]: " firejail_opt
if [ $firejail_opt = "y" ] 
then 
	pacman -S firejail
	stow firejail/
fi

# Zathura
read -p "Set up Zathura? [y/N]: " zathura_opt
if [ $zathura_opt = "y" ]
then 
	pacman -S zathura
	pacman -S zathura-pdf-mupdf
	stow zathura/
fi

# Neovim
read -p "Set up Neovim? [y/N]: " nvim_opt
if [ $nvim_opt = "y" ]
then 
	sudo pacman -S neovim
	stow nvim/
fi

# Entire Desktop
read -p "Set up desktop? [y/N]: " desktop_opt
if [ $desktop_opt = "y" ]
then 
	# Kitty
	pacman -S kitty
	stow kitty/

	# Hyprland
	yay -S hyprland
	yay -S hyprpaper-git
	yay -S xdg-desktop-portal-hyprland-git
	stow hypr/
	
	# Waybar
	yay -S waybar-hyprland-git
	stow waybar/

	# Everything else
	pacman -S dunst
	pacman -S polkit-kde-agent
	pacman -S swaylock
	pacman -S grim
	pacman -S slurp
	pacman -S wl-clipboard
	yay -S safeeyes
	yay -S avizo
fi