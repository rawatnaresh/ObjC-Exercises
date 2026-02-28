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

- (NSArray *) filterItemsWithPredicate: (NSString *) predicate
{
    NSArray *items = [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicate]];
    return items;
}

- (NSArray *) valuableItems
{
    return [self filterItemsWithPredicate:@"valueInDollars >= 50"];
}

- (NSArray *) lessValuableItems
{
    return [self filterItemsWithPredicate:@"valueInDollars < 50"];
}

@end
