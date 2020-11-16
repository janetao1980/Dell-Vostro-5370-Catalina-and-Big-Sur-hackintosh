#!/bin/sh

FILE_PATH=$1
OS_VERSION=$2

echo "FILE_PATH \"$FILE_PATH\"" >> ~/Library/Logs/Boom3D.log

sudo mkdir -p /Library/Audio/Plug-Ins/HAL/

if sudo chmod -R 777 /Library/Audio/Plug-Ins/HAL/
then
echo "chmod BoomAudio.driver parent succeeded" >> ~/Library/Logs/Boom3D.log
else
echo "chmod BoomAudio.driver parent failed" >> ~/Library/Logs/Boom3D.log
fi

if sudo rm -rv /Library/Audio/Plug-Ins/HAL/BoomAudio.driver
	then
	echo "Remove BoomAudio.driver  succeeded" >> ~/Library/Logs/Boom3D.log
else
	echo "Remove BoomAudio.driver  failed" >> ~/Library/Logs/Boom3D.log
fi

if sudo cp -rv "$FILE_PATH" /Library/Audio/Plug-Ins/HAL/
	then
	echo "Copy BoomAudio.driver  succeeded" >> ~/Library/Logs/Boom3D.log
else
	echo "Copy BoomAudio.driver  failed" >> ~/Library/Logs/Boom3D.log
fi
#sudo shutdown -r now

MOJAVE=1014
if [ $OS_VERSION -gt $MOJAVE ]
then
echo "Catalina OS detected" >> ~/Library/Logs/Boom3D.log
if sudo chmod -R 777 /Library/Audio/Plug-Ins/HAL/BoomAudio.driver
then
echo "chmod BoomAudio.driver  succeeded" >> ~/Library/Logs/Boom3D.log
else
echo "chmod BoomAudio.driver  failed" >> ~/Library/Logs/Boom3D.log
fi
else
echo "OS detected is prior to Catalina" >> ~/Library/Logs/Boom3D.log
fi


sudo launchctl stop com.apple.audio.coreaudiod
