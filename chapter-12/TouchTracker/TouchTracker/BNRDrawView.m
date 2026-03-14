//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Naresh Rawat on 14/03/2026.
//

#import "BNRDrawView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRDrawView()

@property (nonatomic, strong) BNRLine *currentLine;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) strokeLine: (BNRLine *) line
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    
    [path moveToPoint:line.begin];
    [path addLineToPoint:line.end];
    [path stroke];
}

- (void) drawRect:(CGRect)rect
{
    // Draw finished lines in black
    [[UIColor blackColor] set];
    for(BNRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    if (self.currentLine) {
        // If there is line currently being drawn, do it in red
        [[UIColor redColor] set];
        [self strokeLine:self.currentLine];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    // Get any object from the set
    UITouch *t = [touches anyObject];
    // Get location of the touch in view's coordinate system
    CGPoint location = [t locationInView:self];
    
    // Create a new line and update its begin and end
    self.currentLine = [[BNRLine alloc] init];
    self.currentLine.begin = location;
    self.currentLine.end = location;
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint location = [t locationInView:self];
    
    self.currentLine.end = location;
    // redraw the view
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    // update finishedLines
    [self.finishedLines addObject:self.currentLine];
    // reset current line
    self.currentLine = nil;
    // redraw the view
    [self setNeedsDisplay];
}

@end

NS_ASSUME_NONNULL_END
