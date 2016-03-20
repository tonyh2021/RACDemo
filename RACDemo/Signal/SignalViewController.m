//
//  SignalViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "SignalViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@implementation SignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    // 1.创建信号 createSignal:didSubscribe(block)
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // block调用时刻:每当有订阅者订阅信号，就会调用block。
        // block作用:描述当前信号哪些数据需要发送
        // _subscriber = subscriber;

        // 3.发送信号
        NSLog(@"调用了didSubscribe");
        // 通常：传递数据出去
        [subscriber sendNext:@1];
        // 此处调用订阅者的nextBlock
        
        // 5.如果不再发送数据，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。或者信号想要被取消，就必须返回一个RACDisposable，然后在后面[disposable dispose]
        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            // 6.信号什么时候被取消：1.自动取消，当一个信号的订阅者被销毁的时候，就会自动取消订阅 2.主动取消
            // block调用时刻:一旦一个信号，被取消订阅的时候就会调用
            // block作用：当信号取消订阅，用于清空一些资源
            NSLog(@"取消订阅");
        }];
    }];
    
    // subscribeNext:创建订阅者，然后把nextBlock保存到订阅者里面
    // 2.订阅信号：只要订阅信号，就会返回一个取消订阅信号的类
    [siganl subscribeNext:^(id x) {
        // 4.block调用时刻：每当有信号发出数据，就会调用block。
        NSLog(@"接收到数据:%@",x);
    }];
    
    // 5.取消订阅
    //    [disposable dispose];
}

@end
