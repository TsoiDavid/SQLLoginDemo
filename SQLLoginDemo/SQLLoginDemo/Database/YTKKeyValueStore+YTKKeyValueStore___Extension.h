//
//  YTKKeyValueStore+YTKKeyValueStore___Extension.h
//  SQLLoginDemo
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "YTKKeyValueStore.h"

@interface YTKKeyValueStore (YTKKeyValueStore___Extension)
+ (BOOL)checkSameUserInDataBase:(NSString *)userName;
+ (void)deleteAllUserItemFromDataBase;
@end
