//
//  AppDelegate.m
//  DemoApp
//
//  Created by khanh on 4/21/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "AppDelegate.h"
#import <DemoKit/DemoKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[KDemoDelegate sharedInstance] application:application
                didFinishLaunchingWithOptions:launchOptions];
  [GIDSignIn sharedInstance].clientID = @"871137579127-"
                                        @"9iq60cikpgnmhrchooedua9n0l0qou91."
                                        @"apps.googleusercontent.com";

  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
    [[UIApplication sharedApplication]
        registerUserNotificationSettings:
            [UIUserNotificationSettings
                settingsForTypes:(UIUserNotificationTypeSound |
                                  UIUserNotificationTypeAlert |
                                  UIUserNotificationTypeBadge)
                      categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
  } else {
    [[UIApplication sharedApplication]
        registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                            UIUserNotificationTypeSound |
                                            UIUserNotificationTypeAlert)];
  }

  return YES;
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {

  if ([[url scheme] isEqualToString:@"fb1112556342122786"]) {
    return [[KDemoDelegate sharedInstance] application:application
                                               openURL:url
                                     sourceApplication:sourceApplication
                                            annotation:annotation];
  } else {
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
                                      annotation:annotation];
  }
}

- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo {
  [KDemoDelegate handlePushNotification:userInfo application:application];
}

- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  NSString *deviceTokenStr =
      [NSString stringWithFormat:@"Device Token=%@", deviceToken];

  deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" "
                                                             withString:@""];
  deviceTokenStr =
      [deviceTokenStr stringByReplacingOccurrencesOfString:@"DeviceToken=<"
                                                withString:@""];
  deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@">"
                                                             withString:@""];
  [KDemoDelegate setDeviceToken:deviceTokenStr];
}

- (void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  NSLog(@"Failed with Error: %@", error);
}

- (void)application:(UIApplication *)application
    didRegisterUserNotificationSettings:
        (UIUserNotificationSettings *)notificationSettings {
  [application registerForRemoteNotifications];
}

// Load the framework bundle.
+ (NSBundle *)frameworkBundle {
  static NSBundle *frameworkBundle = nil;
  static dispatch_once_t predicate;
  dispatch_once(&predicate, ^{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *frameworkBundlePath =
        [mainBundlePath stringByAppendingPathComponent:@"Serenity.bundle"];
    frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
  });
  return frameworkBundle;
}
@end
