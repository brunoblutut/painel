#!/bin/bash
ip=$(wget -qO- ipv4.icanhazip.com)
wget -qO- ipv4.icanhazip.com > /tmp/1.db
val=$(grep $ip /tmp/1.db)

if [ "$ip" = "$val" ]; then
	echo -e "\033[1;42mIp Registrado no sistema\033[0m"
	sleep 2
	echo "Continuando a instalacao......"
	sleep 2
	apt-get install figlet 1> /dev/null 2>/dev/null 
	echo -e "\033[0;32m####################################################################\033[0m"
	figlet DRAKOWISKY
	echo -e "\033[0;32m####################################################################\033[0m"
	sleep 4
  echo -n "Digite uma senha para ROOT: "; read sn
	echo "Sempre que solicitado uma senha use a mesma do ROOT"
	echo "Sempre que solicitado Y ou N escolha Y, apenas em Disallow root login remotely selecione N"	
	sleep 8
	apt-get update && apt-get upgrade -y
apt-get install curl -y
apt-get install apache2 -y
apt-get install php5 libapache2-mod-php5 php5-mcrypt -y
service apache2 restart 
apt-get install mysql-server
mysql_install_db
mysql_secure_installation 
apt-get install phpmyadmin -y
php5enmod mcrypt
service apache2 restart
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
apt-get install libssh2-1-dev libssh2-php 
php -m |grep ssh2
apt-get install php5-curl
service apache2 restart
cd /var/www/html
apt-get install unzip -y
	wget https://www.dropbox.com/s/0hlccsz59fedbem/painel7.5.zip
	unzip painel7.5.zip
	rm painel7.5.zip
	rm index.html
	cd
	echo -e "\033[1;32mPainel importado com sucesso!!!\033[0m"
	sleep 5
	clear
apt-get install mariadb-server -y
	apt-get install cron -y
	apt-get install git -y
	service apache2 restart
	mysql -h localhost -u root -p$sn -e "grant all privileges on *.* to root@'localhost' identified by 'root'; commit;flush privileges;"
	mysql -h localhost -u root -p$dn -e "CREATE DATABASE plus"
	cd /var/www/html
	mysql -p -u root -p$sn plus < plus.sql
	cd /root
	clear
	echo -e "\033[1;32mBanco de dados importado com sucesso!!!\033[0m"
	sleep 5
	echo "* * * * * /usr/bin/php5 /var/www/html/pages/system/cron.php" >> /var/spool/cron/crontabs/root
	echo "* * * * * /usr/bin/php5 /var/www/html/pages/system/cron.ssh.php" >> /var/spool/cron/crontabs/root
	echo "* * * * * /usr/bin/php5 /var/www/html/pages/system/cron.sms.php" >> /var/spool/cron/crontabs/root
	echo "* * * * * /usr/bin/php5 /var/www/html/pages/system/cron.online.ssh.php" >> /var/spool/cron/crontabs/root
	echo "10 * * * * /usr/bin/php5 /var/www/html/pages/system/cron.servidor.php" >> /var/spool/cron/crontabs/root
	cd /var/www/html/pages/system/
	/etc/init.d/cron reload > /dev/null 2>&1
	/etc/init.d/cron restart > /dev/null 2>&1
	chmod 7777 cron.php 
	chmod 7777 cron.ssh.php 
	chmod 7777 cron.sms.php 
	chmod 7777 cron.online.ssh.php 
	chmod 7777 cron.ssh.free.php 
	chmod 7777 cron.online.free.ssh.php
	chmod 7777 cron.servidor.php 
	cd /root
	rm painel
	cd /var/www/html/files/
	chmod 7777 pdf
	chmod 7777 ovpn
	chmod 7777 ktc
	chmod 7777 kpn
	chmod 7777 epro
	chmod 7777 ehi
	chmod 7777 acm
	cd /root
	cd /var/www/html/admin/pages/download
	chmod 7777 downloads.php
	chmod 7777 enviandoarquivo.php
	chmod 7777 excluir.php
	chmod 7777 excluir_todos.php
	cd /root
	cd /var/www/html/admin/pages/servidor
	chmod 7777 ovpn
	chmod 7777 upload
	chmod 7777 adicionar.php
	chmod 7777 adicionar_exe.php
	chmod 7777 alocados.php
	chmod 7777 baixar_ovpn.php
	chmod 7777 deletar_ovpn.php
	chmod 7777 editar_exe.php
	chmod 7777 enviar_ovpn.php
	chmod 7777 listar.php
	chmod 7777 recebe_ehi.php
	chmod 7777 servidor.php
	chmod 7777 servidor_exe.php
	chmod 7777 index.html
	cd /root
	cd /var/www/html/script
	chmod 7777 online.php
	cd /root
	cd /var/www/html/pages/contas
	chmod 7777 online.php
	cd /root
	cd /var/www/html/admin/pages/contas
	chmod 7777 online.php
	clear
	echo "America/Mexico_City" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime > /dev/null 2>&1
	dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
	cat /dev/null > ~/.bash_history && history -c && clear
	clear

	echo -e "\033[0;35m//////////////////////////////////////////////////////////\033[0m"
	figlet DRAKOWISKY
	echo -e "\033[0;35m//////////////////////////////////////////////////////////\033[0m"
	echo -e "\033[01;37mPAINEL CONFIGURADO\033[0m"
	echo -e "\033[1;31mPara acessa-lo digite no navegador:\033[0m"
	echo -e "\033[1;31mhttp://$ip\033[01;37m/admin\033[0m"
	echo -e "\033[1;31mUsuario: \033[01;37madmin\033[0m"
	echo -e "\033[1;31mSenha: \033[01;37madmin\033[0m"
	echo -e "\033[1;31mDuvidas: \033[01;37m@drakowisky\033[0m"
	echo -e "\033[1;31mBom uso!\033[0m"
	cd /root
	rm paine* > /dev/null
	cd /tmp
	rm 1.db > /dev/null
cd /root
	
else
	apt-get install figlet 1>/dev/null 2>/dev/null
	echo -e "\033[1;41mIp nao registrado no sistema\033[0m"
	sleep 3
	echo "contato para suporte ou revenda @drakowisky"
	echo -e "\033[1;41m/////////////////////////////////////////////////////////////////////\033[0m"
	figlet DRAKOWISKY
	echo -e "\033[1;41m/////////////////////////////////////////////////////////////////////\033[0m"
	rm /tmp/1.db
  rm painel*
	sleep 4
fi
