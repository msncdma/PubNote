##iOS 宁远iOS开发规范

###命名规范
    1.文件名驼峰方式，如遇到可能重名情况，添加前缀，前缀2-3个大字字母
    2.局部变量，成员变量，静态变量，全局静态变量，宏（通知名，方法名），

###注释规范
    ```
    1.类名和方法用/** * */注释；属性及单行注释 尽量用/* */注释或者//
    2.层级深的界面，流程比较长的界面，在文件头部详细标明UI点击路径，当前界面说明
    3.复杂一点的功能加上详细的中文注释，分步骤12345说明，方法参数需要说明为什么要加。
    ```


###新建规范（新建（类，工具方法等）时，先询问是否已存在）
    1.所有ViewController继承与NYBaseViewController,NYBaseViewTableViewContoller少用或者不用，第三方库优先使用Cocoapods集成
    2.所有ViewController 按功能模块在SeekDoctor160工程，Request、Model、公共类、扩展、第三方库，
    在AppSupport静态工程按功能模块保存，oldSeekDoctor160是需要逐步清理的工程
    3.TableView尽量使用Model+Cell分离的方式实现，不要使用网络Model用作CELL展示Model,网络Model与        CELL展示的MODEL隔离,具体参照工程实现
    4.考虑到医疗业务特殊性，业务实现处，详细记录为什么要这样设计代码，业务的详细说明
    5.接口有许多不合理的命名方式，不要照搬过来，需要自己重新命名，保持代码的可读性
    6.接口，MODEL，属性字段需要注明详细说明
    7.不必要的字段尽量不要写在.h文件，尽量私有化
    8.NSString使用copy关键字，NSMutable*系列对象返回方法值时注意copy下再返回
    9.不用StoryBoard，代码写UI，保证代码高度可复用性，解耦合性
    10.选择第三方库，需要团队成员一块评估，选择
    11.图片一律为png,统一放入Images.xcassets中，只需要2X,3X图片
    12.使用block时，注意self的内存泄漏，使用weakfiy,strongfiy宏

###修改规范
    1.修改重要逻辑的地方必须在修改处注明时间、原因、作者、Bug编号(如果有)


###安全性及性能规范
    1.项目中统一使用AFN+JSONMODEL框架，遇到ASI旧框架，抽时间重构
    2.UI操作务必在主线程中，参见js回调OC接口处
    3.Array中取数据务必使用objectAtIndexEX扩展方法，其它容器类同
    4.if后一定用{}，即使只有一行

###git规范
    1.安装Tower，用于方便查看代码历史记录，其它的pull,push,merge操作尽量使用命令行操作
    2.commit 给出详情的说明注释，不要随意写无意义的注释
    3.每个版本在独立的分支中开发，开发完成并上线后代码合并入master主干，并打tag
    4.所有代码以gitlab下的root用户为基准，开发人员fork，push到开发人员自己用户下，然后gitlab平台发起合并请求，其它开发人员审核，然后所有人再从root用户下的仓库pull代码

    ###架构与组件


    ###持久层与解析

    ###导出项目doc
    - [修改Xcode自动生成的文件注释来导出API文档](http://www.jianshu.com/p/d0c7d9040c93)
