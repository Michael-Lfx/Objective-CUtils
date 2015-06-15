//
//  UIView+BounceAnimation.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "UIView+BounceAnimation.h"

@implementation UIView (BounceAnimation)

- (void)defaultBounceAnimation {
    [self bounceAnimationWithValues:@[@1.0, @1.4, @0.9, @1.15, @0.95, @1.02, @1.0] duration:0.5 repeatCount:1];
}

- (void)bounceAnimationWithValues:(NSArray *)values duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = values;
    bounceAnimation.duration = duration;
    bounceAnimation.repeatCount = repeatCount;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

@end
