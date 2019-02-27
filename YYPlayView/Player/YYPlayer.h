//
//  YYPlayer.h
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YYPlayerStatus) {
    YYPlayerStatus_Preparing,
    YYPlayerStatus_Buffering,
    YYPlayerStatus_BufferComplete,
    YYPlayerStatus_Playing,
    YYPlayerStatus_PlayComplete,
    YYPlayerStatus_PlaybackFailed
};

typedef NS_ENUM(NSUInteger, YYPlayerScreenType) {
    YYPlayerScreenType_Small,
    YYPlayerScreenType_Normal,
    YYPlayerScreenType_Full
};

@interface YYPlayer : NSObject

@property (nonatomic, assign) YYPlayerScreenType  screenType;
@property (nonatomic, assign) YYPlayerStatus      playerStatus;

- (void)playWithUrl:(NSURL *)url;

- (void)playWithVideoPath:(NSString *)videoPath;

- (void)pause;

- (void)play;

- (void)resume;

- (BOOL)isPlaying;

- (void)destruction;


@end

NS_ASSUME_NONNULL_END
