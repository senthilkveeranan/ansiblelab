#!/bin/bash
ansible all -m rpm_key -a 'key=http://content.example.com/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release state=present' -u admin -b
ansible all -m yum_repository -a 'name=appstream baseurl=http://content.example.com/rhel8.0/x86_64/dvd/AppStream/ description="RH294 Description" enabled=true  gpgcheck=true' -u admin -b
ansible all -m yum_repository -a 'name=baseos baseurl=http://content.example.com/rhel8.0/x86_64/dvd/BaseOS/ description="RH294 Description" enabled=true  gpgcheck=true' -u admin -b
