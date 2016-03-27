#函数命名
Objective-C 允许通过函数(C 形式的函数)描述行为,就如成员方法一样。如果隐含的类为单例或在处理函数子系统时,你应当优先使用函数,而不 是类方法。

函数命名应该遵循如下几条规则:
  2. 大写前缀后紧跟的第一个单词首字符

```
NSHighlightRect
```
查询属性的函数有个更多的规则要遵循:

* 查询第一个参数的属性的函数,省略动词
```
unsigned int NSEventMaskFromType(NSEventType type)
float NSHeight(NSRect rect)
```
* 返回值为引用的方法,使用 Get

```
```

* 返回 boolean 值的函数,名称使用判断动词 is/does 开头 

```
BOOL NSDecimalIsNotANumber(const NSDecimal *decimal)
```