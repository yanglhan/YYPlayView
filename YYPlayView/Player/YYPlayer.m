//
//  YYPlayer.m
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import "YYPlayer.h"

@interface YYPlayer ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation YYPlayer

- (void)initPlayer:(NSURL *)url {
    self.player = [[AVPlayer alloc] initWithURL:url];
}

#pragma mark - pubic

- (instancetype)initWithUrl:(NSURL *)url {
    if (self = [super init]) {
        [self initPlayer:url];
    }
    return self;
}

- (void)play {
    [self.player play];
}

- (void)pause {
    [self.player pause];
}

- (void)destruction {
    [self.player removeTimeObserver:self];
    self.player = nil;
}

@end
