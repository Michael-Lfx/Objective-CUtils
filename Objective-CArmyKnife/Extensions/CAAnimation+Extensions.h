@import UIKit;

@interface CAAnimation (Convenience)

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath values:(NSArray *)values duration:(CFTimeInterval)duration repeatCount:(float)repeatCount;

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CFTimeInterval)duration repeatCount:(float)repeatCount;

@end

