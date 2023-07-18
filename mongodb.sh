echo -e "\e[33mCopy mongodb repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[33minstalling mongodb\e[0m"
yum install mongodb-org -y  &>>/tmp/roboshop.log

echo -e "\e[33mupdate mongodb listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[33mstart mongodb service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log