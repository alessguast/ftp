#!/bin/bash
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turqColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
    case $1 in
    anonrw)
        read -p "Puerto de escucha [->] " port
        echo " 
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=YES
local_enable=NO
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=YES
anon_upload_enable=YES
idle_session_timeout=600
chroot_local_user=NO
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf 
        exit ;;
    localrwE)
           read -p "Puerto de escucha [->] " port
           echo "
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=NO
local_enable=YES
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=NO
anon_upload_enable=NO
idle_session_timeout=600
chroot_local_user=YES
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf 
            exit ;;
     localrw)
     read -p "Puerto de escucha [->] " port
      echo "
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=NO
local_enable=YES
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=NO
anon_upload_enable=NO
idle_session_timeout=600
chroot_local_user=NO
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf
            exit ;;
      anon)
      read -p "Puerto de escucha [->] " port
       echo "
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=YES
local_enable=NO
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=YES
anon_upload_enable=YES
idle_session_timeout=600
chroot_local_user=NO
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf 
            exit ;;
      localanonr)
      read -p "Puerto de escucha [->] " port
       echo "
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=YES
local_enable=YES
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=NO
anon_upload_enable=NO
idle_session_timeout=600
chroot_local_user=NO
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf 
            exit ;;
       localanon)
       read -p "Puerto de escucha [->] " port
        echo "
listen=NO
listen_ipv6=YES
listen_port=$port
anonymous_enable=YES
local_enable=YES
write_enable=YES
xferlog_enable=YES
xferlog_file=/var/log/vsftpd.log
use_localtime=YES
anon_mkdir_write_enable=YES
anon_upload_enable=YES
idle_session_timeout=600
chroot_local_user=NO
chroot_list_enable=NO
chroot_list_file=/etc/vsftpd.chroot_list" > vsftpd.conf
            exit ;;
            
       info)
       	echo -e "$yellowColour Menu De ayuda FtpLinux! $endColour"
       		echo -e "$greenColour Add:$endColour Añadir un usuario a la chroot_list"

       case $2 in
       localA)
       	echo -e "$yellowColour Menu De ayuda Anonimos $endColour"
       			echo -e "	$greenColour localanon:$endColour Usuarios locales Encapsulados y anonimos. $turqColour permisos:$endColour Lectura, Escritura "
       			
      		echo -e "	$greenColour localanonr:$endColour Usuarios locales y anonimos. $turqColour permisos:$endColour Usuarios: Lectura, Escritura, anonimos: Lectura "
      		
      		exit
      		;;
      		
      	locals)
      				echo -e "	$greenColour localrw:$endColour Usuarios locales encapsulados $turqColour permisos:$endColour Lectura, Escritura "
      		exit
      		;;
       	Anon)	
      	echo -e "$yellowColour Menu De ayuda Anonimos $endColour"
      	echo -e "	$greenColour Anon:$endColour Usuarios Anonimos. $turqColour permisos:$endColour Lectura, Escritura "
      	exit
      	;;
      	
      	esac
      	
            exit ;;
            
        add)
           echo "$2" >> vsftpd.chroot_list
           exit ;;
      esac    
    figlet Ftp linux | lolcat
    echo -e "$turqColour REZA TODO LO QUE PUEDAS... $endColour" 

    echo "listen=NO" > vsftpd.conf
    read -p "Puerto de escucha [->] " port 
    echo "listen_ipv6=YES" >> vsftpd.conf
    echo "listen_port=$port" >> vsftpd.conf
    
    read -p "Activación usuario anónimo yes/no? [->] " anon 
    case $anon in
        yes)
             echo "anonymous_enable=YES" >> vsftpd.conf ;;
        no)
             echo "anonymous_enable=NO" >> vsftpd.conf ;;
        *)
            echo -e "$redColour ¿Eres tonto o que? $endColour" ;;
        esac
    
        read -p "Permitir el acceso a usuarios locales yes/no? [->] " user
            case $user in
                yes)
                    echo "local_enable=YES" >> vsftpd.conf ;;
                no)
                    echo "local_enable=NO" >> vsftpd.conf ;;
                *)
                    echo -e "$redColour ¿Eres tonto o que? $endColour" ;;
            esac
          
    
            read -p "¿Habilitar permisos de Escritura yes/no? [->] " writepes
                    case $writepes in
                    yes)
                        echo "write_enable=YES" >> vsftpd.conf ;;
                    no)
                        echo "write_enable=NO" >> vsftpd.conf ;;
                    *)
                        echo -e "$redColour ¿Eres tonto o que? $endColour" ;;
            esac
                
                echo "xferlog_enable=YES" >> vsftpd.conf 
                echo "xferlog_file=/var/log/vsftpd.log" >> vsftpd.conf
                echo "use_localtime=YES" >> vsftpd.conf

        read -p "Permitir escritura a usuarios anonimos yes/no? [->] " anonwri
            case $anonwri in
                yes)
                    echo "anon_mkdir_write_enable=YES" >> vsftpd.conf ;;
                no)
                    echo "anon_mkdir_write_enable=NO" >> vsftpd.conf ;;
                *)
                    echo -e "$redColour ¿Eres tonto o que? $endColour" 
            esac
       

       
            read -p "Permitir la subida de archivos a anónimos yes/no? [->] " upload_anon 
                case $upload_anon in
                    yes)
                        echo "anon_upload_enable=YES" >> vsftpd.conf ;;
                    no)
                        echo "anon_upload_enable=NO" >> vsftpd.conf ;;
                    *)
                        echo -e "$redColour ¿Eres tonto o que? $endColour" 
                esac
                    
                    echo "idle_session_timeout=600" >> vsftpd.conf
         

                read -p "Mensaje de saludo del servicor [->] " msg 
                    echo "ftpd_banner=$msg" >> vsftpd.conf

                
                read -p "Activar chroot list yes/no [->] " chrootlist
                        case $chrootlist in
                        yes)
                            echo "chroot_list_enable=YES" >> vsftpd.conf
                            read -p "Chroot list almacenara los usuarios encapsulados o no encapulados? yes/no [->] " optionchr
                                case $optionchr in
                                yes)
                                    echo "chroot_local_enable=NO" >> vsftpd.conf
                                    echo "chroot_list_enable=YES" >> vsftpd.conf
                                    echo "chroot_list_file=/etc/vsftpd.chroot_list" >> vsftpd.conf ;;
                                no)
                                    echo "chroot_local_enable=YES" >> vsftpd.conf
                                    echo "chroot_list_enable=YES" >> vsftpd.conf
                                    echo "chroot_list_file=/etc/vsftpd.chroot_list" >> vsftpd.conf ;;
                                    esac
    
                             ;; 
                        no)
                            echo "chroot_list_enable=NO" >> vsftpd.conf
                                read -p "¿Desea entonces activar la encapsulación de usuarios locales? yes/no [->] " localusers
                                    case $localusers in
                                    yes)
                                        echo "chroot_local_user=YES" >> vsftpd.conf ;;
                                    no)
                                        echo "chroot_local_user=NO" >> vsftpd.conf ;;
                                    esac
                             ;;
                        *) 
                           echo -e "$redColour ¿Eres tonto o que? $endColour" ;;
                        	
      
                        		 
                        
                         esac 
    

             

