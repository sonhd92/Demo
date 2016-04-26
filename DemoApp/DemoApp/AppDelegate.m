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
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[KDemoDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    NSString *currentVersion = [[UIDevice currentDevice] systemVersion];
    if ([currentVersion compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending)
    {
        UIRemoteNotificationType types =
        UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:types];
    }
    else
    {
        UIUserNotificationType types =
        UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[KDemoDelegate sharedInstance] application:application
                                               openURL:url
                                     sourceApplication:sourceApplication
                                            annotation:annotation];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [KDemoDelegate handlePushNotification:userInfo application:application];
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString *deviceTokenStr = [NSString stringWithFormat:@"Device Token=%@", deviceToken];
    
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@"DeviceToken=<" withString:@""];
    deviceTokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    [KDemoDelegate setDeviceToken:deviceTokenStr];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"Failed with Error: %@", error);
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}
@end
