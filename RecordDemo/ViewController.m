//
//  ViewController.m
//  RecordDemo
//
//  Created by 张炯 on 17/6/1.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "ViewController.h"
#import "RecordView.h"
#import "AVPlayerManager.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [NSArray arrayWithObjects:
                      @"http://fjdx.sc.chinaz.com/Files/DownLoad/sound1/201501/5466.mp3",
                      @"http://sc1.111ttt.com/2015/1/06/06/99060941326.mp3",
                      @"http://sc1.111ttt.com/2017/1/05/10/298101027072.mp3",
                      @"http://sc1.111ttt.com/2015/1/06/06/99060941326.mp3",
                      @"http://sc1.111ttt.com/2015/1/06/06/99060941326.mp3",
                      @"http://sc1.111ttt.com/2015/1/06/06/99060941326.mp3",
                      @"http://sc1.111ttt.com/2017/1/05/10/298101027072.mp3",
                      @"http://fjdx.sc.chinaz.com/Files/DownLoad/sound1/201501/5466.mp3",
                      @"http://fjdx.sc.chinaz.com/Files/DownLoad/sound1/201501/5466.mp3",
                      @"http://fjdx.sc.chinaz.com/Files/DownLoad/sound1/201501/5466.mp3", nil];
    
    for (int i = 0; i<10; i++) {
        RecordView *view = [[RecordView alloc] initWithFrame:CGRectMake(20, 80+(50)*i, 0, 0) Seconds:20 viewHeight:40 recordUrl:array[i]];
        [self.view addSubview:view];
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
