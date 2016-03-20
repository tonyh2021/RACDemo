//
//  ViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "ViewController.h"
#import "SignalViewController.h"
#import "ExampleViewController.h"

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
        case 6: {
            UIStoryboard *exampleStoryBoard = [UIStoryboard storyboardWithName:@"Example" bundle:nil];
            ExampleViewController *exampleViewController = [exampleStoryBoard instantiateViewControllerWithIdentifier:@"ExampleViewController"];  //ExampleViewController为viewcontroller的StoryboardId
            [self.navigationController pushViewController:exampleViewController animated:YES];
            break;
        }
        default:
            break;
    }
}


@end
