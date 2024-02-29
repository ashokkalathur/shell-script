#!/bin/bash

ID=$(id -u)
TIMESTAMP= $(date)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "script name: $0"

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

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"
