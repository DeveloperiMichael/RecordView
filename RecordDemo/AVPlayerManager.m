//
//  AVPlayerItemManager.m
//  RecordDemo
//
//  Created by 张炯 on 17/6/2.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "AVPlayerManager.h"

@interface AVPlayerManager()

@property (nonatomic, strong) AVPlayerItem *playerItem;

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation AVPlayerManager

+ (instancetype)sharedAVPlayerManager {
    static AVPlayerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AVPlayerManager alloc] init];
        
    });
    return manager;
}

- (void)setRecordUrlString:(NSString *)recordUrlString {
    _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:recordUrlString]];
}

- (void)playerStart{
    _player = [AVPlayer playerWithPlayerItem:_playerItem];
    [_player play];
}

- (void)playerStop{
    [_player pause];
}

@end
