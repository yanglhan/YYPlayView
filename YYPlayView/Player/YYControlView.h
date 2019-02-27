//
//  YYControlView.h
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "YYSliderView.h"
@class YYControlView;

NS_ASSUME_NONNULL_BEGIN

@protocol YYControlViewDelegate <NSObject>

- (void)playViewPlayDidClick:(YYControlView *)view;

- (void)playViewReturnBackDidClick:(YYControlView *)view;

- (void)playViewNormolScreenDidClick:(YYControlView *)view;

- (void)playViewFullScrrenDidClick:(YYControlView *)view;

- (void)playViewMoreSetDidClick:(YYControlView *)view;

- (void)PlayViewSliderViewMoved:(YYControlView *)view;


@end

@interface YYControlView : UIView

@property (nonatomic,   weak) id<YYControlViewDelegate>delegate;
@property (nonatomic, strong) YYSliderView  *sliderView;

@end

NS_ASSUME_NONNULL_END
