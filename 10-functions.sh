#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
  echo "ERROR:: $2 ... Failed"
  exit 1
else
  echo "$2 is success"
fi
}

if [ $ID -ne 0 ]
then 
  echo "ERROR:: please run this script with root access"
  exit 1 #you can give other than 0
else
  echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "installing git"
