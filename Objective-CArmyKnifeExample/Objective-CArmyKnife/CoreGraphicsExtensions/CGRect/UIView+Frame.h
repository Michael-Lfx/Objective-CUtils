@import UIKit;

@interface UIView (CGRect)

@property CGFloat x;
@property CGFloat y;
@property CGFloat width;
@property CGFloat height;

@end

@interface UIView (CALayer)

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size;

@end


#ifndef kDuration
#define kDuration (0.5)
#endif

@interface UIView (Animation)

- (void)defaultShakeAnimation;
- (void)shakeAnimationWithMargin:(CGFloat)margin duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

/**
 *  旋转360度动画
 */
- (void)defaultRotateAnimation;
- (void)rotateAnimationFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

- (void)defaultBounceAnimation;
- (void)bounceAnimationWithValues:(NSArray *)values duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

@end

//@interface UIView (TextSize)
//
//- (CGSize)boundingRectWithSize:(CGSize)size;
//
//@end




