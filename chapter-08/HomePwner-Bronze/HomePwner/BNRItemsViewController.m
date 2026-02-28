//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for(int i = 0; i < 5; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[BNRItemStore sharedStore] valuableItems].count;
    } else {
        return [[BNRItemStore sharedStore] lessValuableItems].count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Valuable";
    }
    return @"Less Valuable";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *items;
    
    if (indexPath.section == 0) {
        items = [[BNRItemStore sharedStore] valuableItems];
    } else {
        items = [[BNRItemStore sharedStore] lessValuableItems];
    }
    
    BNRItem *item = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item description];
    
    return cell;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
