//
//  UserDB.m
//  SQLLoginDemo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UserDB.h"

@implementation UserDB
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        if (dic) {
            self.name = [dic objectForKey:@"name"];
            self.age = [dic objectForKey:@"age"];
        }
    }
    return self;
}
- (UserDB *)getInfoWithDictionary:(NSDictionary *)dic {
    
    if (dic) {
        self.name = [dic objectForKey:@"name"];
        self.age = [dic objectForKey:@"age"];
    }
    return self;
}
@end
