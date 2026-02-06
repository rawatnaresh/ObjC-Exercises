//
//  main.m
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRItem *item = [[BNRItem alloc] init];
        item.itemName = @"Laptop";
        item.serialNumber = @"1ZXCJ-FDF-SDFD";
        item.valueInDollars = 100;
        NSLog(@"BNR instance %@", item);
        
        BNRItem *item2 = [[BNRItem alloc] initWithItemName:@"Red Sofa" valueInDollars:150 serialNumber:@"1-2swewe-121"];
        NSLog(@"BNR instance %@", item2);
        
        BNRItem *item3 = [[BNRItem alloc] initWithItemName:@"Cupboard"];
        NSLog(@"BNR instance %@", item3);
    }
    return EXIT_SUCCESS;
}
