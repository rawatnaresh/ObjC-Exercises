//
//  BNRItemStore.m
//  HomePwner
//
//  Created by Naresh Rawat on 16/02/2026.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore

+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use [BNRItem sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *) allItems
{
    return self.privateItems;
}

- (BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void) removeItem:(BNRItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void) moveItemAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    // Get the pointer to the obj being moved so we can re-insert it
    BNRItem *movedItem = [self.privateItems objectAtIndex:fromIndex];
    // remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    // re-insert item in the array at new location
    [self.privateItems insertObject:movedItem atIndex:toIndex];
}


@end
