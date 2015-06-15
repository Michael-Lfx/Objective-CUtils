@import UIKit;

@interface NSString (Color)

- (UIColor *)color;

@end



@interface NSString (AES)

//+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;
//+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password;

@end


@interface NSString (Bundle)

+ (NSString *)stringFromMainBundleWithFilename:(NSString *)filename;

@end

