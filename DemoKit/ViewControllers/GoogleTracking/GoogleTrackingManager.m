//
//  GoogleTrackingManager.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/28/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "GoogleTrackingManager.h"
#import "GAI.h"
@implementation GoogleTrackingManager
+ (instancetype)sharedInstance {
    static GoogleTrackingManager *kdemo;
    static dispatch_once_t oneT;
    dispatch_once(&oneT, ^{
        kdemo = [GoogleTrackingManager new];
    });
    return kdemo;
}
- (void)setGoogleTrackingID:(NSString*)trackingID{
    if (trackingID) {
        [GAI sharedInstance].trackUncaughtExceptions = YES;
        [[GAI sharedInstance].logger setLogLevel:kGAILogLevelVerbose];
        [GAI sharedInstance].dispatchInterval = 6;
        //      id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:googleTrackingID];
        id<GAITracker> tracker = [[GAI sharedInstance] trackerWithName:@"DemoApp"
                                                            trackingId:trackingID];
        [[GAI sharedInstance] setDefaultTracker:tracker];
    }
}
@end
