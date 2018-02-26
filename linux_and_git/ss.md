
cat /etc/ssh/sshd_config | grep authorized_keys


###Debian / Ubuntu:
```
apt-get install python-pip
pip install shadowsocks
```
###CentOS:
```
yum install python-setuptools && easy_install pip
pip install shadowsocks
```

###如果要后台运行：
```
sudo ssserver -p 443 -k password -m rc4-md5 --user nobody -d start
```
###如果要停止：
```
sudo ssserver -d stop
```
###如果要检查日志：
```
sudo less /var/log/shadowsocks.log
```
