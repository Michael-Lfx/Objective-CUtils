#import "NSString+Extensions.h"


//
//
//#pragma mark - UIColor
//
//#import "UIColor+Extensions.h"
//
//@implementation NSString (Color)
//
//- (UIColor *)color {
//    return [UIColor colorWithHexString:self];
//}
//
//@end




#pragma mark - AES加解密

@implementation NSString (AES)

//+ (NSString *)encrypt:(NSString *)message password:(NSString *)password {
//    NSData *encryptedData = [[message dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptedDataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
//    NSString *base64EncodedString = [NSString base64StringFromData:encryptedData length:[encryptedData length]];
//    return base64EncodedString;
//}
//
//+ (NSString *)decrypt:(NSString *)base64EncodedString password:(NSString *)password {
//    NSData *encryptedData = [NSData base64DataFromString:base64EncodedString];
//    NSData *decryptedData = [encryptedData decryptedAES256DataUsingKey:[[password dataUsingEncoding:NSUTF8StringEncoding] SHA256Hash] error:nil];
//    return [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding];
//}

@end


#pragma mark - NSBundle

@implementation NSString (Bundle)

+ (NSString *)stringFromMainBundleWithFilename:(NSString *)filename {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return text;
}

@end

