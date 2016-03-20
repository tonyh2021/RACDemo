//
//  SubjectSecondViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "SubjectSecondViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@implementation SubjectSecondViewController

- (IBAction)backDidClick:(UIButton *)sender {
    
    // 4.点击返回按钮时，便可以通知SubjectViewController做事情
    //判断代理信号是否有值
    if (self.subject) {
        
        [self.subject sendNext:@1];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
}

- (void)dealloc {
    NSLog(@"%@ dealloc", [self class]);
}

@end
