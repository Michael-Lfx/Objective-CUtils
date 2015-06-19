#import "CGRect+Convenience.h"

inline CGRect CGRectFromCGSize(CGSize size) {
    return (CGRect){ .origin = CGPointZero, .size = size };
}

inline CGRect CGRectMakeWithCenterAndSize(CGPoint center, CGSize size) {
    return (CGRect){ center.x - size.width * 0.5, center.y - size.height * 0.5, size };
}

inline CGRect CGRectMakeWithOriginAndSize(CGPoint origin, CGSize size) {
    return (CGRect){ .origin = origin, .size = size };
}

inline CGPoint CGRectCenter(CGRect rect) {
    return (CGPoint){ CGRectGetMidX(rect), CGRectGetMidY(rect) };
}
