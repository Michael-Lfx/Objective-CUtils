//
//  UIView+ShakeAnimation.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShakeAnimation)

- (void)defaultShakeAnimation;

- (void)shakeAnimationWithMargin:(CGFloat)margin duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

@end
