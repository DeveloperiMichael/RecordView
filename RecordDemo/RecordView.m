//
//  RecoedView.m
//  RecordDemo
//
//  Created by 张炯 on 17/6/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "RecordView.h"
#import "AVPlayerManager.h"
@interface RecordView() {
    AVPlayerManager *manager;
}

//录音时间
@property (nonatomic, assign) NSTimeInterval recordSeconds;
//view高度
@property (nonatomic, assign) CGFloat viewHeight;
//语音资源url
@property (nonatomic, copy) NSString *recordUrl;
//最长录音时间
@property (nonatomic, assign)NSTimeInterval maxRecordSeconds;
//view最大宽度
@property (nonatomic, assign) CGFloat maxViewWidth;
//录音时间label
@property (nonatomic, strong) UILabel *timeLabel;
//playing status
@property (nonatomic, strong) UIImageView *statusImageView;
//statusImageView iamgeArray
@property (nonatomic, strong) NSMutableArray *animationImages;


@end


@implementation RecordView

- (instancetype)initWithFrame:(CGRect)frame
                      Seconds:(NSInteger)recordSeconds
                   viewHeight:(CGFloat)height
                    recordUrl:(NSString *)url{
    self = [super initWithFrame:frame];
    if (self) {
        manager = [AVPlayerManager sharedAVPlayerManager];
        _recordSeconds = recordSeconds;
        _viewHeight = height>30?height:30;
        _recordUrl = url;
        _maxViewWidth = [[UIScreen mainScreen] bounds].size.width - 18*2;
        _maxRecordSeconds = 60;
        
        [self initRecordView];
    }
    
    return self;
}


- (void)initRecordView {
    CGFloat viewWidth = ((_recordSeconds/_maxRecordSeconds)>1.0?1.0:(_recordSeconds/_maxRecordSeconds))*_maxViewWidth;
    CGFloat width = viewWidth>80?viewWidth:80;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, _viewHeight);
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:232/255.0 blue:208/255.0 alpha:1];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithRed:112/255.0 green:107/255.0 blue:90/255.0 alpha:1].CGColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height*0.5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerAction)];
    [self addGestureRecognizer:tap];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, _viewHeight)];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.text = [NSString stringWithFormat:@"%ld\"",(long)_recordSeconds];
    [self addSubview:_timeLabel];
    
    _statusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-30, (self.frame.size.height-20)*0.5, 20, 20)];
    _statusImageView.image = [UIImage imageNamed:@"zuoye_icon_record3"];
    _statusImageView.animationDuration = 1;
    _statusImageView.animationImages = self.animationImages;
    [self addSubview:_statusImageView];

}

- (void)prepareAnimationImages {
    NSInteger imageCount = 4;
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ImageSource" ofType:@"bundle"];
    NSString *imageGroupPath = [bundlePath stringByAppendingPathComponent:@"statusImage"];
    for (int i=1; i<imageCount; i++) {
        NSString *path = [imageGroupPath stringByAppendingPathComponent:[NSString stringWithFormat:@"zuoye_icon_record%d.png",i]];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [self.animationImages addObject:image];
    }
}

- (void)tapRecognizerAction{
    _isPlaying = !_isPlaying;
    if (_isPlaying) {
        [self startPlay];
    }else{
        [self stopPlay];
    }
}

- (NSMutableArray *)animationImages {
    if (!_animationImages) {
        _animationImages = [NSMutableArray array];
        [self prepareAnimationImages];
    }
    return _animationImages;
}


- (void)startPlay{
    [_statusImageView startAnimating];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(playItemDidReachEnd:)
                                                name:AVPlayerItemDidPlayToEndTimeNotification
                                              object:_recordUrl];
    manager.recordUrlString = _recordUrl;
    [manager playerStart];
    
    
    
    
}

- (void)stopPlay{
    [_statusImageView stopAnimating];
    [manager playerStop];
}

- (void)playItemDidReachEnd:(NSNotification *)noti{
    [_statusImageView stopAnimating];
}



@end
