#!/bin/bash

function _hyprland() {
	# Hyprland desktop
	yes | sudo pacman -S kitty hyprland-git hyprpaper-git waybar-hyprland-git dunst swaylock slurp grim
	stow kitty/
	stow hypr/
	stow waybar/

	# Avizo
	yes | sudo pacman -S brightnessctl pamixer avizo

	# Everything Else
	yes | sudo pacman -S xdg-desktop-portal-hyprland-git xdg-desktop-portal-gtk
}

function _set_up_shell() {
	yes | sudo pacman -S starship lsd bat zoxide sshpass zsh zsh-syntax-highlighting zsh-autosuggestions atuin
	
	# Nerd font
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/BigBlueTerminal.zip
	mkdir -p ~/.local/share/fonts/nerd-fonts
	unzip BigBlueTerminal.zip -d ~/.local/share/fonts/nerd-fonts
	rm -f BigBlueTerminal.zip # Force it just in case

	fc-cache -fv
	stow bash/
	stow zsh/
}

function _set_up_general() {
	yes | sudo pacman -S librewolf-bin firejail zathura zathura-pdf-mupdf neovim gimp git
	stow firejail/
	stow zathura/
	stow nvim/
	stow gimp/
	stow git/
}
