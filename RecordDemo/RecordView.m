//
//  RecoedView.m
//  RecordDemo
//
//  Created by 张炯 on 17/6/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "RecordView.h"

@interface RecordView() {
    
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


@end


@implementation RecordView

- (instancetype)initWithSeconds:(NSTimeInterval)recordSeconds
                     viewHeight:(CGFloat)height
                      recordUrl:(NSString *)url{
    self = [super init];
    if (self) {
        _recordSeconds = recordSeconds;
        _viewHeight = height;
        _recordUrl = url;
        _maxViewWidth = [[UIScreen mainScreen] bounds].size.width - 18*2;
        _maxRecordSeconds = 60;
        
        
    }
    
    return self;
}


- (void)drawRecordView {
    CGFloat viewWidth = (_recordSeconds/_maxRecordSeconds)*_maxViewWidth;
}

@end
