//
//  RecoedView.h
//  RecordDemo
//
//  Created by 张炯 on 17/6/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                      Seconds:(NSInteger)recordSeconds
                   viewHeight:(CGFloat)height
                    recordUrl:(NSString *)url;


- (void)startPlay;

- (void)stopPlay;

//playing status
@property (nonatomic, strong) UIImageView *statusImageView;

@property (nonatomic, assign) BOOL isPlaying;

@end
