//
//  UserDB.h
//  SQLLoginDemo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDB : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

- (instancetype)init;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
- (UserDB *)getInfoWithDictionary:(NSDictionary *)dic;
@end
