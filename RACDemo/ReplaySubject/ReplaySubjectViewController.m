//
//  ReplaySubjectViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "ReplaySubjectViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@implementation ReplaySubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
    // 1.创建信号
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    // 2.订阅信号
    [subject subscribeNext:^(id x) {
        
        NSLog(@"第一个订阅者%@",x);
    }];
    
    // 3.发送信号
    [subject sendNext:@1];
    
    [subject sendNext:@2];
    
    [subject subscribeNext:^(id x) {
        
        NSLog(@"第二个订阅者%@",x);
    }];
}

@end
