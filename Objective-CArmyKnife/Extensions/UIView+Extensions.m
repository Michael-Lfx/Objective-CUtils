#import "UIView+Extensions.h"

@implementation UIView(CGRect)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)newX {
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)newY {
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

@end


#pragma mark - CALayer特性实现特殊效果

// 整合自：https://gist.github.com/bobmoff/5967220

@implementation UIView (CALayer)

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGSize)size {
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:size];
    
    CAShapeLayer* maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

@end


#pragma mark - 动画

@implementation UIView (Animation)

#pragma mark 摇晃

- (void)defaultShakeAnimation {
    [self shakeAnimationWithMargin:10 duration:0.20 repeatCount:2];
}

- (void)shakeAnimationWithMargin:(CGFloat)margin duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shakeAnimation.values = @[@0, @(-margin), @(margin), @0];
    shakeAnimation.duration = duration;
    shakeAnimation.repeatCount = repeatCount;
    [self.layer addAnimation:shakeAnimation forKey:@"shakeAnimationWithX"];
}

#pragma mark 旋转

- (void)defaultRotateAnimation {
    [self rotateAnimationFrom:0 to:M_PI * 2 duration:kDuration repeatCount:1];
}

- (void)rotateAnimationFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = [NSNumber numberWithDouble:fromValue];
    rotateAnimation.toValue = [NSNumber numberWithDouble:toValue];
    rotateAnimation.duration = duration;
    rotateAnimation.repeatCount = repeatCount;
    [self.layer addAnimation:rotateAnimation forKey:@"rotation360"];
}

#pragma mark 弹性动画

- (void)defaultBounceAnimation {
    [self bounceAnimationWithValues:@[@1.0, @1.4, @0.9, @1.15, @0.95, @1.02, @1.0] duration:kDuration repeatCount:1];
}

- (void)bounceAnimationWithValues:(NSArray *)values duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0, @1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = duration;
    bounceAnimation.repeatCount = repeatCount;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

@end

//@implementation UILabel (TextSize)
//
//- (CGSize)boundingRectWithSize:(CGSize)size {
//    NSDictionary *attribute = @{NSFontAttributeName: self.font};
//    
//    CGSize retSize = [self.text boundingRectWithSize:size
//                                             options:\
//                      NSStringDrawingTruncatesLastVisibleLine |
//                      NSStringDrawingUsesLineFragmentOrigin |
//                      NSStringDrawingUsesFontLeading
//                                          attributes:attribute
//                                             context:nil].size;
//    
//    return retSize;
//}
//
//
//@end

