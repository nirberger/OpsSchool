#!/bin/bash
#add fix to exercise5-server2 here
#su vagrant -c "ssh-keygen -t rsa -P "" -f /home/vagrant/.ssh/id_rsa"
#ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@server2
#cat  /home/vagrant/.ssh/id_rsa.pub | ssh  vagrant@192.168.100.10 "cat >> ~/.ssh/authorized_keys"
sudo sed -i '$ a 192.168.100.10 server1 server1' /etc/hosts
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
