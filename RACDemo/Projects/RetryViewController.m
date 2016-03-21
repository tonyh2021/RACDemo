//
//  RetryViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "RetryViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface RetryViewController ()

@property (nonatomic, strong) RACSignal *signal;


@end

@implementation RetryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
#pragma mark - retry
//    __block int i = 0;
//    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        if (i == 5) {
//            [subscriber sendNext:@1];
//        } else {
//            NSLog(@"接收到错误");
//            [subscriber sendError:nil];
//        }
//        i++;
//        return nil;
//        
//    }] retry] subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x);
//        
//    } error:^(NSError *error) {
//        
//    }];

    
#pragma mark - replay
//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        [subscriber sendNext:@1];
//        [subscriber sendNext:@2];
//        
//        return nil;
//    }] replay];
//    
//    [signal subscribeNext:^(id x) {
//        NSLog(@"第一个订阅者%@",x);
//    }];
//    
//    [signal subscribeNext:^(id x) {
//        NSLog(@"第二个订阅者%@",x);
//    }];
    
#pragma mark - throttle
    RACSubject *signal = [RACSubject subject];
    
    self.signal = signal;
    // 截流，在一定时间（1秒）内，不接收任何信号内容，过了这个时间（1秒）获取最后发送的信号内容发出。
    [[signal throttle:3] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

@end
