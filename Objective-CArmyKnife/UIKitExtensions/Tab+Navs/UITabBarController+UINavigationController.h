@import UIKit;


/**
 *  快速实现以UITabBarController为基础结构的View骨架
 *  建议用法：
 *      AppleViewController *appleViewController = [AppleViewController new];
 *      BoyViewController *boyViewController     = [BananaViewController new];
 *      CarViewController *carViewController     = [CarViewController new];
 *      DogViewController *dogViewController     = [DogViewController new];
 *
 *      self.window.rootViewController =
 *          [[[[UITabBarController new]
 *              addChildViewController:appleViewController withNavigationControllerTitle:@"苹果" ...]
 *             addChildViewController:boyViewController withNavigationControllerTitle:@"男孩" ...]
 *            addChildViewController:carViewController withNavigationControllerTitle:@"车" ...]
 *           addChildViewController:dogViewController withNavigationControllerTitle:@"狗" ...];
 */
@interface UITabBarController (UINavigationController)

/**
 *  用UINavigationController将childViewController并加到UITabBarController中
 *
 *  @param childViewController     当成UINavigationController rootViewController的UIViewController
 *  @param title                   导航栏标题
 *  @param tabBarItemImage         默认TabBarItem图片
 *
 *  @return 持有装载childViewController的UINavigationController的UITabBarController实例
 */
- (instancetype)addChildViewController:(UIViewController *)childViewController
         withNavigationControllerTitle:(NSString *)title
                       tabBarItemImage:(UIImage *)tabBarItemImage;
/**
 *  用UINavigationController将childViewController并加到UITabBarController中
 *
 *  @param childViewController     当成UINavigationController rootViewController的UIViewController
 *  @param title                   导航栏标题
 *  @param tabBarItemImage         默认TabBarItem图片
 *  @param tabBarItemSelectedImage 选中时TabBarItem图片
 *
 *  @return 持有装载childViewController的UINavigationController的UITabBarController实例
 */
- (instancetype)addChildViewController:(UIViewController *)childViewController
         withNavigationControllerTitle:(NSString *)title
                       tabBarItemImage:(UIImage *)tabBarItemImage
               tabBarItemSelectedImage:(UIImage *)tabBarItemSelectedImage;

@end
