#!bin/sh
sshpass -f ~/.secrets rsync -av /home mahid@192.168.1.6::NetBackup
