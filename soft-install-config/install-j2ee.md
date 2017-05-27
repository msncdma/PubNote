
#####NGINX
brew install nginx
sudo nginx


dyld: Library not loaded: /usr/local/lib/libpcre.1.dylib
brew unlink pcre && brew link --overwrite pcre

/usr/local/etc/nginx/nginx.conf
sudo nginx -s stop

#####Eclipse Installer

####eclipse的优化
```
--launcher.XXMaxPermSize
2048m
...
-vmargs
...
-Xms512m
-Xmx850m
-XX:PermSize=512m
-XX:MaxPermSize=1024m
```


####安装ant, maven, tomcat, jetty
```
brew install ant maven tomcat jetty
```
####is damaged and can’t be opened. You should move it to the Trash
```
sudo spctl --master-disable
```
