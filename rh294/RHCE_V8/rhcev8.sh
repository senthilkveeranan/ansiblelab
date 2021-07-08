#!/bin/bash
echo "#######starting exam script###########################"
echo "server[a:d]" >> /etc/ansible/hosts
ansible all,localhost -m user -a 'name=admin state=present' >> /dev/null
ansible all,localhost -m shell -a 'echo "redhat" | passwd --stdin admin' > /dev/null
ansible all,localhost -m copy -a 'content="admin ALL=(ALL) NOPASSWD:ALL" dest=/etc/sudoers.d/admin' >> /dev/null
ansible servera,serverb,serverc -m parted -a 'device=/dev/vdb number="1" state=present part_end=2GiB' 
ansible serverd -m parted -a 'device=/dev/vdb number="1" state=present part_end=1GiB'
ansible servera,serverb,serverd -m lvg -a 'vg=research pvs=/dev/vdb1' 
mkdir -p /home/admin/ansible/roles
chown admin:admin /home/admin/ansible/
chown admin:admin /home/admin/ansible/roles
rm -rf /etc/ansible/hosts
yum remove ansible -y >> /dev/null
echo "#############prepation is done############"
echo "do password less auth for admin user to all nodes with password \"redhat\" "

