//
//  BNRContainer.h
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subitems;
}

- (void) addSubItem: (BNRItem *) item;

- (instancetype) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
@end
