//
//  YTKKeyValueStore+YTKKeyValueStore___Extension.m
//  SQLLoginDemo
//
//  Created by admin on 16/3/25.
//  Copyright © 2016年 admin. All rights reserved.
//
#define UserDatabaseName @"test.db"
#define UserTableName @"user_table"

#import "YTKKeyValueStore+YTKKeyValueStore___Extension.h"

@implementation YTKKeyValueStore (YTKKeyValueStore___Extension)

+ (BOOL)checkSameUserInDataBase:(NSString *)userName {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc]initDBWithName:UserDatabaseName];
    NSArray *array = [store getAllItemsFromTable:UserTableName];
    if (array.count > 0) {
        for (YTKKeyValueItem *item in array) {
            if ([item.itemObject isKindOfClass:[NSDictionary class]]) {
                NSString *name = [item.itemObject objectForKey:@"name"];
                if ([name isEqualToString:userName]) {
                    return NO;
                }else {
                    return YES;
                }
            }
        }
    }
    return YES;
    
    
    
}
+ (void)deleteAllUserItemFromDataBase {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc]initDBWithName:UserDatabaseName];
    NSArray *array = [store getAllItemsFromTable:UserTableName];
    NSMutableArray *itemArray = [[NSMutableArray alloc]init];
    if (array.count > 0) {
        for (YTKKeyValueItem *item in array) {
            NSString *itemId = item.itemId;
            [itemArray addObject:itemId];
            
        }
        [store deleteObjectsByIdArray:itemArray fromTable:UserTableName];
    }
    

}
@end
