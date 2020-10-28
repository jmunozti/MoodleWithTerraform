#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install httpd -y
sudo sed -i 's/^/#&/g' /etc/httpd/conf.d/welcome.conf
sudo sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/httpd/conf/httpd.conf
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
sudo yum install mod_php71w php71w-common php71w-mbstring php71w-xmlrpc php71w-soap php71w-gd php71w-xml php71w-intl php71w-mysqlnd php71w-cli php71w-mcrypt php71w-ldap -y
wget https://download.moodle.org/download.php/direct/stable32/moodle-3.2.1.tgz
sudo tar -zxvf moodle-3.2.1.tgz -C /var/www/html
sudo chown -R root:root /var/www/html/moodle
sudo mkdir /var/www/moodledata
sudo chown -R apache:apache /var/www/moodledata
sudo chmod -R 755 /var/www/moodledata

cat << 'EOF' > /home/ec2-user/config.php
<?php

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'mysql.moodlewithterraform.ml';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'foo';
$CFG->dbpass    = 'f00barbaz1';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
);

$CFG->sslproxy=true;
$CFG->wwwroot   = 'https://elb.moodlewithterraform.ml/moodle';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');
EOF

sudo mv /home/ec2-user/config.php /var/www/html/moodle/
sudo chmod o+r /var/www/html/moodle/config.php
( echo "* * * * *    /usr/bin/php /var/www/html/moodle/admin/cli/cron.php >/dev/null") | sudo crontab -u apache -e
sudo systemctl restart httpd.service
sudo yum install -y awslogs
sudo systemctl start awslogsd
sudo systemctl enable awslogsd.service
logger $(uname -a)
