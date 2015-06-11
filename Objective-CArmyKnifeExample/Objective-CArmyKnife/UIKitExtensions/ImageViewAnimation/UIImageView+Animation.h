@import UIKit;

#ifndef kDuration
#define kDuration (0.5)
#endif

@interface UIImageView (Animation)

#pragma mark FrameAnimation

- (void)defaultFrameAnimationWithImages:(NSArray *)images;
- (void)frameAnimation:(UIImageView *)icon images:(NSArray *)images duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

@end
