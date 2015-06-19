@import UIKit;

/**
 *  创建一个origin = CGPointZero，size为传入size的矩形
 *
 *  @param size 矩形大小
 *
 *  @return 新创建的矩形
 */
OBJC_EXPORT CGRect CGRectFromCGSize(CGSize size);

OBJC_EXPORT CGRect CGRectMakeWithCenterAndSize(CGPoint center, CGSize size);
OBJC_EXPORT CGRect CGRectMakeWithOriginAndSize(CGPoint origin, CGSize size);
OBJC_EXPORT CGPoint CGRectCenter(CGRect rect);
