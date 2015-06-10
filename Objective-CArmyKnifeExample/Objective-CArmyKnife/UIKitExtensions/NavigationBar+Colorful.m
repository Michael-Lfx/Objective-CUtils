#import "NavigationBar+Colorful.h"
#import <objc/runtime.h>

@implementation UINavigationBar (Colorful)

#pragma mark - 公开接口

static const char *kSoloColorKey = "kSoloColorKey";

- (void)setSoloColor:(UIColor *)soloColor {
    objc_setAssociatedObject(self, &kSoloColorKey, soloColor, OBJC_ASSOCIATION_RETAIN);
    UIImage *image = [self imageWithColorConstructBlock:^(CGRect *rect) {
        [soloColor setFill];
        UIRectFill(*rect);
    }];
    [self updateNavigationBarWithImage:image];
}

- (UIColor *)soloColor {
    return (UIColor *)objc_getAssociatedObject(self, &kSoloColorKey);
}

static const char *kGradientColorsKey = "kGradientColorsKey";
#define kEndPoint 1.5

- (void)setGradientColors:(NSArray *)gradientColors {
    objc_setAssociatedObject(self, &kGradientColorsKey, gradientColors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UIImage *image = [self imageWithColorConstructBlock:^(CGRect *rect) {
        CFMutableArrayRef colors = CFArrayCreateMutable(CFAllocatorGetDefault(), gradientColors.count, nil);
        for (UIColor *color in gradientColors) {
            CFArrayAppendValue(colors, color.CGColor);
        }
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGFloat locations[] = { 0.0, 1.0 };
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, colors, locations);
        CGPoint startPoint = CGPointMake(rect->size.width / 2, 0);
        CGPoint endPoint = CGPointMake(rect->size.width / 2, rect->size.height / kEndPoint);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGContextAddRect(context, *rect);
        CGContextClip(context);
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation);
        CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
        CGContextRestoreGState(context);
        if (colors) {
            CFRelease(colors);
        }
    }];
    [self updateNavigationBarWithImage:image];
}

- (NSArray *)gradientColors {
    return (NSArray *)objc_getAssociatedObject(self, &kGradientColorsKey);
}

#pragma mark - 私有接口

- (UIImage *)imageWithColorConstructBlock:(void (^)(CGRect *rect))block {
    __block UIImage *image = nil;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGRect rect = CGRectMake(0, 0, 1, 1);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO/*透明*/, 0/*device’s main screen*/);
        block(&rect);
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    });
    
    return image;
}

- (void)updateNavigationBarWithImage:(UIImage *)image {
    // setShadowImage:需要setBackgroundImage:forBarMetrics:配合
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = [UIImage new];   // 清除导航栏最下面那条线，它起到分割导航栏与下面控件内容的作用。
}

@end
