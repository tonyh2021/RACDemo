//
//  EventsViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "EventsViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface EventsViewController()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end


@implementation EventsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];

    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSLog(@"按钮被点击了");
    }];
}

@end
