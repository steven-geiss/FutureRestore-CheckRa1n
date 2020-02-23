##!/bin/bash
clear
echo "Welcome to the All-in-One FutureRestore script for all devices (CheckRa1n)"
echo "Are you jailbroken with CheckRa1n? (y,n)"

read input

if [ $input = y ];
then
    echo "Is your device in the same Wi-FI Network? (y,n)"
    
    read network
    
    if [ $network = y ];
    then 
        echo "Put in your devices IP-Adresse."
       
        read ip

        
    elif [ $network = n ];
    then
        echo "Enter the same Wi-Fi Network"
        exit
    fi
elif [ $input = n ];
then
    
    echo "Please jailbreak your device with CheckRa1n"
    
    exit
fi

echo "Please enter your nonce"

read generator

echo "$generator is your nonce"
echo "What is your root password? (alpine is the standard pw)"
read pw
echo "Your password is $pw"
./passh -p $pw ssh root@$ip wget https://github.com/Halo-Michael/GeneratorAutoSetter/releases/download/0.1.1/com.michael.generatorautosetter-0.1.1_iphoneos-arm.deb
./passh -p $pw ssh root@$ip dpkg -i com.michael.generatorautosetter-0.1.1_iphoneos-arm.deb
./passh -p $pw ssh root@$ip setgenerator $generator
chmod +x futurerestore

echo "Your nonce is now set"
echo "Do you have a iPhone/iPad Cellular or iPad/iPod? (1,2)"
read device

if [ $device = 1 ];
    then 
        echo "Put in your blobs."
       
        read blob1

        echo "Put in your IPSW."

        read ipsw1
        
        ./futurerestore -t $blob1 --latest-sep --latest-baseband $ipsw1    
    elif [ $device = 2 ];
    then
        echo "Put in your blobs."

        read blob2
        echo "Put in your IPSW."
        read ipsw2

        ./futurerestore -t $blob2 --latest-sep --no-baseband $ipsw2
fi
