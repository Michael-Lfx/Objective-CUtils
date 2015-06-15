#import "UITabBarController+UINavigationController.h"


@implementation UITabBarController (UINavigationController)

- (instancetype)addChildViewController:(UIViewController *)childViewController
         withNavigationControllerTitle:(NSString *)title
                       tabBarItemImage:(UIImage *)tabBarItemImage {
    return [self addChildViewController:childViewController
          withNavigationControllerTitle:title
                        tabBarItemImage:tabBarItemImage
                tabBarItemSelectedImage:nil];
}

- (instancetype)addChildViewController:(UIViewController *)childViewController
         withNavigationControllerTitle:(NSString *)title
                       tabBarItemImage:(UIImage *)tabBarItemImage
               tabBarItemSelectedImage:(UIImage *)tabBarItemSelectedImage {
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:childViewController];
    childViewController.title = title;
    childViewController.tabBarItem.image = tabBarItemImage;
    childViewController.tabBarItem.selectedImage = tabBarItemSelectedImage;
    [self addChildViewController:navigationController];
    return self;
}


@end
