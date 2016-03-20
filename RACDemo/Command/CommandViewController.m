//
//  CommandViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "CommandViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface CommandViewController ()

@property (nonatomic, strong) RACCommand *command;

@end

@implementation CommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    // 创建命令类
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        // block什么时候调用:当执行这个命令类的时候就会调用
        NSLog(@"执行命令 %@", input);
        // block有什么作用:描述下如何处理事件，网络请求
        
        // 创建空信号，必须返回信号
        // return [RACSignal empty];
        
        // 2.RACCommand必须返回信号，处理事件的时候，肯定会有数据产生，产生的数据就通过返回的信号发出。注意：数据传递完，最好调用sendCompleted，这时命令才执行完毕。
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            // block作用：发送处理事件的信号
            // block调用：当信号被订阅的时候才会调用
            [subscriber sendNext:@"信号发出的内容"];
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    // 强引用命令，不要被销毁，否则接收不到数据
    _command = command;
    // executionSignals:信号源，包含事件处理的所有信号。
    // executionSignals: signalOfSignals，信号中的信号，就是信号发出的数据也是信号类
    
    // 4.如果想要订阅接收信号源的信号内容，必须保证命令类不会被销毁
    [command.executionSignals subscribeNext:^(id x) {
        // x -> 信号
        [x subscribeNext:^(id x) {
            
            NSLog(@"%@",x);
        }];
    }];
    
    // 3.执行命令,调用signalBlock
    [command execute:@1];
    
    
    // RAC高级用法
    // switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号
    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 5.监听命令是否执行完毕，默认会来一次，可以直接跳过，skip表示跳过第一次信号。
    [[command.executing skip:1] subscribeNext:^(id x) {
        
        if ([x boolValue] == YES) {
            // 正在执行
            NSLog(@"正在执行");
            
        }else{
            // 执行完成
            NSLog(@"执行完成");
        }
        
    }];
    
    [self signalOfSignals];
    
}

- (void)signalOfSignals {
    // 创建一个信号中的信号
    RACSubject *signalOfSignals = [RACSubject subject];
    
    // 信号
    RACSubject *signal = [RACSubject subject];
    
    
    // 先订阅
    [signalOfSignals subscribeNext:^(id x) {
        
        // x -> 信号
        NSLog(@"%@", [x class]);
        NSLog(@"%@", x);
        
        [x subscribeNext:^(id x) {
            NSLog(@"%@",x);
        }];
    }];
    
    // 再发送
    
    [signalOfSignals sendNext:signal];
    
    [signal sendNext:@1];
}

@end
