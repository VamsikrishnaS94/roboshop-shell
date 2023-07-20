echo -e "\e[33m Disable Mysql Default Version\e[0m"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[33m install mysql community server \e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[33m start mysql service \e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[33m setup mysql password \e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log


