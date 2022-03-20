#!/bin/bash

echo "Sonax Kali Setup"

## МЕНЯЕМ ЗДЕСЬ НА НУЖНЫЕ ДАННЫЕ!

port_xrdp=8080 #порт подключения по RDP

username="alex" #логин. Если хотите каждый раз вводить напишите "ask"

password="alex"  #пароль Если хотите каждый раз вводить напишите "ask"

## Закончили менять. Дальше ничего не трогаем

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y kali-desktop-xfce xrdp # для Ubuntu замените kali-desktop-xfce на xubuntu-desktop

#XRDP

sudo cp -n /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak #(бэкапим оригинал)

sudo sed -i 's/3389/'$port_xrdp'/g' /etc/xrdp/xrdp.ini #(Смена порта со стандартного 3389 на указанный в переменной выше)

sudo sed -i '186s/username=ask/username='$username'/g' /etc/xrdp/xrdp.ini #(логин, чтобы не вводить)

sudo sed -i '187s/password=ask/password='$password'/g' /etc/xrdp/xrdp.ini #(пароль, чтобы не вводить)

#sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini #(Цветопередача не 32, а 128 бит на пиксель) UPD: нет необходимости, но можете раскомментировать эту и следующие строчки.

#sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini

sudo /etc/init.d/xrdp start

#END XRDP
