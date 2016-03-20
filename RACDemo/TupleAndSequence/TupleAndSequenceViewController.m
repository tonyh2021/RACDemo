//
//  TupleAndSequenceViewController.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "TupleAndSequenceViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+RandomColors.h"
#import "FlagItem.h"

@implementation TupleAndSequenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor randomColor];
    
    // 1.遍历数组
    NSArray *arr = @[@1,@2,@3];
    
    // 这里其实是三步
    
    // 第一步: 把数组转换成集合RACSequence arr.rac_sequence
    // 第二步: 把集合RACSequence转换RACSignal信号类，arr.rac_sequence.signal
    // 第三步: 订阅信号，激活信号，会自动把集合中的所有值，遍历出来。
//    [arr.rac_sequence.signal subscribeNext:^(id x) {
//        
//        NSLog(@"%@",x);
//    }];
    
    
    // 2.遍历字典,遍历出来的键值对会包装成RACTuple(元组对象)
    NSDictionary *dict = @{@"name":@"Tony",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key, NSString *value) = x;
        
        // 相当于以下写法
        // NSString *key = x[0];
        // NSString *value = x[1];
        
        NSLog(@"%@ %@",key,value);
        
    }];
}


- (IBAction)buttonDidClick:(UIButton *)sender {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];

    //OC
    NSMutableArray *items = [NSMutableArray array];
    for (NSDictionary *dict in dictArr) {
        FlagItem *item = [FlagItem flagWithDict:dict];
        [items addObject:item];
    }
    
    //RAC
    NSMutableArray *flags = [NSMutableArray array];
    // rac_sequence注意点：调用subscribeNext，并不会马上执行nextBlock，而是会等一会。
    [dictArr.rac_sequence.signal subscribeNext:^(id x) {
        // 运用RAC遍历字典，x：字典
        FlagItem *item = [FlagItem flagWithDict:x];
        [flags addObject:item];
    }];
    
    // 使用map
    // map:映射的意思，目的：把原始值value映射成一个新值
    // array: 把集合转换成数组
    // 底层实现：当信号被订阅，会遍历集合中的原始值，映射成新值，并且保存到新的数组里。
    NSArray *newFlags = [[dictArr.rac_sequence map:^id(id value) {
        return [FlagItem flagWithDict:value];
    }] array];
    
    NSLog(@"%@, %@, %@", items, flags, newFlags);
}

@end
