```
typedef void (^Block)(void);

Block block;
{
    int val = 0;
    block = ^(){
        NSLog(@"val = %d",val);
    };
}
block();
```

```
//A powerful feature of blocks is that they can modify
variables in the same lexical scope. You signal that a block
can modify a variable using the __block storage type
modifier.

//At function level are __block variables. These are mutable
within the block (and the enclosing scope) and are preserved
if any referencing block is copied to the heap.

大概意思归结出来就是两点：
1.__block对象在block中是可以被修改、重新赋值的。
2.__block对象在block中不会被block强引用一次，从而不会出现循环引用问题。

API Reference对__weak变量修饰符有如下几处解释：

__weak specifies a reference that does not keep the
referenced object alive. A weak reference is set to nil when
there are no strong references to the object.

使用了__weak修饰符的对象，作用等同于定义为weak的property。自然不会导致循环引用问题，因为苹果文档已经说的很清楚，当原对象没有任何强引用的时候，弱引用指针也会被设置为nil。

因此，__block和__weak修饰符的区别其实是挺明显的：
1.__block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
2.__weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
3.__block对象可以在block中被重新赋值，__weak不可以。
PS：__unsafe_unretained修饰符可以被视为iOS SDK 4.3以前版本的__weak的替代品，不过不会被自动置空为nil。所以尽可能不要使用这个修饰符。
```



