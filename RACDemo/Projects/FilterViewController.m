//
//  FilterViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "FilterViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface FilterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];

//#pragma mark - filter
//    [self.textField.rac_textSignal filter:^BOOL(NSString *value) {
//        return value.length > 3;
//    }];
//    
//#pragma mark - ignore
//    // 内部调用filter过滤，忽略掉ignore的值
//    [[self.textField.rac_textSignal ignore:@"1"] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    
//#pragma mark - distinctUntilChanged
//    [[self.textField.rac_textSignal distinctUntilChanged] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//#pragma mark - take
//    // 1、创建信号
//    RACSubject *signal = [RACSubject subject];
//    // 2、处理信号，订阅信号
//    [[signal take:1] subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
//    // 3.发送信号
//    [signal sendNext:@1];
//    [signal sendNext:@2];
    
//#pragma mark - takeLast
//    // 1、创建信号
//    RACSubject *signal = [RACSubject subject];
//    // 2、处理信号，订阅信号
//    [[signal takeLast:1] subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x);
//    }];
//    // 3.发送信号
//    [signal sendNext:@1];
//    [signal sendNext:@2];
//    [signal sendCompleted];
    
#pragma mark - takeUntil
    [self.textField.rac_textSignal takeUntil:self.rac_willDeallocSignal];
    
#pragma mark - skip
    [[self.textField.rac_textSignal skip:1] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
#pragma mark - switchToLatest
    RACSubject *signalOfSignals = [RACSubject subject];
    RACSubject *signal = [RACSubject subject];
    
    // 获取信号中信号最近发出信号，订阅最近发出的信号。
    // 注意switchToLatest：只能用于信号中的信号
    [signalOfSignals.switchToLatest subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    [signalOfSignals sendNext:signal];
    [signal sendNext:@1];
}


@end
