//
//  FlagItem.h
//  RACDemo
//
//  Created by BloodLine on 16/3/19.
//  Copyright © 2016年 BloodLine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlagItem : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)flagWithDict:(NSDictionary *)dict;

@end
