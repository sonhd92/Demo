//
//  GoogleTrackingManager.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/28/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoogleTrackingManager : NSObject
+ (instancetype)sharedInstance;
- (void)setGoogleTrackingID:(NSString*)trackingID;
@end
