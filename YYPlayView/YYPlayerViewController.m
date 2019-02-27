//
//  YYPlayerViewController.m
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYPlayerViewController.h"
#import "YYPlayerView.h"
#import <Masonry.h>

@interface YYPlayerViewController ()
<YYPlayerViewDelegate>

@property (nonatomic, strong) YYPlayerView *playerView;

@end

@implementation YYPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self initSubViews];
}

- (void)initSubViews {
    self.playerView = ({
        YYPlayerView *v = [[YYPlayerView alloc] init];
        v.delegate = self;
        [self.view addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.view);
            make.size.mas_offset(260);
        }];
        v;
    });
}

#pragma mark -

- (void)playerViewPlayStart:(YYPlayerView *)playerView {
    [self.playerView play];
}

- (void)playerViewPlayFailure:(YYPlayerView *)playerView {
    [self.playerView puase];
}

- (void)playerViewPlayComplete:(YYPlayerView *)playerView {
    [self.playerView puase];
}

- (void)playerViewPlayWithScreenType:(YYPlayerScreenType)type {
    if (type == YYPlayerScreenType_Normal) {
        // 退出全屏
    } else if (type == YYPlayerScreenType_Full){
        // 进入全屏
    }
}

@end
