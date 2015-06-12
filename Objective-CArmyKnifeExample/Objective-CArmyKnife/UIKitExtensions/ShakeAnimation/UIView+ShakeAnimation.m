//
//  UIView+ShakeAnimation.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "UIView+ShakeAnimation.h"

@implementation UIView (ShakeAnimation)

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

@end
