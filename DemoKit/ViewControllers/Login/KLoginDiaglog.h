//
//  KLoginDiaglog.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KManagerResult.h"

@protocol KLoginDiaglogDelegate <NSObject>
- (void) LoginDialogWithResult:(KManagerResult*)result
                         error:(NSError *)error;
@end
@interface KLoginDiaglog : UIViewController
@property (weak, nonatomic) IBOutlet id<KLoginDiaglogDelegate> delegate;
@end
