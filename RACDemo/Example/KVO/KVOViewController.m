//
//  KVOViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/20.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "KVOViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import "CustomView.h"
#import "Cat.h"

@interface KVOViewController ()

@property (nonatomic, strong) Cat *cat;


@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    Cat *cat = [Cat new];
    self.cat = cat;
}

- (void)


@end
