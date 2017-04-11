


### nil / Nil / NULL / NSNull

Symbol	| Value	| Meaning
---|---|---
NULL | (void *)0| literal null value for C pointers
nil  | (id)0| literal null value for Objective-C objects
Nil  | (Class)0| literal null value for Objective-C classes
NSNull  | [NSNull null] | singleton object used to represent null

### BOOL / bool / Boolean / NSCFBoolean

Name | Typedef| Header| True Value| False Value
---|---|---|---|---
BOOL|signed|char|objc.h|YES|NO
bool|_Bool(int)|stdbool.h|true|false
Boolean|unsigned char|MacTypes.h|TRUE|FALSE
NSNumber|__NSCFBoolean|Foundation.h|@(YES)|@(NO)
CFBooleanRef|struct|CoreFoundation.h|kCFBooleanTrue|kCFBooleanFalse


###iOS里Toll-Free Bridging的桥接机制
- Toll-free bridging,简称为TFB，是一种允许某些ObjC类与其对应的CoreFoundation类之间可以互换使用的机制。比如 NSString与CFString是桥接(bridged)的, 这意味着可以将任意NSString当做CFString使用，也可以将任意的CFString当做NSString使用。

- 为什么要有CFString呢？
- NSString是一个抽象类，每当你创建一个NSString实例，实际上是创建的NSString的一个私有子类实例。其中一个私有子类就是NSCFString,其是CFString类的在ObjC中的对应类。NSCFString实现了作为NSString需要的所有方法。
```
There are a number of data types in the Core Foundation framework and the Foundation framework that can be used interchangeably. This capability, called toll-free bridging, means that you can use the same data type as the parameter to a Core Foundation function call or as the receiver of an Objective-C message。
CFString provides a suite of efficient string-manipulation and string-conversion functions. It offers seamless Unicode support and facilitates the sharing of data between Cocoa and C-based programs
```
参照 - [iOS渐入佳境之内存管理机制（三）：Toll-Free-Bridging/](http://solacode.github.io/2015/10/20/iOS%E6%B8%90%E5%85%A5%E4%BD%B3%E5%A2%83%E4%B9%8B%E5%86%85%E5%AD%98%E7%AE%A1%E7%90%86%E6%9C%BA%E5%88%B6%EF%BC%88%E4%B8%89%EF%BC%89%EF%BC%9AToll-Free-Bridging/)


###内联函数
- [内联函数：static inline 和 extern inline 的含义](http://www.cnblogs.com/pengyingh/articles/2405718.html)




```
java 中的 成员变量、局部变量、静态变量、类变量、非静态变量、实例变量、向前引用、非法向前引用、静态代码块、非静态代码块 执行时机
java 中的变量大致分为 成员变量 和 局部变量 两大类。
```
成员变量：
* 在类体里面定义的变量称为成员变量；
* 如果该成员变量有 static 关键字修饰，则该成员变量称为 静态变量 或 类变量；
* 如果该成员变量没有 static 关键字修饰，则该成员变量被称为 非静态变量 或 实例变量。

局部变量：
* 形参、方法内定义的变量、代码块中定义的变量，都属于局部变量。

类变量 （静态变量）
* 1. 可以向前引用
* 2. 变量属于类本身
* 3. 类变量不依赖类的实例，类变量只在初始化时候在栈内存中被分配一次空间，无论类的实例被创建几次，都不再为类变量分配空间
* 4. 通过类的任意一个实例来访问类变量，底层都将将其转为通过类本身来访问类变量，它们的效果是一样的
* 5. 一旦类变量的值被改变，通过类或类的任意一个实例来访问类变量，得到的都将是被改变后的值
* 6. 将在类的初始化之前初始化

实例变量（非静态变量）
* 1. 不能向前引用，如果向前引用，则称为非法向前引用，这是不允许的
* 2. 变量属于类的实例对象
* 3. 随着类的实例被创建而分配内存空间

非静态代码块
    直接由 { } 包起来的代码，称为非静态代码块

静态代码块
 * 直接由 static { } 包起来的代码，称为静态代码块

类变量（静态变量）、实例变量（非静态变量）、静态代码块、非静态代码块 的初始化时机
* 由 static 关键字修饰的（如：类变量[静态变量]、静态代码块）将在类被初始化创建实例对象之前被初始化，而且是按顺序从上到下依次被执行；
    没有 static 关键字修饰的（如：实例变量[非静态变量]、非静态代码块）初始化实际上是会被提取到类的构造器中被执行的，但是会比类构造器中的
    代码块优先执行到，其也是按顺序从上到下依次被执行。



####结论

    -  static变量属于本类，不同的类对应的是不同的对象
    - static变量同一个类所有对象中共享，只初始化一次
const
    * static const变量同static的结论I，只是不能修改了，但是还是不同的对象
    * extern const变量只有一个对象，标准的常量的定义方法
    * extern的意思就是这个变量已经定义了，你只负责用就行了
