//
//  ViewController.m
//  SQLLoginDemo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 admin. All rights reserved.
//
#define UserDatabaseName @"test.db"
#define UserTableName @"user_table"
#import "ViewController.h"
#import "YTKKeyValueStore.h"
#import "YTKKeyValueStore+YTKKeyValueStore___Extension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userTextField;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)login {
    if (_userTextField.text.length > 0 && _ageTextField.text.length > 0) {
        NSString *userName = _userTextField.text;
        NSString *userAge = _ageTextField.text;
//        NSString *key = @"user_table";
        if ([YTKKeyValueStore checkSameUserInDataBase:userName]) {
            YTKKeyValueStore *store = [[YTKKeyValueStore alloc]initDBWithName:UserDatabaseName];
            NSString *key = [NSString stringWithFormat:@"%lu",(unsigned long)[store getCountFromTable:UserTableName]];
            NSDictionary *user = @{@"id":key,@"name": userName, @"age": userAge};
            [store putObject:user withId:key intoTable:UserTableName];
        }else {
            NSLog(@"已有相同名字用户");
        }
        
    }else {
        return;
    }
   
}

@end
