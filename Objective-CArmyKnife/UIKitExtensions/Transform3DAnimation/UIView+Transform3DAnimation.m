//
//  UIView+Transform3DAnimation.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/12/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "UIView+Transform3DAnimation.h"

@implementation UIView (Transform3DAnimation)

- (instancetype)transform3DAnimation {
    CATransform3D transform;
    transform = CATransform3DMakeRotation( (90.0 * M_PI) / 180, 0.0, 0.7, 0.4);
    transform.m34 = 1.0/ -600;
    
    self.layer.shadowColor = [[UIColor blackColor]CGColor];
    self.layer.shadowOffset = CGSizeMake(10, 10);
    self.alpha = 0;
    
    self.layer.transform = transform;
    self.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DIdentity;
        self.alpha = 1;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        
    }];
    
    return self;
}

@end
