@import UIKit;

/**
 *  旋转LoopImage、LogoImage时亮时暗动画的视图
 *
 *  建议使用场合：加载数据等无预计时间的等待画面
 */
@interface LoopLoadingView : UIView

/**
 *  是否正在加载
 */
@property (assign, nonatomic, readonly, getter=isLoading) BOOL loading;

/**
 *  设置外圈旋转图标，应该大于LogoImage，且最好为非完整圆
 *
 *  @param image 外圈旋转图标
 */
- (void)setLoopImage:(UIImage *)image;

/**
 *  内图标，要求小于LogoImage，最好被LoopImage包起来后还有些边距，一般是产品图标缩略图
 *
 *  @param image 内圈LOGO图标
 */
- (void)setLogoImage:(UIImage *)image;

- (void)startAnimating;

- (void)stopAnimating;

@end
