//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Naresh Rawat on 12/02/2026.
//

#import "BNRHypnosisViewController.h"
#import "BNRHyponsisView.h"

@interface BNRHypnosisViewController ()
//@property (nonatomic, strong) BNRHyponsisView *hypnosisView;
@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    // Create a view
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc] init];
    backgroundView.circleColor = UIColor.redColor;
    
    // Create a segmented UI
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithFrame: CGRectMake(0, 50, 300, 50)];
    
    [control insertSegmentWithTitle:@"Red" atIndex:0 animated:false];
    [control insertSegmentWithTitle:@"Green" atIndex:1 animated:false];
    [control insertSegmentWithTitle:@"Blue" atIndex:2 animated:false];
    
    
    [control addTarget:self action:@selector(handleControlChange:) forControlEvents:UIControlEventValueChanged];
    
    // set defaults
    [control setSelectedSegmentIndex:0];
    [control setSelectedSegmentTintColor:UIColor.redColor];
    
    [backgroundView addSubview:control];
    
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

- (void) handleControlChange: (UISegmentedControl *) control
{
    NSInteger selectedIndex = control.selectedSegmentIndex;
    
    
    UIColor *color = UIColor.blueColor;
    if (selectedIndex == 0) {
        color = UIColor.redColor;
    } else if(selectedIndex == 1) {
        color = UIColor.greenColor;
    }
    // change selected segment text color
//    [control setTitleTextAttributes:@{NSForegroundColorAttributeName: color} forState:UIControlStateSelected];
    [control setSelectedSegmentTintColor:color];
    [(BNRHyponsisView *) self.view setCircleColor:color];
}

@end
