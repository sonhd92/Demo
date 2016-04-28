//
//  KDemo.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/27/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface KDemo : NSObject
//init
+ (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;
//api
+ (void)showAdAtViewController:(UIViewController*)fromView position:(CGPoint)miniLibAdPosition adUnitID:(NSString*)adID;
+ (void)googleClientID:(NSString*)clientID;

+ (void)googleTrackingID:(NSString*)trackingID;
@end
