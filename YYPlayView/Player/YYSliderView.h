//
//  YYSliderView.h
//  YYPlayView
//
//  Created by etz on 2019/2/27.
//  Copyright © 2019年 alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYSliderView : UIView

@property (nonatomic, assign) CGFloat progress;

- (void)playMovProgressBar:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
