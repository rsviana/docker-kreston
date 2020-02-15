#!/bin/bash
#
# Rodrigo Viana - Krest0n 
# email: eth0.krest0n@gmail.com 
# 10.02.2020
# 

clear
echo -e "\\033[01;05;32m -*- Maquinas Vulneraveis em Docker -*- \033[0m"
echo
echo "Ambientes virtuais para estudo e pratica (PenTest)"
echo "Pratique suas habilidades em ambiente seguro"
echo
echo " --- SEU LABORATÓRIO MONTADO EM SEGUNDOS ---"
echo
echo "Escolha a opção desejada"
echo 
echo -e "\\033[01;31m -| Instaladores |-\033[0m "
echo
echo "+------ Docker and Service -----+"
echo "|     0 - Install Docker        |"	    
echo "|    00 - Start Docker Service  |"
echo "+-------------------------------+"
echo
echo "1 - Install DVWA "
echo "2 - Install Mutilidae (OWASP)"
echo "3 - Install WebGoat (OWASP)"
echo "4 - Install bWAPP"
echo
echo -e "\\033[01;31m -| Ambientes |-\033[0m "
echo
echo "5 - Subir DVWA"
echo "6 - Subir Mutilidae"
echo "7 - Subir WebGoat"
echo "8 - Subir bWAPP"
echo
echo -e "h - Help"
echo -e "\\033[01;31m 9 - Sair\033[0m"
echo "Escolha: "
read op
echo 
case $op in
	"0")
		sudo apt-get update;apt-get upgrade;apt-get install docker.io
		echo
		echo "Docker instalado com sucesso...."
		echo
		service docker start
		echo
		docker --version
		echo Startando serviço Docker, aguarde...
		sleep 5
		sh docker.sh
	;;
	"00")
		clear
		echo "Starting Docker service..."
		service docker start
	        echo "Aguarde..."	
		sleep 3
		echo "Service started..."
		sleep 3
		sh docker.sh
	;;
	"1")
		docker pull vulnerables/web-dvwa;sh docker.sh
	;;	
	"2")
		docker pull szsecurity/mutillidae;sh docker.sh
	;;
	"3")
		docker pull szsecurity/webgoat;sh docker.sh
	;;	

	"4")
		docker pull raesene/bwapp;sh docker.sh
	;;
	"5")
		echo "Port: 80"
		echo "Acess: http://localhost/"
		#echo "O navegador sera aberto automaticamente..."
		echo
		echo
		sleep 2
		docker run -p 80:80 vulnerables/web-dvwa
		#firefox http://localhost
		echo 
	;;
	"6")
		echo "Port: 1080"
		echo "Acess: http://localhost:1080"
		echo
		sleep 2
		echo 
		docker run -p 1080:80 szsecurity/mutillidae
	;;
	"7")
		echo "Port: 1081"
		echo "Acess: http://localhost:1081"
		sleep 2
		echo
		docker run -p 1081:80 szsecurity/webgoat
	;;
	"8")
		echo "Port 1082"
		echo "Acess: http://localhost: 1082"
		sleep 2
		echo
		docker run -p 1082:80 raesene/bwapp
	;;
	
	"h")
		echo "Este é um ambiente para estudo e práticas de ataque web."
		echo "Ambiente homologado em Linux: 4.19.0-6-amd64 Debian 10.3"
		echo "Você tem total autonomia para modificar, repassar e utilizar este software"
		echo "Seja Livre, use LINUX!"
		echo 
		echo; 
	;;

	"9")
		exit 0
	;;
	*)
		echo "Entre com uma opção váilda";sh docker.sh
;;

esac


