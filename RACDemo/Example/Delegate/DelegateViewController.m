//
//  DelegateViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/20.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "DelegateViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import "CustomView.h"

@interface DelegateViewController ()

@property (weak, nonatomic) IBOutlet CustomView *customView;

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    [[self.customView rac_signalForSelector:@selector(buttonDidClick:)] subscribeNext:^(id x) {
        NSLog(@"控制器知道：点击了按钮");
    }];
}

@end
