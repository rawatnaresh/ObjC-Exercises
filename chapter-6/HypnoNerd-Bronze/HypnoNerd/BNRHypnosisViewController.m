//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Naresh Rawat on 12/02/2026.
//

#import "BNRHypnosisViewController.h"
#import "BNRHyponsisView.h"

@implementation BNRHypnosisViewController

- (void)loadView
{
    // Create a view
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc] init];
    self.view = backgroundView;
}

- (void) viewDidLoad
{
    NSLog(@"BNRHypnosisViewController loaded its view");
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnosis";
        self.tabBarItem.image = [UIImage imageNamed:@"hypnosis"];
    }
    return self;
}

@end
