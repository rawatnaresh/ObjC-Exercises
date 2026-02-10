//
//  BNRHyponsisView.m
//  Hypnosister
//
//  Created by Naresh Rawat on 09/02/2026.
//

#import "BNRHyponsisView.h"

@implementation BNRHyponsisView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        // All BNRHypnosisViews starts with a clear background color
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void) drawRect: (CGRect) rect
{
    
    CGRect bounds = self.bounds;
    NSLog(@"x:%f,y:%f, width: %f, height: %f", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    NSLog(@"x: %f, y: %f", center.x, center.y);
    
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
    
    // Configure the drawing color to light gray
    [[UIColor grayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    UIImage *logo = [UIImage imageNamed:@"logo.png"];
    [logo drawInRect:rect];
}

@end
