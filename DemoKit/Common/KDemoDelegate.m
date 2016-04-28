//
//  KDemoDelegate.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KDemoDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
@implementation KDemoDelegate

#define KEY_DEVICE_TOKEN @"deviceToken"

static NSString *token = @"";

+ (instancetype)sharedInstance {
  static KDemoDelegate *kdemo;
  static dispatch_once_t oneT;
  dispatch_once(&oneT, ^{
    kdemo = [KDemoDelegate new];
  });
  return kdemo;
}
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [FBSDKLoginButton class];
  [[FBSDKApplicationDelegate sharedInstance] application:application
                           didFinishLaunchingWithOptions:launchOptions];
  return YES;
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    if ([[url scheme] hasPrefix:@"fb"]) {
        return
        [[FBSDKApplicationDelegate sharedInstance] application:application
                                                       openURL:url
                                             sourceApplication:sourceApplication
                                                    annotation:annotation];
    }else{
        return [[GIDSignIn sharedInstance] handleURL:url
                                   sourceApplication:sourceApplication
                                          annotation:annotation];
    }
}
+ (void)handlePushNotification:(NSDictionary *)notificationDictionary
                   application:(UIApplication *)application {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 1;
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

+ (void)setDeviceToken:(NSString *)deviceToken {
  token = deviceToken;
  NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
  [userDefault setObject:deviceToken forKey:KEY_DEVICE_TOKEN];
  [userDefault synchronize];
}
@end
