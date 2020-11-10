#!/bin/bash

read -p "username: " username

id $username

if [ "$?" == "0" ]; then
  exit 1
fi

useradd -m "$username"

cd /etc/openvpn/easyrsa3

./easyrsa build-client-full "$username" nopass

cp pki/issued/$username.crt /home/$username/
cp pki/private/$username.key /home/$username/

sudo chown -Rv $username: /home/$username

cd /home/$username

sed -i "s/UPDATEME/$username/" /home/$username/costco.ovpn

sudo -u "$username" /usr/local/bin/google-authenticator -f -t -d -r3 -R30 -w2 > google-auth.txt

sudo -u "$username" tar -pczvf $username.tar.gz ca.crt  $username.crt  $username.key  costco.ovpn  ta.key google-auth.txt

mkdir /home/"$username"/.ssh

touch /home/"$username"/.ssh/authorized_keys

chmod 0600 /home/"$username"/.ssh/authorized_keys
chmod 0700 /home/"$username"/.ssh
chown -R ${username}:${username} /home/${username}/.ssh

cp $username.tar.gz /home/choi/




chown choi: /home/choi/$username.tar.gz
