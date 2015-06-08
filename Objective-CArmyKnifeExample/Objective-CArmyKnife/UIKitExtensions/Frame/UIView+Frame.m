#import "UIView+Frame.h"


@implementation UIView (Frame)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)newX {
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)newY {
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

@end
