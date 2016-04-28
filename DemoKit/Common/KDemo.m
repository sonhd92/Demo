//
//  KDemo.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/27/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KDemo.h"
#import "GoogleAdmobManager.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import "KDemoDelegate.h"
#import "GoogleTrackingManager.h"
@implementation KDemo
+ (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    return [[KDemoDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

+ (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation{
    return [[KDemoDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}
//api
+ (void)showAdAtViewController:(UIViewController*)fromView position:(CGPoint)miniLibAdPosition adUnitID:(NSString*)adID{
    [[GoogleAdmobManager sharedInstance] showAdAtViewController:fromView position:miniLibAdPosition adUnitID:adID];
}

+ (void)googleClientID:(NSString*)clientID{
     [GIDSignIn sharedInstance].clientID=clientID;
}
+ (void)googleTrackingID:(NSString*)trackingID{
    [[GoogleTrackingManager sharedInstance] setGoogleTrackingID:trackingID];
}
@end
