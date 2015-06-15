#import "CGRect+Extensions.h"


#pragma mark - 转换方法

// 整合自：https://gist.github.com/aegzorz/5797337

inline CGRect CGRectFromCGSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

inline CGRect CGRectMakeWithCenterAndSize(CGPoint center, CGSize size) {
    return CGRectMake(center.x - size.width * 0.5, center.y - size.height * 0.5, size.width, size.height);
}

inline CGRect CGRectMakeWithOriginAndSize(CGPoint origin, CGSize size) {
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

inline CGPoint CGRectCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}
