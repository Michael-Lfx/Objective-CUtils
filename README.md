# Objective-CArmyKnife

收录Objective-C常用工具方法，以细颗粒度分块整理，用户自行按需添加需要的功能模块，提高生产效率。
**人生苦短，别浪费在编写重复代码上，工程师应该做些有意义的事。当然，必须要掌握原理，我觉得iOS应用开发属于理论指导实践。**

## 使用方法

两个使用方式，选择合适的：

1. 拷贝目录至工程即可使用
2. CocoaPod工程可在Podfile加上`pod 'Objective-CArmyKnife'`，然后终端执行`pod install`

## 目录说明

```
Objective-CArmyKnife/
    Controls/
      Loading/
    CoreAnimationExtensions/
      ConvenienceAnimation/
    CoreGraphicsExtensions/
      CGRect/
    FoundationExtensions/
      Edit/
      Regex/
    PublicHeaders/
    RuntimeExtensions/
      MethodSwizzConvenienceInterface/
      PrintModelProperty/
      PrintViewControllerHierarchy/
    UIKitExtensions/
      BounceAnimation/
      ColorfulNavigationBar/
      DataSourceCollections/
      HexStringColor/
      ImageViewAnimation/
      LoadImage/
      MoveCell/
      RegisterCell/
      RotateAnimation/
      RoundCorner/
      ShakeAnimation/
      Tab+Navs/
      TableViewSeparator/
      Transform3DAnimation/
      ViewFrame/
```

PublicHeaders/Objective-CArmyKnife.h内包含了所有拓展头文件，可将其加入.PCH文件，省去逐一添加头文件的麻烦。
Controls需要自己添加，因为我也不知哪些控件适合你的项目。

我使用[synx](https://github.com/venmo/synx)自动生成目录，因为手工创建太累。

## 许可信息

MIT许可，允许使用者自由修改与拷贝，本项目维护者不负任何法律责任，也不承诺提供任何维护支持。

## 更新内容

2015.6.15

* 支持Travis CI
* 分离NSString，为编辑（Edit）、正则（Regex）、MD5、Base64、回文字符串（Palindrome）建立独立目录
* 调整Sample项目，简化仓库目录结构，方便synx生成物理目录