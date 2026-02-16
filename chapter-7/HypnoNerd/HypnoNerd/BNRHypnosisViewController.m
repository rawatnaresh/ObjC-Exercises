//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Naresh Rawat on 12/02/2026.
//

#import "BNRHypnosisViewController.h"
#import "BNRHyponsisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    // Create a view
    CGRect textFieldRect = CGRectMake(40, 70, 320, 35);
    BNRHyponsisView *backgroundView = [[BNRHyponsisView alloc] init];
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    [backgroundView addSubview:textField];
    
    textField.delegate = self;
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"HI %@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void) drawHypnoticMessage: (NSString *) message
{
    NSLog(@"drawHypnoticMessage called");
    for (int i = 0; i < 20; i++) {
        UILabel *label = [[UILabel alloc] init];
        
        // Configure label's text and color
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.text = message;
        
        // This method resizes the label, which will be relative to the text that it is displaying
        [label sizeToFit];
        
        // Get a random x value that fits within the hypnosis view's width
        int width = (int) (self.view.bounds.size.width - label.bounds.size.width);
        int x = arc4random() % width;
        
        // Get a random y value that fits within the hypnosis view's height
        int height = (int) (self.view.bounds.size.height - label.bounds.size.height);
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect labelFrame = label.frame;
        labelFrame.origin = CGPointMake(x, y);
        label.frame = labelFrame;
        
        // add the label to the hiererchy
        
        [self.view addSubview:label];
        
        // add motion effects to the label
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        
        [label addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.maximumRelativeValue = @(-25);
        motionEffect.minimumRelativeValue = @(25);
        [label addMotionEffect:motionEffect];
    }
}

@end
