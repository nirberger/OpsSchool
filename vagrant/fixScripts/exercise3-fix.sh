#!/bin/bash
#add fix to exercise3 here
## allow connect www from apache 
sudo sed -i 's/deny from all/allow from all/' /etc/apache2/sites-available/default
sudo service apache2 reload
