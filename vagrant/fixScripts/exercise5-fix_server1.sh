#!/bin/bash
#add fix to exercise5-server1 here
#ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
#ssh-copy-id -i ~/.ssh/id_dsa.pub vagrant@server2
#cat  .ssh/id_rsa.pub | ssh  vagrant@server2 "cat > ~/.ssh/authorized_keys"


sudo sed -i '$ a 192.168.100.11 server2 server2' /etc/hosts
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chown -R vagrant:vagrant /home/vagrant/.ssh
su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"
#ssh-copy-id -i ~/.ssh/id_dsa.pub vagrant@server1
mkdir -p /vagrant/files/ssh
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/files/ssh/`hostname`.pub
ssh-keyscan -t rsa server2  > /etc/ssh/ssh_known_hosts
ssh-keyscan -t rsa server1 >> /etc/ssh/ssh_known_hosts
ssh-keyscan -t dsa server2  >> /etc/ssh/ssh_known_hosts
ssh-keyscan -t dsa  server1  >> /etc/ssh/ssh_known_hosts
cat /vagrant/files/ssh/server2.pub >> /home/vagrant/.ssh/authorized_keys
cat /vagrant/files/ssh/server1.pub >> /home/vagrant/.ssh/authorized_keys
