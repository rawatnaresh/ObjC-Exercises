//
//  BNRHyponsisView.m
//  Hypnosister
//
//  Created by Naresh Rawat on 09/02/2026.
//

#import "BNRHyponsisView.h"

// Class extension
@interface BNRHyponsisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHyponsisView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = UIColor.clearColor;
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void) drawRect: (CGRect) rect
{
    CGRect bounds = self.bounds;
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2
                     clockwise:YES];
    }
    
    
    // Configure the line width to 10 points
    [path setLineWidth:10.0];
    
    [self.circleColor setStroke];
    
    // Draw the line!
    [path stroke];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
}

- (void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    // so whenever the color is updated, this view will ask for re-draw
    [self setNeedsDisplay];
}
@end
