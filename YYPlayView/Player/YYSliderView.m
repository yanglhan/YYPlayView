//
//  YYSliderView.m
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYSliderView.h"
#import <Masonry.h>

@interface YYSliderView ()

@property (nonatomic, strong) UIProgressView  *progressView;

@end

@implementation YYSliderView

- (instancetype)init {
    if (self = [super init]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    self.progressView = ({
        UIProgressView *v = [[UIProgressView alloc] init];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        v;
    });
}

#pragma mark - setter

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    /** slider 播放到当前的位置*/
    self.progressView.progress = progress;
}

- (void)playMovProgressBar:(CGFloat)progress {
    self.progressView.progress = self.progress + progress;
}


@end
