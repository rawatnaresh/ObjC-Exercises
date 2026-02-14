//
//  main.m
//  RandomItems
//
//  Created by Naresh Rawat on 06/02/2026.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

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
        
        // Create an instance of BNRContainer
        BNRContainer *container = [[BNRContainer alloc] initWithItemName:@"Container A" valueInDollars:100 serialNumber:@"Container-1"];
        
        
        // Add 3 subitems
        for(int i = 0; i< 3; i++) {
            BNRItem *subitem = [[BNRItem alloc] initWithItemName:[NSString stringWithFormat:@"%@-%d", @"SubItem", i]
                                                  valueInDollars:(i+1)*100
                                                    serialNumber:[NSString stringWithFormat:@"%@-%d", @"A0000-", i]];
            [container addSubItem:subitem];
            
        }
        
        // Creting a child container
        BNRContainer *childContainer = [[BNRContainer alloc] initWithItemName:@"Child Container" valueInDollars:50 serialNumber:@"SUB-101"];
        
        // child container subitems
        [childContainer addSubItem:[[BNRItem alloc] initWithItemName:@"sub child"
                                                      valueInDollars:20
                                                        serialNumber:@"subchild-101"]];
        // add child container as sub item of parent container
        [container addSubItem:childContainer];
        NSLog(@"Container %@", container);
        items = nil;
    }
    return EXIT_SUCCESS;
}
