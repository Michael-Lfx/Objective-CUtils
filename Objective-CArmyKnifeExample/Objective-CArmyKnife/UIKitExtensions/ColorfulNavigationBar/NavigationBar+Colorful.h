@import UIKit;

/**
 *  支持透明、多种颜色渐变的NavigationBar。
 *  说明：Xcode 6.3.2中Interface Builder不支持NavigationBar的实时渲染，加上IB_DESIGNABLE与IBInspectable无任何意义
 *  故不做成子类，改用拓展实现
 */
@interface UINavigationBar (Colorful)

/**
 *  单个颜色，与gradientColors互斥
 */
@property (strong, nonatomic) UIColor *soloColor;

/**
 *  一组（只支持两个，多了自己改代码吧）渐变颜色，从顶到底渐变。与soloColor互斥
 */
@property (copy, nonatomic) NSArray *gradientColors;    // for Colors

@end
