//
//  UIView+RotateAnimation.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  旋转360度动画
 */
@interface UIView (RotateAnimation)

- (void)defaultRotateAnimation;

- (void)rotateAnimationFrom:(CGFloat)fromValue to:(CGFloat)toValue duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;
@end
