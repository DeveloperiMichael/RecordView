//
//  AVPlayerItemManager.h
//  RecordDemo
//
//  Created by 张炯 on 17/6/2.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface AVPlayerManager : NSObject

+ (instancetype)sharedAVPlayerManager;

- (void)playerStart;

- (void)playerStop;

@property (nonatomic, copy) NSString *recordUrlString;

@end
