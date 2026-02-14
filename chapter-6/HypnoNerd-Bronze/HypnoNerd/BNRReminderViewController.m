//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Naresh Rawat on 12/02/2026.
//

#import "BNRReminderViewController.h"
//#import <UserNotifications/UNUserNotificationCenter.h>

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view");
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:60]];
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.tabBarItem.title = @"Reminder";
        UIImage *icon = [UIImage imageNamed:@"time"];
        self.tabBarItem.image = icon;
    }
    
    return self;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)addReminder:(id)sender
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:
                                            (UIUserNotificationTypeAlert |
                                             UIUserNotificationTypeSound |
                                             UIUserNotificationTypeBadge)
                                                                             categories:nil];
    
    // (deprecated) request permission to alert
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    // create a local notification
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertTitle = @"Hypnotize me!";
    note.alertBody = @"It's time for Hypnosis";
    note.fireDate = self.datePicker.date;
    // schedule notification
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
