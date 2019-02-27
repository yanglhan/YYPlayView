//
//  YYPlayerView.h
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYPlayer.h"
@class YYPlayerView;

NS_ASSUME_NONNULL_BEGIN

@protocol YYPlayerViewDelegate <NSObject>

- (void)playerViewPlayStart:(YYPlayerView *)playerView;

- (void)playerViewPlayFailure:(YYPlayerView *)playerView;

- (void)playerViewPlayComplete:(YYPlayerView *)playerView;

- (void)playerViewPlayWithScreenType:(YYPlayerScreenType)type;


@end

@interface YYPlayerView : UIView

- (void)playWithUrl:(NSURL *)url;

- (void)playWithVideoPath:(NSString *)videoPath;

- (void)play;

- (void)puase;

- (void)destruction;

@end

NS_ASSUME_NONNULL_END
