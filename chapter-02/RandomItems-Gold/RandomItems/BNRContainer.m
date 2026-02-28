//
//  BNRContainer.m
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (void) addSubItem:(BNRItem *)item
{
    [_subitems addObject:item];
}

// overrides superclass
- (int) valueInDollars
{
    int containerValue = [super valueInDollars];
    for(BNRContainer *item in _subitems) {
        containerValue += [item valueInDollars];
    }
    return containerValue;
}

- (NSString *) description
{
    int totalValue = [self valueInDollars];
    return [NSString stringWithFormat:@"<%@: , Total value: %d, SubItems: %@>", [self itemName], totalValue, _subitems];
}

- (instancetype) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    if(!_subitems) {
        _subitems = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
