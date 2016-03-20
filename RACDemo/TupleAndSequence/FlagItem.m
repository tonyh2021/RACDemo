//
//  FlagItem.m
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import "FlagItem.h"

@implementation FlagItem

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)flagWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
