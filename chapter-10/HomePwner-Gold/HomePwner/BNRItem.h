//
//  BNRItem.h
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property int valueInDollars;
@property (nonatomic, copy) NSDate *dateCreated;

+ (instancetype) randomItem;

// Designated initializer for BNRItem
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber;

- (instancetype) initWithItemName: (NSString *) name;

@end
