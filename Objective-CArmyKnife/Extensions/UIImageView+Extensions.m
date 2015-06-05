#import "UIImageView+Extensions.h"
#import "UIView+Extensions.h"

@implementation UIImageView (Animation)

#pragma mark FrameAnimation

- (void)defaultFrameAnimationWithImages:(NSArray *)images {
    [self frameAnimation:self images:images duration:kDuration repeatCount:1];
}

- (void)frameAnimation:(UIImageView *)icon images:(NSArray *)images duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    frameAnimation.calculationMode = kCAAnimationDiscrete;
    frameAnimation.duration = duration;
    frameAnimation.values = images;
    frameAnimation.repeatCount = 1;
    frameAnimation.removedOnCompletion = false;
    frameAnimation.fillMode = kCAFillModeForwards;
    [icon.layer addAnimation:frameAnimation forKey:@"frameAnimation"];
}

@end
