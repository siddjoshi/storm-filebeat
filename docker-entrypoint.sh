#!/bin/bash
set -e

elastic=$ELASTICSERVERS
usern=$USERNAME
passwd=$PASSWORD
setup=$DEPLOYMENT


## Change Elastic servers
sed -i 's/change_elastic/'$elastic'/g' /etc/filebeat/filebeat.yaml

## Change Username
sed -i 's/change_username/'$usern'/g' /etc/filebeat/filebeat.yaml

## Change Password
sed -i 's/change_password/'$passwd'/g' /etc/filebeat/filebeat.yaml

##change Environemnt
sed -i 's/change_environment/'$setup'/g' /etc/filebeat/filebeat.yaml