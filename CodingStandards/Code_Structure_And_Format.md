#代码结构
实现文件中的代码结构，提倡以下约定：

* 用`#pragma mark -`将函数或方法按功能进行分组。
* dealloc方法放到实现文件的最顶部。
	> 这样是为了时刻提醒你要记得释放相关资源。

* delgate或协议相关方法放到一般内容之后。

```
	#pragma mark - Lifecycle
	
	- (void)dealloc {}
	- (instancetype)init {}
	- (void)viewDidLoad {}
	- (void)viewWillAppear:(BOOL)animated {}
	- (void)didReceiveMemoryWarning {}
	
	#pragma mark - Custom Accessors
	
	- (void)setCustomProperty:(id)value {}
	- (id)customProperty {}
	
	#pragma mark - Protocol conformance
	#pragma mark - UITextFieldDelegate
	#pragma mark - UITableViewDataSource
	#pragma mark - UITableViewDelegate
	
	#pragma mark - NSCopying
	
	- (id)copyWithZone:(NSZone *)zone {}
	
	#pragma mark - NSObject
	
	- (NSString *)description {}
```

#代码排版格式
## 点语法

应该 **始终** 使用点语法来访问或者修改属性，访问其他实例时首选括号。

**推荐：**

```
view.backgroundColor = [UIColor orangeColor];
[UIApplication sharedApplication].delegate;
```

**反对：**

```
[view setBackgroundColor:[UIColor orangeColor]];
UIApplication.sharedApplication.delegate;
```

## 间距

* 一个缩进使用 4 个空格，永远不要使用制表符（tab）缩进。请确保在 Xcode 中设置了此偏好。
* 方法的大括号和其他的大括号（`if`/`else`/`switch`/`while` 等等）始终和声明在同一行开始，在新的一行结束。

**推荐：**

```
if (user.isHappy) {
// Do something
}
else {
// Do something else
}
```
* 方法之间应该正好空一行，这有助于视觉清晰度和代码组织性。在方法中的功能块之间应该使用空白分开，但往往可能应该创建一个新的方法。
* `@synthesize` 和 `@dynamic` 在实现中每个都应该占一个新行。

## 长度
* 每行代码的长度最多不超过100个字符
* 尝试将单个函数或方法的实现代码控制在30行内
    > 如果某个函数或方法的实现代码过长，可以考量下是否可以将代码拆分成几个小的拥有单一功能的方法。
    >
	> 30行是在13寸macbook上XCode用14号字体时，恰好可以让一个函数的代码做到整屏完全显示的行数。
* 将单个实现文件里的代码行数控制在500～600行内
	> 为了简洁和便于阅读，建议将单个实现文件的代码行数控制在500～600行以内最好。
	> 
	> 当接近或超过800行时，就应当开始考虑分割实现文件了。
	>
	> 最好不要出现代码超过1000行的实现文件。
	>
	> 我们一般倾向于认为单个文件代码行数越长，代码结构就越不好。而且，翻代码翻的手软啊。
	> 
	> 可以使用Objective-C的Category特性将实现文件归类分割成几个相对轻量级的实现文件。


## 条件判断

