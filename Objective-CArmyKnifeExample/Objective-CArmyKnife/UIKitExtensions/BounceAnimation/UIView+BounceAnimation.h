//
//  UIView+BounceAnimation.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  弹性动画
 */
@interface UIView (BounceAnimation)

- (void)defaultBounceAnimation;
- (void)bounceAnimationWithValues:(NSArray *)values duration:(CGFloat)duration repeatCount:(CGFloat)repeatCount;

@end
