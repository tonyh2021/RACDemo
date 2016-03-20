//
//  MulticastConnectionViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "MulticastConnectionViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface MulticastConnectionViewController ()

@end

@implementation MulticastConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
//    // 发送请求，用一个信号内包装，不管有多少个订阅者，只想要发送一次请求
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        
//        // didSubscribeblock中的代码都统称为副作用（Side Effects）。
//        // 发送请求
//        NSLog(@"发送请求");
//        
//        [subscriber sendNext:@1];
//        
//        return nil;
//    }];
    
    // 订阅信号
//    [signal subscribeNext:^(id x) {
//
//        NSLog(@"接收数据：%@",x);
//    }];
//
//
//    [signal subscribeNext:^(id x) {
//
//        NSLog(@"接收数据：%@",x);
//    }];
    
    
    
    // RACMulticastConnection:解决重复请求问题
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送请求");
        [subscriber sendNext:@1];
        return nil;
    }];
    // 2.创建连接
    RACMulticastConnection *connect = [signal publish];
    // 3.订阅信号，
    // 注意：订阅信号，也不能激活信号，只是保存订阅者到数组，必须通过连接,当调用连接，就会一次性调用所有订阅者的sendNext:
    [connect.signal subscribeNext:^(id x) {
        NSLog(@"订阅者一信号");
        
    }];
    [connect.signal subscribeNext:^(id x) {
        NSLog(@"订阅者二信号");
        
    }];
    
    // 4.连接,激活信号
    [connect connect];
}

@end
