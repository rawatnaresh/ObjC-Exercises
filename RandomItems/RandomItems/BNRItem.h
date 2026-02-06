//
//  BNRItem.h
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

// getters
- (NSString*) itemName;
- (NSString*) serialNumber;
- (int) valueInDollars;
- (NSDate *) dateCreated;

// setters
- (void) setItemName: (NSString *)n;
- (void) setSerialNumber: (NSString *)n;
- (void) setValueInDollars: (int) v;

// Designated initializer for BNRItem
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber;

- (instancetype) initWithItemName: (NSString *) name;

@end

