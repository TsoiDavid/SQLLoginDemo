//
//  TableViewController.m
//  SQLLoginDemo
//
//  Created by admin on 16/3/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "TableViewController.h"
#import "YTKKeyValueStore.h"
#import "YTKKeyValueStore+YTKKeyValueStore___Extension.h"
#import "UserDB.h"
@interface TableViewController ()
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) YTKKeyValueStore *store;

@property (strong, nonatomic) IBOutlet UITableView *userTableView;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self loadData];
    
    
}
- (void)loadData {
    _store = [[YTKKeyValueStore alloc]initDBWithName:@"test.db"];
    NSArray *array = [_store getAllItemsFromTable:@"user_table"];
    [_dataArray removeAllObjects];
    if (array.count > 0) {
        for (YTKKeyValueItem *item in array) {
            UserDB *db = [[UserDB alloc]initWithDictionary:item.itemObject];
            [_dataArray addObject:db];
        }
    }

}
- (IBAction)cleanAllUserInfo:(UIBarButtonItem *)sender {
    [YTKKeyValueStore deleteAllUserItemFromDataBase];
    [self loadData];
    [self.userTableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mycell"];
    }
    UserDB *db = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = db.name;
    cell.detailTextLabel.text = db.age;
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
