//
//  BNRItemsViewController.m
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"

@interface BNRItemsViewController ()
@end

@implementation BNRItemsViewController

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"HomePwner";
        UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = rightBtnItem;

        navItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void) addNewItem:(id)sender
{
    BNRItem *item = [[BNRItemStore sharedStore] createItem];
    
    // Figure out where that item is in the array
    NSInteger itemIndex = [[[BNRItemStore sharedStore] allItems] indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // delete item from store
        BNRItem *itemToRemove = [[[BNRItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
        [[BNRItemStore sharedStore] removeItem:itemToRemove];
        
        // delete item from table
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row at index %ld selected", indexPath.row);
    
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] init];
    BNRItem *item = [[[BNRItemStore sharedStore] allItems] objectAtIndex:indexPath.row];
    detailViewController.item = item;
    
    // push the controller to the top of the navigation stack!
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
