//
//  BNRItem.m
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import "BNRItem.h"

@implementation BNRItem

- (NSString *) description
{
    return [NSString stringWithFormat:@"%@ (%@): Worth $%d, date %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
}

- (instancetype) init
{
    return [self initWithItemName:@"Item"];
}

-(instancetype) initWithItemName:(NSString *) name
{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}

#pragma mark Designated Initializer
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber
{
    self = [super init];
    if (self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [NSDate date];
    }
    return self;
}

#pragma mark class methods
+ (instancetype) randomItem
{
    // create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rust", @"Shiny"];
    // create an immutable array of three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    // Get the index of a random adjective/noun from the lists
    NSInteger adjectiveIndex = arc4random() % randomAdjectiveList.count;
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    // generate random name
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], randomNounList[nounIndex]];
    
    // generate random value
    int randomValue = arc4random() % 100;
    
    // generate random serial number
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 25,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    return [[self alloc] initWithItemName:randomName
                           valueInDollars:randomValue
                             serialNumber:randomSerialNumber];
}
@end
