//
//  YYLaunchViewController.m
//  YYPlayView
//
//  Created by etz on 2019/2/20.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYLaunchViewController.h"
#import "YYPlayerViewController.h"

@interface YYLaunchViewController ()

@end

@implementation YYLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    [self openPlayerView];
}

- (void)openPlayerView {
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window]
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        BOOL oldState = [UIView areAnimationsEnabled];
                        [UIView setAnimationsEnabled:NO];
                        [UIApplication sharedApplication].delegate.window.rootViewController
                        = [[YYPlayerViewController alloc] init];
                        [UIView setAnimationsEnabled:oldState];
                    }
                    completion:NULL];
}

@end
