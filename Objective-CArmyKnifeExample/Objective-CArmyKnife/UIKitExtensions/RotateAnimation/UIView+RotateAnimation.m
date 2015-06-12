//
//  UIView+RotateAnimation.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "UIView+RotateAnimation.h"

@implementation UIView (RotateAnimation)

- (void)defaultRotateAnimation {
    [self rotateAnimationFrom:0 to:M_PI * 2 duration:0.5 repeatCount:1];
}

- (void)rotateAnimationFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = [NSNumber numberWithDouble:fromValue];
    rotateAnimation.toValue = [NSNumber numberWithDouble:toValue];
    rotateAnimation.duration = duration;
    rotateAnimation.repeatCount = repeatCount;
    [self.layer addAnimation:rotateAnimation forKey:@"rotation360"];
}

@end
