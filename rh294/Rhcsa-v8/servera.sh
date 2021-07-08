echo "..........Wellcome To Exam Script.........."
echo ".......Make Sure This Is Running Servera ........"
yum install httpd-2.4.37-10.module+el8+2764+7127e69e.x86_64 -y
systemctl start httpd
systemctl enable httpd
wget http://classroom.example.com/content/httpd.conf /root/
cp -rvpf /root/httpd.conf /etc/httpd/conf/httpd.conf
rm -rf /root/httpd.conf
echo " This is my web server " >> /var/www/html/index.html
firewall-cmd --permanent --add-port=82/tcp
firewall-cmd --reload
rm -rf /etc/yum.repos.d/*
rm -f /root/servera.sh
rm -f /root/Desktop/*
systemctl reboot




