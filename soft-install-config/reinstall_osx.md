####重装MAC系统




MD5: 73ff3f7dcf9b4355b01de950b30d0572
macOS Sierra 10.12 (16A323).dmg   4.46  https://pan.baidu.com/s/1i5yOIw9 链接：http://pan.baidu.com/s/1pKKaYpX 密码：r0z1
4.46G  下载:  https://pan.baidu.com/s/1nuSS4A1   y974  本站发布的文件 MD5 : macOSSierra10-12.dmg = 68be510e6af0726d3bdc223788e43b25

U盘分区方案为GUID分区表（如果不是可以在分区里选择选项进行修改）盘符名请命名为”Untitled” 格式[Mac OS Extended (Journaled)]/[Mac OS 扩展（日志式）]。
```
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app --nointeraction
```

```
sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/USB01 --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app --nointeraction
```

```
sudo  #获取超级用户权限执行以下命令
/Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia  #指定运行路径为为/Applications/Install OS X El Capitan.app/Contents/Resources/中的createinstallmedia这个“创建安装媒体”的程序，路径的文件名中的空格前添加的反斜杠“\”是转义字符，以便将“文件名中的空格”和“命令行中的参数之间的空格”区别开来。
--volume  #该选项要求指定在哪个volume中创建安装媒体（安装U盘）
/Volumes/USB01  #你要创建的安装盘（U盘）的路径
--applicationpath  #该选项是要求指定写入到U盘的OS X系统安装包的路径
/Applications/Install\ OS\ X\ El\ Capitan.app  #所指定的要写入U盘的系统安装包在电脑中的路径
--nointeraction   #该选项表示运行程序 createinstallmedia 的过程中不交互。如果不用这个选项，可能会弹出一个提示，跟你说接下来要干什么，问你是否确定，确定就按y，然后回车继续。
```

Install macOS Sierra 10.12(16A323).dmg
1、文件名：Install macOS Sierra 10.12 (16A323).dmg  2、大小： 4.92 G
3、MD5：
MD5 (/Applications/Install macOS Sierra.app/Contents/SharedSupport/InstallESD.dmg) = 98eb1328baa53f5b1e8445c869fcbb3a
链接: https://pan.baidu.com/s/1bYaw70   密码: yv7k


