echo -e "\e[33minstalling nginx server\e[0m"
yum install nginx -y

echo -e "\e[33mremoving default content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33mDownloading frontend content\[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[33mextracting frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#here we need to copy conig file

echo -e "\e[33mrestarting nginx\e[0m"
systemctl enable nginx
systemctl restart nginx