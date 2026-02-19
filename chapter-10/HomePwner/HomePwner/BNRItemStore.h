//
//  BNRItemStore.h
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import <Foundation/Foundation.h>
@class BNRItem;

NS_ASSUME_NONNULL_BEGIN

@interface BNRItemStore : NSObject
@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype) sharedStore;

- (BNRItem *) createItem;
- (void) removeItem: (BNRItem *) item;
- (void) moveItemAtIndex: (NSInteger) fromIndex
                 toIndex: (NSInteger) toIndex;

@end

NS_ASSUME_NONNULL_END
