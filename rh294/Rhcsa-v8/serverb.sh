echo "..........Wellcome To Exam Script.........."
echo "......Make Sure This Script Is Running In Serverb ......."
echo "redhat123" | passwd --stdin root #passwdord Change For Root User..
echo -e "n\np\n\n\n+500M\nt\n1\n8e\nw" | fdisk /dev/vdb  
if [ $? -eq 0 ]
        then
             echo "pass"
fi
partprobe /dev/vdb
pvcreate /dev/vdb1
vgcreate myvg /dev/vdb1 
lvcreate -n mylv -L 160M myvg 
mkdir /mnt/mylv
mkfs -t ext4 /dev/myvg/mylv 
echo  "/dev/myvg/mylv  /mnt/mylv ext4 defaults 0  0 " >> /etc/fstab 
mount -a
echo -e "n\np\n\n\n+1G\nt\n2\n82\nw" | fdisk /dev/vdb
partprobe /dev/vdb
mkswap /dev/vdb2
echo "/dev/vdb2  swap swap defaults 0 0 " >> /etc/fstab
swapon -a
tuned-adm profile balanced
rm -rf /etc/yum.repos.d/*
rm -f /root/serverb.sh
rm -f /root/Desktop/*
systemctl reboot




