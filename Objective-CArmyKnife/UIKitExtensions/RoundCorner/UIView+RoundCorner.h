//
//  UIView+RoundCorner.h
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  CALayer mask属性实现遮罩效果
 
 // 整合自：https://gist.github.com/bobmoff/5967220
 
 */
@interface UIView (RoundCorner)

- (void)setRoundCorners:(UIRectCorner)corners radius:(CGSize)size;

@end
