//
//  AVPlayerItemManager.h
//  RecordDemo
//
//  Created by 张炯 on 17/6/2.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "RecordView.h"

@interface AVPlayerManager : NSObject

+ (instancetype)sharedAVPlayerManager;

- (void)playerStartInView:(RecordView *)view;

- (void)playerStop;

@property (nonatomic, copy) NSString *recordUrlString;

@property (nonatomic, assign) BOOL isPlaying;

@end
