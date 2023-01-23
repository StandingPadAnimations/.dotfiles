# Firejail profile for discord
# This file is overwritten after every install/update
# Persistent local customizations
include discord.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/discord
noblacklist ${HOME}/.config/Vencord

mkdir ${HOME}/.config/discord
whitelist ${HOME}/.config/discord
whitelist ${HOME}/.config/Vencord

private-bin discord,Discord
private-opt discord,Discord

# Redirect
include discord-common.profile
