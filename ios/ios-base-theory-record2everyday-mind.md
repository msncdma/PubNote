#离屏渲染原理

#导航栏专题
- [几句话实现导航栏透明渐变](http://www.cocoachina.com/ios/20160606/16608.html)
- [LTNavigationBar](https://github.com/ltebean/LTNavigationBar)
- [MXNavigationBarManager](https://github.com/cwxatlm/MXNavigationBarManager)

#Objective-C 的方法调用流程

- [UIView中的layoutSubviews和drawRect](http://www.jianshu.com/p/438bcf8e3e53)



#对viewController进行管理的类有UINavigationController，UITabBarController

ViewController切换
弹簧式列表的制作
UIViewController的误用


```
ios开发scrollView中contentSize、contentInset和contentOffset区别

contentSize是scrollview可以滚动的区域，比如frame = (0 ,0 ,320 ,480) contentSize = (320 ,960)，代表你的scrollview可以上下滚动，滚动区域为frame大小的两倍。 
contentOffset是scrollview当前显示区域顶点相对于frame顶点的偏移量，比如上个例子你拉到最下面，contentoffset就是(0 ,480)，也就是y偏移了480 
contentInset是scrollview的contentview的顶点相对于scrollview的位置，例如你的contentInset = (0 ,100)，那么你的contentview就是从scrollview的(0 ,100)开始显示 

另外UITableView是UIScrollView的子类，它们在上述属性又有所不同，tabelview的contentsize是由它的下列方法共同实现的 
- (NSInteger)numberOfSections; 
- (NSInteger)numberOfRowsInSection:(NSInteger)section; 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; 
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section; 
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; 
它会自动计算所有的高度和来做为它的contentsize的height.

```


UIView层次管理(sendSubviewToBack,bringSubviewToFront)



#生命周期：

```
2013-03-27 16:58:48.277StudyInit[1659:11303] initWithNibName

2013-03-27 16:58:48.279StudyInit[1659:11303] loadView

2013-03-27 16:58:48.280StudyInit[1659:11303] viewDidLoad

2013-03-27 16:58:48.281StudyInit[1659:11303] viewWillAppear

2013-03-27 16:58:48.284StudyInit[1659:11303] viewWillLayoutSubviews

2013-03-27 16:58:48.285StudyInit[1659:11303] viewDidLayoutSubviews

2013-03-27 16:58:48.637StudyInit[1659:11303] viewDidAppear

2013-03-27 16:58:50.158StudyInit[1659:11303] viewWillDisappear

2013-03-27 16:58:50.511StudyInit[1659:11303] viewDidDisappear

2013-03-27 16:58:50.512StudyInit[1659:11303] dealloc

```

#UIScrollView
- [Allen 许帅](https://github.com/allenhsu)
- [UIScrollView 实践经验](http://tech.glowing.com/cn/practice-in-uiscrollview/)


