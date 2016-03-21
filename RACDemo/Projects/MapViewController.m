//
//  MapViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "MapViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import <ReactiveCocoa/RACReturnSignal.h>

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
    [[self.textField.rac_textSignal flattenMap:^RACStream *(id value) {
        
        // block什么时候 : 源信号发出的时候，就会调用这个block。
        
        // block作用 : 改变源信号的内容。
        NSLog(@"%@", value);
        NSString *newValue = [NSString stringWithFormat:@"new:%@", value];
        
        // 返回值：绑定信号的内容.
        return [RACReturnSignal return:[NSString stringWithFormat:@"输出:%@", newValue]];
        
    }] subscribeNext:^(id x) {
        // 订阅绑定信号，每当源信号发送内容，做完处理，就会调用这个block。
        NSLog(@"%@", x);
    }];
    
    
    [[self.textField2.rac_textSignal map:^id(id value) {
        // 当源信号发出，就会调用这个block，修改源信号的内容
        // 返回值：就是处理完源信号的内容。
        NSLog(@"%@", value);
        NSString *newValue = [NSString stringWithFormat:@"new:%@", value];
        
        return [NSString stringWithFormat:@"输出:%@", newValue];
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 创建信号中的信号
    RACSubject *signalOfsignals = [RACSubject subject];
    RACSubject *signal = [RACSubject subject];
    
    [[signalOfsignals flattenMap:^RACStream *(id value) {
        
        // 当signalOfsignals的signals发出信号才会调用
        
        return value;
        
    }] subscribeNext:^(id x) {
        
        // 只有signalOfsignals的signal发出信号才会调用，因为内部订阅了bindBlock中返回的信号，也就是flattenMap返回的信号。
        // 也就是flattenMap返回的信号发出内容，才会调用。
        
        NSLog(@"%@   aaa", x);
    }];
    
    // 信号的信号发送信号
    [signalOfsignals sendNext:signal];
    
    // 信号发送内容
    [signal sendNext:@1];
}

@end
