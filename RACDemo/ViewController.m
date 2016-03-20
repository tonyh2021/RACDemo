//
//  ViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "ViewController.h"
#import "SignalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonDidClick:(UIButton *)button {
    switch (button.tag) {
        case 0: {
            SignalViewController *vc = [[SignalViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            break;
        }
        case 2: {
            break;
        }
        default:
            break;
    }
}


@end
