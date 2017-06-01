//
//  RecoedView.h
//  RecordDemo
//
//  Created by 张炯 on 17/6/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordView : UIView

- (instancetype)initWithSeconds:(NSTimeInterval)recordSeconds
                     viewHeight:(CGFloat)height
                      recordUrl:(NSString *)url;

@end
