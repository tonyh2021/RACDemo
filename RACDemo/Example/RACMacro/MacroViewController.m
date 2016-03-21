//
//  MacroViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "MacroViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"

@interface MacroViewController()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end


@implementation MacroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor randomColor];
    
    RAC(self.label, text) = self.textField.rac_textSignal;
    
    [RACObserve(self.view, center) subscribeNext:^(id x) {
        NSLog(@"%@", NSStringFromCGRect(self.textField.frame));
    }];

    RACTuple *tuple = RACTuplePack(@1,@3);
    NSLog(@"%@", tuple);
    
    RACTupleUnpack(NSNumber *num1,NSNumber *num2) = tuple;
    NSLog(@"%@ %@", num1, num2);
}

@end
