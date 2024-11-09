#!/bin/bash
#
### Install LAMP and Wordpress automation Ubuntu Servers ###

### Make sure you are running as root or sudo ###
if [ $(id -u) -ne 0 ]
then
	echo 'please run as root or sudo.'
	exit 1
fi

## Install Apache ##
apt install apache2

## Install MySQL server ##
apt install mysql-server


## Install PHP ##
apt install php libapache2-mod-php php-mysql php-cli php-curl php-gd php-mbstring php-xml php-xmlrpc

## Create Database for wordpress site ##
echo "Enter name of database"
read -r name

mysqladmin create ${name}

## Create user for database ##
echo "add a user name"
read -r user
echo "create user password"
read -r pass

## create user ##
mysql -e "GRANT ALL on ${name}.* to ${user}@localhost identified by '${pass}';"
mysql -e "FLUSH PRIVILEGES;"

## Secure MySQL ##
mysql_secure_installation


## Install Wordpress ##
# Download and extract WordPress
TMP_DIR=$(mktemp -d)
cd $TMP_DIR
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo mv wordpress/* /var/www/html/

# Clean up
cd /
rm -rf $TMP_DIR

exit 1
