echo -e "\e[31minstalling nginx server\e[0m"
yum install nginx -y

echo -e "\e[31mremoving default content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[31mDownloading frontend content\[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[31mextracting frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#here we need to copy conig file

echo -e "\e[31mrestarting nginx\e[0m"
systemctl enable nginx
systemctl restart nginx