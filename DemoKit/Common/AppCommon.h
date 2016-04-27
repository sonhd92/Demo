//
//  AppCommon.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppCommon : NSObject
+ (NSString*)getToken;
+ (void)setToken:(id)token;
+ (NSString*)getDeviceID;
@end
