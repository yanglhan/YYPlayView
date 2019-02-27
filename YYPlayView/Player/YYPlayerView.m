//
//  YYPlayerView.m
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYPlayerView.h"
#import <Masonry.h>
#import "YYControlView.h"
#import "YYPlayer.h"


@interface YYPlayerView ()
<YYControlViewDelegate>

@property (nonatomic, strong) YYControlView  *controlView;
@property (nonatomic, strong) YYPlayer       *player;
@property (nonatomic, strong) UIButton       *playButton;

@end

@implementation YYPlayerView

- (instancetype)init {
    if (self = [super init]) {
        [self initSubViews];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)dealloc {
    
}

- (void)initSubViews {
    self.controlView = ({
        YYControlView *v = [[YYControlView alloc] init];
        [self addSubview:v];
        v.delegate = self;
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        v;
    });
    
    self.playButton = ({
        UIButton *v = [[UIButton alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.size.mas_offset(CGSizeMake(60, 60));
        }];
        [v addTarget:self action:@selector(videoPlayDidClick:) forControlEvents:UIControlEventTouchUpInside];
        v;
    });
}

#pragma mark - private

- (void)videoPlayDidClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        [self play];
    } else {
        [self puase];
    }
}

#pragma mark - public

- (void)playWithUrl:(NSURL *)url {
    
}

- (void)playWithVideoPath:(NSString *)videoPath {
    
}

- (void)play {
    
}

- (void)puase {
    
}

- (void)destruction {
    
}

#pragma mark - NSNotification


#pragma mark - KVO

#pragma mark - YYControlViewDelegate

- (void)playViewPlayDidClick:(YYControlView *)view {
    
}

- (void)playViewReturnBackDidClick:(YYControlView *)view {
    
}

- (void)playViewNormolScreenDidClick:(YYControlView *)view {
    
}

- (void)playViewFullScrrenDidClick:(YYControlView *)view {
    
}

- (void)playViewMoreSetDidClick:(YYControlView *)view {
    
}

- (void)PlayViewSliderViewMoved:(YYControlView *)view {
    
}




@end
