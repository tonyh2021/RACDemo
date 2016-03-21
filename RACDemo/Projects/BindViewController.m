//
//  BindViewController.m
//  RACDemo
//
//  Created by 晓童 韩 on 16/3/21.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "BindViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import <ReactiveCocoa/RACReturnSignal.h>

@interface BindViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation BindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        
        NSLog(@"输出:%@",x);
        
    }];

    
    [[self.textField2.rac_textSignal bind:^RACStreamBindBlock{
        
        // 什么时候调用:
        // block作用:表示绑定了一个信号.
        
        return ^RACStream *(id value, BOOL *stop){
            
            // 什么时候调用block:当信号有新的值发出，就会来到这个block。
            
            // block作用:做返回值的处理
            
            // 做好处理，通过信号返回出去.
            return [RACReturnSignal return:[NSString stringWithFormat:@"输出:%@",value]];
        };
        
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
}


@end
