#import "CAAnimation+Extensions.h"

#pragma mark - 便捷方法

@implementation CAAnimation (Convenience)

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath values:(NSArray *)values duration:(CFTimeInterval)duration repeatCount:(float)repeatCount {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    animation.values = values;
    animation.duration = duration;
    animation.calculationMode = kCAAnimationCubic;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CFTimeInterval)duration repeatCount:(float)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.fromValue = [NSNumber numberWithDouble:fromValue];
    animation.toValue = [NSNumber numberWithDouble:toValue];
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    return animation;
}

@end
