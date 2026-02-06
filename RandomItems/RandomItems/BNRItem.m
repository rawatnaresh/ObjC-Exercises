//
//  BNRItem.m
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import "BNRItem.h"

@implementation BNRItem

#pragma mark setters

- (void) setItemName:(NSString *)n
{
    _itemName = n;
}

- (void) setSerialNumber:(NSString *)n
{
    _serialNumber = n;
}

- (void) setValueInDollars:(int)v
{
    _valueInDollars = v;
}

#pragma mark getters

- (NSString *) itemName
{
    // return self->_itemName;
    // or simpler.
    return _itemName;
}

- (NSString *) serialNumber
{
    return _serialNumber;
}

- (int) valueInDollars
{
    return _valueInDollars;
}

- (NSDate *) dateCreated
{
    return _dateCreated;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"<Name : %@, SerialNumber: %@, DateCreated: %@, Value in Dollars: %d>", self.itemName, self.serialNumber, self.dateCreated, self.valueInDollars];
}

#pragma mark Custom Initializers
// if we don't override this, then the type of initialization we want for this class
// would't happen if the user decides to use [[BNRItem alloc] init]

// Now whatever initialization method they used, we can be sure that our BNR object is properly initialized the way we want!

- (instancetype) init
{
    return [self initWithItemName:@"Item"];
}

-(instancetype) initWithItemName:(NSString *) name
{
    //    self = [super init];
    //    if(self) {
    //        _itemName = name;
    //        _valueInDollars = 0;
    //        _serialNumber = @"";
    //        _dateCreated = [NSDate date];
    //    }
    //
    //    return self;
    
    // this can be simplified to
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

// whichever init method they use, eventually this will be called so this becomes our
// designated initializer
#pragma mark Designated Initializer
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber
{
    self = [super init];
    if(self) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        // **this is essentially same as**
        // self->_itemName = name;
        // self->_valueInDollars = value;
        // self->_serialNumber = sNumber;
        
        // Set _dateCreated to current date
        _dateCreated = [NSDate date];
    }
    return self;
}
@end
