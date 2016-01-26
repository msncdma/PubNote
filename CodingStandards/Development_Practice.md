#开发实践
本章主要描述开发过程中一些比较固定的实践技巧，写代码时可以直接套用
##初始化

* 初始化方法的返回类型用`instancetype`，不要用`id`

	> 关于instancetype的介绍参见[NSHipster.com](http://nshipster.com/instancetype/)。

## 单例

单例对象应该使用线程安全的模式创建共享的实例。

```
+ (instancetype)sharedInstance {
   static id sharedInstance = nil;

   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      sharedInstance = [[self alloc] init];
   });

   return sharedInstance;
}
```
这将会预防[有时可能产生的许多崩溃][Singletons_1]。

[Singletons_1]:http://cocoasamurai.blogspot.com/2011/04/singletons-your-doing-them-wrong.html
## 字面量

每当创建 `NSString`， `NSDictionary`， `NSArray`，和 `NSNumber` 类的不可变实例时，都应该使用字面量。要注意 `nil` 值不能传给 `NSArray` 和 `NSDictionary` 字面量，这样做会导致崩溃。

**推荐：**

```
NSArray *names = @[@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
NSDictionary *productManagers = @{@"iPhone" : @"Kate", @"iPad" : @"Kamal", @"Mobile Web" : @"Bill"};
NSNumber *shouldUseLiterals = @YES;
NSNumber *buildingZIPCode = @10018;
```

**反对：**

```
NSArray *names = [NSArray arrayWithObjects:@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul", nil];
NSDictionary *productManagers = [NSDictionary dictionaryWithObjectsAndKeys: @"Kate", @"iPhone", @"Kamal", @"iPad", @"Bill", @"Mobile Web", nil];
NSNumber *shouldUseLiterals = [NSNumber numberWithBool:YES];
NSNumber *buildingZIPCode = [NSNumber numberWithInteger:10018];
```
## CGRect 函数

当访问一个 `CGRect` 的 `x`， `y`， `width`， `height` 时，应该使用[`CGGeometry` 函数][http://developer.apple.com/library/ios/#documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html]代替直接访问结构体成员。苹果的 `CGGeometry` 参考中说到：

> All functions described in this reference that take CGRect data structures as inputs implicitly standardize those rectangles before calculating their results. For this reason, your applications should avoid directly reading and writing the data stored in the CGRect data structure. Instead, use the functions described here to manipulate rectangles and to retrieve their characteristics.

**推荐：**

```
CGRect frame = self.view.frame;

CGFloat x = CGRectGetMinX(frame);
CGFloat y = CGRectGetMinY(frame);
CGFloat width = CGRectGetWidth(frame);
CGFloat height = CGRectGetHeight(frame);
```

**反对：**

```
CGRect frame = self.view.frame;

CGFloat x = frame.origin.x;
CGFloat y = frame.origin.y;
CGFloat width = frame.size.width;
CGFloat height = frame.size.height;
```

## 常量
* 定义常量时，除非明确的需要将常量当成宏使用，否则优先使用`const`，而非`#define`


* 只在某一个特定文件里面使用的常量，用static

```
	static CGFloat const RWImageThumbnailHeight = 50.0;
```

## 枚举类型

当使用 `enum` 时，建议使用新的基础类型规范，因为它具有更强的类型检查和代码补全功能。现在 SDK 包含了一个宏来鼓励使用使用新的基础类型 - `NS_ENUM()`

```
typedef NS_ENUM(NSInteger, NYTAdRequestState) {
    NYTAdRequestStateInactive,
    NYTAdRequestStateLoading
};
```

## 位掩码

当用到位掩码时，使用 `NS_OPTIONS` 宏。


```
typedef NS_OPTIONS(NSUInteger, NYTAdCategory) {
NYTAdCategoryAutos      = 1 << 0,
NYTAdCategoryJobs       = 1 << 1,
NYTAdCategoryRealState  = 1 << 2,
NYTAdCategoryTechnology = 1 << 3
};
```

## 私有属性

私有属性应该声明在类实现文件的延展（匿名的类目）中。有名字的类目（例如 `ASMPrivate` 或 `private`）永远都不应该使用，除非要扩展其他类。


```
@interface NYTAdvertisement ()

@property (nonatomic, strong) GADBannerView *googleAdView;
@property (nonatomic, strong) ADBannerView *iAdView;
@property (nonatomic, strong) UIWebView *adXWebView;

@end
```
## 布尔值

* Objective-C的布尔值只使用`YES`和`NO`

* `true`和`false`只能用于CoreFoundation，C或C++的代码中

* 禁止将某个值或表达式的结果与`YES`进行比较
	> 因为BOOL被定义成signed char。这意味着除了YES(1)和NO(0)以外，它还可能是其他值。
	> 
	> **因此C或C++中的非0为真并不一定就是YES**

```

	//以下都是被禁止的
    - (BOOL)isBold {
		return [self fontTraits] & NSFontBoldTrait;
	}

	- (BOOL)isValid {
	    return [self stringValue];
	}
	
	if ([self isBold] == YES) {
		//...
	}
	
	
	//以下才是赞成的方式
	- (BOOL)isBold {
	    return ([self fontTraits] & NSFontBoldTrait) ? YES : NO;
	}
	
	- (BOOL)isValid {
	    return [self stringValue] != nil;
	}
	
	- (BOOL)isEnabled {
	    return [self isValid] && [self isBold];
	}
	
	if ([self isBold]) {
		//...
	}
```
* 虽然`nil`会被直接解释成`NO`，但还是建议在条件判断时保持与nil的比较，因为这样代码更直观。

```
	//比如，更直观的代码
	if (someObject != nil) {
		//...
	}
	
	//没那么直观的代码
	if (!someObject) {
		//...
	}
```

* 在C或C++代码中，要注意NULL指针的检测。
	> 向一个nil的Objective-C对象发送消息不会导致崩溃。但由于Objective-C运行时不会处理给NULL指针的情况，所以为了避免崩溃，需要自行处理对于C/C++的NULL指针的检测。

* 如果某个`BOOL`类型的property的名字是一个形容词，建议为getter方法加上一个"is"开头的别名。

```
	@property (assign, getter = isEditable) BOOL editable;
```
	
* 在方法实现中，如果有block参数，要注意检测block参数为nil的情况。

```
	- (void)exitWithCompletion:(void(^)(void))completion {
		// 错误。 如果外部调用此方法时completion传入nil，此处会发生EXC_BAD_ACCESS
	    completion();
	    
	    // 正确。如果completion不存在则不调用。
	    if (completion) {
	        completion();
	    }
	}
```
