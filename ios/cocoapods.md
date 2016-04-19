




###针对xmpp库的循环引用解决办法：
- 卸载 cocoapods
`
$ sudo gem uninstall cocoapods
`

- 安装 xcodeproj
`
$ sudo gem install xcodeproj
`

- 安装指定0.34.4版本的 Cocoapods
`
sudo gem install cocoapods -v 0.34.4
`

###更新cocoapods的本地镜像仓库
#######命令行中查看当前仓库的git远程地址

`````
$ pod repo

master
- Type: git (master)
- URL:  https://github.com/CocoaPods/Specs.git
- Path: /Users/vice/.cocoapods/repos/master
`````

###替换

`````
pod repo remove master
pod repo add master https://gitcafe.com/akuandev/Specs.git
pod repo update
`````

- 将以上代码中的 `https://gitcafe.com/akuandev/Specs.git` 
- 替换成 `http://git.oschina.net/akuandev/Specs.git` 即可使用 oschina 上的镜像