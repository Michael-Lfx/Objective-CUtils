@import UIKit;

/**
 *  创建一个origin = CGPointZero，size为传入size的矩形
 *
 *  @param size 矩形大小
 *
 *  @return 新建的矩形
 */
OBJC_EXPORT CGRect CGRectFromCGSize(CGSize size);

/**
 *  根据中心点及大小创建矩形
 *
 *  @param center 中心点坐标
 *  @param size   大小
 *
 *  @return 新建的矩形
 */
OBJC_EXPORT CGRect CGRectMakeWithCenterAndSize(CGPoint center, CGSize size);

/**
 *  通过起点坐标及大小创建矩形
 *
 *  @param origin 起点坐标
 *  @param size   大小
 *
 *  @return 新建的矩形
 */
OBJC_EXPORT CGRect CGRectMakeWithOriginAndSize(CGPoint origin, CGSize size);

/**
 *  返回矩形中心点坐标
 *
 *  @param rect 矩形
 *
 *  @return 中心点坐标
 */
OBJC_EXPORT CGPoint CGRectCenter(CGRect rect);
