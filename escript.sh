#!/bin/bash

clear
echo "Abrindo o /tmp:"
cd /tmp
read 
clear

echo "Mostrando que está no /tmp:"
pwd
read
clear

echo "Criando a pasta aula04 e entrando e mostrando que está nela:"
mkdir aula04
cd aula04
pwd
read
clear

echo "Procurando o arquivo e copiando pra pasta aula04:"
resp=$(sudo find /var -name auth.log | tail -20)  
cp $resp  /tmp/aula04/auth.log.bkp
read
clear

echo "Mostrando o conteudo de auth.log.bpk:"
cat /tmp/aula04/auth.log.bkp | less
clear

echo "Salvando e listando todos os usuários:"
cat /etc/passwd | cut -d ":" -f 1 | tr "\n" ";" > usuarios.lst
cat usuarios.lst
read
clear

echo "Salvando e listando todos os grupos:"
cat /etc/group | cut  -d ":" -f 1 | tr "\n" ";" > grupos.lst
cat grupos.lst
read
clear

echo "Criando a pasta arquivos e backup:"
mkdir /tmp/aula04/arquivos
mkdir /tmp/aula04/backup
read
clear

echo "Copiando as listas de usuário e grupos para arquivos:"
mv *.lst /tmp/aula04/arquivos/
read
clear

echo "Copiando as pastas/arquivos do /var/log para a pasta de backup:"
sudo cp -R /var/log/* /tmp/aula04/backup/
read
clear

echo "Pegando as informações de inode e salvando no inodes.info:"
df -i > /tmp/aula04/arquivos/inodes.info
read 
clear

echo "Criando o arquivo.tar:"
tar -cf /tmp/aula04/arquivos.tar /tmp/aula04/arquivos/ 
read
clear

echo "Listando o conteúdo de /tmp/aula04:"
ls /tmp/aula04
read
clear

echo "Movendo o arquivos.tar para backup"
mv /tmp/aula04/arquivos.tar /tmp/aula04/backup/
read
clear


echo "Listando o conteúdo de backup:"
ls /tmp/aula04/backup/
read
clear

echo "Indo para o /home do usuário:"
cd /home/$(echo $USER)
read 
clear

echo "Criando o arquivo gustavo.txt:"
touch gustavo.txt
read
clear

echo "Copiando o arquivo para backup:"
sudo cp -p /home/$(echo $USER)/gustavo.txt /tmp/aula04/backup/
read
clear


echo "Mostrando o arquivo:"
sudo ls -lh /tmp/aula04/backup/ 
read
clear

echo "Criando o bash.lst:"
history > /tmp/aula04/backup/bash.lst
read
clear

echo "Empacotar o aula04:"
sudo tar -cf /tmp/aula04.tar /tmp/aula04 
read
clear

echo "Indo e Copiando para o root:"
sudo cp /tmp/aula04.tar /root/
read
clear

echo "Extraindo o aula04.tar:"
sudo tar -xf /root/aula04.tar -C /root/ 
read
clear

echo "Listar o conteúdo da pasta aula04:"
sudo ls /root/tmp/aula04/
read
clear
