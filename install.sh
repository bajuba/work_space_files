#!/bin/bash

# NodeJS
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum install -y nodejs

# Google Chrome
#cat /etc/yum.repos.d/google-chrome.repo
#[google-chrome]
#name=google-chrome
#baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
#enabled=1
#gpgcheck=1
#gpgkey=https://dl.google.com/linux/linux_signing_key.pub
#yum install -y google-chrome-stable
URL=https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install -y ${URL}

# Brackets
#yum install -y yum-plugin-copr
#yum copr enable jgillich/brackets
#yum install -y brackets

# Microsoft Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
yum install -y code

# Microsoft .NET SDK
rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum install -y dotnet-sdk-2.1

# MonoDevelop
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sh -c 'curl https://download.mono-project.com/repo/centos7-vs.repo | tee /etc/yum.repos.d/mono-centos7-vs.repo'
yum install -y monodevelop

# Anaconda Python
# Go to home directory
#cd ~

# You can change what anaconda version you want at 
# https://repo.continuum.io/archive/
#wget -c https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh
#bash Anaconda3-5.2.0-Linux-x86_64.sh -b -p ~/anaconda
#rm Anaconda3-5.2.0-Linux-x86_64.sh
#echo 'export PATH="/root/anaconda/bin:$PATH"' >> /root/.bashrc 

# Refresh basically
#source .bashrc

#conda update conda

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html
# LAMP for Amazon Linux 2
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server

# Set startup for Apache HTTP Server
systemctl start httpd
systemctl enable httpd
systemctl is-enabled httpd
