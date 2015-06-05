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


@interface UIView (Animation)

- (void)defaultShakeAnimation;
- (void)shakeAnimationWithMargin:(CGFloat)margin duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

@end

//@interface UIView (TextSize)
//
//- (CGSize)boundingRectWithSize:(CGSize)size;
//
//@end




