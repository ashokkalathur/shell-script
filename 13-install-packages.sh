#!/bin/bash
ID=$(id -u)

TIMESTAMP=$(date +%F-%T)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failed $N"
    else
        echo -e "$2...$R success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root access $N"
    exit 1
else
    echo "you are root user"
fi

#echo "All arguments passed: $@"
#git mysql postfix net-tools

for package in $@
do
    yum list insytalled $package #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y  #install the package
        VALIDATE $? "installation of $package"  #validate
    else
        echo -e "$package is already installed.. $Y SKIPPING $N"
    fi
done