//
//  NotificationViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "NotificationViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface NotificationViewController()

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end


@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    // 只要发出这个通知,又会转换成一个信号
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"弹出键盘");
    }];
    
    
    [self.textfield.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
}

@end
