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
    
    // Configure the drawing color to light gray
    [[UIColor grayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    // create a triangle
    UIBezierPath *triangle = [[UIBezierPath alloc] init];
    
    float hSpacing = 50;
    float vSpacing = 200;
    
    CGPoint topPoint = CGPointMake(center.x, vSpacing);
    CGPoint leftPoint = CGPointMake(hSpacing, self.bounds.size.height - vSpacing);
    CGPoint rightPoint = CGPointMake(self.bounds.size.width - hSpacing, self.bounds.size.height - vSpacing);
    
    // start drawing from this point
    [triangle moveToPoint:topPoint];
    // draws left line
    [triangle addLineToPoint:leftPoint];
    // draws bottom line
    [triangle addLineToPoint:rightPoint];
    [triangle closePath];
    
    [triangle setLineWidth:0.0];
    [triangle stroke];
    
    // get graphics context
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // save current graphics state before clipping triangle
    CGContextSaveGState(currentContext);
    
    [triangle addClip];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = {
        // R, G, B, A
        0.0, 1.0, 0.0, 1.0,
        1.0, 1.0, 0.0, 1.0
    };
    size_t numOfLocations = 2;
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, numOfLocations);
    
    // Vertical gradient
    CGPoint startPoint = CGPointMake(0, vSpacing);
    CGPoint endPoint = CGPointMake(0, self.bounds.size.height - vSpacing);
    
 
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    // remove ownership
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(currentContext);
    
    // Drawing Image with shadow
    
    // save current graphics state
    CGContextSaveGState(currentContext);
    // set shadow
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    UIImage *logo = [UIImage imageNamed:@"logo.png"];
    [logo drawInRect:rect];
    // restore graphics state
    CGContextRestoreGState(currentContext);
}

@end
