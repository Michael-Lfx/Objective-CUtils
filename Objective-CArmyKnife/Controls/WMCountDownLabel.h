//
//  WMCountDownLabel.h
//  WMObjCsWorld
//
//  Created by maginawin on 15/6/17.
//  Copyright (c) 2015年 wendong wang. All rights reserved.
//

/// 支持倒计时的 UILabel, 可以拖控件用, 也可以代码初始化, 在后台继续倒计 (伪)
/// 使用例子:
/// [_countDownLabel setupCountDownSeconds:888];
/// [_countDownLabel start];
/// [_countDownLabel stop];
/// warning : 暂时最高支持 99 分钟 59 秒, 小时还未写, 有空补上

#import <UIKit/UIKit.h>

@protocol WMCountDownLabelDelegate <NSObject>

@optional

/**
 * @brief 倒计时开始
 * @param mTag : count down label's tag
 */
- (void)countDownLabelStart:(NSInteger)mTag;

/**
 * @brief 倒计时结束
 * @param mTag : count down label's tag
 */
- (void)countDownLabelStop:(NSInteger)mTag;

@end

@interface WMCountDownLabel : UILabel

@property (weak, nonatomic) id<WMCountDownLabelDelegate> delegate;

/**
 * @brief 设置倒计时的倒计时间, 建议在未 start 的情况下设置
 *　@param seconds : 倒计时间, 不要超过 99 分钟, 小时的还没有实现, 有空再来写
 */
- (void)setupCountDownSeconds:(NSInteger)seconds;

/**
 * @brief 开始倒计时
 */
- (void)start;

/**
 * @brief 结束倒计时
 */
- (void)stop;

@end
