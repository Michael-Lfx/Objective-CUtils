//
//  ViewController.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/8/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "ViewController.h"
#import "OCKLoopLoadingView.h"
#import "NavigationBar+Colorful.h"
#import "UIView+BounceAnimation.h"

@interface ViewController ()

@property (strong, nonatomic) OCKLoopLoadingView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *viewForBounceAnimation;
@property (strong, nonatomic) NSString *hello;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    OCKLoopLoadingView *loading = [[OCKLoopLoadingView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:loading];
    self.loadingView = loading;
    
    // 透明
    self.navigationController.navigationBar.soloColor = [UIColor clearColor];
    // 渐变
//    UIColor *topColor = [[UIColor blueColor] colorWithAlphaComponent:1];
//    UIColor *bottomColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
//    self.navigationController.navigationBar.gradientColors = @[topColor, bottomColor];
    self.title = @"我就是测试";
    [self setHello:nil];
    self.hello = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.loadingView setLoopImage:[UIImage imageNamed:@"loading_loop"]];
    [self.loadingView setLogoImage:[UIImage imageNamed:@"loading_monkey"]];
    [self.loadingView startAnimating];
}

- (IBAction)tapBounceAnimationBtn:(id)sender {
    [self.viewForBounceAnimation defaultBounceAnimation];
    [self.loadingView stopAnimating];
}

@end


