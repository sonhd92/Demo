//
//  KDemoDelegate.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDemoDelegate : NSObject
+ (instancetype)sharedInstance;

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

+ (void)handlePushNotification:(NSDictionary *)notificationDictionary
                   application:(UIApplication *)application;

+ (void)setDeviceToken:(NSString *)deviceToken;
@end
