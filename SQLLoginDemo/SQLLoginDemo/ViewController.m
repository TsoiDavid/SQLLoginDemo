//
//  ViewController.m
//  SQLLoginDemo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "YTKKeyValueStore.h"
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
        
        YTKKeyValueStore *store = [[YTKKeyValueStore alloc]initDBWithName:@"test.db"];
        NSString *key = [NSString stringWithFormat:@"%lu",(unsigned long)[store getCountFromTable:@"user_table"]];
        NSDictionary *user = @{@"name": userName, @"age": userAge};
        [store putObject:user withId:key intoTable:@"user_table"];
    }else {
        return;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