条件判断主体部分应该始终使用大括号括住来防止[出错](https://github.com/NYTimes/objective-c-style-guide/issues/26#issuecomment-22074256)，即使它可以不用大括号（例如它只需要一行）。这些错误包括添加第二行（代码）并希望它是 if 语句的一部分时。还有另外一种[更危险的](http://programmers.stackexchange.com/a/16530])，当 if 语句里面的一行被注释掉，下一行就会在不经意间成为了这个 if 语句的一部分。此外，这种风格也更符合所有其他的条件判断，因此也更容易检查。

**推荐：**

```
if (!error) {
    return success;
}
```

**反对：**

```
if (!error)
    return success;
```

或

```
if (!error) return success;
```
### 三目运算符

三目运算符，? ，只有当它可以增加代码清晰度或整洁时才使用。单一的条件都应该优先考虑使用。多条件时通常使用 if 语句会更易懂，或者重构为实例变量。

**推荐：**

```
result = a > b ? x : y;
```

**反对：**

```
result = a > b ? x = c > d ? c : d : y;
```

## 错误处理

当引用一个返回错误参数（error parameter）的方法时，应该针对返回值，而非错误变量。

**推荐：**

```
NSError *error;
if (![self trySomethingWithError:&error]) {
    // 处理错误
}
```

**反对：**

```
NSError *error;
[self trySomethingWithError:&error];
if (error) {
    // 处理错误
}
```
一些苹果的 API 在成功的情况下会写一些垃圾值给错误参数（如果非空），所以针对错误变量可能会造成虚假结果（以及接下来的崩溃）。

## 方法

* 在方法签名中，在 -/+ 符号后应该有一个空格。方法片段之间也应该有一个空格。

**推荐：**

```
- (void)setExampleText:(NSString *)text image:(UIImage *)image;
```
* 实现文件中，方法的左花括号不另起一行，和方法名同行，并且和方法名之间保持1个空格
	> 此条是为了和XCode6.1模板生成的文件的代码风格保持一致。

```
//赞成的
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//不赞成的
- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
```

## 变量

变量名应该尽可能命名为描述性的。除了 `for()` 循环外，其他情况都应该避免使用单字母的变量名。
星号表示指针属于变量，例如：`NSString *text` 不要写成 `NSString* text` 或者 `NSString * text` ，常量除外。
尽量定义属性来代替直接使用实例变量。除了初始化方法（`init`， `initWithCoder:`，等）， `dealloc` 方法和自定义的 setters 和 getters 内部，应避免直接访问实例变量。更多有关在初始化方法和 dealloc 方法中使用访问器方法的信息，参见[这里](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmPractical.html#//apple_ref/doc/uid/TP40004447-SW6)。


**推荐：**

```
@interface NYTSection: NSObject

@property (nonatomic) NSString *headline;

@end
```

**反对：**

```
@interface NYTSection : NSObject {
    NSString *headline;
}
```


#### 变量限定符

当涉及到[在 ARC 中被引入](https://developer.apple.com/library/ios/releasenotes/objectivec/rn-transitioningtoarc/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226-CH1-SW4))变量限定符时，
限定符 (`__strong`, `__weak`, `__unsafe_unretained`, `__autoreleasing`) 应该位于星号和变量名之间，如：`NSString * __weak text`。

## block

`block` 适合用在 target/selector 模式下创建回调方法时，因为它使代码更易读。块中的代码应该缩进 `4` 个空格。
取决于块的长度，下列都是合理的风格准则：

- 如果一行可以写完块，则没必要换行。
- 如果不得不换行，关括号应与块声明的第一个字符对齐。
- 块内的代码须按 `4` 空格缩进。
- 如果块太长，比如超过 `20` 行，建议把它定义成一个局部变量，然后再使用该变量。
- 如果块不带参数，`^{` 之间无须空格。如果带有参数，`^(` 之间无须空格，但 `) {` 之间须有一个空格。

```
// The entire block fits on one line.
[operation setCompletionBlock:^{ [self onOperationDone]; }];

[operation setCompletionBlock:^{
    [self.delegate newDataAvailable];
}];

dispatch_async(fileIOQueue_, ^{
    NSString *path = [self sessionFilePath];
    if (path) {
        ...
    }
});


[[SessionService sharedService]
    loadWindowWithCompletionBlock:^(SessionWindow *window) {
        if (window) {
            [self windowDidLoad:window];
        }
        else {
            [self errorLoadingWindow];
        }
    }
];

[[SessionService sharedService]
    loadWindowWithCompletionBlock:
        ^(SessionWindow *window) {
            if (window) {
                [self windowDidLoad:window];
            }
            else {
                [self errorLoadingWindow];
            }
        }
];


void (^largeBlock)(void) = ^{
    ...
};
[operationQueue_ addOperationWithBlock:largeBlock];
```
