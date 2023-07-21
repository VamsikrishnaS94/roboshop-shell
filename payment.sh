echo -e"\e[33m installing python\e[0m"
yum install python36 gcc python3-devel -y &>>/tmp/roboshop.log

echo -e "\e[33m adding application user roboshop\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e"\e[33m create application directory \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e"\e[33m download application content  \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip &>>/tmp/roboshop.log
cd /app

echo -e"\e[33m extract application content  \e[0m"
unzip /tmp/payment.zip &>>/tmp/roboshop.log

echo -e"\e[33m install application dependencies \e[0m"
cd /app
pip3.6 install -r requirements.txt &>>/tmp/roboshop.log

echo -e "\e[33m setup systemD file \e[0m"
cp /home/centos/roboshop-shell/payment.service /etc/systemd/system/payment.service &>>/tmp/roboshop.log

echo -e"\e[33m start payment service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable payment &>>/tmp/roboshop.log
systemctl restart payment &>>/tmp/roboshop.log