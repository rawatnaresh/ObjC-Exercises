//
//  BNRItem.h
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
/**
 * Attributes::
 * Multi-threading: atomic, nonatomic
 * Read/write: readonly, readwrite
 * Memory management: copy, strong, weak
 *   - weak for weak references or to prevent retain cycles
 *   - strong for strong references
 *   - copy, when a property points to an instance of a class that has mutable subclass, we set it memory managent attrib to copy
 */

// Declaring a property in a class interface only creates the declaration for accessor methods
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

+ (instancetype) randomItem;

// Designated initializer for BNRItem
- (instancetype) initWithItemName: (NSString *) name
                   valueInDollars: (int) value
                     serialNumber: (NSString *) sNumber;

- (instancetype) initWithItemName: (NSString *) name;

@end

