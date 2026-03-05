//
//  BNRImageStore.m
//  HomePwner
//
//  Created by Naresh Rawat on 01/03/2026.
//

#import "BNRImageStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+ (instancetype) sharedStore
{
    static BNRImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[BNRImageStore alloc] initPrivate];
    }
    return sharedStore;
}

// No one should call init
- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRImageStore sharedStore]" userInfo:nil];
    return nil;
}

// Secret designated initializer
- (instancetype) initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (UIImage *) imageForKey:(NSString *)key
{
    return self.dictionary[key];
    // return [self.dictionary objectForKey:key];
}

 - (void) deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

- (void) setImage:(UIImage *) image forKey:(nonnull NSString *)key
{
    self.dictionary[key] = image;
    // [self.dictionary setValue:image forKey:key];
}

@end

NS_ASSUME_NONNULL_END
