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
        // Create 5 items
        for(int i = 0; i < 5; i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

// change the height of the rows
// https://developer.apple.com/documentation/uikit/configuring-the-cells-for-your-table?language=objc
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item description];
    // change font size
    cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    return cell;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // set the footer once its loaded
    UILabel *footerLable = [[UILabel alloc] init];
    ////  configure footer
    footerLable.text = @"No more items!";
    [footerLable sizeToFit];
    footerLable.textAlignment = NSTextAlignmentCenter;
    footerLable.textColor = [UIColor whiteColor];
    // setting the background color just so we know that it's size remain unchanged
    footerLable.backgroundColor = [UIColor systemGrayColor];
    
    self.tableView.tableFooterView = footerLable;
    
    // set image as table background image
    UIImage *bgImage = [UIImage imageNamed:@"bg.jpg"];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    // The table automatically resizes this view to match its own bound
    self.tableView.backgroundView = bgImageView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
