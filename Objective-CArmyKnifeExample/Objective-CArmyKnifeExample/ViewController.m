//
//  ViewController.m
//  Objective-CArmyKnifeExample
//
//  Created by Michael on 6/8/15.
//  Copyright (c) 2015 Michael-lfx. All rights reserved.
//

#import "ViewController.h"
#import "LoopLoadingView.h"
#import "NavigationBar+Transparency.h"

@interface ViewController ()

@property (strong, nonatomic) LoopLoadingView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LoopLoadingView *loading = [[LoopLoadingView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    [self.view addSubview:loading];
    self.loadingView = loading;
    

    self.navigationController.navigationBar.soloColor = [UIColor clearColor];

//    UIColor *topColor = [[UIColor blueColor] colorWithAlphaComponent:1];
//    UIColor *bottomColor = [[UIColor blueColor] colorWithAlphaComponent:0.2];
//    self.navigationController.navigationBar.gradientColors = @[topColor, bottomColor];
    self.title = @"我就是测试";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.loadingView setLoopImage:[UIImage imageNamed:@"loading_loop"]];
    [self.loadingView setLogoImage:[UIImage imageNamed:@"loading_monkey"]];
    [self.loadingView startAnimating];
}

@end


