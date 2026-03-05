//
//  BNRImageStore.h
//  HomePwner
//
//  Created by Naresh Rawat on 01/03/2026.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKey.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRImageStore : NSObject
+ (instancetype) sharedStore;

- (void) setImage: (UIImage *)image forKey: (NSString *)key;
- (UIImage *) imageForKey: (NSString *) key;
- (void) deleteImageForKey: (NSString *) key;

@end

NS_ASSUME_NONNULL_END
