#import "OCKLoopLoadingView.h"

@interface OCKLoopLoadingView ()

/**
 *  外圈旋转图标
 */
@property (weak, nonatomic, readonly) UIImageView *loopImageView;

/**
 *  内圈LOGO图标
 */
@property (weak, nonatomic, readonly) UIImageView *logoImageView;

/**
 *  默认值0度
 */
@property (nonatomic, assign) CGFloat loopAngle;

/**
 *  默认值1.0，完全不透明
 */
@property (nonatomic, assign) CGFloat logoAlpha;

/**
 *  默认值360/3 = 120度
 */
@property (nonatomic, assign) CGFloat angleStep;

/**
 *  步进：默认值1.0/3.0
 */
@property (nonatomic, assign) CGFloat alphaStep;

/**
 *  默认值 NO
 */
@property (assign, nonatomic, readwrite) BOOL loading;

@end

@implementation OCKLoopLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _loopImageView = [self buildImageView];
        _logoImageView = [self buildImageView];
        
        _loopAngle = 0.0;
        _logoAlpha = 1.0;
        _angleStep = 360/3;
        _alphaStep = 1.0/3.0;
        _loading = NO;
    }
    return self;
}

- (UIImageView *)buildImageView {
    UIImageView *imageView = [UIImageView new];
    imageView.center = self.center;
    [self addSubview:imageView];
    [self makeCenterEqualLayoutConstraintForView:imageView];
    return imageView;
}

- (void)makeCenterEqualLayoutConstraintForView:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = false;
    [self makeCenterEqualLayoutConstraintForView:view attribute:NSLayoutAttributeCenterX];
    [self makeCenterEqualLayoutConstraintForView:view attribute:NSLayoutAttributeCenterY];
}

- (void)makeCenterEqualLayoutConstraintForView:(UIView *)view attribute:(NSLayoutAttribute)attr{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:attr
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:attr
                                                                 multiplier:1
                                                                   constant:0];
    [self addConstraint:constraint];
}

- (void)loadingAnimation{
    static CGFloat duration = 0.25f;
    self.loopAngle += self.angleStep;
    if (self.logoAlpha <= 0.0 || self.logoAlpha >= 1.0 ) {
        self.alphaStep = -self.alphaStep;
    }
    self.logoAlpha += self.alphaStep;
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self updateLoopAngleTransform];
    } completion:^(BOOL finished) {
        if (self.isLoading && [self superview] != nil) {
            [self loadingAnimation];
        } else {
            [self removeFromSuperview];
            
            self.loopAngle = 0.0;
            self.logoAlpha = 0;
            self.alphaStep = ABS(self.alphaStep);
            [self updateLoopAngleTransform];
        }
    }];
}

- (void)updateLoopAngleTransform {
    CGAffineTransform loopAngleTransform = CGAffineTransformMakeRotation(self.loopAngle * (M_PI / 180.0f));
    self.loopImageView.transform = loopAngleTransform;
    self.logoImageView.alpha = self.logoAlpha;
}

#pragma mark - 分开接口

- (void)startAnimating{
    self.hidden = NO;
    if (self.isLoading) {
        return;
    }
    self.loading = YES;
    [self loadingAnimation];
}

- (void)stopAnimating{
    self.hidden = YES;
    self.loading = NO;
}

- (void)setLoopImage:(UIImage *)image {
    self.loopImageView.image = image;
}

- (void)setLogoImage:(UIImage *)image {
    self.logoImageView.image = image;
}

@end
