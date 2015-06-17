//
//  WMCountDownLabel.m
//  WMObjCsWorld
//
//  Created by maginawin on 15/6/17.
//  Copyright (c) 2015年 wendong wang. All rights reserved.
//

#import "WMCountDownLabel.h"
#import "AppDelegate.h"

@interface WMCountDownLabel()

@property (nonatomic) NSInteger seconds;

@property (strong, nonatomic) NSTimer* countTimer;

@property (nonatomic) BOOL isStarting;
@property (nonatomic) NSInteger remainSeconds;
@property (nonatomic) NSDate* dateEnterBackground;

@end

@implementation WMCountDownLabel

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultValues];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupDefaultValues];
}

#pragma mark - Out methods

- (void)setupCountDownSeconds:(NSInteger)seconds {
    _seconds = seconds;
    _remainSeconds = _seconds;
    
    [self showLabelTextWithSeconds:_seconds];
}

- (void)start {
    if (!_isStarting) {
        _isStarting = YES;
        
        [self handleCountDown];
        
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handleCountDown) userInfo:nil repeats:YES];
        
        @try {
            [_delegate countDownLabelStart:self.tag];
        }
        @catch (NSException *exception) {
            NSLog(@"delegate countDownLabelStart exception : %@", exception);
        }
        @finally {
            
        }
    }
}

- (void)stop {
    _isStarting = NO;
    
    _remainSeconds = _seconds;
    [self showLabelTextWithSeconds:_seconds];
    
    if (_countTimer.isValid) {
        [_countTimer invalidate];
        _countTimer = nil;
    }
    
    @try {
        [_delegate countDownLabelStop:self.tag];
    }
    @catch (NSException *exception) {
        NSLog(@"delegate countDownLabelStop exception : %@", exception);
    }
    @finally {

    }
}

- (void)pause {
    
}

#pragma mark - Assistor

/**
 * @brief 初始化, 默认值与视图, 配置等
 */
- (void)setupDefaultValues {
    [self setupNotificationForEnterBackground];
    
    _isStarting = NO;
    _seconds = 30;
    _remainSeconds = _seconds;
    
    [self showLabelTextWithSeconds:_seconds];
    
    _countTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(handleCountDown) userInfo:nil repeats:YES];
}

/**
 * @brief 添加后台监听, 即后台支持
 */
- (void)setupNotificationForEnterBackground {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification *note) {
        _dateEnterBackground = [NSDate date];
    }];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification *note) {
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:_dateEnterBackground];
        if (_isStarting) {
            _remainSeconds -= timeInterval;
        }
    }];
}

/**
 * @brief 倒计时每秒减 1 秒, 作用于 mTimer<NSTimer>
 */
- (void)handleCountDown {
    if (!_isStarting) {
        [self showLabelTextWithSeconds:_seconds];
        return;
    }
    
    // 自然结束
    if (_remainSeconds <= 0) {
        [self stop];
        return;
    }
    
    [self showLabelTextWithSeconds:_remainSeconds];
    
    _remainSeconds--;
}

/**
 * @brief 根据传入的秒数来改变 Label.text, 暂时只支持 mm : ss 格式, 所以不要超过 99 分钟
 * @param seconds : 需要显示的秒数
 */
- (void)showLabelTextWithSeconds:(NSInteger)seconds {
    NSString* minString, * secondString;
    
    NSInteger min = seconds / 60;
    if (min < 10) {
        minString = [NSString stringWithFormat:@"0%d", min];
    } else {
        minString = [NSString stringWithFormat:@"%d", min];
    }
    
    NSInteger second = seconds % 60;
    if (second < 10) {
        secondString = [NSString stringWithFormat:@"0%d", second];
    } else {
        secondString = [NSString stringWithFormat:@"%d", second];
    }
    
    NSString* time = [NSString stringWithFormat:@"%@ : %@", minString, secondString];
    
    self.text = time;
}

@end
