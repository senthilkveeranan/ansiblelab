vi file.sh

ansible prod -m file -a "path=/root/redhat/ex294 state=directory" --become 
ansible prod -m file -a "path=/root/redhat/ex294/results mode=766 owner=ansadmin group=ansadmin state=touch" --become
ansible prod -m file -a "src=/root/redhat/ex294/results dest=/root/results state=link" --become


ansible prod -m file -a "path=/root/redhat/ex294/results mode=766group+rwx,o+rw owner=ansadmin group=ansadmin state=touch" --become

chmod +x file.sh 
./file.sh 