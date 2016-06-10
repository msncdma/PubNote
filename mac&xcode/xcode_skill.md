
## XCODE技巧
----



**快捷键**

- Show Blame for Line(Editor Menu for Source Code)
- 删除一整行	到行尾control+A 然后 cmd + delete


**Alcatraz**

###安装
    curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

###删除程序
    rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin
    
    find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID

sudo xcode-select --reset
    
###删除Lib
    rm -rf ~/Library/Application\ Support/Alcatraz/
    
---
       