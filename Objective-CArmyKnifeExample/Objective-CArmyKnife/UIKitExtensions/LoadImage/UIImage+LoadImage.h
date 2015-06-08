#import <UIKit/UIKit.h>

@interface UIImage (LoadImage)

+ (instancetype)loadImageFromMainBundleWithPath:(NSString *)path;

+ (instancetype)loadOriginalImageFromMainBundleWithPath:(NSString *)path;

@end
