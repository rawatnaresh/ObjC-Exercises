//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Naresh Rawat on 14/03/2026.
//

#import "BNRDrawView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRDrawView()

@property (nonatomic, strong) NSMutableArray *finishedLines;
@property (nonatomic, strong) NSMutableDictionary *linesInProgress;

@end

@implementation BNRDrawView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.finishedLines = [[NSMutableArray alloc] init];
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.backgroundColor = [UIColor clearColor];
        self.multipleTouchEnabled = YES;
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
    
    for (NSValue *key in self.linesInProgress) {
        [[UIColor redColor] set];
        [self strokeLine:self.linesInProgress[key]];
    }
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        CGPoint location = [t locationInView:self];
        
        BNRLine *line = [[BNRLine alloc] init];
        line.begin = location;
        line.end = location;
        
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        
        [self.linesInProgress setValue:line forKey:key];
    }
    [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        
        CGPoint location = [t locationInView:self];
        line.end = location;
    }
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches
            withEvent:(nullable UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BNRLine *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void) touchesCancelled:(NSSet<UITouch *> *)touches
                withEvent:(nullable UIEvent *)event
{
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

@end

NS_ASSUME_NONNULL_END
