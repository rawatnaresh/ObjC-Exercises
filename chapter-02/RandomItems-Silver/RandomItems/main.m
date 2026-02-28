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
        
        // generating random items with "Convenience methods"
        BNRItem *item4 = [BNRItem randomItem];
        NSLog(@"BNR instance %@", item4);
        
        // array to hold randommly generated items
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        // generate 10 random items and add to items
        for(int i = 0; i < 10; i++) {
            BNRItem *randomItem = [BNRItem randomItem];
            [items addObject:randomItem];
        }
        
        // Display all randomly generated items
        for(BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        // Sending a message that an instance of BNRItem will not understand
        // id lastItem = [items lastObject];
        // This will cause an NSInvalidArgumentsException
        // [lastItem count];
        
        // Using new Initializer
        BNRItem *item5 = [[BNRItem alloc] initWithItemName:@"Item 5" serialNumber:@"ABCDE"];
        NSLog(@"%@", item5);
        items = nil;
    }
    return EXIT_SUCCESS;
}
