                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  //
//  AVPlayerItemManager.m
//  RecordDemo
//
//  Created by 张炯 on 17/6/2.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "AVPlayerManager.h"

@interface AVPlayerManager()



@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) RecordView *playInView;

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

- (void)setPlayerItem:(AVPlayerItem *)playerItem {
    _playerItem = playerItem;
}

- (void)playerStartInView:(RecordView *)view{
    
    if (_playInView == nil) {
        _playInView = view;
    }else{
        if (_playInView != view) {
            _playInView.isPlaying = NO;
            [_playInView.statusImageView stopAnimating];
        }
        
        _playInView = view;
    }
    
    if (_playerItem==nil) {
        NSLog(@"请设置AVPlayerManager的_playerItem");
        return;
    }
    
    _player = [AVPlayer playerWithPlayerItem:_playerItem];
    [_player play];
    self.isPlaying = YES;
}

- (void)playerStopInView:(RecordView *)view{
    [_player pause];
    _playerItem = nil;
    _player = nil;
    self.isPlaying = NO;
}

@end
