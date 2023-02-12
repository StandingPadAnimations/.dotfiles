# Firejail profile for discord
# This file is overwritten after every install/update
# Persistent local customizations
include discord-common.local
# Persistent global definitions
# added by caller profile
#include globals.local

# Disabled until someone reported positive feedback
ignore include disable-interpreters.inc
ignore include disable-xdg.inc
ignore include whitelist-runuser-common.inc
ignore include whitelist-usr-share-common.inc
ignore apparmor
ignore disable-mnt
ignore private-cache
ignore dbus-user none
ignore dbus-system none

ignore noexec ${HOME}
ignore novideo

whitelist ${HOME}/.config/Vencord
whitelist ${HOME}/Documents
whitelist ${HOME}/.local/share/betterdiscordctl

private-bin awk,bash,cut,echo,egrep,electron,electron[0-9],electron[0-9][0-9],fish,grep,head,sed,sh,tclsh,tr,which,xdg-mime,xdg-open,zsh,librewolf
private-etc alternatives,ca-certificates,crypto-policies,fonts,group,ld.so.cache,ld.so.preload,localtime,login.defs,machine-id,password,pki,pulse,resolv.conf,ssl

join-or-start discord

# Redirect
include electron.profile
