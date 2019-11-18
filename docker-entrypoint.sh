#!/bin/bash
set -e

elastic=$ELASTICSERVERS
usern=$USERNAME
passwd=$PASSWORD
setup=$DEPLOYMENT


## Change Elastic servers
sed -i 's/change_elastic/'$elastic'/g' /usr/share/filebeat/filebeat.yml

## Change Username
sed -i 's/change_username/'$usern'/g' /usr/share/filebeat/filebeat.yml
## Change Password
sed -i 's/change_password/'$passwd'/g' /usr/share/filebeat/filebeat.yml

##change Environemnt
sed -i 's/change_environment/'$setup'/g' /usr/share/filebeat/filebeat.yml

## Run Filebeat
filebeat -c /usr/share/filebeat/filebeat.yml