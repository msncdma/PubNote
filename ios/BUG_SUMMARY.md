BUG总结

indexAtEX  防御性代码，防止越界

及时更新第三方库，降低线上BUG率

主线程同步调用C函数，在IOS7上使用中移动CELL网络，方法调用会一直卡在调用处而不返回，
造成UI卡死现象，同时用户快速多次点击APP，APP崩溃


ios PROGRAM crash 的几种情况:
调用block时没有判断BLOCK是否为空
if(block())
if([aobj respondsToSelector:@selector(amethod)])

