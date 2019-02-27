//
//  YYControlView.m
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYControlView.h"
#import <Masonry.h>

@interface YYControlView ()

/**上面隐藏视图*/
@property (nonatomic, strong) UIView   *topView;
@property (nonatomic, strong) UIView   *bottonView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *screenButton;
@property (nonatomic, strong) UIButton *returnButton;
@property (nonatomic, strong) UIButton *moreSetButton;
@property (nonatomic, strong) UILabel  *leftTimeLabel;
@property (nonatomic, strong) UILabel  *rightTimeLabel;

@end

@implementation YYControlView

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    /** 上面一个返回按钮一个更多设置按钮*/
    self.topView = ({
        UIView *v = [[UIView alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self);
            make.height.mas_offset(60);
        }];
        v;
    });
    
    self.returnButton = ({
        UIButton *v = [[UIButton alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.topView.mas_centerY);
            make.left.mas_equalTo(self.topView.mas_left).offset(10);
            make.size.mas_offset(CGSizeMake(40, 40));
        }];
        [v addTarget:self action:@selector(backDidClick:) forControlEvents:UIControlEventTouchUpInside];
        v;
    });
    
    self.moreSetButton = ({
        UIButton *v = [[UIButton alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.topView.mas_centerY);
            make.right.mas_equalTo(self.topView.mas_right).offset(-10);
            make.size.mas_offset(CGSizeMake(40, 40));
        }];
        [v addTarget:self action:@selector(moreSetDidClick:) forControlEvents:UIControlEventTouchUpInside];
        v;
    });
    
    /** 上面一个播放按钮，一个屏幕设置按钮，一个进度条，时间线*/
    self.bottonView = ({
        UIView *v = [[UIView alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(self);
            make.height.mas_offset(60);
        }];
        v;
    });
    
    self.playButton = ({
        UIButton *v = [[UIButton alloc] init];
        [self.bottonView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bottonView.mas_left).offset(10);
            make.centerY.mas_equalTo(self.bottonView.mas_centerY);
            make.size.mas_offset(CGSizeMake(40, 40));
        }];
        [v addTarget:self action:@selector(playDidClick:) forControlEvents:UIControlEventTouchUpInside];
        v;
    });
    
    self.leftTimeLabel  = ({
        UILabel *v = [[UILabel alloc] init];
        [self.bottonView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playButton.mas_left).offset(10);
            make.centerY.mas_equalTo(self.bottonView.mas_centerY);
            make.size.mas_offset(CGSizeMake(60, 24));
        }];
        v;
    });
    
    /** sliderView 上加一个滑动手势*/
    self.sliderView = ({
        YYSliderView *v = [[YYSliderView alloc] init];
        [self.bottonView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.bottonView.mas_centerY);
            make.centerX.mas_equalTo(self.bottonView.mas_centerX);
            make.left.mas_equalTo(self.leftTimeLabel.mas_left).offset(10);
        }];
        v;
    });
    
    self.rightTimeLabel = ({
        UILabel *v = [[UILabel alloc] init];
        [self.bottonView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.sliderView.mas_right).offset(10);
            make.centerY.mas_equalTo(self.bottonView.mas_centerY);
            make.size.mas_offset(CGSizeMake(60, 24));
        }];
        v;
    });
    
    self.screenButton = ({
        UIButton *v = [[UIButton alloc] init];
        [self.bottonView addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.bottonView.mas_right).offset(-10);
            make.centerY.mas_equalTo(self.bottonView.mas_centerY);
            make.size.mas_offset(CGSizeMake(40, 40));
        }];
        [v addTarget:self action:@selector(fullScrrenDidClick:) forControlEvents:UIControlEventTouchUpInside];
        v;
    });
}

#pragma mark - click action method

- (void)playDidClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(playViewPlayDidClick:)]) {
        [self.delegate playViewPlayDidClick:self];
    }
}

- (void)backDidClick:(UIButton *)button {
    if (self.topView.frame.size.height < self.window.frame.size.height) {
        /** 退出*/
        if ([self.delegate respondsToSelector:@selector(playViewReturnBackDidClick:)]) {
            [self.delegate playViewReturnBackDidClick:self];
        }
    } else {
        /** 回到小屏幕*/
        if ([self.delegate respondsToSelector:@selector(playViewNormolScreenDidClick:)]) {
            [self.delegate playViewNormolScreenDidClick:self];
        }
    }
}

- (void)moreSetDidClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(playViewMoreSetDidClick:)]) {
        [self.delegate playViewMoreSetDidClick:self];
    }
}

- (void)fullScrrenDidClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(fullScrrenDidClick:)]) {
        [self.delegate playViewFullScrrenDidClick:self];
    }
}


@end
