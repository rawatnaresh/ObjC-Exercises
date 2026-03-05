//
//  BNRDetailViewController.h
//  HomePwner
//
//  Created by Naresh Rawat on 19/02/2026.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNRDetailViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong) BNRItem *item;
@end

NS_ASSUME_NONNULL_END
