#!/bin/sh

####################################################
##############  ZendServer Functions  ##############
####################################################

if [[ $CDPATH != */usr/local/zend/apache2/htdocs* ]]
then
    export CDPATH=/usr/local/zend/apache2/htdocs:$CDPATH
fi

if [[ $PATH != */usr/local/zend* ]]
then
    export PATH=/usr/local/zend/bin:/usr/local/zend/mysql/bin:$PATH
fi

if [[ $CDPATH != */usr/local/zend* ]]
then
    export CDPATH=/usr/local/zend/bin:/usr/local/zend/mysql/bin:$CDPATH
fi

alias zend="sudo zendctl.sh"

export APACHE_LOG_DIR=/usr/local/zend/apache2/logs

zend_restart_all(){
  sudo zendctl.sh restart
}

zend_restart_apache(){
  sudo zendctl.sh restart-apache
}

zend_restart_mysql(){
  sudo zendctl.sh restart-mysql
}

zend_vhosts_dir(){
  echo "/usr/local/zend/etc/sites.d"
}

zend_sites_dir(){
  echo "/usr/local/zend/apache2/htdocs"
}

llzv() { echo $(builtin cd /usr/local/zend/etc/sites.d/ && pwd); ll /usr/local/zend/etc/sites.d/; }
llzs() { echo $(builtin cd /usr/local/zend/apache2/htdocs/ && pwd); ll /usr/local/zend/apache2/htdocs/; }

cdzv() { cd /usr/local/zend/etc/sites.d; }  ## cd to Zend Server virtual hosts directory
cdzs() { cd /usr/local/zend/apache2/htdocs; } ## cd to Zend Server sites directory

vimzv() {
  sudo vim /usr/local/zend/etc/sites.d/vhost_${1}.conf
}

vimhttpd() {
  sudo vim /usr/local/zend/apache2/conf/httpd.conf
}

vimphpini() {
  sudo vim /usr/local/zend/etc/php.ini
}