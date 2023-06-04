PHONY: pacman setup_tpm create_token create_key export_ssh_pub

pacman:
	sudo pacman -S - < pacman.txt
	sudo pip install -r requirements.txt

setup_tpm:
	./setup-tpm.sh ${USER}

create_token:
	./create-token.sh

create_key:
	./create-key.sh

export_ssh_pub:
	ssh-keygen -D /usr/lib/pkcs11/libtpm2_pkcs11.so 2>/dev/null > ssh.pub

gh-ssh-add:
	gh ssh-key add ssh.pub

agent-add:
	ssh-add -s /usr/lib/pkcs11/libtpm2_pkcs11.so 

luks-tpm:
	sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+7 /dev/${VOLUME} --tpm2-with-pin=yes
