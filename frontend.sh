echo -e "\e[33m installing nginx server\e[0m"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[33m removing default content\e[0m"
rm -rf /usr/share/nginx/html/*  &>>/tmp/roboshop.log

echo -e "\e[33m Downloading frontend content\[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m extracting frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33m update frontend configuration\e[0m"
cp roboshop.confg /etc/nginx/default.d/roboshop.conf

echo -e "\e[33m restarting nginx\e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log