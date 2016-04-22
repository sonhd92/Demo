//
//  KLoginButton.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KLoginButton;
@class MTError;
@class KManagerResult;
@protocol KLoginButtonDelegate <NSObject>
- (void)loginButton:(KLoginButton *)loginButton
didCompleteWithResult:(KManagerResult *)result
                error:(MTError *)error;
@end
@interface KLoginButton : UIButton
@property (weak, nonatomic) IBOutlet id<KLoginButtonDelegate> delegate;
@end
