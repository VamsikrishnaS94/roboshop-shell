echo -e "\e[33m install maven \e[0m"
yum install maven -y &>>/tmp/roboshop.log

echo -e "\e[33m add user roboshop \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m make app directory  \e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33m download application content  \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log


echo -e "\e[33m extract application content \e[0m"
cd /app
unzip /tmp/shipping.zip &>>/tmp/roboshop.log


echo -e "\e[33m download maven dependencies  \e[0m"
mvn clean package &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[33m install mysql client  \e[0m"
yum install mysql -y &>>/tmp/roboshop.log

echo -e "\e[33m load schema \e[0m"
mysql -h mysql-dev.vamsidevops.cloud -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[33m setup systemD file \e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "\e[33m start shipping service  \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl restart shipping &>>/tmp/roboshop.log
