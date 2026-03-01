//
//  BNRUpdateDateViewController.m
//  HomePwner
//
//  Created by Naresh Rawat on 28/02/2026.
//

#import "BNRUpdateDateViewController.h"

@interface BNRUpdateDateViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRUpdateDateViewController

- (void) setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = [NSString stringWithFormat:@"Update Date - %@", _item.itemName];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.datePicker.date = self.item.dateCreated;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.item.dateCreated = self.datePicker.date;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
