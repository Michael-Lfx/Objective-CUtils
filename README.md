# Objective-CArmyKnife

收录Objective-C常用工具方法，以细颗粒度分块整理，用户自行按需添加需要的功能模块，提高生产效率。
**人生苦短，别浪费在编写重复代码上，工程师应该做些有意义的事。当然，必须要掌握原理，我觉得iOS应用开发属于理论指导实践。**

>预计稳定后两个工作周发布一次版本，目前处于整理代码阶段，一周一次发布。

## 使用方法

两个使用方式，选择合适的：

1. 拷贝目录至工程即可使用
2. CocoaPod工程可在Podfile加上`pod 'Objective-CArmyKnife'`，然后终端执行`pod install`

## 目录说明（正在修复）

```
|-  Extensions：常规拓展
    |-  NSObject+Extensions .h .m
|-  Controls：常用控件
    |-  OAKDownloadProgressView .h.m
|-  Objective-CArmyKnife.h
```

Objective-CArmyKnife.h内包含了Extensions目录的所有拓展头文件，可将其加入.PCH文件，省去逐一添加头文件的麻烦。
Controls需要自己添加，因为我也不知哪些控件适合你的项目。

## 参与

登陆GitHub，点击项目右上角 Fork 按钮，终端中输入git clone 你的副本地址（如`git clone https://github.com/你的用户名/Objective-CArmyKnife`），在本地加上你的新代码，提交到GitHub，做Pull Request，我到时合并进来。

需要添加更多拓展方法或有Bug，可在右上角`Issue`中提，或加 `820 84 788` 告诉我。

## 许可信息

MIT许可，允许使用者自由修改与拷贝，本项目维护者不负任何法律责任，也不承诺提供任何维护支持。