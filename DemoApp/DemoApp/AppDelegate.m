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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[KDemoDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [GIDSignIn sharedInstance].clientID = @"871137579127-9iq60cikpgnmhrchooedua9n0l0qou91.apps.googleusercontent.com";
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
     if ([[url scheme] isEqualToString:@"fb1112556342122786"]) {
         return [[KDemoDelegate sharedInstance] application:application
                                                    openURL:url
                                          sourceApplication:sourceApplication
                                                 annotation:annotation];
     }else{
         return [[GIDSignIn sharedInstance] handleURL:url
                                    sourceApplication:sourceApplication
                                           annotation:annotation];
     }
}
@end
