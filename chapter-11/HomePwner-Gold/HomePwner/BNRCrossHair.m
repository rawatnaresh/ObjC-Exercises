//
//  BNRCrossHair.m
//  HomePwner
//
//  Created by Naresh Rawat on 05/03/2026.
//

#import "BNRCrossHair.h"

@implementation BNRCrossHair

- (void) drawRect:(CGRect)rect
{
    CGFloat line = 30.0;
    
    CGFloat centerX = rect.size.width / 2.0;
    CGFloat centerY = rect.size.height / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(centerX - line / 2, centerY)];
    
    [path addLineToPoint:CGPointMake(centerX + line / 2, centerY)];
    
    [path moveToPoint:CGPointMake(centerX, centerY - line / 2)];
    [path addLineToPoint:CGPointMake(centerX, centerY + line / 2)];
    
    [UIColor.greenColor setStroke];
    [path stroke];
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        self.opaque = YES;
        [self setBackgroundColor:UIColor.clearColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
