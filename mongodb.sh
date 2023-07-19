echo -e "\e[33m Copy mongodb repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[33m installing mongodb\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[33m update mongodb listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[33m start mongodb service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log