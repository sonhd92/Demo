//
//  GoogleAdmobManager.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/27/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoogleAdmobManager : NSObject
+ (instancetype)sharedInstance;
- (void)showAdAtViewController:(UIViewController*)fromViewController position:(CGPoint)position adUnitID:(NSString*)adID;
@end
