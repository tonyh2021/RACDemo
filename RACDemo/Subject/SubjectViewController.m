//
//  SubjectViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "SubjectViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import "SubjectSecondViewController.h"

@implementation SubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    // RACSubject:信号提供者
    
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.订阅信号
    [subject subscribeNext:^(id x) {
        
        // 4.block:当有数据发出的时候就会调用
        // block:处理数据
        NSLog(@"第一个订阅者%@",x);
    }];
    
    // 发送信号
//    [subject sendNext:@1];
    
    // 2.1 第二次订阅信号
    [subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第二个订阅者%@",x);
    }];
    
    // 3.发送信号
    [subject sendNext:@1];
    [subject sendNext:@2];
}

- (IBAction)buttonDidClick:(UIButton *)button {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SubjectSecondViewController *twoVc = [storyboard instantiateViewControllerWithIdentifier:@"two"];
    
    //1.创建并设置信号提供者
    twoVc.subject = [RACSubject subject];
    
    // 2.订阅信号
    @weakify(twoVc)
    [twoVc.subject subscribeNext:^(id x) {
        
        NSLog(@"通知了ViewController:%@", x);
        @strongify(twoVc)
        [twoVc dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    
    // 3.present控制器
    [self presentViewController:twoVc animated:YES completion:nil];
    
}


@end
