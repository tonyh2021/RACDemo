//
//  CustomView.m
//  RACDemo
//
//  Created by BloodLine on 16/3/20.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "CustomView.h"
#import "UIColor+RandomColors.h"

@implementation CustomView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
    }
    return self;
}

- (IBAction)buttonDidClick:(UIButton *)sender {
    NSLog(@"buttonDidClick");
}

@end
